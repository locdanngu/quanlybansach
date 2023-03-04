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
 * Servlet implementation class fixsach
 */
@WebServlet("/fixsach")
public class fixsach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fixsach() {
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
		String ms = request.getParameter("ms");
		String msm= request.getParameter("msm");
		String tsm= request.getParameter("tsm");
		Long slm= Long.parseLong(request.getParameter("slm"));
		Long gm= Long.parseLong(request.getParameter("gm"));
		String mlm= request.getParameter("mlm");
		String anhm= request.getParameter("anhm");
		int stm= Integer.parseInt(request.getParameter("stm"));
		Date nnm= Date.valueOf(request.getParameter("nnm"));
		String tgm= request.getParameter("tgm");
		sachbo sdao = new sachbo();
		sdao.editSach(msm, tsm, slm, gm, mlm, stm, anhm, nnm, tgm, ms);
		RequestDispatcher rd= request.getRequestDispatcher("adminSachController");
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
