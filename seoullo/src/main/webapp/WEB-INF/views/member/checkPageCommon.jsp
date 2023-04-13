<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 전 체크 페이지</title>
<style type="text/css">
button{
background-color: #ccffcc;
border:0px;
 width: 100px;
 height: 30px;
}

</style>
<script type="text/javascript">
	$(function() {

		$('#nextBtn').click(function() {
			if (!$('#checker').is(':checked')) {
				alert('개인정보 수집에 동의 해주세요!'); // 경고창 출력
				return false;
			} else {
				location = "commonWelcom.do";
			}
		});

	});
</script>
</head>
<body>
	<div class="container">
	<div class="path">
			<span>main</span>
			 <span>&gt;</span>
			<span>회원가입</span>
			  <span>&gt;</span> 
			<span>회원가입 동의서</span>
		</div>
		<br /> <br />
	<h1>회원 동의서</h1>
	<div style="border: 2px solid #339933; display: flex; align-items: center; justify-content: center; height: 45vh;">
		<textarea rows="20" cols="150">
국내 가입률 No.1이 될 이젠서울 입니다.
1. 회원가입시 모든 정보를 조건에 맞추어 입력바랍니다.
2. 탈퇴를 하시면 동일한 정보로 가입이 불가능 합니다.
나머지 궁금하신 정보는 +012 345 6789로 연락부탁드립니다.
</textarea>
</div>
<div align="right">
		<input type="checkbox" name="checker" id="checker">
		개인정보 수집 및 이용에 동의합니다.(필수)
		<button id="nextBtn">회원가입 -></button>
	</div>
	</div>
</body>
</html>