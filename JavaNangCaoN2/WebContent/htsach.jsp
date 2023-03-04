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
<link type="image/png" sizes="16x16" rel="icon"
	href="image_sach/icons8-book-16.png">
<title>Cửa hàng bán sách</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	background-color: #f5f5f5;
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
	display: flex;
	justify-content: center;
	/* border: 1px solid black; */
}

.pagination a {
	color: black;
	float: left;
	padding: 4px 18px;
	text-decoration: none;
	margin: 0;
}

.pagination a.active {
	background-color: black;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.pagination li {
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
	margin-left: -5px;
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

.list_nav {
	text-transform: none;
	color: #252525;
	text-decoration: none;
	font-weight: 700;
	transition: .35s;
}

.list_nav:hover {
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
	display: block;
}

.ls:hover {
	background-color: #e7e7e7;
	border-left: 2px solid #00a3f2;
}

.log {
	margin-right: -125px;
	height: 100%;
	display: flex;
	align-items: center;
	position: absolute;
	right: 8.5%;
}

.login {
	text-align: right;
}

.container {
	width: 80%;
	margin: 60px 1%;
	height: 700px;
}

.nav_cate {
	/* margin-left:120px; */
	width: 120%;
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
	box-shadow: 1px 1px #e7e7e7;
	font-weight: bold;
}

.list_book {
	margin: 10px 0 4px 25px;
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

.form_search {
	height: 50px;
	position: relative;
}

.form_search>button {
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

.form_search input[type=text] {
	width: 100%;
	height: 100%;
	border: 1px solid #cecece;
	padding: 12px 20px;
	transition: .35s;
	outline: none;
}

.form_search input[type=text]:focus {
	border: 1px solid #00a3f2;
}

.contact {
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

.htsach {
	margin-top: 10px;
	width: 100%;
	background-color: transparent;
	height: 100vh;
}

.ds_sach {
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
	box-shadow: 0px 0px 0px 1px #00a3f2;
}

.img-sach {
	width: 100%;
	height: 180px;
}

.book_name {
	color: black;
	font-weight: 700;
	width: 100%;
	height: 15%;
	padding: 0 6px;
}

.soluong {
	font-size: 12px;
}

.mua {
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

.btn_mua {
	font-weight: 600;
	background-color: #00a3f2;
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
	background: #00a3f2;
	transition: .5s;
}

.ctn .txt_field input:focus ~ label, .txt_field input:valid ~ label {
	top: -4px;
	color: #00a3f2;
}

.ctn .txt_field input:focus ~ span::before, .txt_field input:valid ~
	span::before {
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
	background: #00a3f2;
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
}

.ctn input[type="submit"]:hover {
	border-color: #00a3f2;
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

button.btn_login:hover {
	color: #00a3f2;
	font-weight: 700;
	transition: .35s;
}

@
keyframes modelFadeIn {from { opacity:0;
	transform: translateY(-140px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<div class="header">
		<div class="header_ctn">
			<ul class="navlist">
				<c:if test="${DangNhap==null }">
				<li><a class="list_nav active" href="htsachController"><i class="fa fa-home" aria-hidden="true"></i> Trang
						chủ</a></li>
				<li><a class="list_nav" href="htgioController"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ hàng</a></li>
				<!-- 
				
                <li><a class="list_nav" href="">Thanh toán</a></li> -->
                
				<li><a class="list_nav" href="ktdn"><i class="fa fa-list" aria-hidden="true"></i> Lịch
						sử mua hàng</a></li>


				<%-- <c:if test="${DangNhap==null }"> --%>
					<div class="log">
						<li class="login"><button class="btn_login"><i class="fa fa-sign-in" aria-hidden="true"></i> Đăng
								nhập</button></li>

						<li class="signin"><a class="list_nav"
							href="khachhangController"><i class="fa fa-user-plus" aria-hidden="true"></i> Đăng ký</a></li>
					</div>
				</c:if>
				<c:if test="${DangNhap != null }">
				<li><a class="list_nav active" href="htsachController"><i class="fa fa-home" aria-hidden="true"></i> Trang
						chủ</a></li>
				<li><a class="list_nav" href="htgioController"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Giỏ hàng</a></li>
				<!-- 
				
                <li><a class="list_nav" href="">Thanh toán</a></li> -->
                
				<li><a class="list_nav" href="lichsucontroller?mkh=${makh }"><i class="fa fa-list" aria-hidden="true"></i> Lịch
						sử mua hàng</a></li>
				
					<div class="log">
						<li class="login" style="cursor: pointer;"><a
							style="color: #000; user-select: none; cursor: default;">Xin
								chào, <c:out value="${DangNhap}" />!
						</a></li>
						<li class="signin"><a href="logout" class="list_nav">Đăng
								xuất</a></li>
					</div>
				</c:if>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="nav_cate">
			<div class="category">
				<div class="cate_ctn">
					<div class="cate_all">
						<i class="fa fa-bars"></i> <span>Tất cả loại sách</span>
					</div>
					<ul class="list_cate">
						<c:forEach items="${dsloai }" var="l">
							<li class="list_book ls"><a class="loai"
								href="htsachController?ml=${l.getMaloai() }">
									${l.getTenloai() }</a></li>
						</c:forEach>
					</ul>

				</div>
			</div>
			<div class="sach_ctn">
				<div class="boxsearch">
					<div style="width: 750px;">
						<form class="form_search" action="htsachController">
							<input type="text" name="txttk"
								placeholder="Nhập thông tin sách muốn tìm">
							<button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
						</form>
					</div>
					<!-- <div class="contact">
						<a href="htgioController">GIỎ HÀNG <i
							class="fa-sharp fa-solid fa-cart-shopping"></i></a>
					</div> -->
				</div>
				<div class="htsach">
					<div class="ds_sach">
						<c:forEach items="${dssach }" var="s">
							<div class="sach"
								onclick="location.href='giohangController?hd=add&ms=${s.getMasach()}&ts=${s.getTensach()}&gia=${s.getGia()}&anh=${s.getAnh()}&makh=${makh}'">
								<div class="img-book">
									<img class="img-sach" src="${s.getAnh() }" alt="avatar">
								</div>
								<h5 class="book_name">${s.getTensach() }</h5>
								<span class="soluong">Kho: ${s.getSoluong() }</span>
								<div class="mua">
									<div class="gia">
										<h5>${s.getGia() }đ</h5>
									</div>
									<div class="btn_mua">
										<a
											href="giohangController?hd=add&ms=${s.getMasach()}&ts=${s.getTensach()}&gia=${s.getGia()}&anh=${s.getAnh()}&makh=${makh}">
											Mua hàng </a>
									</div>
								</div>

								<%-- <span class="soluong">Kho: ${s.getSoluong() }</span> --%>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="pagination-container">
		<ul class="pagination">
			<c:if test="${tag>1 }">
				<li style="border: 0.1px solid black;"><a href="htsachController?page=${tag-1}"><</a></li>
			</c:if>
			<c:forEach begin="1" end="${endPage }" var="i">
				<li style="border: 0.1px solid black;"><a class="${tag==i?'active':''}"
					href="htsachController?page=${i }&">${i }</a></li>
			</c:forEach>
			<c:if test="${tag < endPage }">
				<li style="border: 0.1px solid black;"><a href="htsachController?page=${tag+1 }">></a></li>
			</c:if>
		</ul>
	</div>
	<div class="center">
		<div class="ctn">
			<h1 style="color: #00a3f2; user-select: none;">Đăng nhập vào bookstore</h1>
			<form action="ktdn" method="post">
				<div class="txt_field">
					<input type="text" name="txtun" value="" required> <span></span>
					<label>Tài khoản</label>
				</div>
				<div class="txt_field">
					<input type="password" name="txtpass" value="" required> <span></span>
					<label>Mật khẩu</label>
				</div>
				<div class="pass" style="user-select: none;">Quên mật khẩu?</div>
				<input type="submit" value="Login">
				<div class="signup_link">
					Chưa có tài khoản? <a href="khachhangController">Đăng ký ở đây</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		const btnlogin = document.querySelector('.btn_login')
		const centers = document.querySelector('.center')
		const centerCtn = document.querySelector('.ctn')
		function showLogin() {
			centers.classList.add('open')
		}
		function hideLogin() {
			centers.classList.remove('open')
		}
		btnlogin.addEventListener('click', showLogin)
		centers.addEventListener('click', hideLogin)
		centerCtn.addEventListener('click', function(event) {
			event.stopPropagation()
		})
	</script>
</body>
</html>