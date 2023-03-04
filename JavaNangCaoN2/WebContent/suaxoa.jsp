<%@page import="bo.giohangbo"%>
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
  giohangbo gh=(giohangbo)session.getAttribute("gio");
  String[] check= request.getParameterValues("check");
  if(check!=null)
	  for(String ms:check)
		  gh.Xoa(ms);
  if(request.getParameter("butxoa")!=null){
	  String ms=request.getParameter("butxoa");
	  gh.Xoa(ms);
  }
  if(request.getParameter("butsua")!=null){
	  String ms=request.getParameter("butsua");
	  String sl=request.getParameter(ms);
	//  out.print(ms+":"+sl);
	  gh.Them(ms, "", Long.parseLong(sl), 0, "");
  }
  session.setAttribute("gio", gh);
  if(gh.ds.size()==0)
	  response.sendRedirect("htsach.jsp");
  else
	  response.sendRedirect("htgio.jsp");
%>
</body>
</html>
