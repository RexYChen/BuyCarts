package com.rex.DB;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.enterprise.inject.New;

import com.rex.domain.Book;

public class DB {
	
	private static Map map = new LinkedHashMap();
	
	static{
		map.put("1", new Book("1","JavaWeb",25,"MR C","java development"));
		map.put("2", new Book("2","C",45.5,"MR L","C development"));
		map.put("3", new Book("3","C++",60,"MR R","C++ development"));
		map.put("4", new Book("4","python",13.1,"MR P","python development"));
	}

	public static Map getAll(){
		return map;
	}
	
}
