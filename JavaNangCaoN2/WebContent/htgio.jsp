<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
<style type="text/css">
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
    width: 80%;
    margin:60px 10% 80px;
    /* min-height: 100vh; */
    position: relative;
    
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
    font-weight: bold;
}
.list_book {
    margin:10px 0 4px 25px;
    font-size: 15px;
    font-family: Tahoma, sans-serif;
}
.sach_ctn {
    width: calc(100% - 250px);;
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
    width: 125%;
    background-color: transparent;
}
.cnt {
    width: 100%;
}
.book_name {
    color: #00a3f2;
    font-weight: 700;
    width: 100%;
    height: 20%;
}
.soluong {
    font-size: 8px;
}
.mua{
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    height: 40px;  
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
    height: 100px;
    background-color: #fff;
    text-align: center;
}
.name_book {
    text-align: left;
    padding-left: 8px;
    
}
.img_book {
    width: 80px;
    height: 90px;
}
td>a {
    /* color: #fff; */
    margin: 0;
    margin-bottom: 4px;
    display: inline-block;
    width: 75%;
    background-color: #00a3f2;
    border-radius: 6px;
}
td>a:hover{
    opacity: 0.8;
}
tbody>tr {
    box-shadow: 1px 1px #e7e7e7;
    
}
tbody>tr:hover{
	opacity: 0.85;
}
.tac {
    background-color: orangered;

}
.sum {
    color: red;
    font-weight: 600;
}
input[type=number]{
    text-align: center;
    width: 50px;
    height: 30px;
    outline: none;
    border: 1px solid #cecece;
}

input[type=number]:focus{
    border: 1px solid #00a3f2;
}
.payment{
	position: fixed;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:70px;
	border-top:1px solid #e7e7e7;
	background-color: #fff;
}
.payment>.ctn {
    width: 80%;
    height:70px;
    display:flex;
    align-items: center;
	justify-content: space-between;
    margin: 0 10%;
}
.btn {
    color: #fff;
    padding:0 20px;
    border-radius: 18px;
    border: none;
    background-color: #00a3f2;
}
.btn_del {
    border: none;
    cursor: pointer;
    padding: 4px 10px;
    background-color: orangered;
    color: #fff;
    border-radius: 12px;
}
.btn.pay{
    background-color: orangered;
}
.btn_group {
    display: flex;
}
.btn_del:hover, .btn:hover {
    opacity: 0.8;
}
.btn_del:active, .btn:active {
    opacity: 0.6;
}
.sum_all {
    user-select: none;
    text-align: right;
    margin-right: 20px;
}
</style>

</head>
<body>
	<div class="header">
        <div class="header_ctn">
            <ul class="navlist">
                <li><a class="list_nav" href="htsachController"><i class="fa fa-home" aria-hidden="true"></i> Trang chủ</a></li>
                <li><a class="list_nav active" href="htgioController"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ hàng</a></li>
               <!--  <li><a class="list_nav" href="">Thanh toán</a></li> -->
                <li><a class="list_nav" href="lichsucontroller?mkh=${makh }"><i class="fa fa-list" aria-hidden="true"></i> Lịch sử mua hàng</a></li>
                
               
			
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
        <div style="    margin-left: -125px;" class="nav_cate">
            <div class="category">
                <div class="cate_ctn">
                    <div class="cate_all">
                        <i class="fa fa-bars"></i>
                        <span>Tất cả loại sách</span>
                    </div>
                    <ul class="list_cate">
                    <c:forEach items="${dsloai }" var="l">
                        <li class="list_book ls"><a class="loai" href="htsachController?ml=${l.getMaloai() }">
							${l.getTenloai() }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="sach_ctn">
                <div class="giohang">
                    <div class="ctn">
                        <form action="giohangController" method="GET" id="my_form"></form>
                            <table class="tb_gh">
                                <thead>
                                    <tr>
                                        <th style="width: 17%">Sản phẩm</th>
                                        <th style="width: 30% ">Tên sách</th>
                                        <th style="width: 10%">Đơn giá</th>
                                        <th style="width: 9%">Số lượng</th>
                                        <th style="width: 12%">Thao tác</th>
                                        <th style="width: 14%">Số tiền</th>
                                        <th style="width: 10%"><input class ="btn_del"  type="submit" form="my_form"
                                            value="xoá" name="btn-cb-del">
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${ds }" var="d">
	                                    <tr>
	                                        <td data-th="Sản phẩm">
	                                            <img class="img_book" src="${d.getAnh() }" alt="">
	                                        </td>
	                                        <td class="name_book" data-th="Tên sách">${d.getTensach()}</td>
	                                        <td data-th="Đơn giá">${d.getGia() }đ</td>
	                                        <td data-th="Số lượng">
	                                            <input type="number" min="0" id=${d.getMasach() } value=${d.getSoluong() }>
	                                        </td>
	                                        <td data-th="Thao tác">
	                                            <a href="#" onclick="location.href='giohangController?hd=update&soluong='+document.getElementById('${d.getMasach() }').value+'&ms=${d.getMasach() }'">
												Cập nhật </a>
	                                            <a class="tac" href="giohangController?hd=remove&ms=${d.getMasach()}"> Trả lại</a>
	                                    	</td>
	                                        <td class="sum" data-th="Thành tiền">${d.getGia() * d.getSoluong() }đ</td>
	                                        <td data-th=""><input style="cursor: pointer;" type="checkbox" form="my_form"
	                                            class="Check-box" name="cb-del"
	                                            value=${d.getMasach() }></td>
	                                    </tr>
	                         		</c:forEach>
	                         		
                                </tbody>
                            </table>
                            </div>
                    </div>
                </div>
            </div>
        
    </div>
    <div class="payment">
        <div class="ctn">
            <div class="btn_group">
                <a class="btn" href="htsachController">Tiếp tục mua hàng</a>		
                <a class="btn" href="giohangController?hd=removeAll">Trả lại tất cả</a>
                <a class="btn pay" href="lichsucontroller?hd=thanhtoan&mkh=${makh }">Xác nhận đặt hàng</a>
                <!-- <form action="dathangController" method="post">
                	<button class="btn" style="padding: 12px 12px;" type="submit" name="abc">Xác  nhận đặt hàng</button>
                </form>  -->       
            </div>
            <div class="sum_all">
                <h4> (Tổng số: <b style="color:orangered;">${ds.size() }</b> sản phẩm)</h4>
                <h2 style="color:orangered;">Tổng tiền: ${gio.TongTien() } VNĐ</h2>
            </div>
        </div>
    </div>
    
</body>
</html>