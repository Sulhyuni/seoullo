<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3593b4fa1bdf0517be47b4b4399cb5ac"></script>
<script type="text/javascript">

// 기본정보는 스크립트 없음

// 상세일정 스크립트
$(function() {
	var container = document.getElementById('meetMap'); // 지도를 표시할 div 
	if(container != null) {
		// 마커 좌표
		var meetLatlng = new kakao.maps.LatLng(${tourvo.meetLat}, ${tourvo.meetLng});

		var options = {
			center : meetLatlng, // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(container, options);

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35);
		// 마커 이미지를 생성합니다    
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		//마커 생성
		var meetMarker = new kakao.maps.Marker({
			map : map,
			position : meetLatlng,
			image : markerImage
		});

		var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(meetLatlng, 50, function(panoId) {
		    roadview.setPanoId(panoId, meetLatlng); //panoId와 중심좌표를 통해 로드뷰 실행
		});
	}

// 후기 스크립트

// QnA 스크립트

// 예약 스크립트


});
</script>
<style type="text/css">

/* 상단 메인 스타일------------------------- */
#region {
	float:left;
	text-align: center;
}
#tourTitle {
	text-align: center;
}
#leftDiv {
	float:left;
	width:750px;
}
#mainImg {
	clear:both;
	width: 100%;
	height:400px;
}
.tab-content {
	margin-top: 30px;
}

/* 기본정보, 상세일정 탭 스타일--------------- */
#tourSubLeft {
	float: left;
	width: 63%;
	padding: 15px;
}
#tourSubRight {
	float: right;
	width: 35%;
}
#tourSubImg {
	margin: 30px 10px 10px 10px;
	width: 230px;
	height: 230px;
	border-radius: 50%;
	border: thin;
	overflow: hidden;
}
#basicSchedule {
	clear: both;
}
.dayBox {
	clear: both;
}
.dayNum {
	width: 140px;
	font-size: x-large;
	float: left;
	padding: 35px 20px;
}
.tourCourse {
	width: 600px;
	float: left;
}
.scheduleCircle {
	float: left;
	background-color: #ECF2FA;
	border-radius: 50%;
	width: 100px;
	height: 100px;
	margin: 10px;
	text-align: center;
}
.scheduleEach {
	font-size: small;
}

.pointBox {
	padding: 20px 0px 20px 0px;
}

.pointLeft {
	float:left;
	width: 370px;
	height: 270px;
}
.pointImage {
	margin:20px;
	width: 330px;
	height: 230px;
}
.pointRight {
	float:right;
	width: 370px;
}
.pointNum {
	margin: 20px 20px 0px 20px;
	width: 100px;
	padding: 5px 10px;
	font-size:large;
	color: white;
}
.pointTitle {
	margin: 10px 20px;
	font-size:x-large;
	font-weight: lighter;
}
.pointContent {
	margin: 0px 20px;
	padding-top:10px;
	font-size: medium;
}
.clear{
	clear:both;
}
#meetInfo{
	margin: 20px 0px;
	border-top: 1px dotted gray;
	padding: 20px;
}
#meetTitle {
	margin: 20px 0px;
	font-size: x-large;
	font-weight: bold;
	color: #DC143C;
}

#mapDiv {
	margin: 20px 0px;
}

#scheduleDetail {
	margin: 20px 0px;
	padding: 20px;
}

.sd-dayNum {
	margin: 20px 0px;
	font-size: xx-large;
	font-weight: bolder;
	color: #DC143C;
	border-bottom: 2px solid #DC143C;
	padding-bottom: 10px;
}

.sd-tourTitle {
	color: gray;
	font-size: large;
	font-weight: lighter;
	padding-top:15px;
	letter-spacing: 5px;
}
.sd-each {
	padding: 0px 0px 10px 25px;
}
.schedule-name {
	font-size: medium;
}

.emptyTime {
	padding-left: 15px;
}

.schedule-description p {
	padding: 5px 0px 0px 25px;
	color: gray;
	font-size: small;
	font-style: italic;
}

.startTime {
	color: #DC143C;
}

.well {
	padding-top: 35px;
}
.well li p {
	font-size: small;
}

/* 예약 부분 스타일---------------------- */
#rightDiv {
	background-color: #ccc;
	float:right;
	width:350px;
	height: 700px;
}
</style>
</head>
<body>
	<div class="container">
	
<!-- 		메인  -->
		<div class="main"
			style="width: 100%; height: 500px;">
			<div id="region" class="col-md-2">${tourvo.region} | ${tourvo.type }</div>
			<div id="tourTitle" class="col-md-8"><h1>${tourvo.title }</h1></div>
			<div id="mainImg">
				<img src="${tourvo.mainImg }" width="100%" height="100%">
			</div>
		</div>
		
<!-- 		왼쪽 DIV -->
		<div id="leftDiv">
			<ul class="nav nav-tabs" role="tablist">
				<li class="active"><a data-toggle="tab" href="#basic">기본정보</a></li>
				<li><a data-toggle="tab" href="#schedule">상세일정</a></li>
			</ul>
			<div class="tab-content">
			
<!-- 				기본정보 탭 -->
				<div id="basic" class="tab-pane fade in active">
					<div id="tourSubLeft">
						<div id="tourSubtitle" style="padding-bottom: 15px;">
							<span style="color: #4B8A08; font-size:xx-large; font-weight: lighter; text-align: justify; ">${tourvo.subtitle }</span>
						</div>
						<div id="tourDescription"><p style="padding:10px; font-size:large; text-align: justify;">${tourvo.content}</p></div>
					</div>
					<div id="tourSubRight">
						<div id="tourSubImg">
							<img src="${tourvo.subImg }" width="100%" height="100%">							
						</div>
					</div>
					<div id="basicSchedule">
						<c:if test="${tourvo.type eq '당일' }">
							<div class="dayBox">
								<div class="dayNum">투어코스</div>
								<div class="tourCourse">
									<c:forEach items="${tourvo.scheduleList}" var="svo">
										<div class="scheduleCircle"><span class="scheduleEach"><span style="font-size:large;"><br></span>
										<span style="color:blue;">STEP ${svo.scheduleNum }</span><br>
										${svo.schedule }</span></div>
									</c:forEach>
								</div>
							</div>												
						</c:if>
						<c:if test="${tourvo.type ne '당일' }">
							<c:forEach var="day" begin="1" end="${tourvo.type.charAt(2)-48 }">
								<div class="dayBox">
									<div class="dayNum">${day }일차</div>
									<div class="tourCourse">
										<c:forEach items="${tourvo.scheduleList }" var="svo">
											<c:if test="${svo.dayNum eq day }">
												<div class="scheduleCircle"><span class="scheduleEach"><span style="font-size:large;"><br></span>
												<span style="color:blue;">STEP ${svo.scheduleNum }</span><br>
												${svo.schedule }</span></div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div id="tourpoint" class="clear">
						<%! int pointNum = 1; %>
						<c:forEach items="${tourvo.tourpointList }" var="pointvo">
							<div class="pointBox clear">
								<% if(pointNum % 2 == 1) { %>
								<div class="pointLeft">
									<div class="pointImage" style="background-image: url('${pointvo.image }');">
										<img src="${pointvo.image }" width="100%" height="100%">
									</div>
								</div>
								<div class="pointRight">
									<div class="pointNum" style="background-color: #4B8A08;"> POINT <%=pointNum++ %></div>
									<div class="pointTitle">${pointvo.title }</div>
									<div class="pointContent" style="border-top: 2px solid #4B8A08;">${pointvo.content }</div>
								</div>
								<% } else { %>
								<div class="pointLeft">
									<div class="pointNum" style="background-color: #DC143C;"> POINT <%=pointNum++ %></div>
									<div class="pointTitle">${pointvo.title }</div>
									<div class="pointContent" style="border-top: 2px solid #DC143C;">${pointvo.content }</div>
								</div>
								<div class="pointRight">
									<div class="pointImage">
										<img src="${pointvo.image }" width="100%" height="100%">
									</div>
								</div>
								<% } %>
							</div>
						</c:forEach>
						<div class="clear"><% pointNum = 1; %></div>
					</div>
				</div>
				
<!-- 				상세일정 탭 -->
				<div id="schedule" class="tab-pane fade">
					<div id="scheduleList">
						<c:if test="${tourvo.type eq '당일' }">
							<div class="dayBox">
								<div class="dayNum">투어코스</div>
								<div class="tourCourse">
									<c:forEach items="${tourvo.scheduleList}" var="svo">
										<div class="scheduleCircle"><span class="scheduleEach"><span style="font-size:large;"><br></span>
										<span style="color:blue;">STEP ${svo.scheduleNum }</span><br>
										${svo.schedule }</span></div>
									</c:forEach>
								</div>
							</div>												
						</c:if>
						<c:if test="${tourvo.type ne '당일' }">
							<c:forEach var="day" begin="1" end="${tourvo.type.charAt(2)-48 }">
								<div class="dayBox">
									<div class="dayNum">${day }일차</div>
									<div class="tourCourse">
										<c:forEach items="${tourvo.scheduleList }" var="svo">
											<c:if test="${svo.dayNum eq day }">
												<div class="scheduleCircle"><span class="scheduleEach"><span style="font-size:large;"><br></span>
												<span style="color:blue;">STEP ${svo.scheduleNum }</span><br>
												${svo.schedule }</span></div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<div class="dayBox"></div>
					</div>
					<div id="meetInfo">
						<div id="meetTitle">만나는 장소</div>
						<div id="meetPlace">▶  ${tourvo.meetPlace }</div>
						<div id="mapDiv">
							<c:if test="${tourvo.meetLat ne null }">
								<div id="meetMap" style="width:50%; height:350px; float:left;"></div>
								<div id="roadview" style="width:50%; height:350px;"></div>
							</c:if>
						</div>
					</div>
					<div id="scheduleDetail">
						<c:if test="${tourvo.type eq '당일' }">
							<div class="sd-dayNum">투어코스 <span class="pull-right sd-tourTitle">${tourvo.title }</span></div>
							<div class="sd-schedule">
								<c:forEach items="${tourvo.scheduleList}" var="svo">
									<div class="sd-each">
										<div class="schedule-name">
											<c:if test="${svo.starthour ne null }">
												<span class="startTime" style="font-size: medium;">${svo.starthour }시 
												<c:if test="${svo.startminute ne 0 }">
													${svo.startminute }분
												</c:if>
												</span>
											</c:if>
											<c:if test="${svo.starthour eq null }">
												<span class="emptyTime"></span>
											</c:if>
											<span style="font-weight: bold; font-size: medium;">${svo.schedule }</span>
										</div>
										<div class="schedule-description"><p>${svo.description }</p></div>
									</div>
								</c:forEach>
							</div>		
						</c:if>
						<c:if test="${tourvo.type ne '당일' }">
							<c:forEach var="day" begin="1" end="${tourvo.type.charAt(2)-48 }">
								<div class="sd-dayNum">DAY ${day } <span class="pull-right sd-tourTitle">${tourvo.title } ${day }일차</span></div>
								<div class="sd-schedule">
									<c:forEach items="${tourvo.scheduleList }" var="svo">
										<c:if test="${svo.dayNum eq day }">
											<div class="sd-each">
												<div class="schedule-name">
													<c:if test="${svo.starthour ne null }">
														<span class="startTime" style="font-size: medium;">${svo.starthour }시 
														<c:if test="${svo.startminute ne 0 }">
															${svo.startminute }분
														</c:if>
														</span>
													</c:if>
													<c:if test="${svo.starthour eq null }">
														<span class="emptyTime"></span>
													</c:if>
													<span style="font-weight: bold; font-size: medium;">${svo.schedule }</span>
												</div>
												<div class="schedule-description"><p>${svo.description }</p></div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
					<div class="well">
						<ol>
							<c:forEach items="${tourvo.checkpointList }" var="cpvo">
								<li>
									<p>${cpvo }</p>
								</li>
							</c:forEach>
						</ol>
					</div>
					
				</div>
			</div>
		</div>
		
<!-- 		오른쪽 DIV -->
		<div id="rightDiv">
		
		</div> 
<!-- 		예약div 끝	 -->
		
		
	</div> <!-- container div 끝 **지우면안됨**-->
	
	
</body>
</html>