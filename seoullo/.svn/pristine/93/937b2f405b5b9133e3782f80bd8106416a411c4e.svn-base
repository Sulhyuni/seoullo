<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정</title>

</head>
<body>
<div class="container">
	<form action="update.do" method="post">
	<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<input type="hidden" name="key" value="${param.key }">
		<input type="hidden" name="word" value="${param.word }">
			<div class="form-group">
			<label>번호</label>
			<input name="e_no" class="form-control" readonly="readonly" value="${vo.e_no }">
		</div>
		<div class="form-group">
				<label for="e_title">제목</label>
				<input class="form-control" id="e_title" name="e_title" value="${vo.e_title }">
		</div>
		<div class="form-group">
				<label for="e_content">내용</label>
				<textarea rows="10" class="form-control" id="e_content" name="e_content" >${vo.e_content }</textarea>
				
			</div>
				<div class="form-group">
				<label for="e_startDate">이벤트 시작일</label>
				<input class="form-control" id="e_startDate" name="e_startDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${vo.e_startDate }'/>" placeholder="yyyy/mm/dd 형식으로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="e_endDate">이벤트 종료일</label>
				<input class="form-control" id="e_endDate" name="e_endDate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${vo.e_endDate }'/>" placeholder="yyyy/mm/dd 형식으로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="e_date">이벤트 발표일</label>
				<input class="form-control" id="e_date" name="e_date" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${vo.e_date }'/>" placeholder="yyyy/mm/dd 형식으로 입력하세요.">
			
			</div>


		<button class="btn btn-default">수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" class="btn btn-default" id="cancelBtn">취소</button>

	</form></div>
</body>
</html>