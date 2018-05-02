package model;

import java.sql.Blob;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Profile extends Principal {
    private int profileId;
    private String firstName;
    private String lastName;
    private String description;
    private String highlight;
    private Date birthDate;
    private Date startDate;
    private Blob image;
    private String imgsrc;

    public Profile(int profileId, String firstName, String lastName){
        this.profileId = profileId;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Profile(String highlight, String description, Date birthDate, Date startDate, Blob image){
        this.highlight = highlight;
        this.description = description;
        this.birthDate = birthDate;
        this.startDate = startDate;
        this.image = image;
    }

    public Blob getImage(){return image;}

    public void setImage(Blob image){this.image = image;}

    public String getImageSrc(){return imgsrc;}

    public void setImageSrc(String imgsrc){this.imgsrc = imgsrc;}

    public int getProfileId() {
        return profileId;
    }

    public String getHighlight() { return highlight; }
    //firstName
    public String getFirstName() { return firstName; }
    //lastName
    public String getLastName() { return lastName; }

    //birthDate
    public Date getBirthDate() { return birthDate; }

    public String getBirthDateFormatted() {
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        return df.format(birthDate);
    }

    public void setBirthDate(Date birthDate) { this.birthDate = birthDate;}
    //startDate
    public Date getStartDate() { return startDate; }

    public void setProfileId(int profileId) { this.profileId = profileId; }
    //highlight
    public void setHightlight(String highlight) { this.highlight = highlight; }

    public void setImgSrc(String imgSrc) { this.imgsrc = imgSrc; }

    //description
    public String getDescription() {
        return description;
    }
    //description
    public void setDescription(String description) { this.description = description; }



}
