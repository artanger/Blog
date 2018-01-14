import datasource.src.PostSource;
import model.Post;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

public class IndexServlet extends HttpServlet {
    PostSource postSource = new PostSource();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            LinkedList<Post> posts = postSource.getPosts();
            req.setAttribute("post", posts);

            RequestDispatcher dispatcher = req.getRequestDispatcher("Index.jsp");
            dispatcher.forward(req, resp);
    }
}