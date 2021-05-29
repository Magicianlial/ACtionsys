package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import communication.Main;

/**
 * Servlet implementation class connectServlet
 */
@WebServlet("/connectServlet")
public class connectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public connectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 调用方法	
		System.out.println("1");
		String state = req.getParameter("state");
		System.out.println(state);
		if (state.equals("on") ) {
			Main.connect();
			
		}
		if (state.equals("off") ) {
			Main.disconnect();
			
		}
		resp.getWriter();
	}

}
