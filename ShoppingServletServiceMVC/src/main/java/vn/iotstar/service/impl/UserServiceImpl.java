package vn.iotstar.service.impl;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;
import vn.iotstar.util.PasswordUtil;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = userDao.findByUsername(username);
        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public boolean resetPassword(String email, String newPassword) {
        try {
            String hashedPassword = PasswordUtil.hashPassword(newPassword);
            userDao.updatePassword(email, hashedPassword);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (userDao.checkExistUsername(username) || userDao.checkExistEmail(email)) {
            return false;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(PasswordUtil.hashPassword(password));
        user.setEmail(email);
        user.setFullname(fullname);
        user.setPhone(phone);
        user.setRoleid(2);
        try {
            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void insert(User user) {
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
        userDao.insert(user);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
    @Override
    public void update(User user) {
        userDao.update(user);
    }
}