package com.teksystem.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teksystem.model.Product;
import com.teksystem.model.Tags;

@Repository
public interface TagsDAO extends JpaRepository<Tags, Integer> {
	
	List<Tags> findByproducttagged(@Param("producttagged")Product producttagged);
	List<Tags> findBytitle(@Param("title")String title);
}
