package model;

public class Post {
    int id = -1;
    String title = "";
    String text = "";


    public Post(int id, String title, String text) {
        this.id = id;
        this.title = title;
        this.text = text;
    }


    public void setText(String text) {
        this.text = text;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public String getShortText() {
        int endIndex = text.length();

        if (endIndex > 200){
            endIndex = 200;
        }

        return text.substring(0, endIndex);
    }

    public String getTitle() {
        return title;
    }

    public int getId() {
        return id;
    }
}
