import datasource.abs.IUserDb;
import datasource.src.UserDb;
import model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

public class OurBloggersServlet extends HttpServlet {
    private IUserDb userDal;

    public OurBloggersServlet(){
        this.userDal = new UserDb();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LinkedList<Profile> users = this.userDal.getAllProfiles();
        req.setAttribute("profile", users);

        RequestDispatcher dispatcher = req.getRequestDispatcher("OurBloggers.jsp");
        dispatcher.forward(req, resp);
    }
}
