package com.teksystem.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Tags")
public class Tags {
	@Id
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	@ManyToOne
	@JoinColumn(name="product_id")
	Product producttagged;
	public Tags() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tags(String title, Product producttagged) {
		super();
		this.title = title;
		this.producttagged = producttagged;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Product getProducttagged() {
		return producttagged;
	}
	public void setProducttagged(Product producttagged) {
		this.producttagged = producttagged;
	}
	@Override
	public String toString() {
		return "Tags [tagId=" + id + ", title=" + title + ", producttagged=" + producttagged + "]";
	}
	
	

	
	

}
