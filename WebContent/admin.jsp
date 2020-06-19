<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>博客來圖書-管理者</title>
    
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
				  location.href = "/Library/admin?page="+page;
			  })

			  $("#previous").click(function () {
				  var page = parseInt($("#currentPage").html());
				  if(page == 1){
					  return;
				  }
				  page--;
				  location.href = "/Library/admin?page="+page;
			  })

			  $("#first").click(function () {
				  location.href = "/Library/admin?page=1";
			  })

			  $("#last").click(function(){
				  var pages = parseInt($("#pages").html());
				  location.href = "/Library/admin?page="+pages;
			  })
		  })
	  </script>
  </head>
  
  <body>
    <%@ include file="top.jsp" %>
  	
  	
  	<div id="main">
		<div class="navigation">
				<a href="/Library/admin?method=getBorrowed&page=1">還書管理</a>
				<div id="readerBlock">歡迎回來&nbsp;${admin.username }&nbsp;&nbsp;<a href="/Library/logout">登出</a></div>
		</div>
		<div class="img_block">
			<img src="images/middle.jpg" class="img" />
		</div>
		
		<table class="table" cellspacing="0">
			<tr>
				<td>編號</td>
				<td>書名</td>
				<td>作者</td>
				<td>會員姓名</td>
				<td>證件編號</td>
				<td>聯絡電話</td>
				<td>借書時間</td>
				<td>還書時間</td>
				<td>操作</td>
			</tr>

			<c:forEach items="${list}" var="borrow">
				<tr>
					<td>${borrow.id}</td>
					<td>${borrow.book.name}</td>
					<td>${borrow.book.author}</td>
					<td>${borrow.reader.name}</td>
					<td>${borrow.reader.cardId}</td>
					<td>${borrow.reader.tel}</td>
					<td>${borrow.borrowTime}</td>
					<td>${borrow.returnTime}</td>
					<td>
						<a href="/Library/admin?method=handle&id=${borrow.id}&state=1">同意</a>
						<a href="/Library/admin?method=handle&id=${borrow.id}&state=2">拒絕</a>
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
