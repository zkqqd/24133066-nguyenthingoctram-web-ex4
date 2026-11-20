package vn.iotstar.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Videos")
public class Video implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "VideoId")
    private String videoId;
    
    @Column(name = "Title")
    private String title;
    
    @Column(name = "Poster")
    private String poster;
    
    @Column(name = "Description")
    private String description;
    
    @Column(name = "Views")
    private int views;
    
    @ManyToOne
    @JoinColumn(name = "UserId")
    private User user;

    @ManyToOne
    @JoinColumn(name = "CategoryId")
    private Category category;

    public String getVideoId() { return videoId; }
    public void setVideoId(String videoId) { this.videoId = videoId; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getPoster() { return poster; }
    public void setPoster(String poster) { this.poster = poster; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public int getViews() { return views; }
    public void setViews(int views) { this.views = views; }
    
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}