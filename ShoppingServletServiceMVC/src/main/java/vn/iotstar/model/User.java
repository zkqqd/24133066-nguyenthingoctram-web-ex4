package vn.iotstar.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "Users")
public class User implements Serializable {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String email;
    private String username;
    private String password;
    
    @Column(columnDefinition = "nvarchar(255)")
    private String fullname;
    
    private String phone;
    private int roleid;
    
    @Column(name = "otp", columnDefinition = "VARCHAR(10)")
    private String otp;

    @OneToMany(mappedBy = "user")
    private List<Video> videos;

    public User() {
    }
    
    public User(int id, String email, String username, String password, String fullname, String phone, int roleid) {
        super();
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.roleid = roleid;
    }
    @Column(name = "images", columnDefinition = "NVARCHAR(500)")
    private String images;
    
    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public int getRoleid() { return roleid; }
    public void setRoleid(int roleid) { this.roleid = roleid; }
    
    public String getOtp() { return otp; }
    public void setOtp(String otp) { this.otp = otp; }
    
    public static long getSerialversionuid() { return serialVersionUID; }

    public List<Video> getVideos() { return videos; }
    public void setVideos(List<Video> videos) { this.videos = videos; }
}