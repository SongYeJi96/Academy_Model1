<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/ba8d291cc0.js" crossorigin="anonymous"></script>
<style>
	*{
		margin :0;
		padding :0;
	}
	.container{
		height: 100%;
		margin: 0;
		padding: 0;
		display: grid;
		grid-template : 70px 1fr 100px / 250px 1fr;
		grid-gap: 0px;
		min-height: 100vh;
		min-width: 100%;
	}
	.cell-header{
		display: flex;
		padding: 30px;
		grid-column: 1 / 3;
		border-bottom: solid 2px #9CAF72;
		justify-content: space-between; 
		align-items: center; 
	}
	.logo-menu{
	 	display: flex;
	 	justify-content: space-between; 
		align-items: center;
	}
	.logo{
		padding-right: 100px;
			
	}
	.logoA{
		font-size: 25px;
		font-weight: bold;
		color: #234200;
	}
	.nav-item{
		padding-right:30px; 	
	}
	.nav-menuA{
		color: #476600;
		font-weight: bold;
	}
	a{
		text-decoration: none;
	}
	
</style>
</head>
<body>
	<div class="container">
		<!-- 메인메뉴 -->
		<div class="cell-header">
			<jsp:include page="/inc/mainmenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>