package com.rex.dao;

import java.util.Map;

import com.rex.DB.DB;
import com.rex.domain.Book;

public class BookDao {

	public Map getAll(){
		return DB.getAll();
	}
	
	// parameter id is Map id , no book id
	public Book find(String id){
		return (Book) DB.getAll().get(id);
	}
	
}
