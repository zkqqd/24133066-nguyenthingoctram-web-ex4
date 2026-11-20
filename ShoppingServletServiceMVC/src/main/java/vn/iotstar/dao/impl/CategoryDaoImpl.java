package vn.iotstar.dao.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import vn.iotstar.connection.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.model.Category;

public class CategoryDaoImpl implements CategoryDao {

    @Override
    public void insert(Category category) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(category);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Category category) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(category);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Category category = enma.find(Category.class, id);
            if(category != null) {
                enma.remove(category);
            } else {
                throw new Exception("Không tìm thấy");
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public Category findById(int id) {
        EntityManager enma = JPAConfig.getEntityManager();
        return enma.find(Category.class, id);
    }

    @Override
    public List<Category> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Category> query = enma.createQuery("SELECT c FROM Category c", Category.class);
        return query.getResultList();
    }

    @Override
    public List<Category> search(String keyword) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<Category> query = enma.createQuery("SELECT c FROM Category c WHERE c.categoryName LIKE :keyword", Category.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            enma.close();
        }
    }
}