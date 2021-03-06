<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="com.zh.base.util.JspUtil" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="getText('COM.OSFI.WINDOW.TITLE')" /></title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/theme.css">
<link rel="stylesheet" href="<%=path%>/css/font-awesome.css">
<link rel="stylesheet" href="<%=path%>/js/select2/select2.css">
<link rel="stylesheet"
	href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<!-- Demo page code -->
<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
<link href="<%=path%>/img/favicon_32.ico" rel="bookmark"
	type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="icon" type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="shortcut icon"
	type="image/x-icon" />
</head>
<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
<jsp:useBean id="userName" class="com.zh.base.util.JspUtil" scope="session"></jsp:useBean>
	<!--<![endif]-->
	<%@ include file="/pages/common/titleWithNav.jsp"%>
	<%@ include file="/pages/common/sidebarWithNav.jsp"%>

	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="number">53</span>tickets
				</p>
				<p class="stat">
					<span class="number"><s:property value="#session.taskSize" /></span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="<%=path%>/home/main.jspa">主页</a> <span
				class="divider">/</span></li>
			<li><span class="active" id="navigation1"></span></li>
		</ul>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="btn-toolbar">
					<s:if test='hasApprove=="1" || hasSubmitAuth=="1"'>
						<button id="formButton" class="btn btn-primary" type="button">
							<i class="icon-save"></i> 保存
						</button>
						<a class="btn" id="backList" href="">
							返回</a>
						<input type="hidden" id="hasEditAuth" value="1">
					</s:if>
					<s:else>
						<button class="btn" type="button" disabled="disabled">
							<i class="icon-save"></i> 保存
						</button>
						<a class="btn" id="backList" href="">
							返回</a>
						<input type="hidden" id="hasEditAuth" value="0">
					</s:else>

					<div class="pull-right">
						<s:if test='%{hasApprove!=null && hasApprove=="1"}'>
							<button class="btn" type="button" id="approveBtn"
								data-toggle="modal" data-target="#approveConfirm">
								<i class="icon-ok"></i> 批准
							</button>

							<button class="btn" type="button" id="rejectBtn"
								data-toggle="modal" data-target="#rejectConfirm">
								<i class="icon-ok"></i> 拒绝
							</button>
						</s:if>

						<s:if test='%{hasSubmitAuth!=null && hasSubmitAuth=="1"}'>
							<button class="btn" type="button" id="startBtn"
								data-toggle="modal" data-target="#startConfirm">
								<i class="icon-ok"></i> 发起
							</button>
						</s:if>
						<!-- 
							<button class="btn" type="button" id="rejectBtn">
								<i class="icon-remove"></i> 拒绝
							</button>
							 -->
					</div>
				</div>
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<s:set name="ProcessId"
					value="entryProcess.id!=null&&entryProcess.id!=''" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>

						<s:if test="#ProcessId">
							<li><a id="certificatesButt" href="#certificates"
								data-toggle="tab">证件信息</a></li>
							<li><a id="flightButt" href="#flight" data-toggle="tab">航班信息</a></li>
							<li><a id="hotelButt" href="#hotel" data-toggle="tab">酒店信息</a></li>
							<li><a id="physicalExamButt" href="#physicalExam" data-toggle="tab">体检信息</a></li>
							<li><a id="channelButt" href="#channel" data-toggle="tab">渠道信息</a></li>
							<li><a id="trainingButt" href="#training" data-toggle="tab">培训信息</a></li>
							<li><a id="activityButt" href="#activity" data-toggle="tab">公司活动</a></li>
							<li><a id="workflowTabButt" href="#workflowTab" data-toggle="tab">工作流</a></li>
							<li><a id="annexButt" href="#annex" data-toggle="tab">附件</a></li>
						</s:if>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home">
							<form id="editForm" class="form-horizontal"
								action="${menu2Id}!save.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}">
								<input type="hidden" name="spaceId" value="${spaceId}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputId">编号：</label>
											<div class="controls">
												<input type="text" maxlength="15" disabled="disabled"
													id="inputId" name="entryProcess.id"
													value="${entryProcess.id}" class="input-large">
												<input type="hidden" name="entryProcess.id"
													value="${entryProcess.id}">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="description">描述：</label>
											<div class="controls">
												<input type="text" id="description"
													name="entryProcess.description"
													value="${entryProcess.description}"
													data-required="true" placeholder="描述" class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputName">姓名：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="姓名"
													maxlength="15" id="inputName"
													name="entryProcess.name"
													value="${entryProcess.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputEnglishname">英文名：</label>
											<div class="controls">
												<input type="text" id="inputEnglishname"
													name="entryProcess.englishname"
													value="${entryProcess.englishname}"
													data-required="true" placeholder="英文名" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputnationality">国籍：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputnationality"
													name="entryProcess.nationality"
													value="${entryProcess.nationality}"
													data-required="true" placeholder="国籍" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputCurrentlocation">目前所在地(国家)：</label>
											<div class="controls">
												<input type="text" id="inputCurrentlocation"
													name="entryProcess.currentlocation" 
													value="${entryProcess.currentlocation}"
													data-required="true" placeholder="目前所在地(国家)" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearbirth">出生年份：</label>
											<div class="controls">
												<input type="text" id="inputyearbirth"
													name="entryProcess.yearbirth"
													value="${entryProcess.yearbirth}"
													data-required="true" placeholder="出生年份" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthday">生日：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthday"
													name="entryProcess.birthday"
													value="<s:date name="entryProcess.birthday" format="yyyy-MM-dd" />"
													data-required="true" placeholder="生日" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="contracttype">合同种类：</label>
											<div class="controls">
												<select id="contracttype" class="input-large" placeholder="合同种类"
													name="entryProcess.contracttype">
													<option value=""></option>
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputContractdate">合同有效期：</label>
											<div class="controls">
												<input type="text" id="inputContractdate"
													name="entryProcess.contractdate"
													value="${entryProcess.contractdate}"
													 placeholder="合同有效期" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="inputPassportno">护照号：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputPassportno"
													name="entryProcess.passportno"
													value="${entryProcess.passportno}"
													data-required="true" placeholder="护照号" class="input-large">
											</div>
										</div>
									</div>
								
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPassportnodate">护照有效期：</label>
											<div class="controls">
												<input type="text" id="inputPassportnodate"
													name="entryProcess.passportnodate" 
													value="${entryProcess.passportnodate}"
													data-required="true" placeholder="护照有效期" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputMail">电子邮箱：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputMail"
													name="entryProcess.mail"
													value="${entryProcess.mail}" data-required="true"
													placeholder="电子邮箱" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPhone">手机号码：</label>
											<div class="controls">
												<input type="number" id="inputPhone"
													name="entryProcess.Phone"
													value="${entryProcess.phone}" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWechat">WeChat：</label>
											<div class="controls">
												<input type="text" id="inputWechat"	
													name="entryProcess.wechat"
													ventryProcesslProcess.wechat}"
													class="input-large">
											</div>
										</div>
									</div>

									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputSkype">Skype：</label>
											<div class="controls">
												<input type="text" id="inputSkype"
													name="entryProcess.skype"
													value="${entryProcess.skype}" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWorkuserid">创建者：</label>
											<div class="controls">
												<s:set id="userNameid" value="entryProcess.workuserid"></s:set>
												<input type="text" id="inputWorkuserid" disabled="disabled"
													name="entryProcess.workUserName"
													value="${entryProcess.workUserName}"
													readonly class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputState">当前状态：</label>
											<div class="controls">
												<input type="text" id="inputState"
													name="entryProcess.state" readonly="readonly"
													value="${entryProcess.state}" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputDomicile">户籍地址：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputDomicile"
													name="entryProcess.domicile"
													value="${entryProcess.domicile}"
													placeholder="户籍地址" class="input-large">
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						<!-- 证件信息 -->
						<div class="tab-pane fade" id="certificates">
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>证件类型</th>
										<th>证件编号</th>
										<th>办理日期</th>
										<th>领取日期</th>
										<th>有效日期</th>
										<th>结束日期</th>
										<!-- 
										<th>修改时间</th>
										 -->
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="certificatesSearch">
									
								</tbody>
							</table>
						</div>
						<!-- 航班信息 -->
						<div class="tab-pane fade" id="flight">
							<form id="flightForm" class="form-horizontal"
								action="${menu2Id}!saveFlight.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="formId" value="${entryProcess.id}">
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="flight.id" value="${flight.id}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="flightnumber">航班号：</label>
											<div class="controls">
												<input type="text" maxlength="25"  data-required="true" placeholder="航班号" id="flightnumber"
													name="flight.flightnumber" value="${flight.flightnumber}"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="airportPeopleId">接机人：</label>
											<div class="controls">
												<!-- 
												<select id="airportPeopleId" class="input-large"
													name="flight.airportPeopleId">
													<option value="A">测试1</option>
													<option value="B">测试2</option>
												</select>
													<option id="airportPeopleIdOption" value=""></option>
												 -->
												
												<select id="airportPeopleId" class="input-large" name="flight.airportpeopleid" data-required="true" placeholder="接机人">
													<option value=""></option>
													<s:iterator value="userList" var="user" status="index">
													<s:if test='flight.airportpeopleid == #user.id'>
														<option value="${user.id}" selected="selected">${user.name}(${user.loginName})</option>
													</s:if>
													<s:else>
														<option value="${user.id}">${user.name}(${user.loginName})</option>
													</s:else>
													</s:iterator>
												</select>
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputstartdate">起飞时间：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="起飞时间" id="inputstartdate"
													name="flight.startdate"
													value="<s:date name="flight.startdate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputenddate">到达时间：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="到达时间" id="inputenddate"
													name="flight.enddate"
													value="<s:date name="flight.enddate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="place">到达机场：</label>
											<div class="controls">
												<input type="text" maxlength="25" id="place" data-required="true" placeholder="到达机场"
													name="flight.place" value="${flight.place}"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						<!-- 酒店信息 -->
						<div class="tab-pane fade" id="hotel">
							<form id="hotelForm" class="form-horizontal"
								action="${menu2Id}!saveHotel.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${entryProcess.id}">
								<input type="hidden" name="hotel.id" value="${hotel.id}">
								
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="hotelName">酒店名称：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="酒店名称" id="hotelName"
													name="hotel.name"
													value="${hotel.name}"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="roomNumber">房间号：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="房间号" id="roomNumber"
													name="hotel.roomNumber"
													value="${hotel.roomNumber}"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="roomType">房间类型：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="房间类型" id="roomType"
													name="hotel.roomType"
													value="${hotel.roomType}"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="address">酒店地址：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="酒店地址" id="address"
													name="hotel.address"
													value="${hotel.address}"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="telephone">酒店电话：</label>
											<div class="controls">
												<input type="number" data-required="true" placeholder="酒店电话" id="telephone"
													name="hotel.telephone"
													value="${hotel.telephone }"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="checkinDate">入住日期：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="入住日期" id="checkinDate"
													name="hotel.checkinDate"
													value="<s:date name="hotel.checkinDate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="checkInDay">预计入住天数：</label>
											<div class="controls">
												<input type="number" data-required="true" placeholder="预计入住天数" id="checkInDay"
													name="hotel.checkinDay"
													value="${hotel.checkinDay}"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						
						<!-- 体检信息 -->
						<div class="tab-pane fade" id="physicalExam">
							<form id="physicalExamForm" class="form-horizontal"
								action="${menu2Id}!savePhysicalExam.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="formId" value="${entryProcess.id}">
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="physicalExam.id" value="${physicalExam.id}">
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="PEName">体检医院：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="体检医院" id="PEName"
													name="physicalExam.name"
													value="${physicalExam.name }"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="PEAdress">体检地址：</label>
											<div class="controls">
												<input type="text" placeholder="体检地址" id="PEAdress"
													name="physicalExam.address"
													value="${physicalExam.address }"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="PEtelephone">医院电话：</label>
											<div class="controls">
												<input type="number" data-required="true" placeholder="医院电话" id="PEtelephone"
													name="physicalExam.telephone"
													value="${physicalExam.telephone }"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="PERemarks">医院备注：</label>
											<div class="controls">
												<input type="text" placeholder="医院备注" id="PERemarks"
													name="physicalExam.remarks"
													value="${physicalExam.remarks }"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="PEType">种类：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="种类" id="PEType"
													name="physicalExam.type"
													value="${physicalExam.type }"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="PEScheduleDate">预定时间：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="预定时间" id="PEScheduleDate"
													name="physicalExam.scheduleDate"
													value="<s:date name="physicalExam.scheduleDate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="PEReceiveDate">报告领取日期 ：</label>
											<div class="controls">
												<input type="text" placeholder="报告领取日期 " id="PEReceiveDate"
													name="physicalExam.receiveDate"
													value="<s:date name="physicalExam.receiveDate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						
						<!-- 渠道信息 -->
						<div class="tab-pane fade" id="channel">
							<form id="channelForm" class="form-horizontal"
								action="" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="formId" value="${entryProcess.id}">
								<input type="hidden" name="spaceId" value="${spaceId}">
								渠道信息
							</form>
						</div>
						
						<!-- 培训信息 -->
						<div class="tab-pane fade" id="training">
							<form id="trainingForm" class="form-horizontal"
								action="${menu2Id}!saveTrainCourse.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}" /> 
								<input type="hidden" name="menu2Id" value="${menu2Id}" /> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${entryProcess.id}" />
								<input type="hidden" name="tabID" value="trainingButt" />
								<input type="hidden" id="trainCourseId" name="trainingOfPersonnel.trainCourseId" value="" />
								
								<button class="btn btn-small btn-primary" type="button"
								data-toggle="modal" data-target="#popupfirm">添加培训</button>
							</form>
							<table class="table">
							<thead>
								<tr>
									<th>序号</th>
									<th>培训类型</th>
									<th>预定时间</th>
									<th>名称</th>
									<th>地址</th>
									<th>课程教师</th>
									<th>状态</th>
									<th style="width: 26px;"></th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="trainCourseList" var="trainCourse" status="index">
									<tr>
										<td><s:property value="#index.index + 1"/></td>
										<s:if test="#trainCourse.trainType==1">
											<td>入职培训</td>
										</s:if>
										<s:elseif test="#trainCourse.trainType==2">
											<td>岗位培训</td>
										</s:elseif>
										<s:else>
											<td>其他培训</td>
										</s:else>
										<td><s:property value="#trainCourse.scheduleDate"/></td>
										<td><s:property value="#trainCourse.name"/></td>
										<td><s:property value="#trainCourse.address"/></td>
										<td>
											<s:set id="userNameid" value="#trainCourse.userId"></s:set>
											<%=userName.queryUserName(request.getAttribute("userNameid").toString()) %>
										</td>
										<s:if test="#trainCourse.enabled==0">
											<td>有效</td>
										</s:if>
										<s:else>
											<td>无效</td>
										</s:else>
										<td>
											<s:if test='hasApprove=="1" || hasSubmitAuth=="1"'>
											<a href="${menu2Id}!saveTrainCourse.jspa?id=<s:property value='#trainCourse.id'/>&formId=${entryProcess.id}&view=delete&menuId=${menuId}&menu2Id=${menu2Id}&spaceId=${spaceId}&tabID=trainingButt"><i
												class="icon-remove"></i></a>
											</s:if>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						</div>
						
						<!-- 公司活动 -->
						<div class="tab-pane fade" id="activity">
							<form id="activitiesForm" class="form-horizontal"
								action="${menu2Id}!saveActivities.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}" /> 
								<input type="hidden" name="menu2Id" value="${menu2Id}" /> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${entryProcess.id}" />
								<input type="hidden" name="tabID" value="activityButt" />
								<input type="hidden" id="activitiesId" name="activitiesUser.activitiesId" value="" />
								<button class="btn btn-small btn-primary" type="button"
								data-toggle="modal" data-target="#popupfirm">添加活动</button>
							</form>
							<table class="table">
							<thead>
								<tr>
									<th>序号</th>
									<th>活动名称</th>
									<th>预定时间</th>
									<th>集合地点</th>
									<th>活动耗时</th>
									<th>负责人</th>
									<th>电话</th>
									<th>状态</th>
									<th style="width: 26px;"></th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="activitiesList" var="activities" status="index">
									<tr>
										<td><s:property value="#index.index + 1"/></td>
										<td><s:property value="#activities.name"/></td>
										<td><s:property value="#activities.scheduleDate"/></td>
										<td><s:property value="#activities.setPlace"/></td>
										<td><s:property value="#activities.scheduleTime"/></td>
										<td><s:property value="#activities.userName"/></td>
										<td><s:property value="#activities.telephone"/></td>
										<s:if test="#activities.enabled==0">
											<td>有效</td>
										</s:if>
										<s:else>
											<td>无效</td>
										</s:else>
										<td>
											<s:if test='hasApprove=="1" || hasSubmitAuth=="1"'>
											<a href="${menu2Id}!saveActivities.jspa?id=<s:property value='#activities.id'/>&formId=${entryProcess.id}&view=delete&menuId=${menuId}&menu2Id=${menu2Id}&spaceId=${spaceId}&tabID=activityButt"><i
												class="icon-remove"></i></a>
											</s:if>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						</div>

						<!-- 工作流 -->
						<div class="tab-pane fade" id="workflowTab">
							<!-- 如果发起了则显示工作 -->
							<s:if
								test="%{entryProcess.state != null && entryProcess.state != ''&& entryProcess.state != '发起' && entryProcess.state != '结束'}">
								<img alt="流程没有发起或已结束"
									src="${menu2Id}!loadTraceImg.jspa?menuId=workflow&menu2Id=induction&processInstanceId=${entryProcess.workflowid}"
									id="workflowShowPic">
							</s:if>
							<s:else>
								<span>没有匹配的工作流(没有发起或已结束)</span>
							</s:else>
						</div>

						<!-- 附件 -->
						<div class="tab-pane fade" id="annex">
							<button class="btn btn-small icon-file btn-primary" type="button"
								data-toggle="modal" data-target="#filefirm">上传附件</button>
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th>类型</th>
										<th>描述</th>
										<th>创建时间</th>
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="FileInfoSearch">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 创建工作流 -->
			<form action="${menu2Id}!createWorkflow.jspa" method="post" id="createWF">
				<input type="hidden" name="formId" id="cwf_formId" value="${entryProcess.id}">
				<input type="hidden" name="assign" id="cwf_assign"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}">
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>

			<!-- 批准工作流 -->
			<form action="${menu2Id}!approveWorkflow.jspa" method="post"
				id="approveWF">
				<input type="hidden" name="formId" id="awf_formId"
					value="${entryProcess.id}"> 
				<input type="hidden" name="entryProcess.workflowid" id="awf_formId"
					value="${entryProcess.workflowid}"> 
				<input type="hidden" name="entryProcess.taskId" id="taskId"
					value="${entryProcess.taskId}"> 
				<input type="hidden" name="assign" id="awf_assign"> 
				<input type="hidden" name="assignFlag" id="awf_assignFlag"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>
		</div>
	</div>

	<!-- 保存证件列表 -->
	<div class="hide">
		<form id="certificatesForm" class="form-horizontal"
			action="${menu2Id}!saveCertificates.jspa" method="post">
			<input type="hidden" name="formId" value="${entryProcess.id}">
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="menuId" value="${menuId}">
			<input type="hidden" id="jsonList" name="jsonList" />
			<input type="hidden" name="spaceId" value="${spaceId}">
		</form>
	</div>

	<!-- 上传文件 -->
	<div class="modal small hide fade" id="filefirm" tabindex="-1"
		style="width: 550px;" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">附件上传</h3>
		</div>
		<form id="fileForm" class="form-horizontal" enctype="multipart/form-data"
			action="${menu2Id}!saveFile.jspa" method="post">
			<input type="hidden" name="menuId" value="${menuId}"> 
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="formId" value="${entryProcess.id}">
			<input type="hidden" name="tabID" value="annexButt">
			<input type="hidden" name="spaceId" value="${spaceId}">
			<div class="modal-body">
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">文件</label>
						<div class="controls">
							<input type="file" data-required="true" title="上传" id="files"
								name="files" class="input-large" />
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">类型</label>
						<div class="controls">
							<select id="fileInfoNametype" data-required="true" class="input-large"
								name="fileInfo.nametype">
								<option value="1">护照</option>
								<option value="2">毕业证</option>
								<option value="3">简历</option>
								<option value="4">Profile Form</option>
								<option value="5">其他证件(TEFL、家属证明)</option>
								<option value="6">合同word版本</option>
								<option value="7">合同签字版本</option>
								<option value="8">工作许可证</option>
								<option value="9">邀请函</option>
								<option value="10">公司邀请函</option>
								<option value="11">外国专家证</option>
								<option value="12">居留许可</option>
							</select>
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">描述</label>
						<div class="controls">
							<input type="text" maxlength="15" class="input-large"
								id="fileInfoDescr" name="fileInfo.descr" value="">
						</div>
					</div>
				</dir>

			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="submit">确认</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			</div>
		</form>
	</div>
	
	<!-- 修改上传文件信息 -->
	<div class="modal small hide fade" id="fileEditorfirm" tabindex="-1"
		style="width: 550px;" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">附件上传</h3>
		</div>
		<form id="fileEditorForm" class="form-horizontal"
			action="${menu2Id}!saveFile.jspa" method="post">
			<input type="hidden" name="menuId" value="${menuId}"> 
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="spaceId" value="${spaceId}">
			<input type="hidden" name="formId" value="${entryProcess.id}">
			<input type="hidden" name="tabID" value="annexButt">
			<input type="hidden" id="FileInfoId" name="fileInfo.id" value="">
			<div class="modal-body">
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">文件</label>
						<div class="controls">
							<input type="text" readonly="readonly" title="上传" id="FileInfoName"
								name="fileInfo.name" class="input-large" />
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">类型</label>
						<div class="controls">
							<select id="fileInfoNametype" data-required="true" class="input-large"
								name="fileInfo.nametype">
								<option value="1">护照</option>
								<option value="2">毕业证</option>
								<option value="3">简历</option>
								<option value="4">Profile Form</option>
								<option value="5">其他证件(TEFL、家属证明)</option>
								<option value="6">合同word版本</option>
								<option value="7">合同签字版本</option>
								<option value="8">工作许可证</option>
								<option value="9">邀请函</option>
								<option value="10">公司邀请函</option>
								<option value="11">外国专家证</option>
								<option value="12">居留许可</option>
							</select>
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">描述</label>
						<div class="controls">
							<input type="text" maxlength="15" class="input-large"
								id="fileInfoDescr" name="fileInfo.descr" value="">
						</div>
					</div>
				</dir>

			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="submit">确认</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			</div>
		</form>
	</div>
	
	<div class="hide">
		<a id="Ejectfirm" name="Ejectfirm" href="#forMchangefirm"
			data-toggle="modal"></a>
	</div>
	
	<!-- 添加培训 -->
	<div class="modal small hide fade" id="popupfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel1">人员添加</h3>
		</div>
		<div class="modal-body">
				<div class="control-group">
					<label id="modalAssignLable" class="control-label  pull-left" for="popupModalAssign">人员：</label>
					<div class="controls">
						<select id="popupModalAssign" class="input-large">
							<option value=""></option>
							<s:iterator value="userList" var="user" status="index">
							<option value="${user.loginName}">${user.name}(${user.loginName})</option>
							</s:iterator>
						</select>
					</div>
				</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="popupBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>
	
	<!-- 发起流程 -->
	<div class="modal small hide fade" id="startConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">流程发起</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="startConfirmMsg"></p>
			</div>
			<div class="control-group">
				<label class="control-label pull-left" for="modalAssign">审批人：</label>
				<select id="modalAssign" class="input-large pull-right">
					<option value=""></option>
					<s:iterator value="userList" var="user" status="index">
					<option value="${user.loginName}">${user.name}(${user.loginName})</option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="startBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<!-- 批准流程 -->
	<div class="modal small hide fade" id="approveConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="approveModalLabel">流程审批</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="approveConfirmMsg"></p>
			</div>
			<div class="control-group">
				<label class="control-label pull-left" for="modalNextAssign">审批人：</label>
				<select id="modalNextAssign" class="input-large pull-right">
					<option value=""></option>
					<s:iterator value="userList" var="user" status="index">
					<option value="${user.loginName}">${user.name}(${user.loginName})</option>
					</s:iterator>
				</select>
			</div>

		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="approveBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>
	<!-- 拒绝流程 -->
	<div class="modal small hide fade" id="rejectConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="approveModalLabel">流程审批</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="approveConfirmMsg"></p>
			</div>
			<div class="control-group">
				<p class="error-text">
					<i class="icon-warning-sign modal-icon"></i>您确认拒绝流程吗?
				</p>
			</div>

		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="rejectBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<div class="modal small hide fade" id="forMchangefirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">警告</h3>
		</div>
		<div class="modal-body">
			<p class="error-text">
				<i class="icon-warning-sign modal-icon"></i>当前页面已经修改过,请先保存."确认" 保存
				"取消" 不保存
			</p>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="formChangefirmBtn">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/jquery-validate.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="<%=path%>/js/json2.js"></script>
	<script src="<%=path%>/js/select2/select2.js"></script>
	<script src="<%=path%>/js/select2/select2_locale_zh-CN.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="<%=path%>/js/common.js"></script>

	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		var id = '${menuId}';
		var menuId = '${menu2Id}';
		var spaceId = '${spaceId}';
		var row_count = 0;
		var url = $("#" + menuId).attr('url');
		var headText = $("#" + menuId).text();
		$("#navigation1").text(headText);
		//是否具有编辑权限
		var hasEdit = $("#hasEditAuth").val();
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;

		//基本信息
		//$("#contracttype").select2();
		$("#contracttype").val("${entryProcess.contracttype}").trigger(
				"change");
		
		//证件信息初始化
		//$("#certificatesType").select2();
		//$("#certificatesType").val("${certificates.type}").trigger("change");
		certificatesListStr = '${certificatesListJson}';
		certificatesList = new Array();
		if ("" != certificatesListStr) {
			certificatesList = JSON2.parse(certificatesListStr);
		}
		for ( var x = 0; x < certificatesList.length; x++) {
			var certificates = certificatesList[x];
			//获取最后一行数据进行赋值
			addNew();
			$("#certificatesSearch input[id='certificatesId']").last().val(certificates.id);
			$("#certificatesSearch input[id='certificatesSerialNumber']").last().val(certificates.serialNumber);
			$("#certificatesSearch select[id='certificatesType']").last().val(certificates.type).trigger(
					"change");
			//$("#certificatesType").last().select2();
			$("#certificatesSearch input[id='certificatesHandledate']").last().val(
					new Date(certificates.handledate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesReceivedate']").last().val(
					new Date(certificates.receivedate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesValidstartdate']").last().val(
					new Date(certificates.validstartdate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesValidenddate']").last().val(
					new Date(certificates.validenddate).format("yyyy-MM-dd"));
			//$("#certificatesUpdateDate").last().val(new Date(certificates.updateDate).format("yyyy-MM-dd"));
			
		}
		if(hasEdit == "1" && certificatesList.length == 0 )
		{
			addNew();
		}
		
		
		if (hasEdit == "1") {
			$("select").select2();
		} else {
			$(".container-fluid input").attr("disabled", "disabled");
			$(".container-fluid select").attr("disabled", "disabled");
			$(".container-fluid button").attr("disabled", "disabled");
			
		}
		
		//航班信息
		//$("#airportPeopleId").select2();
		//$("#airportpeopleid").val("${flight.airportpeopleid}").attr("selectId","${flight.airportpeopleid}").trigger("change");
		
		//初始化接机人
		//selectUsers("airportPeopleId","form");

		//附件
		//$("select").select2();
		//$('#fileForm').validate();
		//$('#fileEditorForm').validate();
		
		//快递信息
		//$('#expressForm').validate();
		
		
		//附件信息列表初始化
		fileInfoListStr = '${fileInfoListJson}';
		fileInfoList = new Array();
		if ("" != fileInfoListStr) {
			fileInfoList = JSON2.parse(fileInfoListStr);
		}
		for ( var x = 0; x < fileInfoList.length; x++) {
			var fileInfo = fileInfoList[x];
			addNewFile(fileInfo);
			
		}

		//新增证件行信息

		function addNew() {
			row_count++;
			var search = $('#certificatesSearch');
			var row = $("<tr></tr>");
			addTd(row, "<input type='hidden' size='15' id='certificatesId'>");
			addTd(row,
					"<select id='certificatesType' class='input-medium' ><option value='1'>工作许可证</option><option value='2'>邀请函</option><option value='3'>公司邀请函</option> <option value='4'>暂住证</option><option value='5'>工作签</option><option value='6'>入境章页</option><option value='7'>保险</option><option value='8'>外国专家证</option><option value='9'>居留许可</option></select>");
			addTd(row,
					"<input type='text' size='15' id='certificatesSerialNumber' class='input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesHandledate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesReceivedate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesValidstartdate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesValidenddate' readonly class='form_datetime input-small'>");
			/*
			addTd(row,
					"<input type='text' size='15' id='certificatesUpdateDate' readonly class='form_datetime input-small'>");
			*/
			if (hasEdit == "1")
			{
				addTd(row,
					"<p><button class='btn btn-mini icon-plus' onclick='addNew();' type='button'></button><button class='btn btn-mini icon-minus' onclick='del(this);' type='button'></button></p>");
				$("select[id='certificatesType']").last().select2();	
			}else
			{
					$("select[id='certificatesType']").prop("disabled", true);		
			}
			search.append(row);
			
			$("#certificatesSearch .form_datetime").datetimepicker({
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : true
			});
		}

		//获取证件 table中行的的对象
		function queryCertificates(index) {
			var obj = new Object();
			obj.id = $("input[id='certificatesId']")[index].value;
			obj.serialNumber = $("input[id='certificatesSerialNumber']")[index].value;
			obj.type = $("select[id='certificatesType']")[index].value;
			obj.handledate = $("input[id='certificatesHandledate']")[index].value;
			obj.receivedate = $("input[id='certificatesReceivedate']")[index].value;
			obj.validstartdate = $("input[id='certificatesValidstartdate']")[index].value;
			obj.validenddate = $("input[id='certificatesValidenddate']")[index].value;
			obj.technologicalprocessid = $("#inputId").val();
			return obj;
		}

		//新增上传文件行
		
		function addNewFile(fileInfo) {
			var search = $('#FileInfoSearch');
			var row = $("<tr></tr>");
			addTd(row,"<lable id='id'>" + fileInfo.id + "</label>");
			addTd(row,"<lable  id='name'>" + fileInfo.name + "</label>");
			var nametype = "";
			switch(fileInfo.nametype)
			{
			case '2':
				nametype="毕业证";
			  break;
			case '3':
				nametype="简历";
			  break;
			case '4':
				nametype="Profile Form";
			  break;
			case '5':
				nametype="其他证件(TEFL、家属证明)";
			  break;
			case '6':
				nametype="合同word版本";
			  break;
			case '7':
				nametype="合同签字版本";
			  break;
			case '8':
				nametype="工作许可证";
			  break;
			case '9':
				nametype="邀请函";
			  break;
			case '10':
				nametype="公司邀请函";
			  break;
			case '11':
				nametype="外国专家证";
			  break;
			case '12':
				nametype="居留许可";
			  break;
			default:
				nametype="护照";
			}
			addTd(row,"<lable  id='nametype'>" + nametype + "</label>");
			addTd(row,"<lable>" + fileInfo.descr + "</label>");
			addTd(row,"<lable>" + fileInfo.createdate + "</label>");
			addTd(row,
					"<p><button class='btn btn-mini icon-pencil' data-toggle='modal' data-target='#fileEditorfirm' onclick='initFileInfo(this," + fileInfo.nametype + ")' type='button'></button><button class='btn btn-mini icon-minus hide' onclick='delFile(this);' type='button'></button></p>");
			search.append(row);
			$("select[id='fileInfoNametype']").last().select2();
		}
		
		function initFileInfo(obj,nameType)
		{
			var tr = obj.parentNode.parentNode.parentNode;
			cells = tr.cells;
			var id=cells[0].textContent;
			var name=cells[1].textContent;
			//var nametype=cells[2].textContent;
			var descr=cells[3].textContent;
			$("#fileEditorForm input[id='FileInfoId']").val(id);
			$("#fileEditorForm input[id='FileInfoName']").val(name);
			$("#fileInfoNametype").last().val(nameType).trigger(
			"change");
			$("#fileEditorForm input[id='fileInfoDescr']").val(descr);
		}

		function addTd(row, str) {
			var td = $("<td></td>");
			td.append($(str));
			row.append(td);

		}

		function delFile(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}

		function del(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			row_count--;
			$("#formChanged").val("1");
		}

		//判断表单是否修改过
		$("form :input").change(function() {
			$("#formChanged").val("1");
		});

		//所有时间控件变更
		$(".form_datetime").change(function() {
			$("#formChanged").val("1");
		});

		//所有select控件变更
		$("tbody select").change(function() {
			$("#formChanged").val("1");
		});

		//进入指定的tbs
		var tabID = "${tabID}";
		if (null != tabID && "" != tabID) {
			$("#" + tabID).parent().addClass("active");
			$("#" + tabID.substring(0, tabID.length - 4)).removeClass("fade")
					.addClass("active");
		} else {
			tabID = "homeButt";
			$("#tabID").val("homeButt");
			$("#homeButt").parent().addClass("active");
			$("#home").removeClass("fade").addClass("active");
		}

		//提交按钮
		$("#formButton").click(function() {
			//currTab = $("#tabID").val();
			saveForm();
		});

		$("#formChangefirmBtn").click(function() {
			currTab = oldTab;
			saveForm();
		});

		//旧的tbs
		var oldTab = tabID;
		//当前tab
		var currTab = tabID;
		//判读当前tab，需要保存那个form
		function saveForm() {
			var action;
			if ("homeButt" == currTab) {
				action = $("#editForm").attr("action");
				setTabID("editForm",action);
				//validate = $('#editForm').validate();
				$("#editForm").submit();
			} else if ("certificatesButt" == currTab) {
				var arrCertificates = new Array();
				for ( var index = 0; index < row_count; index++) {
					arrCertificatesIndex = queryCertificates(index);
					if (arrCertificatesIndex.handledate != ""
						&& arrCertificatesIndex.receivedate != ""
						&& arrCertificatesIndex.validstartdate != ""
						&& arrCertificatesIndex.validenddate != ""
						&& arrCertificatesIndex.serialNumber != "") {
						
						arrCertificates[index] = arrCertificatesIndex;
					}
				}
				var tex = JSON2.stringify(arrCertificates);
				$("input[id='jsonList']").val(tex);
				action = $("#certificatesForm").attr("action");
				setTabID("certificatesForm",action);
				$("#certificatesForm").submit();
			} else if ("flightButt" == currTab) {

				action = $("#flightForm").attr("action");
				setTabID("flightForm",action);
				$("#flightForm").submit();
			} else if ("expressButt" == currTab) {

				//validate = $('#expressForm').validate();
				action = $("#expressForm").attr("action");
				setTabID("expressForm",action);
				$("#expressForm").submit();
			} else if ("hotelButt" == currTab) {

				//validate = $('#expressForm').validate();
				action = $("#hotelForm").attr("action");
				setTabID("hotelForm",action);
				$("#hotelForm").submit();
			} else if ("physicalExamButt" == currTab) {

				//validate = $('#expressForm').validate();
				action = $("#physicalExamForm").attr("action");
				setTabID("physicalExamForm",action);
				$("#physicalExamForm").submit();
			}
			
			
		}
		
		function setTabID(name,action)
		{
			var index=action.indexOf("?tabID=");
			actionName=action;
			if(  index > 0 )
			{
				actionName = action.substring(0,index);
			}
			$("#" + name).attr("action",
					actionName + "?tabID=" + currTab);	
		}

		/*判断当前form是否变更*/
		var entryProcessId = "${entryProcess.id}";
		function ischangeForm(id) {
			//获取当前需要保存的tabid
			oldTab = $("#tabID").val();
			//设置新的tab
			$("#tabID").val(id);
			currTab = id;
			//判断是否变更过
			if ("1" == $("#formChanged").val()) {
				$("#Ejectfirm").click();
				$("#formChanged").val("0");
			}
		}

		//tab页签添加事件
		$("li a[data-toggle='tab']").click(function() {
			ischangeForm(this.id);
		});

		//开始选择，培训选择框打开
		$('#popupfirm').on('show.bs.modal', function(x,xx) {
			// 执行一些动作...
			if ("trainingButt" == currTab)
			{
				$('#startModalLabel1').html("添加培训");
				$('#modalAssignLable').html("培训课程:");
				selectTrainCourse("popupModalAssign","1");
				$("#popupModalAssign").select2();
			} else if( "activityButt" == currTab)
			{
				$('#startModalLabel1').html("添加活动");
				$('#modalAssignLable').html("活动:");
				selectActivities("popupModalAssign","1");
				$("#popupModalAssign").select2();
			}
			
		});
		
		//弹出框公共确认按钮
		$("#popupBtnConfirm").click(function(x) {
			if ("trainingButt" == currTab)
			{
				var assign = $("#popupModalAssign").val();
				assign = $.trim(assign);
				if (assign == null || assign == "") {
					return;
				} else {
					$("#trainCourseId").val(assign);
					$("#trainingForm").submit();
				}
			}else if( "activityButt" == currTab)
			{
				var assign = $("#popupModalAssign").val();
				assign = $.trim(assign);
				if (assign == null || assign == "") {
					return;
				} else {
					$("#activitiesId").val(assign);
					$("#activitiesForm").submit();
				}
			}
		});
		
		//开始选择，用户选择框打开
		$('#startConfirm').on('show.bs.modal', function(x) {
			// 执行一些动作...
			//selectUsers("modalAssign",'assign');
			//审核状态
			var auditRet = auditStatus();
			//存在必填没有填写
			if (auditRet.length > 0) {
				$("#startBtnConfirm").attr("disabled", "disabled");
				$("#startBtnConfirm").removeClass("btn-danger");
				$("#startConfirmMsg").html("缺少下列必填字段：" + auditRet);
			}
		});

		//选择框隐藏
		$('#startConfirm').on('hidden.bs.modal', function(x) {
			// 执行一些动作...
		});

		//批准选择，用户选择框打开
		$('#approveConfirm').on('show.bs.modal', function(x) {
			// 执行一些动作...
			//selectUsers("modalNextAssign",'assign');
			//审核状态
			var auditRet = auditStatus();
			//存在必填没有填写
			if (auditRet.length > 0) {
				$("#approveBtnConfirm").attr("disabled", "disabled");
				$("#approveBtnConfirm").removeClass("btn-danger");
				$("#approveConfirmMsg").html("缺少下列必填字段：" + auditRet);

			}
		});

		//选择框隐藏
		$('#approveConfirm').on('hidden.bs.modal', function() {
			// 执行一些动作...
		});

		//发起按钮确认
		$("#startBtnConfirm").click(function(x) {
			var assign = $("#modalAssign").val();
			assign = $.trim(assign);
			if (assign == null || assign == "") {
				return;
			} else {
				$("#cwf_assign").val(assign);
				$("#createWF").submit();
			}
		});

		//批准按钮确认
		$("#approveBtnConfirm").click(function(x) {
			var assign = $("#modalNextAssign").val();
			assign = $.trim(assign);
			if (assign == null || assign == "") {
				return;
			} else {
				$("#awf_assign").val(assign);
				$("#awf_assignFlag").val("1");
				$("#approveWF").submit();
			}
		});

		//拒绝按钮确认
		$("#rejectBtnConfirm").click(function(x) {
			$("#awf_assignFlag").val("0");
			$("#approveWF").submit();
		});

		/**
		 * 审核当前的必填字段是否填写
		 * 
		 */
		function auditStatus() {
			var curState = "${entryProcess.state}";
			var formId = "${entryProcess.id}";
			var auditRet = new Array();

			$.ajax({
				type : "POST", //访问WebService使用Post方式请求
				async:false,//同步操作
				url : basePath + "/workflow/induction!auditRelease.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
				data : {state:curState, formId:formId}, //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到       
				dataType : 'json', //WebService 会返回Json类型
				traditional : false, //不要序列化参数
				error : function(err, textStatus) {
					//alert("error: " + err + " textStatus: " + textStatus);
				},
				success : function(result) {//回调函数，result，返回值
					//alert(result);
					auditRet = result;
				}
			});
			
			/*
			if (curState == "发起") {
				//检查必填字段
				$("#myTabContent input[data-required='true']").each(function() {
					var inputValue = $.trim($(this).val());
					if (inputValue == null || inputValue == "") {
						var desc = $(this).attr("desc");
						auditRet.push(desc);
					}
				});

			}
			*/
			return auditRet;
		}
	</script>
</body>
</html>
