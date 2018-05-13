import datasource.abs.ICategoryDb;
import datasource.abs.IUserDb;
import datasource.abs.PostDataSource;
import datasource.src.CategoryDb;
import datasource.src.PostSource;
import datasource.src.UserDb;
import model.Category;
import model.Post;
import model.Principal;
import model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

public class AdminPageServlet extends HttpServlet {

    private ICategoryDb categoryDal;
    private IUserDb userDal;
    private PostDataSource postSource;

    public AdminPageServlet(){
        this.categoryDal = new CategoryDb();
        this.userDal = new UserDb();
        this.postSource = new PostSource();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Principal principal = (Principal) session.getAttribute("PRINCIPAL");
        req.setAttribute("shortname", principal.getShortName());
        Integer userId = principal.getUserId();
        String username = principal.getUsername();
        String password = principal.getPassword();
        Profile profileModel = this.userDal.getCurrentProfile(username, password);
        req.setAttribute("ProfileModel", profileModel);

        LinkedList<Category> categories = this.categoryDal.getCategories();
        req.setAttribute("categories", categories);

        LinkedList<Post> posts = this.postSource.getPosts(userId);
        req.setAttribute("post", posts);

        int allCommentsCount = 0;
        for (Post post : posts) {
            allCommentsCount = allCommentsCount + post.getCommentsCount();
        }
        req.setAttribute("allCommentsCount", Integer.toString(allCommentsCount));

        RequestDispatcher dispatcher = req.getRequestDispatcher("AdminPage.jsp");
        dispatcher.forward(req, resp);
    }
}
