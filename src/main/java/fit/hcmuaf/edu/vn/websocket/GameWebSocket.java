package fit.hcmuaf.edu.vn.websocket;

import fit.hcmuaf.edu.vn.dao.RoomDAO;
import fit.hcmuaf.edu.vn.model.GameMove;
import fit.hcmuaf.edu.vn.model.GameRoom;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/ws/game/{roomId}")
public class GameWebSocket {
    // Lưu trữ các session theo roomId
    private static Map<Long, Set<Session>> roomSessions = new ConcurrentHashMap<>();
    
    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") Long roomId) {
        roomSessions.computeIfAbsent(roomId, k -> Collections.synchronizedSet(new HashSet<>())).add(session);
        
        RoomDAO dao = new RoomDAO();
        GameRoom room = dao.findById(roomId);
        if (room != null && room.getMoves() != null) {
            for (GameMove m : room.getMoves()) {
                String jsonMove = String.format("{\"x\":%d, \"y\":%d, \"color\":\"%s\", \"isHistory\":true}",
                        m.getX(), m.getY(), m.getColor());
                try {
                    session.getBasicRemote().sendText(jsonMove);
                } catch (IOException e) { e.printStackTrace(); }
            }
        }
    }
    
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("roomId") Long roomId) {
        com.google.gson.Gson gson = new com.google.gson.Gson();
        
        try {
            // 1. Giải mã tin nhắn JSON nhận được từ trình duyệt
            MoveMessage moveData = gson.fromJson(message, MoveMessage.class);
            
            // 2. Lưu nước đi vào Database để phục hồi trạng thái bàn cờ
            RoomDAO roomDAO = new RoomDAO();
            GameRoom room = roomDAO.findById(roomId);
            
            if (room != null) {
                GameMove move = new GameMove();
                move.setRoom(room);
                move.setX(moveData.x);
                move.setY(moveData.y);
                move.setColor(moveData.color);
                
                // Tính số thứ tự nước đi (moveOrder)
                int currentMovesCount = (room.getMoves() != null) ? room.getMoves().size() : 0;
                move.setMoveOrder(currentMovesCount + 1);
                
                // Lưu vào MySQL qua JPA
                roomDAO.saveMove(move);
            }
            
            // 3. Chuyển tiếp nước đi tới các kỳ thủ khác trong phòng
            Set<Session> sessions = roomSessions.get(roomId);
            if (sessions != null) {
                for (Session s : sessions) {
                    // Không gửi ngược lại cho người vừa đánh
                    if (s.isOpen() && !s.getId().equals(session.getId())) {
                        s.getBasicRemote().sendText(message);
                    }
                }
            }
            
        } catch (Exception e) {
            System.err.println("Lỗi xử lý nước đi tại phòng " + roomId + ": " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    @OnClose
    public void onClose(Session session, @PathParam("roomId") Long roomId) {
        Set<Session> sessions = roomSessions.get(roomId);
        if (sessions != null) {
            sessions.remove(session);
        }
    }
    
    class MoveMessage {
        int x;
        int y;
        String color;
        // Getter/Setter...
        
        
        public int getX() {
            return x;
        }
        
        public void setX(int x) {
            this.x = x;
        }
        
        public int getY() {
            return y;
        }
        
        public void setY(int y) {
            this.y = y;
        }
        
        public String getColor() {
            return color;
        }
        
        public void setColor(String color) {
            this.color = color;
        }
    }
}