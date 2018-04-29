package datasource.abs;

import model.Principal;
import model.Profile;

import java.util.LinkedList;

public interface IUserDb {
    LinkedList<Profile> getAllProfiles();
    Principal getPrincipal(String username, String password);
    Profile getCurrentProfile(String username, String password);
    void saveProfile(Profile profile);
}