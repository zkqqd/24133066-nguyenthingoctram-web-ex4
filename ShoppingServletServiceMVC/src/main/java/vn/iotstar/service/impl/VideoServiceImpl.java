package vn.iotstar.service.impl;

import java.util.List;
import vn.iotstar.dao.VideoDao;
import vn.iotstar.dao.impl.VideoDaoImpl;
import vn.iotstar.model.Video;
import vn.iotstar.service.VideoService;

public class VideoServiceImpl implements VideoService {

    VideoDao videoDao = new VideoDaoImpl();

    @Override
    public void insert(Video video) {
        videoDao.insert(video);
    }

    @Override
    public void update(Video video) {
        videoDao.update(video);
    }

    @Override
    public void delete(String videoId) throws Exception {
        videoDao.delete(videoId);
    }

    @Override
    public Video findById(String videoId) {
        return videoDao.findById(videoId);
    }

    @Override
    public List<Video> findLatestVideos(int limit) {
        return videoDao.findLatestVideos(limit);
    }

    @Override
    public List<Video> findVideosByUser(int userId, int offset, int limit) {
        return videoDao.findVideosByUser(userId, offset, limit);
    }

    @Override
    public int countVideosByUser(int userId) {
        return videoDao.countVideosByUser(userId);
    }
}