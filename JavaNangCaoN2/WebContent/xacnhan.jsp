 <%@page import="bean.xacnhanbean"%>
<%@page import="bean.dangnhapbean"%>
<%@page import="bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="htsachController">Loại</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="giohangController">Sách</a></li>
      <li><a href="#">Xác nhận hóa đơn</a></li>
       
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="xoa.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li>
      <%if(session.getAttribute("admin")==null){ %>
      <a href="ktdnAdminController">
          <span class="glyphicon glyphicon-log-in"></span>
	       Login
       </a></li>
       <%} else{  %>
       <a href="#">
          <span class="glyphicon glyphicon-log-in"></span>
	       Hi <%
	       dangnhapbean dn=(dangnhapbean)session.getAttribute("admin");
	       out.print(dn.getTenDangNhap());
	       %>
       </a></li>
       <%} %>
    </ul>
  </div>
</nav>
  
<table width="1000" align="center" class="table">
   <%ArrayList<xacnhanbean> ds= 
  (ArrayList<xacnhanbean>)request.getAttribute("dskh"); %>

   <%
   int i=0;
   for(xacnhanbean xn: ds){ %>
      <tr>
      <td><%=i %></td>
      <td><%=xn.getHoten() %></td>
      <td><%=xn.getTensach() %></td>
      <td><%=xn.getGia() %></td>
      <td><%=xn.getSoLuongMua()%></td>
      <td><%=xn.getThanhTien() %></td>
      <td><%=xn.getNgayMua() %></td>
      <td><%=(xn.isDamua()?"Da thanh toan":"Dang dat mua") %></td>
      <td> <a href="xacnhanChuyenTienController">
          Xác nhận đã chuyển tiền
           </td>
   <% i++;} %>
   		
</table>
</body>
</html>

