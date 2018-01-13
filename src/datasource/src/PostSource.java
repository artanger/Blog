package datasource.src;

import datasource.abs.PostDataSource;
import datasource.base.DatabaseConnection;
import model.Post;

import java.sql.*;
import java.util.LinkedList;


public class PostSource extends DatabaseConnection implements PostDataSource {
    @Override
    public void savePost(Post post) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE post SET title = ?, text = ? WHERE id = ?");
            preparedStatement.setString(1,post.getTitle());
            preparedStatement.setString(2,post.getText());
            preparedStatement.setInt(3,post.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public LinkedList<Post> getPosts() {

        LinkedList<Post> posts = new LinkedList<>();

        try (Connection connection = super.getConnection();
            Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery("SELECT * FROM post");

            while (resultSet.next()){
                posts.add(new Post(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("text")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    public Post getPost(String id) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM post WHERE id=?");
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new Post(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("text")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new Post(-1, null, null);

    }

    @Override
    public void addPost(Post post) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into post(title, text) values (?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1,post.getTitle());
            preparedStatement.setString(2,post.getText());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePost(String id) {
        try (Connection connection = super.getConnection()) {
            try (PreparedStatement stmt = connection.prepareStatement("DELETE FROM post where id = ?")) {
                stmt.setString(1, id);
                stmt.execute();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}