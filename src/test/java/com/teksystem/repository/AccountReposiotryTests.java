package com.teksystem.repository;

import static org.assertj.core.api.Assertions.assertThat;


import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;

import com.teksystem.database.AccountDAO;
import com.teksystem.model.Account;

@SpringBootTest
public class AccountReposiotryTests {
	
	@Autowired
	private AccountDAO ad;


	
	
	
	@Test
	public void testInsertion()
	{
		Account account = new Account("Bbob22","Bob","asfds",12,"hello","32332","fas","fdasdf");
		ad.save(account);
		
		assertThat(ad.findByusername("Bbob22")==account);
	}
}
	
