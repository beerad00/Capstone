package com.teksystem.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teksystem.model.Account;



@Repository
public interface AccountDAO extends JpaRepository<Account, Integer> {
	Account findByusername(@Param("username")String username);
	
	@Query(value="SELECT a FROM Account a WHERE a.username LIKE %:username%")
	List<Account> getSimilarName(@Param("username") String username); 
	

}
