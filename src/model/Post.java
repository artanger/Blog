package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

public class Post {
    private int id;
    private String title;
    private String text;
    private int userId = -1;
    private String time = "";
    private String categoryId = "";
    private String categoryName = "";
    private String userFirstName = "";
    private String userLastName = "";
    private String introduction;
    private int commentsCount;

    public Post(int id, String title, String text) {
        this.id = id;
        this.title = title;
        this.text = text;
    }

    public void setText(String text) {
        this.text = text;
    }
    public String getText() {
        return text;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getShortText() {
        int endIndex = text.length();

        if (endIndex > 200){
            endIndex = 200;
        }

        return text.substring(0, endIndex);
    }

    public String getTime() { return time; }
    public void setTime(LocalDateTime time) {
        this.time = time.toString();
    }
   /* public String getBirthDateFormatted() {
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        return df.format(birthDate);
    }*/

    public int getUserId() { return userId; }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCategoryId() { return this.categoryId; }
    public void setCategoryId(String categoryId) { this.categoryId = categoryId; }

    public String getCategoryName() { return this.categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getUserFirstName() { return this.userFirstName; }
    public void setUserFirstName(String userFirstName) { this.userFirstName = userFirstName; }

    public String getUserLastName() { return this.userLastName; }
    public void setUserLastName(String userLastName) { this.userLastName = userLastName; }

    public String getUserShortName() { return String.format("%s %s", this.userFirstName, this.userLastName); }

    public String getIntroduction() { return this.introduction; }
    public void setIntroduction(String introduction) { this.introduction = introduction; }

    public int getCommentsCount() { return commentsCount; }
    public void setCommentsCount(int commentsCount) { this.commentsCount = commentsCount; }
}