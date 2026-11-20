package vn.iotstar.dao;
import java.util.List;
import vn.iotstar.model.Category;

public interface CategoryDao {
    void insert(Category category);
    void update(Category category);
    void delete(int id) throws Exception;
    Category findById(int id);
    List<Category> findAll();
    List<Category> search(String keyword);
}