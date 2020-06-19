<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>博客來圖書館管理系統</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/index.css" type="text/css" rel="stylesheet"> 
	 
  	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  	<script type="text/javascript">
		$(function(){
			$("#next").click(function(){
				var pages = parseInt($("#pages").html());
				var page = parseInt($("#currentPage").html());
				if(page == pages){
					return;
				}
				page++;
				location.href = "/Library/book?page="+page;
			})

			$("#previous").click(function () {
				var page = parseInt($("#currentPage").html());
				if(page == 1){
					return;
				}
				page--;
				location.href = "/Library/book?page="+page;
			})

			$("#first").click(function () {
				location.href = "/Library/book?page=1";
			})

			$("#last").click(function(){
				var pages = parseInt($("#pages").html());
				location.href = "/Library/book?page="+pages;
			})
		})
	</script>
  </head>
  
  <body>
  <%@ include file="top.jsp" %>

  	<div id="main">
		<div class="navigation">
				<a href="/Library/book?&page=1">返回首頁</a>
				<div id="readerBlock">歡迎回來&nbsp;&nbsp;<a href="/Library/book?method=findAllBorrow&page=1">${sessionScope.reader.name }</a>&nbsp;<a href="/Library/logout">登出</a></div>
		</div>
		<div class="img_block">
			<img src="images/middle.jpg" class="img" />
		</div>
		
		<table class="table" cellspacing="0">
			<tr>
				<td>編號</td>
				<td>書名</td>
				<td>作者</td>
				<td>出版社</td>
				<td>圖書頁數</td>
				<td>定價</td>
				<td>書架</td>
				<td>操作</td>
			</tr>

			<c:forEach items="${list}" var="book">
				<tr>
					<td>${book.id}</td>
					<td>${book.name}</td>
					<td>${book.author}</td>
					<td>${book.publish}</td>
					<td>${book.pages}</td>
					<td>${book.price}</td>
					<td>${book.bookCase.name}</td>
					<td>
						<a href="/Library/book?method=addBorrow&bookid=${book.id}">借閱</a>
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<hr class="hr"/>
		<div id="pageControl">
			<div class="pageControl_item">每頁<font id="dataPrePage">${dataPrePage }</font>條數據</div>
			<div class="pageControl_item" id="last">最後一頁</div>
			<div class="pageControl_item" id="next">下一頁</div>
			<div class="pageControl_item"><font id="currentPage">${currentPage }</font>/<font id="pages">${pages }</font></div>
			<div class="pageControl_item" id="previous">上一頁</div>
			<div class="pageControl_item" id="first">首頁</div>
		</div>
		
	</div>
  	
   <%@ include file="footer.jsp" %>
  </body>
</html>
