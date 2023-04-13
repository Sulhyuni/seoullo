<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

div {
padding: 4px 7px 7px 4px;
}
button{
background-color: #ccffcc;
border:0px;
 width: 50px;
 height: 30px;
}
</style>

<script type="text/javascript">
function updatePw() {
	
	if ($("#pw").val() == null || $("#pw").val() == "") {
		alert("현재의 비밀번호를 입력해주세요.");
		$("#pw").focus();

		return false;
	}

	if ($("#chgPw").val() == null || $("#chgPw").val() == "") {
		alert("비밀번호를 입력해주세요");
		$("#chgPw").focus();
		return false;
	}
	if ($("#chgPw2").val() == null || $("#chgPw2").val() == "") {
		alert("비밀번호 확인 입력창에 입력해주세요");
		$("#chgPw2").focus();
		return false;
	}
	
	var chgPw_rule = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\W)(?=\S+$).{8,19}/;
	//8 ~19글자 이하로 작성가능 특수문자가 들어가야하고 영문 대,소 가 들어가야하고, 숫자가 들어가야함.
	if (!chgPw_rule.test($("#chgPw").val())) {
		alert("비밀번호의 형식에 맞게 입력해주세요.");
		return false;
	}
	
	if($("#chgPw").val() != $("#chgPw2").val()){
		alert("비밀번호가 일치하지 않습니다.");
		$("#chgPw, #chgPw2").val("");
		$("#chgPw").focus();
		return false;
	}

	
	if (confirm("비밀번호 변경을 진행합니다.")) {
		$("#joinForm").submit();
	}
}



$(function(){

	//이전페이지로 이동
	$("#cancelBtn").click(function(){
		history.back();
	});
	});

	
	
	


	

</script>
</head>
<body>
<div class="container">
<div class="path">
			<span>main</span>
			 <span>&gt;</span>
			<span>my page</span>
			  <span>&gt;</span> 
			<span>회원정보 상세보기</span>
			  <span>&gt;</span> 
			<span>비밀번호 수정</span>
		</div>
<div style="border: 1px solid #009900; border-radius: 20px; padding: 20px; margin: 20px 25px;">
	<h1>비밀번호 변경</h1>
	
	<form action="updatePw.do" method="post" id="joinForm">
	<input name="id" type="hidden"  value="${login.id }">
		<div class="form-group">
				<label for="pw">현재 비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw">
<!-- 				<span class="pw_input_re_1">알맞게 입력하였습니다.</span> -->
<!-- 				 <span class="pw_input_re_2">잘못 입력하였습니다.</span> -->
		</div >
	
		<div class="form-group">
				<label for="chgPw">신규 비밀번호</label><!-- 8~20자 영어의 소문자와 대문자가 섞이고, 특수문자와 숫자가 들어간다.  -->
				<input type="password" class="form-control" id="chgPw" name="chgPw"
				placeholder="특수문자와 숫자가 반드시 포함된 영문의 대,소문자 형태로 작성해주셔야 합니다.">
		</div>
	
		<div class="form-group">
				<label for="chgPw">신규 비밀번호 확인</label>
				<input type="password" class="form-control" id="chgPw2"
				placeholder="비밀번호를 한번 더 입력해주세요.">
		<div style="float: right;">
		<button type="button" onclick="updatePw();">확인</button>
		<button type="button" id="cancelBtn">취소</button>
	</div>
		</div>
		
	</form>
	

</div>
</div>
<c:if test="${msg != null }">
		<%@ include file="../member/common/message.jspf"%>
	</c:if>
</body>
</html>