<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<link rel="shortcut icon" href="img/favicon.png">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="/obigoProject/css/bootstrap.min.css" rel="stylesheet">
<link href="/obigoProject/css/bootstrap-reset.css" rel="stylesheet">
<!--external css-->
<link href="/obigoProject/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="/obigoProject/assets/morris.js-0.4.3/morris.css" rel="stylesheet" />
<!--right slidebar-->
<link href="/obigoProject/css/slidebars.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/obigoProject/css/style.css" rel="stylesheet">
<link href="/obigoProject/css/style-responsive.css" rel="stylesheet" />
<!--     <link href="/obigoProject/assets/morris.js-0.4.3/morris.css" rel="stylesheet" /> -->
</head>
<body>

	<jsp:include page="/jsp/header/header.jsp"></jsp:include>

	<section id="container" class="">
		<!--main content start-->

		<section id="main-content">
			<section class="wrapper site-min-height">
				<form action="">
					<input type="text" id="searchId" onkeyup="searchUserId()">
				</form>
				<div id="morris">
					<div class="row">
						<!-- page start-->
						<div class="col-lg-6" style="width: 1500px;">
							<section class="panel">
								<header class="panel-heading"> 사용자 접속 통계</header>
								<div class="panel-body">
									<div id="hero-bar" class="graph"></div>
								</div>
							</section>
						</div>
						<!-- page end-->
					</div>
				</div>
			</section>
		</section>
		<!--main content end-->



		<table id="myTable">

			<thead>
				<tr>
					<th>User ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Emain</th>
					<th>Phone</th>
					<th>Role Name</th>
					<th>Date</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>User ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Emain</th>
					<th>Phone</th>
					<th>Role Name</th>
					<th>Date</th>
				</tr>
			</tfoot>
		</table>

		<!--footer start-->
		<jsp:include page="/jsp/header/footer.jsp"></jsp:include>
		<!--footer end-->

	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="/obigoProject/js/jquery.js"></script>
	<!--<script src="js/jquery-1.8.3.min.js"></script>-->
	<script src="/obigoProject/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="/obigoProject/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="/obigoProject/js/jquery.scrollTo.min.js"></script>
	<script src="/obigoProject/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="/obigoProject/assets/morris.js-0.4.3/morris.min.js" type="text/javascript"></script>
	<script src="/obigoProject/assets/morris.js-0.4.3/raphael-min.js" type="text/javascript"></script>
	<script src="/obigoProject/js/respond.min.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
	<!--right slidebar-->
	<script src="/obigoProject/js/slidebars.min.js"></script>

	<!--common script for all pages-->
	<script src="/obigoProject/js/common-scripts.js"></script>

	<!-- script for this page only-->
	<!-- 		<script src="/obigoProject/js/morris-script.js"></script> -->

	<script type="text/javascript">
	$(document).ready(
			
			function() {
				
				if($("#searchId").val()==""){
					setUp(${userAnalytics});
				}else {
					alert("false");
					// User Vehicle에 등록된 차종을 그래프로 출력해주는 AJAX
					
				}
			});
	
	
	function searchUserId(){
		
		$('#myTable').DataTable( {
	        "processing": true,
	        "serverSide": true,
	        "ajax": {
	            "url": "/obigoProject/loginuserlist",
	            "type": "POST"
	        },
	        "columns": [
	            { "data": "userId" },
	            { "data": "password" },
	            { "data": "name" },
	            { "data": "eMain" },
	            { "data": "phone" },
	            { "data": "roleName" },
	            { "data": "date" }
	        ]
	    } );
		
		/* alert($("#searchId").val());
		$.ajax({
			type : "post",
			url : "/obigoProject/loginuserlist",
			data: {
				"userId": $("#searchId").val()
			},
			dataType : "json",
			success : function(data) {
				
				var table = $('#myTable').DataTable();
				table.ajax.reload();
	
// 				alert(data.length);
// 				alert(data[0].userId);			
			},
			error : function(e) {
				console.log(e);
			}
		}); */
		
	}
	
// 	var Script = setUp(${userAnalytics});
		
	function setUp(data){
	    $(function () {
	      Morris.Bar({
	        element: 'hero-bar',
	        resize: true,
	        data: [
	          {device: 'JAN', geekbench: data[0]},
	          {device: 'FEB', geekbench: data[1]},
	          {device: 'MAR', geekbench: data[2]},
	          {device: 'APR', geekbench: data[3]},
	          {device: 'MAY', geekbench: data[4]},
	          {device: 'JUN', geekbench: data[5]},
	          {device: 'JUL', geekbench: data[6]},
	          {device: 'AUG', geekbench: data[7]},
	          {device: 'SEP', geekbench: data[8]},
	          {device: 'OCT', geekbench: data[9]},
	          {device: 'NOV', geekbench: data[10]},
	          {device: 'DEC', geekbench: data[11]},
	        ],
	        xkey: 'device',
	        ykeys: ['geekbench'],
	        labels: ['Geekbench'],
	        barRatio: 0.4,
	        xLabelAngle: 0,
	        hideHover: 'auto',
	        barColors: ['#6883a3']
	      });
	    });
	};
	
	
	</script>
</body>
</html>