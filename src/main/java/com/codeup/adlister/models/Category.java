package com.codeup.adlister.models;

public class Category {
    private long id;
    private String category;

    public Category(){}

    public Category(Long id, String category){
        this.id = id;
        this.category = category;
    }
    public Category(String category){this.category=category;}

    public Long getId(){return id;}
    public void setId(Long id){ this.id = id;}

    public String getCategory(){return this.category;}
    public void setCategory(){this.category= category;}
}
