package model;

public class Category {
    private int categoryId;
    private String name;
    private String description;

    public Category(int categoryId, String name, String description){
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
    }

    public int getCategoryId(){return this.categoryId;}

    public void setCategoryId(int categoryId){this.categoryId = categoryId;}

    public String getName(){return this.name;}

    public void setName(String name){this.name = name;}

    public String getDescription(){return this.description;}

    public void setDescription(String description){this.description = description;}
}
