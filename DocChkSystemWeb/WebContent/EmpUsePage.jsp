<%@ page import="sun.applet.resources.MsgAppletViewer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*" %>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文件簽核系統-首頁</title>
	<script src="js/jquery-1.3.2.js" type="text/javascript"></script>
	<script src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="js/minwt.auto_full_height.mini.js"></script>
	<link rel="stylesheet" href="css/theme.css">
	<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

<script type="text/javascript">
$(document).ready(function(e) {
    $(".sub").slideUp(0);
	for(var i=0;i<$(".menu").length;i++){
		$(".menu:eq("+i+")").click({id:i},function(e){
			$(".sub:not(.sub:eq("+e.data.id+"))").slideUp(500);
			$(".sub:eq("+e.data.id+")").slideDown(500);
		});
	};

});

function changeMainPage()
{
	
}

function changeSubBrowse( str )
{
    //alert( "MainPage" + str );
    var iframeElement = document.getElementById("subBrowse");
    
    iframeElement.src = str;
}

</script>
</head>
<body>
	<div id="head" _height="none">
		<div id="toplink">
		<a href="funcPage/PersonnelMainPage.jsp" target="subBrowse" id="logo"></a>	
		</div>
		<div id="toptool">
			<ul>
				<li><a href="#"><img src="images/logout.png" alt="" width="50%" height="50%"></a>
					<ul>
						<li><a href="changepassword.jsp" target="subBrowse">密碼修改</a></li>
						<li><a href="Logout.jsp">登出</a></li>
					</ul>
				</li>
				<li><a href="javascript:history.forward()" target="subBrowse"><img src="images/next.png" alt="" width="50%" height="50%"></a></li>
				<li><a href="funcPage/PersonnelMainPage.jsp" target="subBrowse"><img src="images/home.png" alt="" width="50%" height="50%"></a></li>
				<li><a href="javascript:history.back()" target="subBrowse"><img src="images/back.png" alt="" width="50%" height="50%"></a></li>
			</ul>
		</div>
	</div>
	<div id="lside" _height="auto">
		<div id="hello">
		<%
            Empolyee m =( Empolyee) session.getAttribute("Empolyee");
            
		    if( m == null )
		        response.sendRedirect("login.jsp");
        %>
        <span class="span1">歡迎光臨</span>
        <span class="span2"><%out.print(m.getName());%></span>
		</div>
	        <div class="menu">文件</div>
	            <div class="sub">
	                <ul>
						<li><a href="funcPage/addNewDoc.jsp" target="subBrowse" >新增文件</a></li>
						<li><a href="funcPage/doc_process.jsp" target="subBrowse">進度查詢</a></li>
						<li><a href="funcPage/doc_draft.jsp" target="subBrowse">草稿夾</a></li>
						<li><a href="funcPage/doc_history.jsp" target="subBrowse" >歷史進度</a></li>
	                </ul>
	            </div>
	        <div class="menu">請假單</div>
	            <div class="sub">
	                <ul>
						<li><a href="#">新增文件</a></li>
						<li><a href="#">進度查詢</a></li>
						<li><a href="#">草稿夾</a></li>
						<li><a href="#">歷史進度</a></li>
	                </ul>
	            </div>
	        <div class="menu">請購單</div>
	            <div class="sub">
	                <ul>
						<li><a href="#">新增文件</a></li>
						<li><a href="#">進度查詢</a></li>
						<li><a href="#">草稿夾</a></li>
						<li><a href="#">歷史進度</a></li>
	                </ul>
	            </div>
	        <div class="menu">文件查詢</div>
	            <div class="sub">
	                <ul>
						<li><a href="funcPage/search.jsp" target="subBrowse" >文件查詢</a></li>
	                </ul>
	            </div>
	</div>
	<div id="right">
		<div id="con" _height="auto">
			<div id="iframe-warp">
				<iframe id="subBrowse" name="subBrowse" width="100%" height="99%" src="funcPage/PersonnelMainPage.jsp" frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
	</div>
	<div class="clr"></div>
</body>
</html>