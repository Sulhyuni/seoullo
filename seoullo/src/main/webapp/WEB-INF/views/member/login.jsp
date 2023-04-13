<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member's login</title>
<style type="text/css">
button{
background-color: #ccffcc;
border:0px;
}
#checkPageCommon, #checkPageGuide{
background-color: #ff99ff;
border:0px;
}
.loginBtn{

background-color: #ff9933;
border:0px;

}
</style>
<script type="text/javascript">
	$(function() {
		$('#findId').click(function() {
			location = "findId.do";
		});

		$('#findPw').click(function() {
			location = "findPw.do";
		});

		$('#checkPageCommon').click(function() {
			location = "checkPageCommon.do";
		});

		$('#checkPageGuide').click(function() {
			location = "checkPageGuide.do";
		});

	});
</script>
</head>
<body>
	<div class="container">
		<div class="path">
			<span>main</span> <span>&gt;</span> <span>로그인</span>

		</div>
		<br />
		<h2>로그인 페이지</h2>
		<br />
		<div
			style="border: 2px solid #339933; display: flex; align-items: center; justify-content: center; height: 45vh;">
			<form action="login.do" method="post">
				<div>
					<div class="form-group">
						<label>아이디</label> <input type="text" class="form-control" name="id" id="id">
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control"name="pw" id="pw">
					</div>
					<div align="right">
						<button type="submit" class="loginBtn">로그인</button>

					</div>
				</div>
<br/>
				
					<button type="button" id="findId">아이디 찾기</button>
					<button type="button" id="findPw">비밀번호 찾기</button>
					<br /> <br />
					<button type="button" id="checkPageCommon">일반회원 회원가입</button>
					<button type="button" id="checkPageGuide">가이드 회원가입</button>
				
			</form>
		</div>
	</div>
	<c:if test="${msg != null }">
		<%@ include file="../member/common/message.jspf"%>
	</c:if>
</body>
</html>