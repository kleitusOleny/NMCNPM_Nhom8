package fit.hcmuaf.edu.vn.dao;

import fit.hcmuaf.edu.vn.model.GameMove;
import fit.hcmuaf.edu.vn.model.GameRoom;
import fit.hcmuaf.edu.vn.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;

import java.util.List;

public class RoomDAO {
    private EntityManagerFactory emf = JPAUtil.getEntityManagerFactory();
    
    public void save(GameRoom room) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(room);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public List<GameRoom> findAvailableRooms() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT r FROM GameRoom r WHERE r.status = 'WAITING'", GameRoom.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }
    
    public GameRoom findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(GameRoom.class, id);
        } finally {
            em.close();
        }
    }
    
    public void update(GameRoom room) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(room);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public void saveMove(GameMove move) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(move);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    
    public void removeMoveAt(Long roomId, int x, int y) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Query query = em.createQuery("DELETE FROM GameMove m WHERE m.room.id = :roomId AND m.x = :x AND m.y = :y");
            query.setParameter("roomId", roomId);
            query.setParameter("x", x);
            query.setParameter("y", y);
            query.executeUpdate();
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}