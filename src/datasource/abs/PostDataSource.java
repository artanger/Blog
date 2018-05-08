package datasource.abs;

import model.Comment;
import model.Post;

import java.util.LinkedList;

public interface PostDataSource {

    LinkedList<Post> getPosts();

    LinkedList<Post> getPosts(int userId);

    LinkedList<Post> getRecentPosts(int limit);

    LinkedList<Post> getPostsByCategory(int categoryId, int limit);

    LinkedList<Post> getPostsByAuthor(int userId, int limit);

    void addPost (Post post);

    void savePost (Post post);

    Post getPost(String id);

    void deletePost(String id);

    LinkedList<Comment> getCommentsForPost(int postId, int limit);

    void addComment(Comment comment);

    int getCommentsCount(int postId);

    void updateCommentsCount(int commentsCount, int postId);
}
