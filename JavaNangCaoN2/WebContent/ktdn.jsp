<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String un=request.getParameter("txtun");
		String pass=request.getParameter("txtpass");
		//if(un.equals("abc") && pass.equals("123"))
		//{
		//	response.sendRedirect("htsach.jsp");
		//}else response.sendRedirect("dangnhap.jsp?kt=1");
		if(session.getAttribute("dn")==null)
			session.setAttribute("dn", "");
		session.setAttribute("dn", un);
		response.sendRedirect("htsach.jsp");
	%>
</body>
</html>