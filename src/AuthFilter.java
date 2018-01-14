import datasource.abs.IUserDb;
import datasource.src.UserDb;
import model.Principal;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter")
public class AuthFilter implements Filter {
    private IUserDb userDal;

    public AuthFilter(){
        this.userDal = new UserDb();
    }

    public void destroy() { }
    public void init(FilterConfig config) throws ServletException { }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpSession session = ((HttpServletRequest)req).getSession();
        Principal principal = (Principal) session.getAttribute("PRINCIPAL");
        if (principal != null){
            String username = principal.getUsername();
            String password = principal.getPassword();
            Principal principalDb = this.userDal.getPrincipal(username, password);
            if(principalDb != null && principal.getUsername().equals(principalDb.getUsername()) && principal.getPassword().equals(principalDb.getPassword())){
                chain.doFilter(req, resp);
            }
        }

        ((HttpServletResponse)resp).sendRedirect("/login");
    }
}