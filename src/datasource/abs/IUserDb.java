package datasource.abs;

import model.Principal;
import model.Profile;

public interface IUserDb {
    Principal getPrincipal(String username, String password);
    Profile getCurrentProfile(String username, String password);
    void saveProfile(Profile profile);
}