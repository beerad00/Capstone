package com.teksystem.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
@Builder
@Entity
@Table(name="Account")
public class Account {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String imagepath;
	private String name;
	private String password;
	private double rating;
	private String sumdescription;
	private String phonenumber;
	private String location;
	@OneToMany(mappedBy="selleraccount", cascade=CascadeType.ALL)
	private List<Product> sellerlist;
	
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(String username, String name, String password, double rating, String sumdescription, String phonenumber,
			String location, String imagepath) {
		super();
		this.username = username;
		this.name = name;
		this.password = password;
		this.rating = rating;
		this.sumdescription = sumdescription;
		this.phonenumber = phonenumber;
		this.location = location;
		this.imagepath=imagepath;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getSumdescription() {
		return sumdescription;
	}
	public void setSumdescription(String sumdescription) {
		this.sumdescription = sumdescription;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public List<Product> getSellerlist() {
		return sellerlist;
	}
	public void setSellerlist(List<Product> sellerlist) {
		this.sellerlist = sellerlist;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	@Override
	public String toString() {
		return "Account [username=" + username + ", name=" + name + ", password=" + password + ", rating=" + rating
				+ ", sumdescription=" + sumdescription + ", phonenumber=" + phonenumber + ", location=" + location
				+ ", sellerlist=" + sellerlist + "]";
	}
	
	
	
	
	

}
