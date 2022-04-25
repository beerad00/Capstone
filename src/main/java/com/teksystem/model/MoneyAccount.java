package com.teksystem.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="moneyaccount")
public class MoneyAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private double balance;
	
	@OneToOne
	@JoinColumn(name="account_id")
	private Account useraccount;

	public MoneyAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MoneyAccount(double balance, Account useraccount) {
		super();
		this.balance = balance;
		this.useraccount = useraccount;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public Account getUseraccount() {
		return useraccount;
	}

	public void setUseraccount(Account useraccount) {
		this.useraccount = useraccount;
	}
	
	

}
