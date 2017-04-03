<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/variable.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>电车金融</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <jsp:include page="/WEB-INF/views/common/style.jsp"></jsp:include>
  <!-- REQUIRED JS SCRIPTS -->
  <jsp:include page="/WEB-INF/views/common/script.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue  sidebar-mini">
<div class="wrapper">
  <jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="/WEB-INF/views/common/leftSide.jsp"></jsp:include>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>微信管理</h1>
		<ol class="breadcrumb">
			<li><a data-pjax href="${contextPath}/index"><i class="fa fa-dashboard"></i> 首页</a></li>
			<li class="active">微信管理</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="panel panel-default">
			<div class="panel-body">
				<div style="text-align: center;cursor: pointer;" id="syncAddrBook">
					<img id="syncAddrBookImg" href="javascript:void(0);" src="${contextPath}/resources/img/common/sync.gif"></img>
					<a href="javascript:void(0);" style="display: block;">同步通讯录</a>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
	<script type="text/javascript" src="${contextPath}/resources/scripts/lib/jQueryRotate.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#syncAddrBook").bind("click",function(){
				syncAddrBook();
			});
		});
		function syncAddrBook(){
			$("#syncAddrBook").unbind("click");
			$('#syncAddrBookImg').rotate({angle:0,animateTo:360*1000,duration:1000*18*1000});
			$("#syncAddrBook").find("a").text("同步中......");
			jsonAjax(appPath + "/weixin/qiye/sync",null,function(data){
				notie.alert(1,"新增部门：" + data.syncSuccessAddDept+"个，"
						+"更新部门：" + data.syncSuccessUpdateDept+"个，"
						+"新增用户：" + data.syncSuccessAddUser+"个，"
						+"更新用户：" + data.syncSuccessUpdateUser+"个，"
						+"同步失败部门：" + data.syncFailDept + "个，"
						+"同步失败用户：" + data.syncFailUser + "个，"
						+"忽略同步用户：" + data.skipSyncUser + "个",3);
				$("#syncAddrBook").find("a").text("同步通讯录");
				$("#syncAddrBookImg").stopRotate();
				$("#syncAddrBook").bind("click",function(){
					syncAddrBook();
				});
			});
		}
	</script>
</div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <jsp:include page="/WEB-INF/views/common/mainFooter.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/views/common/controlSidebar.jsp"></jsp:include>
</div>
<!-- ./wrapper -->
</body>
</html>


