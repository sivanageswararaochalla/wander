package com.wander.repository;

import org.springframework.data.repository.CrudRepository;

import com.wander.model.User;

public interface UserRepository extends CrudRepository<User, Integer>{

}
