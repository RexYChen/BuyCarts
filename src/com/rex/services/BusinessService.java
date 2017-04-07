package com.rex.services;

import java.util.Map;

import javax.enterprise.inject.New;

import com.rex.dao.BookDao;
import com.rex.domain.Book;
import com.rex.domain.Cart;

public class BusinessService {

	private BookDao dao = new BookDao();
	
	// support service to web
	public Map getAllBook(){
		return dao.getAll();
	}
	
	public Book findBook(String id){
		return dao.find(id);
	}

	public void deleteCartItem(String id, Cart cart) {
		// TODO Auto-generated method stub
		cart.getMap().remove(id);
	}

	public void changeQuantity(String id,String quantity, Cart cart) {
		// TODO Auto-generated method stub
		cart.getMap().get(id).setQuantity(Integer.parseInt(quantity));
	}
	
}
