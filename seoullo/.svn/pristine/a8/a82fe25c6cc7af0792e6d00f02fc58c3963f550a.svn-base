<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#day {
	display: none;
}
.title {
	border-bottom: solid 1px #aaa;
	color :#4B8A08;
	font-weight: bold;
	font-size: 14px;
	padding: 5px;
}
#bookInfoDiv, #payDiv{
	margin-top: 10px;
	margin-bottom: 40px;
}
#payPrice{
	border: none;
	color :#4B8A08;
	font-weight: bold;
	font-size: 20px;
	margin-right: 10px;
}
#btnDiv{
	text-align: center;
}
#bookBtn{
	font-weight: bold;
	color: #4B8A08;
}
#cancelBtn{
	font-weight: bold;
}
.card{
    display: flex;
    padding: 10px 12px;
    height: 10px;
    letter-spacing: -.3px;
    border: 1px solid #dee2e6;
    background-color: #fff;
}
.input-group{
	display: inline-block;
	max-width: 250px;
	margin: 15px 0;
}
</style>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">

// 전화번호 하이픈
const hypenTel = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
// 신용카드 하이픈
const hypenCredit = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{4})(\d{4})(\d{4})(\d{4})$/, `$1-$2-$3-$4`);
}

$(function(){	
	// tourPrice의 합계를 계산해서 payPrice에 넣기
	let payPrice = 0;
	$("input[id=tourPrice]").each(function(){
		let tourPrice = $(this).val();
		payPrice += parseInt(tourPrice);
	});	
	$("#payPrice").val(payPrice);
	
	// 새로입력 버튼 눌렀을 때 예약자 정보 비우기
	$("#resetBtn").click(function(){
		$("#bookForm").find(".reset").val("");
		$("#bookForm").find(".reset").prop('checked', false);
		$("#bookForm").find(".reset").removeAttr('value');
	});
	
	// 세션 로그인 정보의 성별을 가져와서 라디오버튼 체크하기
	const genderVal = $('#genderVal').val();
	if (genderVal === '여자') {
	  $('#female').prop('checked', true);
	} else if (genderVal === '남자') {
	  $('#male').prop('checked', true);
	}

	$("#bookForm").submit(function() {
		const result = confirm('예약 하시겠습니까?');
		return result;
	});
	
	// 결제방법 선택에 따라 보여주는 div다르게
	$("input[name='payMethod']").on("change", function() {
	  var value = $(this).val();
	  if (value === "무통장입금") { // 무통장입금 선택
		$(".payDiv").css("display", "none");
		$("#depositDiv").css("display", "block");
	  } else if (value === "신용카드") { // 신용카드 선택
		$(".payDiv").css("display", "none");
		$("#creditDiv").css("display", "block");
	  }
	});
});
</script>
</head>
<body>
	<div class="container">
		<form action="book.do" method="post" id="bookForm">
			<input id="id" name="id" type="hidden" value="${login.id }"><br/>
			<input id="genderVal" type="hidden" value="${member.gender }"><br/>
			
			<div class="title">투어정보</div>
			
			<!-- 투어 상세보기에서 예약하기로 넘어 왔을 때 -->
			<c:if test="${empty list }">
				<input id="tourNo" name="tourNo" type="hidden" value="${param.no }" readonly>			
				<input id="peopleA" name="peopleA" type="hidden" value="${param.peopleA }" readonly>
				<input id="peopleB" name="peopleB" type="hidden" value="${param.peopleB }" readonly>
				<input id="tourPrice" name="tourPrice" type="hidden" value="${param.tourPrice }" readonly>
				<input id="day" name="day" value="${param.day }" type="date" readonly>
				<table id="tourTable" class="table">
					<thead>
						<tr>
							<th>투어명</th>
							<th>투어지역</th>
							<th>투어타입</th>
							<th>대인</th>
							<th>소인</th>
							<th>투어가격</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${vo.title }</td>
							<td>${vo.region }</td>
							<td>${vo.type }</td>
							<td>${param.peopleA }</td>
							<td>${param.peopleB }</td>
							<td>${param.tourPrice }</td>
							<td>${param.day }</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			
			<!-- 장바구니에서 예약하기로 넘어왔을 때 -->
			<c:if test="${!empty list }">
				<table id="tourTable" class="table">
				<thead>
					<tr>
						<th>투어명</th>
						<th>투어지역</th>
						<th>투어타입</th>
						<th>대인</th>
						<th>소인</th>
						<th>투어가격</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
					<input type="hidden" id="cartNo" name="cartNos" value="${list.no }">
					<input type="hidden" id="tourPrice" name="tourPrice" value="${list.tourPrice }" readonly>
					<tr>
						<td>${list.title }</td>
						<td>${list.region }</td>
						<td>${list.type }</td>
						<td>${list.peopleA }명</td>
						<td>${list.peopleB }명</td>
						<td><fmt:formatNumber pattern="#,###" value="${list.tourPrice }" />원</td>
						<td><fmt:formatDate value="${list.day }" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>

			<div class="title">예약자 정보</div>
			
			<div id="bookInfoDiv" class="row">
				<div class="col-md-1">
					<input type="button" id="resetBtn" class="btn btn-default btn-xs" value="새로입력">
				</div>
				<div class="col-md-3">
					<label for="name">이름</label>
					<input id="name" class="reset form-control" name="name" value="${member.name }" required>
				</div>
				<div class="col-md-2">
					<label for="gender">성별</label>
					<div class="radio">
						<label><input id="female" type="radio" name="gender" value="여자" required>여자</label>
						<label><input id="male" type="radio" name="gender" value="남자" required>남자</label>		
					</div>
				</div>
				<div class="col-md-3">
					<label for="email">이메일</label>
					<input id="email" class="reset form-control" name="email" value="${member.email }" required>
				</div>
				<div class="col-md-3">
					<label for="tel">연락처</label>
					<input id="tel"class="reset form-control" name="tel" value="${member.tel }" oninput="hypenTel(this)" maxlength="13" required>
				</div>
			</div>		
			
			<div class="title">결제정보</div>
			
			<div id="payDiv" class="row">
				<div class="col-md-3">
					<label for="payMethod">결제방법</label>
					<div class="radio">
						<label><input type="radio" id="creditCard" name="payMethod" value="신용카드" required>신용카드</label>
						<label><input type="radio" id="account" name="payMethod" value="무통장입금" required>무통장입금</label>		
					</div>		
				</div>
				<div id="creditDiv" class="col-md-4 payDiv" style="display: none;">				
					<label for="cardInfo">카드번호</label><br/>
					<input class="form-control" id="credit" oninput="hypenCredit(this)" maxlength="19">
				</div>
				<div id="depositDiv" class="col-md-4 payDiv" style="display: none;">
					<label for="depositInfo">입급하실 곳</label><br/>
					<span id="depositInfo">농협 101-12345-12345-12 김이젠</span>
				</div>
				<div class="col-md-5">
					<label for="payPrice">결제하실 금액</label>
					<input id="payPrice" class="form-control" name="payPrice" value="0" readonly>
				</div>
			</div>
			<div id="btnDiv">
				<button id="bookBtn" class="btn btn-default btn-xl">예약하기</button>
				<button id="cancelBtn" class="btn btn-default btn-xl" type="button" onclick="history.back()">취소하기</button>
			</div>
		</form>		
	</div>
</body>
</html>