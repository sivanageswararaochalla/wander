package com.wander.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.wander.model.Notes;

public interface NotesRepository extends CrudRepository<Notes, Integer>{
	
	public List<Notes> findByUserId(Integer userId);

}
