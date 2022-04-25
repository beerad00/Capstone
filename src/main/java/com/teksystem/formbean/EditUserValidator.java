package com.teksystem.formbean;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

public class EditUserValidator {
	
	@Length(min=1,max=45)
	@NotEmpty(message="Please Enter a Username")
	String username;
	@Length(min=1,max=45)
	@NotEmpty(message="Please Enter a Name")
	String name;
	
	
	String sumdescription;
	
	String location;
	
	@Pattern(regexp ="[0-9]{3}-[0-9]{3}-[0-9]{4}")
	String phonenumber;
	

}
