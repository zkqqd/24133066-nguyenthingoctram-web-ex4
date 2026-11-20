package vn.iotstar;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import vn.iotstar.connection.JPAConfig;
import vn.iotstar.model.Category;
import vn.iotstar.model.Video;

public class Test {
    public static void main(String[] args) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        
        Category cate = new Category();
        cate.setCategoryName("Iphone");
        cate.setImages("abc.jpg");
        cate.setStatus(1);
        
        Video video = new Video();
        video.setVideoId("v01");
        video.setTitle("test");
        video.setCategory(cate);
        
        try {
            trans.begin();
            enma.persist(cate);
            enma.persist(video);
            trans.commit();
            System.out.println("Tạo bảng và dữ liệu thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
            throw e;
        } finally {
            enma.close();
        }
    }
}