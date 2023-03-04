package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.loaibo;
import bo.sachbo;
import bean.sachbean;
/**
 * Servlet implementation class htsachController
 */
@WebServlet("/htsachController")
public class htsachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public htsachController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loaibo loai = new loaibo();
		if (loai.getloai() != null) {
			request.setAttribute("dsloai", loai.getloai());
		}
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		sachbo sdao = new sachbo();
		String maloai = request.getParameter("ml");
		String giaTriTimKiem = request.getParameter("txttk");

		
		int count =0;
		int endPage=0;
		//Pagination
		String indexPage = request.getParameter("page");
		int page=1;
		if(indexPage!=null)
			page = Integer.parseInt(indexPage);
		
		ArrayList<sachbean> dsSach = null;
		if(maloai == null && giaTriTimKiem == null) {
			dsSach = sdao.pagingBooks(page);
			count = sdao.getTotalBook();
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(maloai!=null) {
			dsSach = sdao.pagingBooksByMaSach(page, maloai);
			count = sdao.countBooksByMaLoai(maloai);
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(giaTriTimKiem!=null) {
			dsSach = sdao.pagingBooksBySearchValue(page, giaTriTimKiem);
			count = sdao.countBooksBySearchValue(giaTriTimKiem);
			endPage = count/12;
			if(count % 12 != 0)
				endPage++;
		}
		if(dsSach!=null)
			request.setAttribute("dssach", dsSach);
		
		request.setAttribute("endPage", endPage);
		request.setAttribute("tag", page);
		RequestDispatcher rd = request.getRequestDispatcher("htsach.jsp");
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