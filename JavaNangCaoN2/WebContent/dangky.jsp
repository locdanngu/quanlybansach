<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" 
integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;
	
	overflow: hidden;
	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(sach.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(50% - 255px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
	margin-left: 30px;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(40% - 75px);
	left: calc(47% - 50px);
	height: 410px;
	width: 260px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	border-radius: 5px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
	border-radius: 5px;
}

.login input[type=submit]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
	border-radius: 5px;
}

.login input[type=submit]:hover{
	opacity: 0.8;
}

.login input[type=submit]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=submit]:focus{
	outline: none;
}
.login input[type=text],.login input[type=password] {
	margin: 4px 0;
}
::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
.signup{
	margin: 10px 0;
	text-align: center;
	font-family: 'Exo', sans-serif;
}
.the-a {
    
    font-size: 14px;
    text-decoration: none;
    color: #fff;
}
.the-a:hover{
	opacity: 0.8;
}

.the-a:active{
	opacity: 0.6;
}
</style>

<title>Đăng ký ngay</title>
</head>
<body>
		<div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div><span style="font-weight: bold;font-size: 80px;position: fixed;font-weight: bold;left: 530px;top: 100px;">Cửa hàng sách</span></div>
		</div>
		<br>
		<form action="khachhangController" method="post">
		<div class="login">
				<div>
					<input type="text" name="uname" value="" required="required" placeholder="Họ và tên">
	                <input type="text" name="txtun" value="" required="required" placeholder="Tên đăng nhập">
	                <input class="pass" type="password" name="txtpass" required="required" placeholder="Mật khẩu">
	                <input class="confirm_pass" type="password" name="txtconfirm"  required="required" placeholder="Xác nhận mật khẩu">
	                <input type="text" name="address" value="" required="required" placeholder="Địa chỉ">
	                <input type="text" name="phone" value=""  placeholder="Số điện thoại">
	                <input type="text" name="email" value=""  placeholder="Email">       
					<input class="button" type="submit" value="Đăng ký"><br>
				</div>
				<div class="signup">
					<a class="the-a" href="ktdn">
					<i class="fa-solid fa-arrow-left-from-line"></i>
					Đăng nhập tại đây</a>
				</div>
		</div>
		
		 </form>
		
	 
	                    
	               
</body>
<script>
	document.querySelector('.button').onclick = function(){
		var password = document.querySelector('.pass').value,
			confirmPassword = document.querySelector('.confirm_pass').value;
		if(password != confirmPassword)
			alert("Password didn't match try again");
	}
</script>
</html>