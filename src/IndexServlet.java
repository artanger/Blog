import datasource.abs.ICategoryDb;
import datasource.abs.IUserDb;
import datasource.abs.PostDataSource;
import datasource.src.CategoryDb;
import datasource.src.PostSource;
import datasource.src.UserDb;
import model.Category;
import model.Post;
import model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

public class IndexServlet extends HttpServlet {
    private ICategoryDb categoryDal;
    private IUserDb userDal;
    private PostDataSource postSource;

    public IndexServlet(){
        this.categoryDal = new CategoryDb();
        this.userDal = new UserDb();
        this.postSource = new PostSource();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            LinkedList<Post> posts = this.postSource.getRecentPosts(10);
            req.setAttribute("post", posts);

            LinkedList<Profile> users = this.userDal.getAllProfiles();
            req.setAttribute("profile", users);

            LinkedList<Category> categories = this.categoryDal.getCategories();
            req.setAttribute("categories", categories);

            RequestDispatcher dispatcher = req.getRequestDispatcher("Index.jsp");
            dispatcher.forward(req, resp);
    }
}