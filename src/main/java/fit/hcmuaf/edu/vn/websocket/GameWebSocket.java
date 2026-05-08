package fit.hcmuaf.edu.vn.websocket;

import com.google.gson.Gson;
import fit.hcmuaf.edu.vn.dao.RoomDAO;
import fit.hcmuaf.edu.vn.model.GameMove;
import fit.hcmuaf.edu.vn.model.GameRoom;
import fit.hcmuaf.edu.vn.util.GoLogic;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/ws/game/{roomId}")
public class GameWebSocket {
    private static Map<Long, Set<Session>> roomSessions = new ConcurrentHashMap<>();
    private final Gson gson = new Gson();
    
    // DTO cho tọa độ quân cờ
    public static class StoneCoords {
        public int x, y;
        public StoneCoords(int x, int y) { this.x = x; this.y = y; }
    }
    
    // DTO cho tin nhắn gửi từ client
    private static class MoveMessage {
        int x, y;
        String color;
    }
    
    // DTO phản hồi đặc biệt (REMOVE quân bị bắt)
    public static class GameResponse {
        String type;
        Object data;
        public GameResponse(String type, Object data) {
            this.type = type;
            this.data = data;
        }
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") Long roomId) {
        roomSessions.computeIfAbsent(roomId, k -> Collections.synchronizedSet(new HashSet<>())).add(session);
        
        // PHỤC HỒI LỊCH SỬ: Gửi toàn bộ nước đi cũ cho người mới vào
        RoomDAO roomDAO = new RoomDAO();
        GameRoom room = roomDAO.findById(roomId);
        if (room != null && room.getMoves() != null) {
            for (GameMove m : room.getMoves()) {
                Map<String, Object> historyMove = new HashMap<>();
                historyMove.put("x", m.getX());
                historyMove.put("y", m.getY());
                historyMove.put("color", m.getColor());
                historyMove.put("isHistory", true);
                try {
                    session.getBasicRemote().sendText(gson.toJson(historyMove));
                } catch (IOException e) { e.printStackTrace(); }
            }
        }
    }
    
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") Long roomId) {
        try {
            MoveMessage moveData = gson.fromJson(message, MoveMessage.class);
            RoomDAO roomDAO = new RoomDAO();
            GameRoom room = roomDAO.findById(roomId);
            if (room == null) return;
            
            // 1. Xây dựng bàn cờ giả lập để tính toán logic bắt quân
            int size = room.getBoardSize();
            int[][] boardArray = new int[size][size];
            for (GameMove m : room.getMoves()) {
                boardArray[m.getX()][m.getY()] = m.getColor().equals("black") ? 1 : 2;
            }
            
            int myColorInt = moveData.color.equals("black") ? 1 : 2;
            int opponentColorInt = myColorInt == 1 ? 2 : 1;
            boardArray[moveData.x][moveData.y] = myColorInt;
            
            // 2. Kiểm tra bắt quân (Luật cờ vây)
            GoLogic logic = new GoLogic(size);
            logic.setBoard(boardArray);
            List<StoneCoords> capturedStones = new ArrayList<>();
            int[][] neighbors = {{0,1}, {0,-1}, {1,0}, {-1,0}};
            
            for (int[] n : neighbors) {
                int nx = moveData.x + n[0], ny = moveData.y + n[1];
                if (nx >= 0 && nx < size && ny >= 0 && ny < size && boardArray[nx][ny] == opponentColorInt) {
                    List<int[]> group = logic.findGroup(nx, ny, opponentColorInt);
                    if (logic.countLiberties(group) == 0) {
                        for (int[] stone : group) {
                            capturedStones.add(new StoneCoords(stone[0], stone[1]));
                            roomDAO.removeMoveAt(roomId, stone[0], stone[1]); // Xóa khỏi DB
                        }
                    }
                }
            }
            
            // 3. Thông báo xóa quân nếu có
            if (!capturedStones.isEmpty()) {
                broadcast(roomId, gson.toJson(new GameResponse("REMOVE", capturedStones)), null);
            }
            
            // 4. Lưu nước đi mới và gửi cho đối thủ
            GameMove newMove = new GameMove();
            newMove.setRoom(room);
            newMove.setX(moveData.x); newMove.setY(moveData.y);
            newMove.setColor(moveData.color);
            newMove.setMoveOrder(room.getMoves().size() + 1);
            roomDAO.saveMove(newMove);
            
            broadcast(roomId, message, session); // Chỉ gửi cho đối thủ để tránh lặp lượt
            
        } catch (Exception e) { e.printStackTrace(); }
    }
    
    private void broadcast(Long roomId, String message, Session sender) {
        Set<Session> sessions = roomSessions.get(roomId);
        if (sessions != null) {
            for (Session s : sessions) {
                // Nếu sender khác null, chỉ gửi cho đối thủ. Nếu null, gửi cho tất cả
                if (s.isOpen() && (sender == null || !s.getId().equals(sender.getId()))) {
                    try { s.getBasicRemote().sendText(message); } catch (IOException e) { e.printStackTrace(); }
                }
            }
        }
    }
    
    @OnClose
    public void onClose(Session session, @PathParam("roomId") Long roomId) {
        Set<Session> sessions = roomSessions.get(roomId);
        if (sessions != null) sessions.remove(session);
    }
}