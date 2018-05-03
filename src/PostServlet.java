import datasource.abs.ICategoryDb;
import datasource.abs.PostDataSource;
import datasource.src.CategoryDb;
import datasource.src.PostSource;
import model.Category;
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
    private ICategoryDb categoryDal;
    public PostServlet(){
        this.postSource = new PostSource();
        this.categoryDal = new CategoryDb();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession  session = req.getSession();
            if (session != null) {
                Principal principal = (Principal) session.getAttribute("PRINCIPAL");
                req.setAttribute("shortname", principal.getShortName());
                Integer userId = principal.getUserId();
                LinkedList<Category> categories = this.categoryDal.getCategories();
                String action = req.getParameter("action");
                if ("addpost".equalsIgnoreCase(action)) {
                    req.setAttribute("categories", categories);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("AddPost.jsp");
                    dispatcher.forward(req, resp);
                    return;
                }
                else if ("editpost".equalsIgnoreCase(action)) {
                    String postId = req.getParameter("postid");
                    Post post = postSource.getPost(postId);
                    req.setAttribute("post", post);
                    req.setAttribute("categories", categories);
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
            HttpSession  session = req.getSession();
            if (session != null) {
                String action = req.getParameter("action");
                Principal principal = (Principal) session.getAttribute("PRINCIPAL");
                Integer userId = principal.getUserId();
                if ("newpost".equalsIgnoreCase(action)) {
                    String title = req.getParameter("title");
                    String text = req.getParameter("text");
                    String categoryId = req.getParameter("categoryId");
                    String introduction = req.getParameter("introduction");
                    if (title != null) {
                        Post addedPost = new Post(-1, title, text);
                        addedPost.setUserId(userId);
                        addedPost.setTime(LocalDateTime.now());
                        addedPost.setCategoryId(categoryId);
                        addedPost.setIntroduction(introduction);
                        postSource.addPost(addedPost);
                    }
                } else if ("deletepost".equalsIgnoreCase(action)) {
                    String postId = req.getParameter("postid");
                    postSource.deletePost(postId);

                } else if ("savepost".equalsIgnoreCase(action)) {
                    String postId = req.getParameter("postid");
                    String title = req.getParameter("title");
                    String text = req.getParameter("text");
                    String categoryId = req.getParameter("categoryId");
                    String introduction = req.getParameter("introduction");
                    Post savedPost = new Post(Integer.parseInt(postId), title, text);
                    savedPost.setCategoryId(categoryId);
                    savedPost.setIntroduction(introduction);
                    postSource.savePost(savedPost);
                }
            }
            doGet(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }
}