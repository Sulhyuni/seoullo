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
div {
padding: 4px 7px 7px 4px;
}
button{
background-color: #ccffcc;
border:0px;
}

</style>
<script type="text/javascript">
$(function(){
	$('#view').click(
			function() {
			location="view.do";
				});
			
	$('#guideView').click(
			function() {
			location="guideView.do";
			});
	$('#list').click(
			function() {
			location="list.do";
			});
			
	$('#memberBookList').click(
			function() {
			location="/book/list.do";
			});
			
	$('#guideBookList').click(
			function() {
			location="/tour/list.do";
			});

	
});
</script>
</head>
<body>
	<div class="container"> 
	<div class="path">
			<span>main</span>
			 <span>&gt;</span>
			<span>마이페이지</span>
			 
		</div>
	<div style="border: 2px solid #339933; display: flex; align-items: center; justify-content: center; height: 45vh;">
	
<div>
		<h2>마이페이지</h2>

		</div>

			<div>
			<c:if test="${login.gradeNo ==1 }">
			<button type="button" id="view">나의 정보보기</button>
			<button type="button" id="memberBookList">내 예약현황</button>
		
			</c:if>
			<c:if test="${login.gradeNo ==2 || login.gradeNo ==3}">
			<button type="button" id="guideView">나의 정보보기</button>
			<button type="button" id="guideBookList">내 예약현황</button>

			</c:if>
			<c:if test="${login.gradeNo ==9 }">
		<button type="button" id="list">회원조회 리스트</button>
		</c:if>
			
				
			</div>
		
		
	</div>
	</div>
</body>
</html>