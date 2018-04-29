package datasource.abs;

import model.Post;

import java.util.LinkedList;

public interface PostDataSource {

    LinkedList<Post> getPosts();

    LinkedList<Post> getPosts(int userId);

    LinkedList<Post> getRecentPosts(int limit);

    void addPost (Post post);

    void savePost (Post post);

    Post getPost(String id);

    void deletePost(String id);
}
