package model;

import java.util.Date;

public class Comment {
    private int commentId;
    private int postId;
    private String author;
    private String text;
    private Date creationTime;

    public Comment(int postId, String author, String text){
        this.postId = postId;
        this.author = author;
        this.text = text;
    }

    public int getCommentId() { return commentId; }

    public void setCommentId(int commentId) { this.commentId = commentId; }

    public int getPostId() { return postId; }

    public void setPostId(int postId) { this.postId = postId; }

    public String getAuthor() { return author; }

    public void setAuthor(String author) { this.author = author; }

    public String getText() { return text; }

    public void setText(String text) { this.text = text; }

    public Date getCreationTime() { return creationTime; }

    public void setCreationTime(Date creationTime) { this.creationTime = creationTime; }
}
