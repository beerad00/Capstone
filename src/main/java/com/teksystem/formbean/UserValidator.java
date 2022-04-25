package com.teksystem.formbean;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class UserValidator {
	@Length(min=1,max=45)
	@NotEmpty(message="Please Enter a Username")
	String username;
	@Length(min=1,max=45)
	@NotEmpty(message="Please Enter a Name")
	String name;
	
	String imagepath;
	
	String sumdescription;
	
	String location;
	
	@Pattern(regexp ="[0-9]{3}-[0-9]{3}-[0-9]{4}")
	String phonenumber;
	
	@NotEmpty(message="You must enter a password")
	String password;

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

	public String getSumdescription() {
		return sumdescription;
	}

	public void setSumdescription(String sumdescription) {
		this.sumdescription = sumdescription;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	
	
	
}
