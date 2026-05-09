package fit.hcmuaf.edu.vn.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "game_rooms")
public class GameRoom implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String roomName;
    
    private String password; // Để trống nếu là phòng công khai
    private int boardSize;   // 9, 13, hoặc 19
    private String timeControl; // Ví dụ: "30m + 3x30s"
    private String status;   // WAITING, PLAYING, FINISHED
    
    @ManyToOne
    @JoinColumn(name = "black_player_id")
    private User blackPlayer;
    
    @ManyToOne
    @JoinColumn(name = "white_player_id")
    private User whitePlayer;
    
    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @OrderBy("moveOrder ASC")
    private java.util.List<GameMove> moves;
    // Constructors, Getters, Setters...
    public GameRoom() { this.status = "WAITING"; }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getRoomName() {
        return roomName;
    }
    
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getBoardSize() {
        return boardSize;
    }
    
    public void setBoardSize(int boardSize) {
        this.boardSize = boardSize;
    }
    
    public String getTimeControl() {
        return timeControl;
    }
    
    public void setTimeControl(String timeControl) {
        this.timeControl = timeControl;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public User getBlackPlayer() {
        return blackPlayer;
    }
    
    public void setBlackPlayer(User blackPlayer) {
        this.blackPlayer = blackPlayer;
    }
    
    public User getWhitePlayer() {
        return whitePlayer;
    }
    
    public void setWhitePlayer(User whitePlayer) {
        this.whitePlayer = whitePlayer;
    }
    
    public List<GameMove> getMoves() {
        return moves;
    }
    
    public void setMoves(List<GameMove> moves) {
        this.moves = moves;
    }
}