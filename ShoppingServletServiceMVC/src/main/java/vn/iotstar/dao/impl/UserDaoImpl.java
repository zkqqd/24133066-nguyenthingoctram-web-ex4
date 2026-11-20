package vn.iotstar.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.connection.JPAConfig;
import vn.iotstar.dao.UserDao;
import vn.iotstar.model.User;

public class UserDaoImpl implements UserDao {

    @Override
    public User get(String username) {
        return findByUsername(username);
    }

    @Override
    public User findByUsername(String username) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<User> query = enma.createQuery("SELECT u FROM User u WHERE u.username = :username", User.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            enma.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<User> query = enma.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            enma.close();
        }
    }

    @Override
    public void updatePassword(String email, String newPassword) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.createQuery("UPDATE User u SET u.password = :password WHERE u.email = :email")
                .setParameter("password", newPassword)
                .setParameter("email", email)
                .executeUpdate();
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void insert(User user) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Long> query = enma.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class);
            query.setParameter("email", email);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            return false;
        } finally {
            enma.close();
        }
    }

    @Override
    public boolean checkExistUsername(String username) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Long> query = enma.createQuery("SELECT COUNT(u) FROM User u WHERE u.username = :username", Long.class);
            query.setParameter("username", username);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            return false;
        } finally {
            enma.close();
        }
    }

    @Override
    public boolean checkExistPhone(String phone) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Long> query = enma.createQuery("SELECT COUNT(u) FROM User u WHERE u.phone = :phone", Long.class);
            query.setParameter("phone", phone);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            return false;
        } finally {
            enma.close();
        }
    }
    
    @Override
    public void update(User user) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}