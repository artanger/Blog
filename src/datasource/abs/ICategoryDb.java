package datasource.abs;

import model.Category;
import java.util.LinkedList;

public interface ICategoryDb {
    LinkedList<Category> getCategories();

    void addCategory(Category category);

    void saveCategory(Category category);

    Category getCategory(String id);

    void deleteCategory(String id);

    int getPostsCount(int categoryId);

    void updatePoststsCount(int poststsCount, int categoryId);
}
