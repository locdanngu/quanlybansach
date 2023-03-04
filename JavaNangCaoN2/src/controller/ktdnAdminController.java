package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangnhapbean;
import bean.khachhangbean;
import bo.dangnhapAdminbo;
import bo.khachhangbo;
import dao.logindao;

/**
 * Servlet implementation class ktdnAdminController
 */
@WebServlet("/ktdnAdminController")
public class ktdnAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ktdnAdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * request.setCharacterEncoding("UTF-8");
		 * response.setCharacterEncoding("UTF-8");
		 * 
		 * logindao tkad = new logindao(); String dnsad="aa"; String usernamead =
		 * request.getParameter("txtunad"); String passwordad =
		 * request.getParameter("txtpassad"); if (usernamead != null && passwordad !=
		 * null) { HttpSession session = request.getSession(); if
		 * (tkad.getTaiKhoan(usernamead, passwordad)==1) { if
		 * (session.getAttribute("DangNhapAD") != null)
		 * session.setAttribute("DangNhapAD", ""); session.setAttribute("DangNhapAD",
		 * usernamead); RequestDispatcher rd =
		 * request.getRequestDispatcher("adminController"); rd.forward(request,
		 * response); }
		 * 
		 * else { RequestDispatcher rd = request.getRequestDispatcher("htxecontroller");
		 * rd.forward(request, response); }
		 * 
		 * else { dnsad="bb"; RequestDispatcher rd =
		 * request.getRequestDispatcher("dangnhapsaicontroller"); rd.forward(request,
		 * response); } }
		 */
		RequestDispatcher rd = request.getRequestDispatcher("dangnhapAdmin.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
