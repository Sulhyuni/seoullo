<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록하기</title>
<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
</head>
<body>
<div class="container">
		<form action="write.do" method="post">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
	<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" id="title" name="title" placeholder="공지사항 제목을 입력하세요.">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea rows="10" class="form-control" id="content" name="content" placeholder="공지사항 내용을 입력하세요."></textarea>
				
			</div>
			<div class="form-group">
				<label for="startDate">공지시작일</label>
				<input class="form-control" id="startDate" name="startDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${vo.startDate }'/>" placeholder="yyyy/mm/dd 형식으로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="endDate">공지종료일</label>
				<input class="form-control" id="endDate" name="endDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${vo.endDate }'/>" placeholder="yyyy/mm/dd 형식으로 입력하세요.">
			</div>
			
			<button class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" class="btn btn-default" id="cancelBtn">취소</button>
	</form>
</div>
</body>
</html>