package com.shashirajraja.onlinebookstore.dto;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


public class BookImg {

    private String name;

    private int quantity;

    private double price;

    private MultipartFile bookImg;

    public BookImg() {
    }

    public BookImg(int id, String name, int quantity, double price, MultipartFile bookImg) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.bookImg = bookImg;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public MultipartFile getBookImg() {
        return bookImg;
    }

    public String getBookImgName() {
        return bookImg!=null? bookImg.getOriginalFilename():"";
    }

    public void setBookImg(MultipartFile bookImg) {
        this.bookImg = bookImg;
    }
}
