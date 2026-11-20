package vn.iotstar.dao.impl;

import vn.iotstar.connection.JPAConfig;
import vn.iotstar.dao.VideoDao;
import vn.iotstar.model.Video;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class VideoDaoImpl implements VideoDao {
    @Override
    public void insert(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(video);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(String videoId) throws Exception {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Video video = enma.find(Video.class, videoId);
            if (video != null) {
                enma.remove(video);
            } else {
                throw new Exception("Không tìm thấy");
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }

    @Override
    public Video findById(String videoId) {
        EntityManager enma = JPAConfig.getEntityManager();
        Video video = enma.find(Video.class, videoId);
        enma.close();
        return video;
    }

    @Override
    public List<Video> findLatestVideos(int limit) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createQuery("SELECT v FROM Video v ORDER BY v.videoId DESC", Video.class);
        query.setMaxResults(limit);
        List<Video> result = query.getResultList();
        enma.close();
        return result;
    }

    @Override
    public List<Video> findVideosByUser(int userId, int offset, int limit) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createQuery("SELECT v FROM Video v WHERE v.user.id = :userId", Video.class);
        query.setParameter("userId", userId);
        query.setFirstResult(offset);
        query.setMaxResults(limit);
        List<Video> result = query.getResultList();
        enma.close();
        return result;
    }

    @Override
    public int countVideosByUser(int userId) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Long> query = enma.createQuery("SELECT COUNT(v) FROM Video v WHERE v.user.id = :userId", Long.class);
        query.setParameter("userId", userId);
        int count = query.getSingleResult().intValue();
        enma.close();
        return count;
    }
}