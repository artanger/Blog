import datasource.abs.IUserDb;
import datasource.src.StringUtils;
import datasource.src.UserDb;
import model.Principal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    private IUserDb userDal;

    public LoginServlet(){
        this.userDal = new UserDb();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset = UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (!StringUtils.isNullOrWhitespace(username) && !StringUtils.isNullOrWhitespace(password)) {
            Principal principal = this.userDal.getPrincipal(username, password);
            if (principal != null){
                HttpSession session = req.getSession();
                session.setAttribute("PRINCIPAL", principal);
                resp.sendRedirect("/adminpage");

            }
        }
        try (PrintWriter out = resp.getWriter()) {
            out.println("<b>username or password does not exist</b>");
        }
    }
}