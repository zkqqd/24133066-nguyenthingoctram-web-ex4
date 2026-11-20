package vn.iotstar.dao;

import vn.iotstar.model.User;

public interface UserDao {
    User get(String username);
    User findByUsername(String username);
    User findByEmail(String email);
    void updatePassword(String email, String newPassword);
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
    void update(User user);
}