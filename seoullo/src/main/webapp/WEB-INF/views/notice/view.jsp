<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
<script type="text/javascript">
$(function(){
	<c:if test="${m!=null}">
	alert("${m}");
	</c:if>
});
</script>
<script type="text/javascript">
$(function(){
			$("#deleteBtn").click(function() {
			if (!confirm("정말 삭제하시겠습니까?"))
				return false;
		});	
	
});
</script>
</head>
<body>
<div class="container">
		<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td>${vo.no }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${vo.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${vo.content }</td>
					</tr>
					<tr>
						<th>공지기간</th>
						<td><fmt:formatDate value="${vo.startDate}" pattern="yyyy/MM/dd"/>~
						<fmt:formatDate value="${vo.endDate}" pattern="yyyy/MM/dd"/></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${vo.writeDate }" /></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><fmt:formatNumber pattern="#,###" value="${vo.hit }" /></td>
					</tr>
		
				</tbody>
			</table>
			<!-- 관리자만 보이는 버튼 -->
			<c:if test="${login!=null&&login.gradeNo==9 }">
				<a href="update.do?no=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}" class="btn btn-default">수정</a>
			<a href="delete.do?no=${vo.no }&page=${param.page}&perPageNum=${param.perPageNum}" class="btn btn-default" id="deleteBtn">삭제</a></c:if>
			<a href="list.do?no=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}" class="btn btn-default">목록</a>
</div>
</body>
</html>