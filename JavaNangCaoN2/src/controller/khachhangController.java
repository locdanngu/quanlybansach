package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.khachhangbo;

/**
 * Servlet implementation class khachhangController
 */
@WebServlet("/khachhangController")
public class khachhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public khachhangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		khachhangbo tk = new khachhangbo();
		String ten = request.getParameter("uname");
		String un = request.getParameter("txtun");
		String pass = request.getParameter("txtpass");
		String conf = request.getParameter("txtconfirm");
		String addr = request.getParameter("address");
		String sdt = request.getParameter("phone");
		String email = request.getParameter("email");
		if (un != null && pass != null && conf!=null) {
			if (tk.checkKhachHang(un, pass)==0) {
				tk.addKhachHang(ten, addr, sdt, email, un, pass);
//			if (session.getAttribute("DangNhap") != null)
//					session.setAttribute("DangNhap", "");
//				session.setAttribute("DangNhap", tk.getTenKhachHang(un, pass));
//				response.sendRedirect("htsachController");
				RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
