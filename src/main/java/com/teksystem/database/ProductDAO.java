package com.teksystem.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teksystem.model.Account;
import com.teksystem.model.Product;
@Repository
public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	List<Product> findByselleraccount(@Param("selleraccount")Account selleraccount);
	List<Product> findBybuyeraccount(@Param("buyeraccount")Account buyeraccount);
	
	@Query(value="Select * from product p where p.purchased=false", nativeQuery=true)
	List<Product> getSellingList();
	
	@Query(value="SELECT p FROM Product p WHERE p.name LIKE %:name%")
	List<Product> getSimilarName(@Param("name") String name); 
	
}
