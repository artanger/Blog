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
import java.time.LocalDateTime;
import java.util.LinkedList;

import static java.lang.System.out;


public class PostServlet extends HttpServlet {

    PostSource postSource = new PostSource();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String uri = req.getRequestURI();
//        String currentPageName = uri.substring(uri.lastIndexOf("/")+1);
//        if (currentPageName.equalsIgnoreCase("posts")){
          HttpSession  session = req.getSession();
        // String name = (String)Session.getAttribute("name");


        if (session != null) {
            String action = req.getParameter("action");

            if ("addpost".equalsIgnoreCase(action)) {
                RequestDispatcher dispatcher = req.getRequestDispatcher("AddPost.jsp");
                dispatcher.forward(req, resp);
                return;
            }
            else if ("editpost".equalsIgnoreCase(action)) {
                String postId = req.getParameter("postid");
                Post post = postSource.getPost(postId);
                req.setAttribute("post", post);
                RequestDispatcher dispatcher = req.getRequestDispatcher("EditPost.jsp");
                dispatcher.forward(req, resp);
                return;
            }

            LinkedList<Post> posts = postSource.getPosts();
            req.setAttribute("post", posts);

            RequestDispatcher dispatcher = req.getRequestDispatcher("Posts.jsp");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect("/login");
        }


    }

        @Override
        protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String action = req.getParameter("action");

            if ("addpost".equalsIgnoreCase(action)) {
                String title = req.getParameter("title");
                String text = req.getParameter("text");
                if (title != null) {
                    Post addedPost = new Post(-1, title, text);
                    addedPost.setUserId(1);   // temporary userId = 1
                    addedPost.setTime(LocalDateTime.now());
                    postSource.addPost(addedPost);
                }
            } else if ("deletepost".equalsIgnoreCase(action)) {
                String postId = req.getParameter("postid");
                postSource.deletePost(postId);

            } else if ("savepost".equalsIgnoreCase(action)) {
                String postId = req.getParameter("postid");
                String title = req.getParameter("title");
                String text = req.getParameter("text");
                postSource.savePost(new Post(Integer.parseInt(postId), title, text));

            }
//
            doGet(req, resp);
        }

    }

