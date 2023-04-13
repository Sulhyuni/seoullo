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
#deleteBtn, #cancelBtn{
background-color: #ccffcc;
border:0px;
 width: 70px;
 height: 30px;
}
</style>

<script type="text/javascript">

$(function(){

	
	$("#cancelBtn").click(function(){
		history.back();
	});
	
	$("#delete").submit(function(){
		// 비밀번호와 비밀번호 확인 같은지 체크
		if($("#pw").val() != $("#pw2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#pw, #pw2").val("");
			$("#pw").focus();
			return false;
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
			<span>my page</span>
			  <span>&gt;</span> 
			<span>회원정보 상세보기</span>
			  <span>&gt;</span> 
			<span>회원탈퇴</span>
		</div>
<div style="border: 2px solid #339933;">
	<h1>회원탈퇴</h1>
	
	<form action="delete.do" method="post" id="delete">
	<input name="id" type="hidden"  value="${login.id }">
		<div class="form-group">
				<label for="pw">현재 비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw">
				
		</div>
	
		<div class="form-group">
				<label for="pw2">비밀번호 확인</label>
				<input type="password" class="form-control" id="pw2">
		</div>
		<div style="float: right;">
		<button type="submit" id="deleteBtn">확인</button>
		<button type="button" id="cancelBtn" >취소</button>
	</div>
	<br/>
	<br/>
	</form>
	

</div>
</div>
<c:if test="${msg != null }">
		<%@ include file="../member/common/message.jspf"%>
	</c:if>
</body>
</html>