<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="image/png" sizes="16x16" rel="icon" href="image_sach/icons8-book-16.png">
    <title>Sửa thông tin sách</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
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

.pagination-container {
	position: fixed;
	bottom: 0;
	right: 0;
	left: 0;
	background-color: #fff;
	z-index: 30;
}
.pagination {
	display:flex;
	justify-content: center;
}
.pagination a {
	color: black;
	float: left;
	padding: 4px 18px;
	text-decoration: none;
	margin: 0;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
.pagination li{
	margin: 0;
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
    /* margin-left: 105px; */
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
    /* text-transform: uppercase; */
    color: #252525;
    text-decoration: none;
    font-weight: 700;
    transition:  .35s;

}
.list_nav:hover{
    color: #55ad39;
}
.active {
    color: #55ad39;
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
    display:block;
}
.ls:hover {
    background-color: #e7e7e7;
    border-left: 2px solid #55ad39;
}
.log {
    height: 100%;
    display: flex;
    align-items: center;
    position: absolute;
    right: 0.5%;
}
.login {
    text-align: right;
}
.container{
    width: 80%;
    margin:60px 10%;
    min-height: 172vh;
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
    background-color: #55ad39;
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
    box-shadow: 1px 1px #e7e7e7;
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
    background-color: #55ad39;
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
.form_search input[type=text]{
    width: 100%;
    height: 100%;
    border: 1px solid #cecece;
    padding: 12px 20px;
    transition: .35s;
    outline: none;
}
.form_search input[type=text]:focus{
    border: 1px solid #55ad39;
}
.contact{
    background-color: #55ad39;
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
.htsach{
    margin-top:10px;
    width: 100%;
    background-color: transparent;
    height: 100vh;
}
.ds_sach{
    display: flex;
    flex-wrap: wrap;
    flex: 0 0 50%;
}
.sach {
    width: 180px;
    height: 300px;
    background-color: #fff;
    margin: 5px;
    box-shadow: 1px 1px #e7e7e7;
    text-align: center;
    transition: .35s;
}
.sach:hover {
    margin-top: -8px;
    cursor: pointer;
    box-shadow: 0px 0px 0px 1px #55ad39;
}
.img-sach{
    width: 100%;
    height: 180px;
}
.book_name {
    color: #55ad39;
    font-weight: 700;
    width: 100%;
    height: 20%;
    padding: 0 6px;
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
    color: #363636;
    /* line-height: 2.2; */
}

a:hover{
	color: blue;
	text-decoration: underline;
}
.btn_mua {
    font-weight: 600;
    background-color: #55ad39;
    height: 90%;
    border-radius: 4px;
}
h5 {
    color: orangered;
    font-size: 14px;
}
.center {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 1000;

}
.open {
	display: flex;
}
.ctn {
	width: 380px;
	background: white;
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.05);
	animation: modelFadeIn ease 0.4s;
}


.ctn h1 {
	text-align: center;
	padding: 20px 0;
	border-bottom: 1px solid silver;
}

.ctn form {
	padding: 0 40px;
	box-sizing: border-box;
}
.ctn form .txt_field {
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;
}
.ctn .txt_field input {
	width: 100%;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border: none;
	background: none;
	outline: none;
}

.ctn .txt_field label {
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
}

.ctn .txt_field span::before {
	content: '';
	position: absolute;
	top: 40px;
	left: 0;
	width: 0%;
	height: 2px;
	background: #55ad39;
	transition: .5s;
}

.ctn .txt_field input:focus ~ label, .txt_field input:valid ~ label {
	top: -4px;
	color: #55ad39;
}

.ctn .txt_field input:focus ~ span::before, .txt_field input:valid ~ span::before
	{
	width: 100%;
}

.ctn .pass {
	margin: -5px 0 20px 5px;
	color: #a6a6a6;
	cursor: pointer;
}

.ctn .pass:hover {
	text-decoration: underline;
}

.ctn input[type="submit"] {
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: #55ad39;
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
}

.ctn input[type="submit"]:hover {
	border-color: #55ad39;
	transform: scale(1.1);
	transition: .5s;
}

.signup_link {
	margin: 30px 0;
	text-align: center;
	font-size: 16px;
	color: #666666;
}

.signup_link a {
	color: #2691d9;
	text-decoration: none;
}

.signup_link a:hover {
	text-decoration: underline;
}
button.btn_login {
    background-color: transparent;
    border: none;
    /* text-transform: uppercase; */
    font-weight: 600;
    font-size: 16px;
    cursor: pointer;
}
button.btn_login:hover{
	color: #55ad39;
	font-weight: 700;
    transition:  .35s;
    
}
@keyframes modelFadeIn  {
    from {
        opacity: 0;
        transform: translateY(-140px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

table,td{
	border :0.5px solid #363636;
	border-collapse: collapse;
}

th{
	border-left: 0.5px solid white;
	border-right: 0.5px solid white;
}

.find0:hover{
	background-color: white;
}

.input-box{
	width: 300px;
    height: 25px;
    border-radius: 5px;
    padding-left: 5px;
}

.but99:hover{
	background-color: #363636;
	color: white;
}
    </style>
</head>
<body>
    <div class="header">
        <div class="header_ctn">
            <ul class="navlist">
            <%
				if(session.getAttribute("DangNhapAD")!=null){
			%>
                <li><a class="list_nav active " href="adminSachController">Sách</a></li>
                <li><a class="list_nav" href="adminLoaiController">Loại</a></li>
                <li><a class="list_nav" href="listdoncontroller">Xác nhận hoá đơn</a></li>
                 <li><a class="list_nav" href="listdondaduyetcontroller">Đơn đã duyệt</a></li>
            <%
				}else{
            %>  
				<li><a class="list_nav active" href="ktdnAdminController">Sách</a></li>
                <li><a class="list_nav" href="ktdnAdminController">Loại</a></li>
                <li><a class="list_nav" href="ktdnAdminController">Xác nhận hoá đơn</a></li>
                 <li><a class="list_nav" href="ktdnAdminController">Đơn đã duyệt</a></li>
			<%} %>
			<%
				if(session.getAttribute("DangNhapAD")==null){
			%>
                <div class="log">
                    <li class="login"><a class="list_nav" href="ktdnAdminController">Đăng nhập</a></li>
                </div>
           
            <%
				}else{
            %>
				
					 <div class="log">
	                    <li class="login" style="cursor:pointer;"><a style="color: #000;user-select:none;cursor: default;">Xin chào, <%=session.getAttribute("DangNhapAD") %></a></li>
	                    <li class="signin"><a href="logoutAdmin" class="list_nav">Đăng xuất</a></li>
                    </div>
			<%
			}
			%>
            </ul>
        </div>
    </div>
    <div style="display: flex;justify-content: center;margin-top: 110px;">
	   	<div style="margin-top: 0px;text-align: center;margin-right: 250px;">
	   		<p style="font-size: 30px;font-weight: bolder;">Thông tin sách cũ</p>
	   		<p>Mã sách: <%=session.getAttribute("ms") %></p>
	   		<p>Tên sách: <%=session.getAttribute("ts") %></p>
	   		<p>Số lượng: <%=session.getAttribute("sl") %></p>
	   		<p>Giá: <%=session.getAttribute("g") %></p>
	   		<p>Mã loại: <%=session.getAttribute("ml") %></p>
	   		<p>Số tập: <%=session.getAttribute("st") %></p>
	   		<img src="<%=session.getAttribute("anh")%>">
	   		<p>Ngày nhập: <%=session.getAttribute("nn") %></p>
	   		<p>Tác giả: <%=session.getAttribute("tg") %></p>
	   	</div>
	   	<div style="margin-top: 0px;text-align: center;">
	   		<form action="fixsach?ms=<%=session.getAttribute("ms")%>" method="post">
	   			<p style="font-size: 30px;font-weight: bolder;">Nhập thông tin sách mới</p>
		   		<div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="msm" value="" required="required" placeholder="Nhập mã sách">
			    </div>
		   		<div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="tsm" value="" required="required" placeholder="Nhập tên sách">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="slm" value="" required="required" placeholder="Nhập số lượng">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="gm" value="" required="required" placeholder="Nhập giá">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <select name="mlm" style="height: 40px;width: 300px;border-radius: 10px;text-align: center; ">
			             <%
			             if(request.getAttribute("dsloai")!=null){
			             ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
			        	 for(loaibean l : dsloai){
			             %>
						      <option value="<%=l.getMaloai()%>"><%=l.getTenloai() %></option>
						<%
						}}
						%>
					</select>
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="stm" value="" required="required" placeholder="Nhập số tập">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			    	<input style="" class="input-box" type="file" name="anhm" value="" id="">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="date" name="nnm" value="" required="required" placeholder="Nhập ngày">
			    </div>
			    <div style="margin-top: 10px;margin-bottom: 3px;">
			        <input style="" class="input-box" type="text" name="tgm" value="" required="required" placeholder="Nhập tác giả">
			    </div>
	   			<button class="but99" style="margin-top: 5px;border-radius:2px;">Lưu thông tin</button>
	   		</form>
	   		
	   		
	   		
	 
	   	
	   	
	   	
	   	
	   	
	   	</div>
    </div>
 
</body>
</html>