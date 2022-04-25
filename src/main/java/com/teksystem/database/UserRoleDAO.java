package com.teksystem.database;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.teksystem.model.UserRoles;



public interface UserRoleDAO extends JpaRepository<UserRoles,Long> {

	List<UserRoles> findByUserId(@Param("userId") Integer userId);
}
