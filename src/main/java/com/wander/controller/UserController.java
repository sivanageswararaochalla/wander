package com.wander.controller;

import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.wander.model.User;
import com.wander.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public RedirectView loginValidate(@RequestParam("email") String email,
			@RequestParam("password") String password){

		List<User> users = userService.getAllUsers();
		Iterator i = users.iterator();
		Integer id = null;
		while(i.hasNext()){
			User user = (User)i.next();
			if(user.getEmail().equalsIgnoreCase(email))
				id = user.getId();
		}
		User user = userService.getUser(id);
		Integer userId = user.getId();

		if(user.getEmail().equalsIgnoreCase(email) && 
				user.getPassword().equalsIgnoreCase(password)){

			RedirectView rv = new RedirectView();
			rv.setContextRelative(true);
			rv.setUrl("/users/"+userId+"/notes");
			return rv;

			// ModelAndView model = new ModelAndView("success", "user", user);
			//return model; 
		}else{
			RedirectView rv = new RedirectView();
			rv.setContextRelative(true);
			rv.setUrl("/home");
			return rv;
		}
	}

	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		return new ModelAndView("home");
	}

	@RequestMapping("/users")
	public List<User> getAllUsers(){
		return userService.getAllUsers();
	}

	@RequestMapping("/users/{id}")
	public User getUser(@PathVariable Integer id){
		return userService.getUser(id);
	}

	@RequestMapping(method = RequestMethod.POST, value = "/registration")
	public ModelAndView addUser(User user){
		userService.addUser(user);
		ModelAndView model = new ModelAndView("home");
		return model;
	}

	@RequestMapping(method = RequestMethod.PUT, value = "/users/{id}")
	public void updateUser(@RequestBody User user, @PathVariable Integer id){
		userService.updateUser(id, user);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/users/{id}")
	public void deleteUser(@PathVariable Integer id){
		userService.deleteUser(id);
	}

}
