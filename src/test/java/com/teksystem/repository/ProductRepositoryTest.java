package com.teksystem.repository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import com.teksystem.database.AccountDAO;
import com.teksystem.database.ProductDAO;
import com.teksystem.model.Account;
import com.teksystem.model.Product;

@DataJpaTest
public class ProductRepositoryTest {
	
	@Autowired
	private ProductDAO pd;
	
	@Autowired
	private AccountDAO ad;
	
	
	
	
	@Test
	public void checkIfProductSave()
	{
		int length=pd.findAll().size();
		Product product = new Product();
		product.setDateadded(new Date());
		product.setDescription("adsf");
		product.setImagepath("adsfs");
		product.setSelleraccount(ad.findByusername("Tom00"));
		product.setName("asfas");
		product.setPrice(33);
		product.setReviewed(false);
		product.setPurchased(false);
		pd.save(product);
		
		assertTrue((length+1)==pd.findAll().size());
	}
}
