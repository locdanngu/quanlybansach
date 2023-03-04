package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.loaibo;

/**
 * Servlet implementation class suasachcontroller
 */
@WebServlet("/suasachcontroller")
public class suasachcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suasachcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String ms= request.getParameter("ms");
		session.setAttribute("ms", ms);
		String ts= request.getParameter("ts");
		session.setAttribute("ts", ts);
		Long sl= Long.parseLong(request.getParameter("sl"));
		session.setAttribute("sl", sl);
		Long g= Long.parseLong(request.getParameter("g"));
		session.setAttribute("g", g);
		String ml= request.getParameter("ml");
		session.setAttribute("ml", ml);
		String anh= request.getParameter("anh");
		session.setAttribute("anh", anh);
		int st= Integer.parseInt(request.getParameter("st"));
		session.setAttribute("st", st);
		Date nn= Date.valueOf(request.getParameter("nn"));
		session.setAttribute("nn", nn);
		String tg= request.getParameter("tg");
		session.setAttribute("tg", tg);
		loaibo loai = new loaibo();
		/*
		 * ArrayList<loaibean> dsloai = loai.getloai(); String GTTK =
		 * request.getParameter("gttk"); if (GTTK != null) { dsloai = loai.Tim(GTTK); }
		 */
		
		if (loai.getloai() != null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		RequestDispatcher rd= request.getRequestDispatcher("adminsuasach.jsp");
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
