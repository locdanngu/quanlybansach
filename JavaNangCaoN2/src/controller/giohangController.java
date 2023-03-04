package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.loaibean;
import bean.sachbean;
import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class giohangController
 */
@WebServlet("/giohangController")
public class giohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public giohangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String hd = request.getParameter("hd");
		String masach = request.getParameter("ms");

		giohangbo gh = null;

		loaibo lbo = new loaibo();
		if (lbo.getloai() != null) {
			request.setAttribute("dsloai", lbo.getloai());
		}

		String button = request.getParameter("btn-cb-del");
		if (button != null) {
			gh = new giohangbo();
			if (session.getAttribute("gio") == null) {
				session.setAttribute("gio", gh);
			}
			String[] checkboxs = request.getParameterValues("cb-del");
			if (checkboxs == null) {
				gh = (giohangbo) session.getAttribute("gio");
				session.setAttribute("gio", gh);
			} else {
				for (String checkbox : checkboxs) {
					gh = (giohangbo) session.getAttribute("gio");
					gh.Xoa(checkbox);
				}
			}
		}
		if (hd != null) {
			if (hd.equals("add")) {
				String tensach = request.getParameter("ts");
				long soluong = (long) 1;
				long gia = Long.parseLong(request.getParameter("gia"));
				String anh = request.getParameter("anh");
				String makh = request.getParameter("makh");
				session.setAttribute("makh", makh);
				gh = new giohangbo();
				if (session.getAttribute("gio") == null) {

					session.setAttribute("gio", gh);
				}

				gh = (giohangbo) session.getAttribute("gio");
				gh.Them(masach, tensach, soluong, gia, anh);

			} else if (hd.equals("remove")) {

				gh = new giohangbo();

				if (session.getAttribute("gio") == null) {

					session.setAttribute("gio", gh);
				}

				if (hd.equals("remove")) {
					gh = (giohangbo) session.getAttribute("gio");
					gh.Xoa(masach);
				}

			} else if (hd.equals("update")) {
				long soluong = Long.parseLong(request.getParameter("soluong"));
				gh = new giohangbo();

				if (session.getAttribute("gio") == null) {
					session.setAttribute("gio", gh);
				}

				gh = (giohangbo) session.getAttribute("gio");
				gh.SuaSoLuong(masach, soluong);

			} else if (hd.equals("removeAll")) {

				gh = new giohangbo();
				if (session.getAttribute("gio") == null) {
					session.setAttribute("gio", gh);
				}
				gh = (giohangbo) session.getAttribute("gio");
				gh.XoaAll();

			}

			giohangbo gio = (giohangbo) session.getAttribute("gio");
			session.setAttribute("ds", gio.ds);
		}
		response.sendRedirect("htgioController");

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
