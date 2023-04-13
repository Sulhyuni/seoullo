<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3593b4fa1bdf0517be47b4b4399cb5ac"></script>
<script type="text/javascript">
	$(function() {

		//지도 관련
		var container = document.getElementById('meetMap'); // 지도를 표시할 div 
		if(container != null) {
			// 마커 좌표
			var meetLatlng = new kakao.maps.LatLng(37.56682870765463, 126.97865225753738);

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
				draggable: true,
				image : markerImage
			});

			var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
			var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			roadviewClient.getNearestPanoId(meetLatlng, 50, function(panoId) {
			    roadview.setPanoId(panoId, meetLatlng); //panoId와 중심좌표를 통해 로드뷰 실행
			});

			//마커 드래그 시 로드뷰를 변경하는 이벤트
			kakao.maps.event.addListener(meetMarker, 'dragend', function() {
			    meetLatlng = meetMarker.getPosition();
			    roadviewClient.getNearestPanoId(meetLatlng, 50, function(panoId) {
				    roadview.setPanoId(panoId, meetLatlng); //panoId와 중심좌표를 통해 로드뷰 실행
				});
			});
		}

		//지도 이외 기능
		
		//미리보기
		
		function preview() {
			let formdata = new FormData($("#form")[0]);

			$.ajax({
				type: 'post',
				url: '/tourlist/preview.do',
				data: formdata,
				contentType: false,
				processData: false,
				success: function(result) {
					window.open('preview.do');
				}
			});
		}
		
		//폼 양식 개수 동적 변경

		let tdNum = 1;
		let pointNum = 1;
		let dayArea = $("#sc-eachDiv");
		let tdArea = $("#td-table");
		let tpArea = $("#tp-div");
		let cpArea = $("#cp-each");

		function addDay(num) {
			let new_day = document.createElement('div');
			new_day.setAttribute('class', 'sc-each');
			new_day.innerHTML = "<div id='sc-day" + num + "' class='sc-dayNum'><span class='subtitle'>" + num + "일차</span>"
				+ "<button type='button' class='sc-addBtn btn btn-xs btn-info' data-daynum='" + num + "'>추가</button></div>"
				+ "<div id='sc-info" + num + "'><div class='sc-eachInfo'><input type='hidden' name='dayNum' value=" + num + "><div class='form-group'><label for='starthour'>시간</label>"
				+ "<input name='starthour' type='number' min='0' max='23' class='form-control sc-time'>"
				+ "<input name='startminute' type='number' min='0' max='59' class='form-control sc-time'>"
				+ "<label for='schedule'>일정</label>	<input name='schedule' maxlength='30' class='form-control halfWidth' required='required'></div>"
				+ "<div class='form-group'><label for='schDescription'>설명</label><input name='schDescription' maxlength='200' class='form-control'>"
				+ "</div></div></div>";
			dayArea.append(new_day);

		}
		function changeAll() {
			$("input[name='maxNum']").val($("#firstMaxNum").val());
			$("input[name='priceA']").val($("#firstPA").val());
			$("input[name='priceB']").val($("#firstPB").val());
		}
		function add_td() {
			tdNum = tdNum + 1;
			let new_td = document.createElement('tr')
			new_td.setAttribute('id', "td"+tdNum);
			new_td.innerHTML = "<td><input name='day' type='date' class='form-control' required='required'></td>"
				+ "<td><input name='maxNum' type='number' class='form-control' required='required'></td>"
				+ "<td><input name='priceA' type='number' class='form-control' required='required'></td>"
				+ "<td><input name='priceB' type='number' class='form-control' required='required'></td>"
				+ "<td><button data-td='" + tdNum + "' type='button' class='td-deleteBtn btn btn-xs btn-danger'>X</button></td>";
			tdArea.append(new_td);
		}
		function add_sc(dayNum) {
			let scArea = $("#sc-info"+dayNum);
			let new_sc = document.createElement('div');
			new_sc.setAttribute('class', 'sc-eachInfo');
			new_sc.innerHTML = "<input type='hidden' name='dayNum' value=" + dayNum
				+ "><div class='form-group'><label for='starthour'>시간</label><input name='starthour' type='number' min='0' max='23' "
				+ "class='form-control sc-time'><input name='startminute' type='number' min='0' max='59' "
				+ "class='form-control sc-time'><label for='schedule'>일정</label><input name='schedule' maxlength='30' "
				+ "class='form-control halfWidth' required='required'></div><div class='form-group'><label for='schDescription'>설명</label>"
				+ "<input name='schDescription' maxlength='200' class='form-control'></div>";
			scArea.append(new_sc);
		}
		function add_tp() {
			pointNum = pointNum + 1;
			let new_tp = document.createElement('div');
			new_tp.setAttribute('class', 'tp-each');
			new_tp.innerHTML = "<div class='pointNum'><span class='subtitle'>POINT "+ pointNum
				 + "</span></div><div class='form-group'><label for='pointTitle'>제목</label>"
				 + "<input name='pointTitle' maxlength='30' class='form-control' required='required'></div><div class='form-group'>"
				 + "<label for='pointContent'>설명</label><input name='pointContent' maxlength='300' class='form-control' required='required'></div>"
				 + "<div class='form-group'><label for='pointImageFile'>이미지</label><input name='pointImageFile' type='file' required='required'></div>";
			tpArea.append(new_tp);
		}
		function add_cp() {
			let new_cp = document.createElement('div');
			new_cp.setAttribute('class', 'form-group');
			new_cp.innerHTML = "<input name='checkpoint' class='form-control cp-input' required='required'>";
			cpArea.append(new_cp);
		}

		$("#typeSelect").change(function() {
			let type = $(this).find("option:selected").data("count");

			dayArea.html("<div class='sc-each'><div id='sc-day1' class='sc-dayNum'><span class='subtitle'>1일차</span>"
				+ "<button type='button' class='sc-addBtn btn btn-xs btn-info' data-daynum='1'>추가</button></div><div id='sc-info1'>"
				+ "<div class='sc-eachInfo'><input type='hidden' name='dayNum' value='1'><div class='form-group'><label for='starthour'>시간</label>"
				+ "<input name='starthour' type='number' min='0' max='23' class='form-control sc-time'>"
				+ "<input name='startminute' type='number' min='0' max='59' class='form-control sc-time'>"
				+ "<label for='schedule'>일정</label>	<input name='schedule' maxlength='30' class='form-control halfWidth' required='required'></div>"
				+ "<div class='form-group'><label for='schDescription'>설명</label>"
				+ "<input name='schDescription' maxlength='200' class='form-control'></div></div></div></div>");

			if(type >= 2) {
				for(let i = 2; i <= type; i++) {
					addDay(i);
				}
			}

			$(".sc-addBtn").on("click", function(){
				let dayNum = $(this).data("daynum");
				add_sc(dayNum);
			});
		});

		$("#td-changeAllBtn").on("click", function() {
			changeAll();
		});

		$(".sc-addBtn").on("click", function(){
			let dayNum = $(this).data("daynum");
			add_sc(dayNum);
		});
		
		$("#td-addBtn").click(function(){
			add_td();
			
			$(".td-deleteBtn").on("click", function() {
				let tdno = $(this).data("td");
				$("#td"+tdno).remove();
			});

		});
		
		$(".td-deleteBtn").on("click", function() {
			let tdno = $(this).data("td");
			$("#td"+tdno).remove();
		});
		
		$("#tp-addBtn").click(function(){
			add_tp();
		});
		
		$("#cp-addBtn").click(function(){
			add_cp();
		});
		$("#previewBtn").click(function() {
			//지도의 좌표 입력
			$("#meetLat").val(meetLatlng.getLat());
			$("#meetLng").val(meetLatlng.getLng());
			preview();
			return false;
		});
		$("#submitBtn").click(function() {
			//온갖 검사...
			$("#meetLat").val(meetLatlng.getLat());
			$("#meetLng").val(meetLatlng.getLng());
			return true;
		});
	});
</script>
<style type="text/css">
#topTitle {
	float: left;
	margin-left: 60px;
}
#topBtns {
	float: left;
	margin: 20px 0px 0px 30px;
}
.categoryDiv {
	width: 100%;
	margin-top: 25px;
}
.categoryTitleDiv {
	float: left;
	width: 20%;
	padding-right: 20px;
	text-align: right;
}
.categoryTitle {
	font-size: large;
	font-weight: bolder;
}

.inputDiv {
	float:left;
	padding-left: 30px;
	border-left: 1px solid #4B8A08;
	border-collapse: collapse;
	width:70%;
}
.clear {
	clear: both;
}
.halfForm > label, .halfForm > select {
	float: left;
}
label {
	float: left;
	margin: 8px;
}
.form-control {
	width: 88%;
}
.halfWidth {
	width: 40%;
}
#mapDiv {
	margin: 20px 0px;
}
.underMap {
	padding: 15px 0px 0px 0px;
}
.sc-dayNum {
	margin: 10px 0px;
}
.subtitle {
	font-size: medium;
	font-weight:bold;
}
.sc-addBtn {
	margin-bottom: 5px;
}

.sc-time {
	width: 60px;
	float: left;
	margin-right: 10px;
}

#td-table input {
	margin: 5px 0px;
}

.pointNum {
	padding: 10px 0px;
}
.cp-input {
	width: 93%;
}
</style>
</head>
<body>
	<div class="container">
		<form id="form" method="post" enctype="multipart/form-data">
			<div id="topDiv">
				<div id="topTitle">
					<h1>투어 등록</h1>
				</div>
				<div id="topBtns">
					<button type="button" class="btn btn-info" id="previewBtn">미리보기</button>
					<button class="btn btn-primary" id="submitBtn">등록</button>
				</div>
				<div class="clear"></div>
			</div>
			<div class="categoryDiv">
				<div class="categoryTitleDiv">
					<span class="categoryTitle">기본정보</span>
				</div>
				<div class="inputDiv">
					<input type="hidden" name="guideId" value=${login.getId() } required="required">
					<div class="form-group halfForm">
						<label for="region">지역</label>
						<select name="region" class="form-control halfWidth" required="required">
							<optgroup label="도심권">
								<option >종로구</option>
								<option>중구</option>
								<option>용산구</option>
							</optgroup>
							<optgroup label="서북권">
								<option>은평구</option>
								<option>서대문구</option>
								<option>마포구</option>
							</optgroup>
							<optgroup label="동북권">
								<option>성동구</option>
								<option>광진구</option>
								<option>동대문구</option>
								<option>중랑구</option>
								<option>성북구</option>
								<option>강북구</option>
								<option>도봉구</option>
								<option>노원구</option>
							</optgroup>
							<optgroup label="서남권">
								<option>강서구</option>
								<option>양천구</option>
								<option>영등포구</option>
								<option>구로구</option>
								<option>금천구</option>
								<option>관악구</option>
								<option>동작구</option>
							</optgroup>
							<optgroup label="동남권">
								<option>서초구</option>
								<option>강남구</option>
								<option>송파구</option>
								<option>강동구</option>
							</optgroup>
						</select>
						<label for="type" style="margin-left: 30px;">종류</label>
						<select name="type" id="typeSelect" class="form-control halfWidth" required="required">
							<option data-count="1" selected="selected">당일</option>
							<option data-count="2">1박2일</option>
							<option data-count="3">2박3일</option>
							<option data-count="4">3박4일</option>
							<option data-count="5">4박5일</option>
							<option data-count="6">5박6일</option>
						</select>
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input name="title" class="form-control" required="required" maxlength="30" placeholder="투어명을 입력하세요">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="description">설명</label>
						<input name="description" class="form-control" required="required" maxlength="50" placeholder="리스트에 나오는 간단한 설명입니다">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="tags">태그</label>
						<input name="tags" class="form-control" required="required" placeholder="반점(,)으로 구분하여 공백 없이 입력하세요">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="thumbnailFile">썸네일이미지</label>
						<input name="thumbnailFile" type="file" required="required">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="mainImgFile">메인이미지</label>
						<input name="mainImgFile" type="file" required="required">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="subtitle">소제목</label>
						<input name="subtitle" class="form-control" required="required" maxlength="30" placeholder="투어 기본정보 탭 소개글의 제목입니다">
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="content">소개글</label>
						<textarea name="content" rows="4" class="form-control" required="required" maxlength="500" placeholder="투어 기본정보 탭의 소개글입니다"></textarea>
						<div class="clear"></div>
					</div>
					<div class="form-group">
						<label for="subImgFile">서브이미지</label>
						<input name="subImgFile" type="file" required="required">
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="categoryDiv">
				<div class="categoryTitleDiv">
					<span class="categoryTitle">예약가능일</span><br>
					<button type="button" id="td-addBtn" class="btn btn-xs btn-info">추가</button>
				</div>
				<div class="inputDiv">
					<table id="td-table">
						<tr>
							<th>날짜</th>
							<th>최대인원</th>
							<th>대인가격</th>
							<th>소인가격</th>
							<th></th>
						</tr>
						<tr>
							<td><input id="firstDay" name="day" type="date" class="form-control" required="required"></td>
							<td><input id="firstMaxNum" name="maxNum" type="number" class="form-control" required="required"></td>
							<td><input id="firstPA" name="priceA" type="number" class="form-control" required="required"></td>
							<td><input id="firstPB" name="priceB" type="number" class="form-control" required="required"></td>
							<td><button type="button" id="td-changeAllBtn" class="btn btn-xs btn-primary">All</button></td>
						</tr>
						<tr id=td1>
							<td><input name="day" type="date" class="form-control" required="required"></td>
							<td><input name="maxNum" type="number" class="form-control" required="required"></td>
							<td><input name="priceA" type="number" class="form-control" required="required"></td>
							<td><input name="priceB" type="number" class="form-control" required="required"></td>
							<td><button data-td="1" type="button" class="td-deleteBtn btn btn-xs btn-danger">X</button></td>
						</tr>
					</table>
				</div>
				<div class="clear"></div>
			</div>
			<div class="categoryDiv">
				<div class="categoryTitleDiv">
					<span class="categoryTitle">투어일정</span>
				</div>
				<div class="inputDiv">
					<div id="meetDiv">
						<div class="form-group">
							<label for="meetPlace">출발지</label>
							<input name="meetPlace" class="form-control" required="required" maxlength="200" placeholder="출발지 및 집결시간을 구체적으로 설명해 주세요">
						</div>
						<div id="mapDiv">
							<div id="meetMap" style="width:45%; height:350px; float:left;">지도</div>
							<div id="roadview" style="width:45%; height:350px; float:left;">로드뷰</div>
							<div class="clear underMap">선택한 위치와 로드뷰가 투어 출발지 정보에 나타납니다. 예약자가 잘 찾아올 수 있도록 정확히 선택해 주세요.<br>
							<hr>
								▼ 시간은 24시간제에 따라 기재하셔야 하며, 생략하셔도 됩니다. 
							</div>
						</div>
						<input id="meetLat" name="meetLat" type="hidden">
						<input id="meetLng" name="meetLng" type="hidden">
					</div>
					<div id="sc-eachDiv">
						<div class="sc-each">
							<div id="sc-day1" class="sc-dayNum">
								<span class="subtitle">1일차</span>
								<button type="button" class="sc-addBtn btn btn-xs btn-info" data-daynum="1">추가</button>
							</div>
							<div id="sc-info1">
								<div class="sc-eachInfo">
									<input type="hidden" name="dayNum" value="1">
									<div class="form-group">
										<label for="starthour">시간</label>
										<input name="starthour" type="number" min="0" max="23" class="form-control sc-time">
										<input name="startminute" type="number" min="0" max="59" class="form-control sc-time">
										<label for="schedule">일정</label>
										<input name="schedule" maxlength="30" class="form-control halfWidth" required="required">
									</div>
									<div class="form-group">
										<label for="schDescription">설명</label>
										<input name="schDescription" maxlength="200" class="form-control">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="categoryDiv">
				<div class="categoryTitleDiv">
					<span class="categoryTitle">투어포인트</span><br>
					<button type="button" id="tp-addBtn" class="btn btn-xs btn-info">추가</button>
				</div>
				<div id = "tp-div" class="inputDiv">
					<div class="tp-each">
						<div class="pointNum">
							<span class="subtitle">POINT 1</span>
						</div>
						<div class="form-group">
							<label for="pointTitle">제목</label>
							<input name="pointTitle" maxlength="30" class="form-control" required="required">
						</div>
						<div class="form-group">
							<label for="pointContent">설명</label>
							<input name="pointContent" maxlength="300" class="form-control" required="required">
						</div>
						<div class="form-group">
							<label for="pointImageFile">이미지</label>
							<input name="pointImageFile" type="file" required="required">
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="categoryDiv">
				<div class="categoryTitleDiv">
					<span class="categoryTitle">예약 시<br>주의사항</span><br>
					<button type="button" id="cp-addBtn" class="btn btn-xs btn-info">추가</button>
				</div>
				<div class="inputDiv">
					<div id="cp-each">
						<div class="form-group">
							<input name="checkpoint" maxlength="300" class="form-control cp-input" required="required">
						</div>
					</div>
				<div class="clear">▶ 모두 입력하셨다면 상단의 미리보기 버튼을 눌러 내용을 확인해 보세요</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>