<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
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
#bookInfoDiv, #payInfoDiv{
	margin-top: 10px;
	margin-bottom: 40px;
}
#payPrice{
	border: none;
	color :#4B8A08;
	font-weight: bold;
	font-size: 20px;
	width: 100px;
	margin-right: 10px;
}
#btnDiv{
	text-align: center;
}
#modifyBtn{
	font-weight: bold;
	color: #4B8A08;
}
#cancelBtn{
	font-weight: bold;
}
</style>
<script type="text/javascript">

//전화번호 하이픈
const hypenTel = (target) => {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
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
		$("#modifyForm").find(".reset").val("");
		$("#modifyForm").find(".reset").prop('checked', false);
		$("#modifyForm").find(".reset").removeAttr('value');
	});
	
	// 세션 로그인 정보의 성별을 가져와서 라디오버튼 체크하기
	const genderVal = $('#genderVal').val();
	if (genderVal === '여자') {
	  $('#female').prop('checked', true);
	} else if (genderVal === '남자') {
	  $('#male').prop('checked', true);
	}

	$("#modifyForm").submit(function() {
		const result = confirm('변경 하시겠습니까?');
		return result;
	});
});
</script>
</head>
<body>
	<div class="container">
		<form action="modify.do" method="post" id="modifyForm">
			<input id="id" name="id" type="hidden" value="${login.id }"><br/>
			<input id="genderVal" type="hidden" value="${vo.gender }"><br/>
			<input id="no" name="no" type="hidden" value="${vo.no }"><br/>

			<div class="title">예약자 정보</div>
			
			<div id="bookInfoDiv" class="row">
				<div class="col-md-1">
					<input type="button" id="resetBtn" class="btn btn-default btn-xs" value="새로입력">
				</div>
				<div class="col-md-3">
					<label for="name">이름</label>
					<input id="name" class="reset form-control" name="name" value="${vo.name }" required>
				</div>
				<div class="col-md-2">
					<label for="gender">성별</label>
					<div class="radio">
						<label><input id="female" type="radio" name="gender" required>여자</label>
						<label><input id="male" type="radio" name="gender" required>남자</label>		
					</div>
				</div>
				<div class="col-md-3">
					<label for="email">이메일</label>
					<input id="email" class="reset form-control" name="email" value="${vo.email }" required >
				</div>
				<div class="col-md-3">
					<label for="tel">연락처</label>
					<input id="tel"class="reset form-control" name="tel" value="${vo.tel }" oninput="hypenTel(this)" maxlength="13" required>
				</div>
			</div>		
			
			<div class="title">결제확인</div>
			
				<div id="payInfoDiv" class="row">
					<div class="col-md-6">
						<label for="payMethod">결제수단</label>
						<input id="payMethod" class="form-control" name="payMethod" value="${vo.payMethod }" readonly>
					</div>
					<div class="col-md-6">
						<label for="payStatus">결제변경</label>
						<select	id="paySelect" class="form-control" name="payStatus">
							<option value="결제대기">결제대기</option>
							<option value="결제완료">결제완료</option>
						</select>
					</div>
				</div>
			
			<div id="btnDiv">
				<button id="modifyBtn" class="btn btn-default btn-xl">변경하기</button>
				<button id="cancelBtn" class="btn btn-default btn-xl" type="button" onclick="history.back()">취소하기</button>
			</div>
		</form>
		
	</div>
</body>
</html>