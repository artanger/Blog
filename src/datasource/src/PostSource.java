package datasource.src;

import datasource.abs.PostDataSource;
import datasource.base.DatabaseConnection;
import model.Comment;
import model.Post;
import java.sql.*;
import java.util.LinkedList;


public class PostSource extends DatabaseConnection implements PostDataSource {
    @Override
    public void savePost(Post post) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE post SET title = ?, text = ?, categoryId = ?, introduction = ? WHERE id = ?");
            preparedStatement.setString(1,post.getTitle());
            preparedStatement.setString(2,post.getText());
            preparedStatement.setInt(3, Integer.parseInt(post.getCategoryId()));
            preparedStatement.setString(4, post.getIntroduction());
            preparedStatement.setInt(5,post.getId());
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
        Post postRow = new Post(-1, null, null);
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

            if (resultSet.next()){
                postRow = retrievePostRow(resultSet);
            }
            if (postRow != null) return postRow;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postRow;
    }

    @Override
    public void addPost(Post post) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into post(title, text, time, userId, categoryId, introduction) values (?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getText());
            preparedStatement.setString(3, post.getTime());
            preparedStatement.setInt(4, post.getUserId());
            preparedStatement.setInt(5, Integer.parseInt(post.getCategoryId()));
            preparedStatement.setString(6, post.getIntroduction());
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

    @Override
    public LinkedList<Comment> getCommentsForPost(int postId, int limit) {
        LinkedList<Comment> comments = new LinkedList<>();
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM comment WHERE postId = ? ORDER BY creationTime DESC LIMIT ?");
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            retrieveCommentRows(comments, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    @Override
    public void addComment(Comment comment) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO comment (postId, author, text) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, comment.getPostId());
            preparedStatement.setString(2, comment.getAuthor());
            preparedStatement.setString(3, comment.getText());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getCommentsCount(int postId) {
        int result = 0;
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT count(id) as commentsCount FROM comment WHERE postId = ?");
            preparedStatement.setInt(1, postId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                result = resultSet.getInt("commentsCount");
            }
            return result;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void updateCommentsCount(int commentsCount, int postId ) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE post SET commentsCount = ? WHERE id = ?");
            preparedStatement.setInt(1, commentsCount);
            preparedStatement.setInt(2, postId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void retrieveCommentRows(LinkedList<Comment> comments, ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            comments.add(retrieveCommentRow(resultSet));
        }
    }

    private Comment retrieveCommentRow(ResultSet resultSet) throws SQLException {
        Comment row = new Comment(
                resultSet.getInt("postId"),
                resultSet.getString("author"),
                resultSet.getString("text")
        );

        Integer commentIdDbValue = resultSet.getInt("id");
        if (commentIdDbValue != null){
            row.setCommentId(commentIdDbValue);
        }

        Date creationTimeDbValue = resultSet.getDate("creationTime");
        if (creationTimeDbValue != null){
            row.setCreationTime(creationTimeDbValue);
        }

        return row;
    }

    private void retrievePostRows(LinkedList<Post> posts, ResultSet resultSet) throws SQLException {
        while (resultSet.next()){
            posts.add(retrievePostRow(resultSet));
        }
    }

    private Post retrievePostRow(ResultSet resultSet) throws SQLException {
            Post postRow = new Post(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("text")
            );

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

            String introductionDbValue = resultSet.getString("introduction");
            if (!StringUtils.isNullOrEmpty(introductionDbValue)){
                postRow.setIntroduction(introductionDbValue);
            }

            Integer commentsCountDbValue = resultSet.getInt("commentsCount");
            if (commentsCountDbValue != null && commentsCountDbValue != -1){
                postRow.setCommentsCount(commentsCountDbValue);
            }

            return postRow;
    }
}