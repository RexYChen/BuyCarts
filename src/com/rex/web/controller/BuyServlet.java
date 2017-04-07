package com.rex.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rex.domain.Book;
import com.rex.domain.Cart;
import com.rex.services.BusinessService;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/servlet/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		BusinessService service= new BusinessService();
		Book book = service.findBook(id);
		
		//get user carts
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		
		if(cart ==null){
			cart =new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		//add book to carts	
		cart.add(book);
		// send redirect can't access .jsp file under WEB-INF folder 
		//response.sendRedirect("WEB-INF/jsp/listcart");
		response.sendRedirect(request.getContextPath()+"/servlet/ListcartUIServlet");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
