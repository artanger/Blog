import datasource.abs.ICategoryDb;
import datasource.src.CategoryDb;
import model.Category;
import model.Principal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

public class CategoryServlet extends HttpServlet {
    private ICategoryDb categoryDal;

    public CategoryServlet(){
        this.categoryDal = new CategoryDb();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            if (session != null) {
                Principal principal = (Principal) session.getAttribute("PRINCIPAL");
                req.setAttribute("shortname", principal.getShortName());
                String action = req.getParameter("action");

                if ("addcategory".equalsIgnoreCase(action)) {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("AddCategory.jsp");
                    dispatcher.forward(req, resp);
                    return;
                }
                else if ("editcategory".equalsIgnoreCase(action)) {
                    String categoryId = req.getParameter("id");
                    req.setAttribute("category", this.categoryDal.getCategory(categoryId));
                    RequestDispatcher dispatcher = req.getRequestDispatcher("EditCategory.jsp");
                    dispatcher.forward(req, resp);
                    return;
                }

                LinkedList<Category> categories = this.categoryDal.getCategories();
                req.setAttribute("categories", categories);
                RequestDispatcher dispatcher = req.getRequestDispatcher("Categories.jsp");
                dispatcher.forward(req, resp);

            } else {
                resp.sendRedirect("/login");
            }
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if ("newcategory".equalsIgnoreCase(action)) {
                String name = req.getParameter("name");
                String description = req.getParameter("description");
                if (name != null) {
                    Category addedCategory = new Category(-1, name, description);
                    this.categoryDal.addCategory(addedCategory);
                }
            } else if ("deletecategory".equalsIgnoreCase(action)) {
                String categoryId = req.getParameter("categoryid");
                this.categoryDal.deleteCategory(categoryId);
            } else if ("savecategory".equalsIgnoreCase(action)) {
                String categoryId = req.getParameter("id");
                String name = req.getParameter("name");
                String description = req.getParameter("description");
                this.categoryDal.saveCategory(new Category(Integer.parseInt(categoryId), name, description));
            }

            doGet(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }
}
