package com.teksystem.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.teksystem.database.AccountDAO;
import com.teksystem.database.ReviewDAO;
import com.teksystem.model.Account;
import com.teksystem.model.Review;

@DataJpaTest
public class ReviewRepository {
	
	@Autowired
	private ReviewDAO rd;
	@Autowired
	private AccountDAO ad;
	Review review;
	
	
	@Test
	public void checkIfReviewsAdded()
	{	int size=rd.findAll().size();
		Review review = new Review("Hi how are you",1,ad.getById(2));
		review.setDate(new Date());
		
		rd.save(review);
		assertThat((rd.findAll().size())==(size+1));
		
	}
}
