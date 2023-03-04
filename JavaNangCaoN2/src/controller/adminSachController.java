package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sachbean;

import bo.loaibo;
import bo.sachbo;


/**
 * Servlet implementation class adminSachController
 */
@WebServlet("/adminSachController")
public class adminSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminSachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		/*
		 * sachbo sach= new sachbo(); if(sach.getsach()!=null) {
		 * request.setAttribute("dssach", sach.getsach()); }
		 */
		sachbo sdao = new sachbo();
		
		ArrayList<sachbean> dssach = sdao.getsach();
		String GTTK = request.getParameter("gttk");
		if (GTTK != null) {
			dssach = sdao.Tim(GTTK);
		}
		
		if (dssach != null) {	
			request.setAttribute("dssach", dssach);
		}
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("adminSach.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
