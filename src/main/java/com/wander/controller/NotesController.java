package com.wander.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.wander.model.Notes;
import com.wander.model.User;
import com.wander.service.NotesService;
import com.wander.service.UserService;

@Controller
@RestController
public class NotesController {
	
	@Autowired
	private NotesService notesService;
	
	@Autowired
	private UserService userService;
	
	/*@RequestMapping("/users/{id}/notes")
	public List<Notes> getAllNotesRest(Integer userId){
		return notesService.getAllNotes(userId);
	}*/
	
	@RequestMapping("/users/{userId}/notes")
	public ModelAndView getAllNotes(@PathVariable Integer userId){
		List<Notes> notesList = notesService.getAllNotes(userId);
		ModelAndView model = new ModelAndView("success");
		model.addObject("user", userService.getUser(userId));
		model.addObject("notesList", notesList);
		return model;
	} 
	
	@RequestMapping("/users/{userId}/notes/{id}")
	public Notes getNotes(@PathVariable Integer id){
		return notesService.getNotes(id);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/users/{userId}/notes")
	public RedirectView addNotes(@ModelAttribute("notesForm") Notes notes, @PathVariable Integer userId){
		notes.setUser(new User(userId, "", "", "", "", new ArrayList<Notes>()));
		notes.setCreated(new Date());
		notes.setUpdated(new Date());
		notesService.addNote(notes);
		
		RedirectView rv = new RedirectView();
		rv.setContextRelative(true);
		rv.setUrl("/users/"+userId+"/notes");
		return rv;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/updateNote/users/{userId}/notes/{notesId}")
	public ModelAndView updateNotes(@PathVariable Integer userId,
			@PathVariable Integer notesId){
		ModelAndView model = new ModelAndView();
		
		Notes note = notesService.getNotes(notesId);
		note.setUser(new User(userId, "", "", "", "",new ArrayList<Notes>()));
		
		model.addObject("notesForm", note);
		model.addObject("user", userService.getUser(userId));
		model.setViewName("updateform");
		
		return model;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/updated/users/{userId}/notes/{notesId}")
	public RedirectView saveUpdatedNote(@ModelAttribute("notesForm") Notes notes, @PathVariable Integer userId,
			@PathVariable Integer notesId){
		notes.setUser(new User(userId, "", "", "", "", new ArrayList<Notes>()));
		notes.setUpdated(new Date());
		notes.setId(notesId);
		notesService.addNote(notes);

		RedirectView rv = new RedirectView();
		rv.setContextRelative(true);
		rv.setUrl("/users/"+userId+"/notes");
		return rv;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/deleteNote/users/{userId}/notes/{notesId}")
	public RedirectView deleteNotes(@PathVariable("notesId") Integer notesId,
			@PathVariable("userId") Integer userId){
		notesService.deleteNotes(notesId);
		
		RedirectView rv = new RedirectView();
		rv.setContextRelative(true);
		rv.setUrl("/users/"+userId+"/notes");
		return rv;
	}

}
