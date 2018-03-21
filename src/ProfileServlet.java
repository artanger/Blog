import datasource.abs.IUserDb;
import datasource.src.UserDb;
import model.Principal;
import model.Profile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


public class ProfileServlet extends HttpServlet {
    private IUserDb userDal;

    public ProfileServlet(){
        this.userDal = new UserDb();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            Principal principal = (Principal) session.getAttribute("PRINCIPAL");
            String username = principal.getUsername();
            String password = principal.getPassword();

            Profile profileModel = this.userDal.getCurrentProfile(username, password);
            req.setAttribute("ProfileModel", profileModel);
            req.setAttribute("shortname", profileModel.getShortName());
            RequestDispatcher dispatcher = req.getRequestDispatcher("EditProfile.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            if ("savecurrentprofile".equalsIgnoreCase(action)) {
                String userId = req.getParameter("userid");
                String firstname = req.getParameter("firstname");
                String lastname = req.getParameter("lastname");
                String highlight = req.getParameter("highlight");
                String description = req.getParameter("description");

//                InputStream inputStream = null;
//                Part filePart = req.getPart("image");
//                if (filePart != null){
//                    inputStream = filePart.getInputStream();
//                }




                Profile profile = new Profile(Integer.parseInt(userId),firstname, lastname);

                try {
                    String birtDateStr = req.getParameter("birthdate");
                    Date birthdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).parse(birtDateStr + " 00:00:00");
                    profile.setBirthDate(birthdate);
//                    profile.setImage();
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                profile.setHightlight(highlight);
                profile.setDescription(description);
                profile.setProfileId(Integer.parseInt(userId));
                profile.setUserId(Integer.parseInt(userId));
                this.userDal.saveProfile(profile);
            }
            doGet(req, resp);
        } catch (Exception e) {
            String message = e.getMessage();
        }
    }
}