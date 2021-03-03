package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.item;
import com.service.removeItem;

/**
 * Servlet implementation class itemRemoveServlet
 */
@WebServlet("/itemRemoveServlet")
public class itemRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int productID =Integer.parseInt(request.getParameter("itemID"));
		
		item it = new item();
		it.setItemID(productID);
		
		removeItem rm = new removeItem();
		rm.removeItem(it);
		
		RequestDispatcher dis = request.getRequestDispatcher("itemView.jsp");
		dis.forward(request,response);
		
		
		
	}

}
