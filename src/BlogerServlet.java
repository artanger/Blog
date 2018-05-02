import datasource.abs.IUserDb;
import datasource.src.UserDb;
import model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BlogerServlet extends HttpServlet {

    private IUserDb userDal;

    public BlogerServlet(){
        this.userDal = new UserDb();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bloggerId = req.getParameter("id");
            Profile profileModel = this.userDal.getBlogger(bloggerId);
            req.setAttribute("ProfileModel", profileModel);
            RequestDispatcher dispatcher = req.getRequestDispatcher("Bloger.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }


    }
}
