package vn.iotstar.service;

import java.util.List;
import vn.iotstar.model.Category;

public interface CategoryService {
    void insert(Category category);
    void update(Category category);
    void delete(int id) throws Exception;
    Category findById(int id);
    List<Category> findAll();
    List<Category> search(String keyword);
}