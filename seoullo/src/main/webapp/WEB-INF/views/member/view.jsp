<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 상세보기</title>
<style type="text/css">
div {
padding: 4px 7px 7px 4px;
}
button{
background-color: #ccffcc;
border:0px;
 width: 130px;
 height: 30px;
}
#updateBtn{
background-color: #ccffcc;
}
#delete{
background-color:#ff6666;
}

</style>
<script type="text/javascript">
$(function(){
	//정보수정하러 
	 $('#updateBtn').click(function(){
		 location="update.do?id="+"${vo.id}";
		 });
	//비밀번호 수정하러 가기
		$("#updatePw").click(function(){
				location ="updatePw.do?id="+"${vo.id}";
			});
		$("#delete").click(function(){
				location ="delete.do?id="+"${vo.id}";
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
		</div>
<div style="border: 2px solid #339933;">
<h2>회원정보 상세보기</h2>
<table class="table">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>${vo.id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${vo.name}</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${vo.nickName}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${vo.gender}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.age}"></fmt:formatDate></td>
					</tr>
				
					<tr>
						<th>회원등급명</th>
						<td>${vo.gradeName}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${vo.tel }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${vo.email }</td>
					</tr>





</tbody>
</table>
</div>
<div style="float: right;"> 
<button type="button" id="updateBtn">정보 수정하러 가기</button>	
<button id="updatePw">비밀번호 수정</button>
<button id="delete">회원탈퇴</button>
</div>
</div>
</body>
</html>