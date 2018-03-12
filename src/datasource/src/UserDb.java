package datasource.src;

import datasource.abs.IUserDb;
import datasource.base.DatabaseConnection;
import model.Principal;
import model.Profile;

import java.sql.*;
import java.text.SimpleDateFormat;

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
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM mypost.registration LEFT JOIN mypost.profile ON mypost.profile.id = mypost.registration.id WHERE username = ? AND password = ?");
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

                Profile profileRow = new Profile(profileId, firstNameValue, lastNameValue);
                profileRow.setUserId(profileId);
                profileRow.setHightlight(highlightValue);
                profileRow.setDescription(descriptionValue);
                profileRow.setBirthDate(birthdateValue);

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

            PreparedStatement preparedStatementTwo = connection.prepareStatement("UPDATE profile SET  highlight = ?, description = ?,birthdate = ? WHERE id = ?");
            preparedStatementTwo.setString(1, profile.getHighlight());
            preparedStatementTwo.setString(2, profile.getDescription());
            preparedStatementTwo.setInt(3, profile.getProfileId());
            preparedStatementTwo.setDate(4,new java.sql.Date(profile.getBirthDate().getTime()));
            preparedStatementTwo.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}