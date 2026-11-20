package vn.iotstar.dao;
import vn.iotstar.model.Video;
import java.util.List;

public interface VideoDao {
    void insert(Video video);
    void update(Video video);
    void delete(String videoId) throws Exception;
    Video findById(String videoId);
    List<Video> findLatestVideos(int limit);
    List<Video> findVideosByUser(int userId, int offset, int limit);
    int countVideosByUser(int userId);
}