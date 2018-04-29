import datasource.src.PostSource;
import datasource.src.UserDb;
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
    PostSource postSource = new PostSource();
    UserDb  userdb = new UserDb();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            LinkedList<Post> posts = postSource.getRecentPosts(10);
            req.setAttribute("post", posts);

            LinkedList<Profile> users = userdb.getAllProfiles();
            req.setAttribute("profile", users);

            RequestDispatcher dispatcher = req.getRequestDispatcher("Index.jsp");
            dispatcher.forward(req, resp);
    }
}