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
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM categories WHERE id = ?");
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Category row = retrieveCategoryRow(resultSet);
            if (row != null) return row;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Category(-1, null, null);
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

    private void retrieveCategoryRows(LinkedList<Category> posts, ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            Category row = new Category(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("description"));
            posts.add(row);
        }
    }

    private Category retrieveCategoryRow(ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            Category row = new Category(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("description"));
            return row;
        }
        return null;
    }
}
