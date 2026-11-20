package vn.iotstar.service;

import vn.iotstar.model.User;

public interface UserService {
    User login(String username, String password);
    User get(String username);
    User findByEmail(String email);
    boolean resetPassword(String email, String newPassword);
    boolean register(String username, String password, String email, String fullname, String phone);
    void insert(User user);
    void update(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
}