package fit.hcmuaf.edu.vn.dao;

import fit.hcmuaf.edu.vn.model.User;
import jakarta.persistence.*;

import java.util.List;

public class UserDAO {

    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("TamTheGoPU");

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

    public User findByUsername(String username) {

        EntityManager em = emf.createEntityManager();

        try {

            TypedQuery<User> query =
                    em.createQuery(
                            "SELECT u FROM User u WHERE u.username = :user",
                            User.class
                    );

            query.setParameter("user", username);

            return query.getSingleResult();

        } catch (NoResultException e) {

            return null;

        } finally {

            em.close();
        }
    }

    public List<User> findAll() {

        EntityManager em = emf.createEntityManager();

        try {

            return em.createQuery(
                    "SELECT u FROM User u",
                    User.class
            ).getResultList();

        } finally {

            em.close();
        }
    }

    // =========================================
    // FIND BY ID
    // =========================================

    public User findById(Long id) {

        EntityManager em = emf.createEntityManager();

        try {

            return em.find(User.class, id);

        } finally {

            em.close();
        }
    }

    // =========================================
    // PAGINATION + SEARCH
    // =========================================

    public List<User> findUsersWithPagination(
            int page,
            int size,
            String keyword
    ) {

        EntityManager em = emf.createEntityManager();

        try {

            String jpql =
                    "SELECT u FROM User u " +
                            "WHERE LOWER(u.username) LIKE :kw " +
                            "OR LOWER(u.fullName) LIKE :kw";

            TypedQuery<User> query =
                    em.createQuery(jpql, User.class);

            query.setParameter(
                    "kw",
                    "%" + keyword.toLowerCase() + "%"
            );

            query.setFirstResult((page - 1) * size);

            query.setMaxResults(size);

            return query.getResultList();

        } finally {

            em.close();
        }
    }

    // =========================================
    // COUNT USERS
    // =========================================

    public long countUsers(String keyword) {

        EntityManager em = emf.createEntityManager();

        try {

            String jpql =
                    "SELECT COUNT(u) FROM User u " +
                            "WHERE LOWER(u.username) LIKE :kw " +
                            "OR LOWER(u.fullName) LIKE :kw";

            TypedQuery<Long> query =
                    em.createQuery(jpql, Long.class);

            query.setParameter(
                    "kw",
                    "%" + keyword.toLowerCase() + "%"
            );

            return query.getSingleResult();

        } finally {

            em.close();
        }
    }

    // =========================================
    // TOGGLE STATUS
    // =========================================

    public boolean toggleStatus(Long userId) {

        EntityManager em = emf.createEntityManager();

        try {

            em.getTransaction().begin();

            User user = em.find(User.class, userId);

            if (user == null) {
                return false;
            }

            if ("ACTIVE".equals(user.getStatus())) {

                user.setStatus("BLOCKED");

            } else {

                user.setStatus("ACTIVE");
            }

            em.merge(user);

            em.getTransaction().commit();

            return true;

        } catch (Exception e) {

            em.getTransaction().rollback();

            e.printStackTrace();

            return false;

        } finally {

            em.close();
        }
    }
}