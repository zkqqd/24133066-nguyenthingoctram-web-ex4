package vn.iotstar.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "Category")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    
    @Column(columnDefinition = "nvarchar(255)")
    private String categoryName;
    
    @Column(columnDefinition = "varchar(500)")
    private String images;
    
    private int status;

    @OneToMany(mappedBy = "category")
    private List<Video> videos;

    public Category() {}

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    public List<Video> getVideos() { return videos; }
    public void setVideos(List<Video> videos) { this.videos = videos; }

    public Video addVideo(Video video) {
        getVideos().add(video);
        video.setCategory(this);
        return video;
    }

    public Video removeVideo(Video video) {
        getVideos().remove(video);
        video.setCategory(null);
        return video;
    }
}