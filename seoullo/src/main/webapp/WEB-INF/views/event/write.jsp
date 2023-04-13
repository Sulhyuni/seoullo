<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>

</head>
<body>
<div class="container">
	<form action="write.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="perPageNum" value="${param.perPageNum }">
		<div class="form-group">
				<label for="e_title">제목</label>
				<input class="form-control" id="e_title" name="e_title" placeholder="이벤트 제목을 입력하세요.">
		</div>
		<div class="form-group">
				<label for="e_content">내용</label>
				<textarea rows="10" class="form-control" id="e_content" name="e_content" placeholder="공지사항 내용을 입력하세요."></textarea>
				
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
			
			<div class="form-group">
				<div class="col-md-6">
				<label>
				   <input type="checkbox" name="main" value="0" class="form-control"></label>
					<input type="file" name="img">
				</div>
				<div class="col-md-6">
				<label>
				   <input type="checkbox" name="main" value="1" class="form-control"></label>
					<input type="file" name="img">
				</div>
			</div>
	 

		<button class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" class="btn btn-default" id="cancelBtn">취소</button>

	</form></div>
</body>
</html>