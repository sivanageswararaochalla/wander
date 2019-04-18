package com.wander.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wander.model.User;
import com.wander.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	public List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		Iterable<User> iterable = userRepository.findAll();
		
		for(User user : iterable){
			users.add(user);
		}
		return users;
	}
	
	public void addUser(User user){
		userRepository.save(user);
	}
	
	public User getUser(Integer id){
		return userRepository.findById(id).get();
	}
	
	public void updateUser(Integer id, User user){
		userRepository.save(user);	
	}
	
	public void deleteUser(Integer id){
		userRepository.deleteById(id);
	}

}
