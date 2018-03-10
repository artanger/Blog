import datasource.abs.PostDataSource;
import datasource.src.PostSource;
import model.Post;
import model.Principal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.LinkedList;

public class PostServlet extends HttpServlet {
    private PostDataSource postSource;

    public PostServlet(){
        postSource = new PostSource();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession  session = req.getSession();
            if (session != null) {
                Principal principal = (Principal) session.getAttribute("PRINCIPAL");
                req.setAttribute("shortname", principal.getShortName());
                Integer userId = principal.getUserId();

                String action = req.getParameter("action");

                if ("addpost".equalsIgnoreCase(action)) {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("AddPost.jsp");
                    dispatcher.forward(req, resp);
                    return;
                }
                else if ("editpost".equalsIgnoreCase(action)) {
                    String postId = req.getParameter("postid");
                    Post post = postSource.getPost(postId);
                    req.setAttribute("post", post);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("EditPost.jsp");
                    dispatcher.forward(req, resp);
                    return;
                }

                LinkedList<Post> posts;
                if (userId != null){
                    posts = postSource.getPosts(userId);
                } else {
                    posts = postSource.getPosts();
                }

                req.setAttribute("post", posts);

                RequestDispatcher dispatcher = req.getRequestDispatcher("Posts.jsp");
                dispatcher.forward(req, resp);
            } else {
                resp.sendRedirect("/login");
            }
        } catch (Exception e) {

            String message = e.getMessage();
        }

    }

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if ("newpost".equalsIgnoreCase(action)) {
                String title = req.getParameter("title");
                String text = req.getParameter("text");
                if (title != null) {
                    Post addedPost = new Post(-1, title, text);
                    addedPost.setUserId(1);   // temporary userId = 1
                    addedPost.setTime(LocalDateTime.now());
                    postSource.addPost(addedPost);
                }
            } else if ("deletepost".equalsIgnoreCase(action)) {
                String postId = req.getParameter("postid");
                postSource.deletePost(postId);

            } else if ("savepost".equalsIgnoreCase(action)) {
                String postId = req.getParameter("postid");
                String title = req.getParameter("title");
                String text = req.getParameter("text");
                postSource.savePost(new Post(Integer.parseInt(postId), title, text));

            }

            doGet(req, resp);
        } catch (Exception e) {

            String message = e.getMessage();
        }

    }
}