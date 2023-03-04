<%@page import="bean.lichsubean"%>
<%@page import="bo.lichsubo"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="style.css">
    <title>Lịch sử mua hàng</title>
    <style>
    	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
html {
    font-family: sans-serif;
}
body {
    width: 100%;   
    background-color:  #f5f5f5;
}
.header {
    width: 100%;
    height: 50px;
    background-color: #fff;
    box-shadow: 0px 1px #e7e7e7;
    position: fixed;
    z-index: 30;
    top: 0;
}
.header_ctn {
    display: flex;
    
    height: 100%;
    
}
.navlist {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
li {
    font: 14px;
    list-style: none;
    margin: 10px;
}
.list_nav{
    text-transform: none;
    color: #252525;
    text-decoration: none;
    font-weight: 700;
    transition:  .35s;

}
.list_nav:hover{
    color: #00a3f2;
}
.active {
    color: #00a3f2;
}

li.list_book.ls {
    margin: 0;
    padding: 2px 0 0 15px;
    height: 30px;
}
.loai {
    text-decoration: none;
    font-size: 13px;
    color: #000;
}
.ls:hover {
    background-color: #e7e7e7;
    border-left: 2px solid #00a3f2;
}
.log {
    height: 100%;
    display: flex;
    align-items: center;
    position: absolute;
    right: 0%;
}
.login {
    text-align: right;
}
.container{
    width: 97%;
    margin-top: 60px;
    min-height: 100vh;
    position: relative;
    margin-left: 25px;
}
.nav_cate {
    width: 100%;
    height: 100%;
    display: flex;
    font-family: Arial, Helvetica, sans-serif;
}
.category {
    width: 220px;
    height: 100%;
    margin-right: 30px;
}
.cate_ctn {
    width: 100%;
    
    background-color: #fff;
}
.cate_all {
    height: 50px;
    background-color: #00a3f2;
    font-weight: 700;
    color: #fff;
    text-align: center;
    font-size: 20px;
    line-height: 2.5;
    font-family: Tahoma, sans-serif;
    user-select: none;
}
.cate_all>i {
    margin-right: 6px;
}
.list_cate {
    box-shadow: 0px 1px #e7e7e7;
}
.list_book {
    margin:10px 0 4px 25px;
    font-size: 15px;
    font-family: Tahoma, sans-serif;
}
.sach_ctn {
    width: 100%;
}
.boxsearch {
    width: 100%;
    height: 50px;
    display: flex;
    margin: 0 5px;
}
.form_search{
    height: 50px;
    position: relative;
}
.form_search>button{
    background-color: #00a3f2;
    color: #fff;
    font-size: 18px;
    font-weight: 700;
    border: none;
    width: 150px;
    height: 100%;
    position: absolute;
    right: 0;
    bottom: 0;
    cursor: pointer;
}
input[type=text]{
    width: 100%;
    height: 100%;
    border: 1px solid #cecece;
    padding: 12px 20px;
    transition: .35s;
    outline: none;
}
input[type=text]:focus{
    border: 1px solid #00a3f2;
}
.contact{
    background-color: #00a3f2;
    color: #fff;
    font-size: 18px;
    font-weight: 700;
    border: none;
    width: 180px;
    height: 50px;
    cursor: pointer;
    margin-left: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.giohang{
    width: 100%;
    background-color: transparent;
}
a {
    text-decoration: none;
    margin: 0 10px;
    color: #fff;
    line-height: 2.2;
}
.tb_gh{
    width: 100%;
    margin-top:-2px;
    font-size: 14px;
    color: #000;
    font-family: 'Tahoma', sans-serif;
}
thead {
    height: 50px;
    background-color: #00a3f2;
    color: #fff;
    font-size: 14px;
}
td {
    height: 160px;
    background-color: #fff;
    text-align: center;
}
.name_book {
    text-align: left;
    padding-left: 8px;
    
}
.img_book {
    width: 120px;
    height: 150px;
}
tbody>tr {
    box-shadow: 1px 1px #e7e7e7;
}
    </style>
</head>
<body>
    <div class="header">
        <div class="header_ctn">
            <ul class="navlist">
                <li><a class="list_nav" href="htsachController"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ</a></li>
                <li><a class="list_nav" href="htgioController"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ hàng</a></li>
                <li><a class="list_nav active" href="lichsucontroller?mkh=${makh }"><i class="fa fa-list" aria-hidden="true"></i> Lịch sử mua hàng</a></li>
                <!-- <li><a class="list_nav" href="">Thanh toán</a></li> -->
               
			
			<c:if test="${DangNhap==null }">
                <div class="log">
                    <li class="login"><a class="list_nav" href="ktdn"><i class="fa fa-sign-in" aria-hidden="true"></i> Đăng nhập</a></li>
                    <li class="signin"><a class="list_nav" href="khachhangController"><i class="fa fa-user-plus" aria-hidden="true"></i> Đăng ký</a></li>
                </div>
            </c:if>
            <c:if test="${DangNhap != null }">
				
					<div class="log">
	                    <li class="login" style="cursor:pointer;"><a style="color: #000;user-select:none;cursor: default;">Xin chào, <c:out value="${DangNhap}" />!</a></li>
	                    <li class="signin"><a href="logout" class="list_nav">Đăng xuất</a></li>
                    </div>
			</c:if> 
            </ul>
        </div>
    </div>
    <div class="container">
        <div class="nav_cate">
            <div class="sach_ctn">
                <div class="giohang">
                    <div class="ctn">
                        <!-- <form action="giohangController" method="GET" id="my_form"></form> -->
                            <table class="tb_gh">
                                <thead>
                                    <tr>
                                        <th style="width: 5%">STT</th>
										<th style="width: 12%">Sản phẩm</th>
										<th style="width: 25%">Tên sách</th>
										<th style="width: 12%">Đơn giá</th>
										<th style="width: 12%">Số lượng</th>
										<th style="width: 12%">Số tiền</th>
										<th style="width: 12%">Ngày mua</th>
										<th style="width: 10%">Đã mua</th>

                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach var="h" items="${ls }">
                               <tr>
								<c:set value="${i+1 }" var="i" />
								<td data-th="STT">
										<c:out value="${i }" />
								</td>
								
								<td data-th="Sản phẩm"><img src="${h.getAnh() }" alt="" class="img_book"></td>
								<td data-th="Tên sách">
									<h4>${h.getTensach() }</h4>
								</td>
								<td data-th="Đơn giá">
									<h4>${h.getGia() }VNĐ</h4>
								</td>

								<td data-th="Số lượng"><h4>${h.getSoluong() }</h4></td>
								<td data-th="Số tiền" style="color: orangered">
									<h4>${h.getGia() * h.getSoluong() }
										VNĐ</h4>
								</td>
								<td data-th="Ngày mua">
									<h4>
										<fmt:formatDate value="${h.getNgaymua() }" pattern="dd/MM/yyyy" />
									</h4>
								</td>
								<td data-th="Đã mua">
								<c:if test="${h.isDamua() == false}">
									<h4>Chưa thanh toán</h4>
								</c:if>
								<c:if test="${h.isDamua() != false}">
									<h4>Đã thanh toán</h4>
								</c:if>
								</td>

							</tr>

						</c:forEach>
                            </table>
                            </div>
                    </div>
                </div>
            </div>
        
    </div>
    
    
</body>
</html>