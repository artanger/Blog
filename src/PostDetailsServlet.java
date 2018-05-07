import datasource.abs.ICategoryDb;
import datasource.abs.IUserDb;
import datasource.abs.PostDataSource;
import datasource.src.CategoryDb;
import datasource.src.PostSource;
import datasource.src.StringUtils;
import datasource.src.UserDb;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.LinkedList;

public class PostDetailsServlet extends HttpServlet {
    private ICategoryDb categoryDal;
    private IUserDb userDal;
    private PostDataSource postSource;

    public PostDetailsServlet(){
        this.categoryDal = new CategoryDb();
        this.userDal = new UserDb();
        this.postSource = new PostSource();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postId = req.getParameter("id");
        Post post = postSource.getPost(postId);
        req.setAttribute("postdetails", post);

        LinkedList<Comment> comments = postSource.getCommentsForPost(Integer.parseInt(postId), 1000);
        req.setAttribute("comments", comments);

        LinkedList<Post> posts = postSource.getRecentPosts(5);
        req.setAttribute("post", posts);

        LinkedList<Profile> users = userDal.getAllProfiles();
        req.setAttribute("profile", users);

        LinkedList<Category> categories = this.categoryDal.getCategories();
        req.setAttribute("categories", categories);

        RequestDispatcher dispatcher = req.getRequestDispatcher("PostDetails.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
                String action = req.getParameter("action");
                String postId = req.getParameter("postId");
                if ("newcomment".equalsIgnoreCase(action)) {
                    String author = req.getParameter("author");
                    String text = req.getParameter("text");
                    if (!StringUtils.isNullOrWhitespace(author) && !StringUtils.isNullOrWhitespace(text) && !StringUtils.isNullOrWhitespace(postId)){
                        Comment addedComment = new Comment(Integer.parseInt(postId), author, text);
                        this.postSource.addComment(addedComment);
                    }
                }
            doGet(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }
}