package com.teksystem.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@Builder
@Entity
@Table(name="Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; 
	private String name;
	private String description;
	@Temporal(TemporalType.DATE)
	private Date dateadded;
	@Temporal(TemporalType.DATE)
	private Date datebought;
	private boolean purchased;
	private boolean reviewed;
	private double price;
	@ManyToOne
	@JoinColumn(name = "buyer_id")
	private Account buyeraccount;
	@ManyToOne
	@JoinColumn(name = "seller_id")
	private Account selleraccount;
	private String imagepath;
	@OneToMany(mappedBy="producttagged", cascade=CascadeType.ALL)
	private List<Tags> lot;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String name, String description, Date dateadded, boolean purchased, boolean reviewed,
			Account selleraccount, String imagepath, double price) {
		super();
		this.name = name;
		this.description = description;
		this.dateadded = new Date();
		this.purchased = purchased;
		this.reviewed = reviewed;
		this.selleraccount = selleraccount;
		this.imagepath = imagepath;
		this.price = price;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDateadded() {
		return dateadded;
	}
	public void setDateadded(Date dateadded) {
		this.dateadded = dateadded;
	}
	public Date getDatebought() {
		return datebought;
	}
	public void setDatebought(Date datebought) {
		this.datebought = datebought;
	}
	public boolean isPurchased() {
		return purchased;
	}
	public void setPurchased(boolean purchased) {
		this.purchased = purchased;
	}
	public boolean isReviewed() {
		return reviewed;
	}
	public void setReviewed(boolean reviewed) {
		this.reviewed = reviewed;
	}
	public Account getBuyeraccount() {
		return buyeraccount;
	}
	public void setBuyeraccount(Account buyeraccount) {
		this.buyeraccount = buyeraccount;
	}
	public Account getSelleraccount() {
		return selleraccount;
	}
	public void setSelleraccount(Account selleraccount) {
		this.selleraccount = selleraccount;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public List<Tags> getLot() {
		return lot;
	}
	public void setLot(List<Tags> lot) {
		this.lot = lot;
	}

	
	
	
	
	

}
