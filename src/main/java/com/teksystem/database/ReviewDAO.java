package com.teksystem.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teksystem.model.Account;
import com.teksystem.model.Review;


@Repository
public interface ReviewDAO extends JpaRepository<Review, Integer> {
	
	List<Review> findByaccountreviewed(@Param("accountreviewed")Account accountreviewed);

}
