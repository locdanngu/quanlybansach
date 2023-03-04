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

import bo.sachbo;

/**
 * Servlet implementation class addsach
 */
@WebServlet("/addsach")
public class addsach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsach() {
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
		String ts= request.getParameter("ts");
		Long sl= Long.parseLong(request.getParameter("sl"));
		Long g= Long.parseLong(request.getParameter("g"));
		String ml= request.getParameter("ml");
		String anh= request.getParameter("anh");
		int st= Integer.parseInt(request.getParameter("st"));
		Date nn= Date.valueOf(request.getParameter("nn"));
		String tg= request.getParameter("tg");
		sachbo sbo = new sachbo();
		sbo.addSach(ms, ts, st, st, ml, st, anh, nn, tg);
		RequestDispatcher rd = request.getRequestDispatcher("adminSachController");
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
