package datasource.abs;

import model.Principal;

public interface IUserDb {
    Principal getPrincipal(String username, String password);
}
