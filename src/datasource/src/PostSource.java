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
    public LinkedList<Post> getPosts(int userId) {
        LinkedList<Post> posts = new LinkedList<>();

        try {Connection connection = super.getConnection();
            PreparedStatement stmt = connection.prepareStatement(
                    "SELECT p.*, c.name as categoryName, r.firstname as userFirstName, r.lastname as userLastName\n" +
                            "FROM post p\n" +
                            "JOIN categories as c ON p.categoryId = c.id\n" +
                            "JOIN registration as r ON p.userId = r.id\n" +
                            "WHERE p.userId = ? \n" +
                            "ORDER BY p.time DESC");
            stmt.setInt(1, userId);
            ResultSet resultSet = stmt.executeQuery();
            retrievePostRows(posts, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    @Override
    public LinkedList<Post> getRecentPosts(int limit) {
        LinkedList<Post> posts = new LinkedList<>();
        try {Connection connection = super.getConnection();
            PreparedStatement stmt = connection.prepareStatement(
                    "SELECT p.*, c.name as categoryName, r.firstname as userFirstName, r.lastname as userLastName\n" +
                            "FROM post p\n" +
                            "JOIN categories as c ON p.categoryId = c.id\n" +
                            "JOIN registration as r ON p.userId = r.id\n" +
                            "ORDER BY p.time DESC LIMIT ?");
            stmt.setInt(1, limit);
            ResultSet resultSet = stmt.executeQuery();
            retrievePostRows(posts, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    @Override
    public LinkedList<Post> getPosts() {
        LinkedList<Post> posts = new LinkedList<>();

        try (Connection connection = super.getConnection();
            Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(
                    "SELECT p.*, c.name as categoryName, r.firstname as userFirstName, r.lastname as userLastName\n" +
                            "FROM post p\n" +
                            "JOIN categories as c ON p.categoryId = c.id\n" +
                            "JOIN registration as r ON p.userId = r.id\n" +
                            "ORDER BY p.time DESC");
            retrievePostRows(posts, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }

    @Override
    public Post getPost(String id) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT p.*, c.name as categoryName, r.firstname as userFirstName, r.lastname as userLastName\n" +
                            "FROM post p\n" +
                            "JOIN categories as c ON p.categoryId = c.id\n" +
                            "JOIN registration as r ON p.userId = r.id\n" +
                            "WHERE p.id = ? \n" +
                            "ORDER BY p.time DESC");
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Post postRow = retrievePostRow(resultSet);
            if (postRow != null) return postRow;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new Post(-1, null, null);
    }

    @Override
    public void addPost(Post post) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into post(title, text, time, userId) values (?, ?, ?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getText());
            preparedStatement.setString(3, post.getTime());
            preparedStatement.setInt(4, post.getUserId());
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

    private void retrievePostRows(LinkedList<Post> posts, ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            /*Post postRow = new Post(resultSet.getInt("id"), resultSet.getString("title"),  resultSet.getString("text"));

            Timestamp timeDbValue = resultSet.getTimestamp("time");
            if (timeDbValue != null){
                postRow.setTime(resultSet.getTimestamp("time").toLocalDateTime());
            }

            Integer userIdDbValue = resultSet.getInt("userId");
            if (userIdDbValue != null && userIdDbValue != -1){
                postRow.setUserId(userIdDbValue);
            }

            String categoryIdDbValue = resultSet.getString("categoryId");
            if (!StringUtils.isNullOrEmpty(categoryIdDbValue)){
                postRow.setCategoryId(categoryIdDbValue);
            }

            String categoryNameDbValue = resultSet.getString("categoryName");
            if (!StringUtils.isNullOrEmpty(categoryNameDbValue)){
                postRow.setCategoryName(categoryNameDbValue);
            }

            String userFirstNameDbValue = resultSet.getString("userFirstName");
            if (!StringUtils.isNullOrEmpty(userFirstNameDbValue)){
                postRow.setUserFirstName(userFirstNameDbValue);
            }

            String userLastNameDbValue = resultSet.getString("userLastName");
            if (!StringUtils.isNullOrEmpty(categoryNameDbValue)){
                postRow.setUserLastName(userLastNameDbValue);
            }
*/

            posts.add(retrievePostRow(resultSet));
        }
    }

    private Post retrievePostRow(ResultSet resultSet) throws SQLException {
       // while (resultSet.next()){
            Post postRow = new Post(resultSet.getInt("id"), resultSet.getString("title"),  resultSet.getString("text"));

            Timestamp timeDbValue = resultSet.getTimestamp("time");
            if (timeDbValue != null){
                postRow.setTime(resultSet.getTimestamp("time").toLocalDateTime());
            }

            Integer userIdDbValue = resultSet.getInt("userId");
            if (userIdDbValue != null && userIdDbValue != -1){
                postRow.setUserId(userIdDbValue);
            }

            String categoryIdDbValue = resultSet.getString("categoryId");
            if (!StringUtils.isNullOrEmpty(categoryIdDbValue)){
                postRow.setCategoryId(categoryIdDbValue);
            }

            String categoryNameDbValue = resultSet.getString("categoryName");
            if (!StringUtils.isNullOrEmpty(categoryNameDbValue)){
                postRow.setCategoryName(categoryNameDbValue);
            }

            String userFirstNameDbValue = resultSet.getString("userFirstName");
            if (!StringUtils.isNullOrEmpty(userFirstNameDbValue)){
                postRow.setUserFirstName(userFirstNameDbValue);
            }

            String userLastNameDbValue = resultSet.getString("userLastName");
            if (!StringUtils.isNullOrEmpty(categoryNameDbValue)){
                postRow.setUserLastName(userLastNameDbValue);
            }

            return postRow;
       // }
       // return null;
    }
}