<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가이드의 결제목록</title>
<style type="text/css">

div {
padding: 4px 7px 7px 4px;
}
button{
background-color: #ccffcc;
border:0px;
 width: 70px;
 height: 30px;
}
</style>
<script type="text/javascript">
$(function(){
	 $('#backBtn').click(function() {
		    history.back();
		  });
});

</script>
</head>
<body>
<div class="container">
<div  style="border: 2px solid #339933;">
<h1>가이드의 결제목록</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>아이디</th>
					<th>결제번호</th>
					<th>카드이름</th>
					<th>할부</th>
					<th>금액</th>
					<th>결제일</th>
		
				</tr>
			</thead>
			<tbody>
				<!-- 리스트에서 받아서 vo로 뿌린다. -->
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.id }</td>
						<td>${vo.paymentNo }</td>
						<td>${vo.cardName }</td>					
						<td >${vo.payMt}개월</td>
						<td>${vo.total }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${vo.payDate }"></fmt:formatDate></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="right">
				
		<button id="backBtn">뒤로가기</button>
		</div>
		</div>
	</div>	
</body>
</html>