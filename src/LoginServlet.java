import datasource.src.PostSource;
import model.Post;

import javax.servlet.RequestDispatcher;
        import javax.servlet.ServletException;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.http.HttpSession;
        import java.io.IOException;
        import java.io.PrintWriter;
import java.util.LinkedList;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        HttpSession session = req.getSession();
        session.invalidate();
        //Session.removeAttribute("name");

        RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset = UTF-8");

            String username = req.getParameter("username");
            String password = req.getParameter("password");

            if ((username != null && password != null) && (username.equals("admin") && password.equals("admin123")) ) {

                HttpSession session = req.getSession();
                session.setAttribute("name", username);
//                LinkedList<Post> posts = new PostSource().getPosts();
//                req.setAttribute("post", posts);
//                RequestDispatcher dispatcher = req.getRequestDispatcher("Posts.jsp");
//                dispatcher.forward(req, resp);
                resp.sendRedirect("/posts");
            }
            else {
                try (PrintWriter out = resp.getWriter()) {
                    out.println("<b>username or password does not exist</b>");
                }
            }

    }
}