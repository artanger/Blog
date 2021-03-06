package model;

public class Principal {

    private String username;
    private String password;
    private String shortName;
    private int userId;

    public Principal(String username, String password, String shortName){
        this.username = username;
        this.password = password;
        this.shortName = shortName;
    }

    public Principal() {
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) { this.userId = userId; }
}
