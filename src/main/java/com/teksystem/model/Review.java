package com.teksystem.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name="Review")
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String reviews;
	private int userrating;
	@Temporal(TemporalType.DATE)
	private Date date;
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account accountreviewed;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(String reviews, int userrating, Account accountreviewed) {
		super();
		this.reviews = reviews;
		this.userrating = userrating;
		this.accountreviewed = accountreviewed;
		this.date=new Date();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReviews() {
		return reviews;
	}
	public void setReviews(String reviews) {
		this.reviews = reviews;
	}
	public int getUserrating() {
		return userrating;
	}
	public void setUserrating(int userrating) {
		this.userrating = userrating;
	}
	public Account getAccountreviewed() {
		return accountreviewed;
	}
	public void setAccountreviewed(Account accountreviewed) {
		this.accountreviewed = accountreviewed;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Review [reviewId=" + id + ", reviews=" + reviews + ", userrating=" + userrating
				+ ", accountreviewed=" + accountreviewed + "]";
	}
	
	

}
