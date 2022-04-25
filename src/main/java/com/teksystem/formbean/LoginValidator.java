package com.teksystem.formbean;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

public class LoginValidator {
	@NotEmpty(message="Please Enter a Username")
	@Length(min=1,max=45)
	private String username;
	@NotEmpty(message="Please Enter a password")
	@Length(min=1,max=45)
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
