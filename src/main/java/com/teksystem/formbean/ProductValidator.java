package com.teksystem.formbean;

import java.util.Arrays;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class ProductValidator {
	int id;
	@NotEmpty(message="Please Enter a Product Name")
	@Length(min=1,max=45)
	String name;
	Double price;
	String[] tags;
	@NotEmpty(message="Please Enter a Description")
	@Length(min=1,max=200, message="Keep message to a length of 200 characters")
	String description;

	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String[] getLot() {
		return tags;
	}
	public void setLot(String[] tags) {
		this.tags = tags;
	}
	public int getId() {
		return id;
	}
	public void setId(int productid) {
		this.id = productid;
	}
	@Override
	public String toString() {
		return "ProductValidator [id=" + id + ", name=" + name + ", price=" + price + ", tags=" + Arrays.toString(tags)
				+ ", description=" + description + "]";
	}

	

}
