package model;

import java.sql.Date;
import java.time.LocalDateTime;

public class Post {
    int id = -1;
    String title = "";
    String text = "";
    int userId = -1;
    String time = "";

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

    public int getUserId() { return userId; }
    public void setUserId(int userId) {
        this.userId = userId;
    }
}