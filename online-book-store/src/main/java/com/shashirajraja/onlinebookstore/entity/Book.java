package com.shashirajraja.onlinebookstore.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="price")
	private double price;
	
	@JoinColumn(name="book_detail_id", referencedColumnName="id")
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private BookDetail bookDetail;

	@Column(name="deleted")
	private boolean deleted;

//	@Column(name="bookName")
//	private String bookName;


	public Book() {}

	public Book(String name, int quantity, double price, BookDetail bookDetail,boolean deleted) {
		super();
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.bookDetail = bookDetail;
		this.deleted = deleted;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public BookDetail getBookDetail() {
		return bookDetail;
	}

	public void setBookDetail(BookDetail bookDetail) {
		this.bookDetail = bookDetail;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", bookDetail="
				+ bookDetail + "]";

//		return "Book [id=" + id + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", bookDetail="
//				+ bookDetail + ", bookName=" + bookName + "]";
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

//	public String getBookName() {
//		return bookName;
//	}
//
//	public void setBookName(String bookName) {
//		this.bookName = bookName;
//	}
}
