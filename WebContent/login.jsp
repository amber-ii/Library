<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客來圖書館</title>
</head>
<link rel="icon" href="images/title_img.jpg" type="img/x-ico" />
<link href="css/login.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<body>
	<div id="top"></div>
	
	<div id="main">
		<img src="images/login.jpg" id="main_bg"/>
		<div id="login_block">
			<form action="/Library/login" method="post" id="loginForm">
				<table border="0">
					<tr>
						<td class="title">帳號</td>
						<td class="input">
							<input type="text" name="username" id="username" value="abc" class="login_input"/>
						</td>
					</tr>
					<tr>
						<td class="title">密碼</td>
						<td class="input">
							<input type="password" name="password" id="password" value="123" class="login_input"/>
						</td>
					</tr>
					<tr>
						<td class="title">身份</td>
						<td class="input">
							<input type="radio" name="type" value="reader" checked="checked"/>&nbsp;&nbsp;會員&nbsp;&nbsp;
							<input type="radio" name="type" value="admin"/>&nbsp;&nbsp;管理員
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input class="btn" type="submit" value="登入"/>
							<!-- <div class="btn" id="reset">重&nbsp;&nbsp;置</div> -->
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="footer">
		<div class="foot_content">
			博客來圖書科技股份有限公司 &nbsp; 地址：臺灣 115 台北市南港區八德路四段11巷1弄11號
		</div>
		<div class="foot_content">
		Copyright © since 2015 books.com.tw All Rights Reserved.
		</div>
	</div>
</body>
</html>