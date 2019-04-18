package com.wander.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wander.model.Notes;
import com.wander.repository.NotesRepository;

@Service
public class NotesService {
	
	@Autowired
	private NotesRepository notesRepository;
	
	public List<Notes> getAllNotes(Integer notesId){
		List<Notes> notes = new ArrayList<Notes>();
		Iterable<Notes> iterable = notesRepository.findByUserId(notesId);
		
		for(Notes note : iterable){
			notes.add(note);
		}
		
		return notes;
	}
	
	public void addNote(Notes notes){
		notesRepository.save(notes);
	}
	
	public Notes getNotes(Integer id){
		return notesRepository.findById(id).get();
	}
	
	public void updateNotes(Notes notes){
		notesRepository.save(notes);	
	}
	
	public void deleteNotes(Integer id){
		notesRepository.deleteById(id);
	}

}
