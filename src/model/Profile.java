package model;

import java.util.Date;

public class Profile extends Principal {
    private int profileId;
    private String firstName;
    private String lastName;
    private String description;
    private String highlight;
    private Date birthDate;
    private Date startDate;

    public Profile(int profileId, String firstName, String lastName){
        this.profileId = profileId;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Profile(String highlight, String description, Date birthDate, Date startDate){
        this.highlight = highlight;
        this.description = description;
        this.birthDate = birthDate;
        this.startDate = startDate;
    }

    public int getProfileId() {
        return profileId;
    }

    public String getHighlight() { return highlight; }

    public String getDescription() {
        return description;
    }

    public String getFirstName() { return firstName; }

    public String getLastName() { return lastName; }

    public Date getBirthDate() { return birthDate; }

    public Date getStartDate() { return startDate; }

    public void setProfileId(int profileId) { this.profileId = profileId; }

    public void setHightlight(String highlight) { this.highlight = highlight; }

    public void setDescription(String description) { this.description = description; }
}
