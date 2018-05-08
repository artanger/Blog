package datasource.src;

import datasource.abs.ICategoryDb;
import datasource.base.DatabaseConnection;
import model.Category;

import java.sql.*;
import java.util.LinkedList;

public class CategoryDb extends DatabaseConnection implements ICategoryDb {
    @Override
    public LinkedList<Category> getCategories() {
        LinkedList<Category> categories = new LinkedList<>();
        try (Connection connection = super.getConnection();
            Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery("SELECT * FROM categories");
            retrieveCategoryRows(categories, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public void addCategory(Category category) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into categories(name, description) values (?, ?)");
            preparedStatement.setString(1, category.getName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveCategory(Category category) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET name = ?, description = ? WHERE id = ?");
            preparedStatement.setString(1, category.getName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.setInt(3, category.getCategoryId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Category getCategory(String id) {
        Category row = new Category(-1, null, null);
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM categories WHERE id = ?");
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                row = retrieveCategoryRow(resultSet);
            }
            if (row != null) return row;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }

    @Override
    public void deleteCategory(String id) {
        try (Connection connection = super.getConnection()) {
            try (PreparedStatement stmt = connection.prepareStatement("DELETE FROM categories where id = ?")) {
                stmt.setString(1, id);
                stmt.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getPostsCount(int categoryId) {
        int result = 0;
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT count(id) AS postsCount FROM post WHERE categoryId = ?");
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                result = resultSet.getInt("postsCount");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void updatePoststsCount(int poststsCount, int categoryId) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE categories SET postsCount = ? WHERE id = ?");
            preparedStatement.setInt(1, poststsCount);
            preparedStatement.setInt(2, categoryId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void retrieveCategoryRows(LinkedList<Category> posts, ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            posts.add(retrieveCategoryRow(resultSet));
        }
    }

    private Category retrieveCategoryRow(ResultSet resultSet) throws SQLException {
        Category row = new Category(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("description"));
        Integer postsCountDbValue = resultSet.getInt("postsCount");
        if (postsCountDbValue != null){
            row.setPostsCount(postsCountDbValue);
        }
        return row;
    }
}
