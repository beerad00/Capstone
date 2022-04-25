package com.teksystem.database;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teksystem.model.Account;
import com.teksystem.model.MoneyAccount;


@Repository
public interface MoneyAccountDAO extends JpaRepository<MoneyAccount, Integer> {
	MoneyAccount findByuseraccount(@Param("useraccount")Account useraccount);
	
}
