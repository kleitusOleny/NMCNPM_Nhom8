package fit.hcmuaf.edu.vn.dao;

import fit.hcmuaf.edu.vn.model.GameRoom;
import fit.hcmuaf.edu.vn.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class GameRoomDAO {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("TamTheGoPU");

    public void save(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
    // lọc danh sách phòng
    public List<GameRoom> findRooms(String type, String search) {
        EntityManager em = emf.createEntityManager();
        try {
            StringBuilder jpql = new StringBuilder("SELECT r FROM GameRoom r WHERE 1=1");
            if (search != null && !search.trim().isEmpty()) {
                jpql.append(" AND LOWER(r.roomName) LIKE LOWER(:search)");
            }
            if (type != null) {
                switch (type) {
                    case "standard":
                        jpql.append(" AND r.timeControl NOT LIKE '%Blitz%'");
                        break;
                    case "blitz":
                        jpql.append(" AND r.timeControl LIKE '%Blitz%'");
                        break;
                    case "playing":
                        jpql.append(" AND r.status = 'PLAYING'");
                        break;
                }
            }

            jpql.append(" ORDER BY r.id DESC");
            TypedQuery<GameRoom> query = em.createQuery(jpql.toString(), GameRoom.class);

            if (search != null && !search.trim().isEmpty()) {
                query.setParameter("search", "%" + search + "%");
            }
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
