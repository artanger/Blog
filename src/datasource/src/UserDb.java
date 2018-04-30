package datasource.src;

import datasource.abs.IUserDb;
import datasource.base.DatabaseConnection;
import model.Post;
import model.Principal;
import model.Profile;

import java.io.OutputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

public class UserDb  extends DatabaseConnection implements IUserDb {
    @Override
    public Principal getPrincipal(String username, String password) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM mypost.registration WHERE username = ? AND password = ?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String usernameValue = resultSet.getString("username");
                String shortNameValue = resultSet.getString("firstname") + " " + resultSet.getString("lastname");
                if (StringUtils.isNullOrWhitespace(shortNameValue)){
                    shortNameValue = usernameValue;
                }

                Principal principalRow = new Principal(usernameValue, resultSet.getString("password"),  shortNameValue);
                principalRow.setUserId(resultSet.getInt("id"));

                return principalRow;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Profile getCurrentProfile(String username, String password) {
        try {Connection connection = super.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM mypost.registration LEFT JOIN mypost.profile ON mypost.profile.id = mypost.registration.id WHERE username = ? AND password = ? ");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){

                String usernameValue = resultSet.getString("username");
                int profileId = resultSet.getInt("id");
                String firstNameValue = resultSet.getString("firstname");
                String lastNameValue = resultSet.getString("lastname");
                String highlightValue = resultSet.getString("highlight");
                String descriptionValue = resultSet.getString("description");
                Date birthdateValue = resultSet.getDate("birthdate");
                String imgsrcValue = resultSet.getString("imgsrc");

                Profile profileRow = new Profile(profileId, firstNameValue, lastNameValue);
                profileRow.setUserId(profileId);
                profileRow.setHightlight(highlightValue);
                profileRow.setDescription(descriptionValue);
                profileRow.setBirthDate(birthdateValue);
                profileRow.setImageSrc(imgsrcValue);

                String shortNameValue = resultSet.getString("firstname") + " " + resultSet.getString("lastname");
                if (StringUtils.isNullOrWhitespace(shortNameValue)){
                    shortNameValue = usernameValue;
                }
                profileRow.setShortName(shortNameValue);

                return profileRow;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void saveProfile(Profile profile) {
        try {Connection connection = super.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE registration SET firstname = ?, lastname = ? WHERE id = ?");
            preparedStatement.setString(1, profile.getFirstName());
            preparedStatement.setString(2, profile.getLastName());
            preparedStatement.setInt(3, profile.getUserId());
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatementTwo = connection.prepareStatement("UPDATE profile SET  highlight = ?, description = ?, imgsrc = ?, birthdate = ? WHERE id = ?");
            preparedStatementTwo.setString(1, profile.getHighlight());
            preparedStatementTwo.setString(2, profile.getDescription());
            preparedStatementTwo.setString(3, profile.getImageSrc());
            preparedStatementTwo.setDate(4, new java.sql.Date(profile.getBirthDate().getTime()));
            preparedStatementTwo.setInt(5, profile.getProfileId());
            
            preparedStatementTwo.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public LinkedList<Profile> getAllProfiles() {
        LinkedList<Profile> users = new LinkedList<>();

        try (Connection connection = super.getConnection();

             Statement stmt = connection.createStatement()) {
            ResultSet resultSet = stmt.executeQuery(
                    "SELECT p.id, r.firstname, r.lastname, p.imgsrc, p.highlight\n" +
                    "FROM registration AS r\n" +
                    "JOIN profile AS p ON r.id = p.id\n" +
                    "ORDER BY p.id");

            while (resultSet.next()){
                int profileId = resultSet.getInt("id");
                String firstNameValue = resultSet.getString("firstname");
                String lastNameValue = resultSet.getString("lastname");
                String imgsrcValue = resultSet.getString("imgsrc");
                String highlightValue = resultSet.getString("highlight");

                Profile profileRow = new Profile(profileId, firstNameValue, lastNameValue);
                profileRow.setImgSrc(imgsrcValue);
                profileRow.setHightlight(highlightValue);

                users.add(profileRow);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }




}