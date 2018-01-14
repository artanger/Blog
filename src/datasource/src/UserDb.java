package datasource.src;

import datasource.abs.IUserDb;
import datasource.base.DatabaseConnection;
import model.Principal;
import java.sql.*;

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
}