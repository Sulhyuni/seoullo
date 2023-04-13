<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Site QNAe</title>

<style type="text/css"> 
	hr{
	  	  border: 0;
	   	  height: 2px;
	   	  background: #ccc;
	  	}
 </style>
 
</head>
<body>
<div class="container">
	 <div class="col-md-12">
		<h1>QnA UPDATE</h1>
	</div>
	<div class="col-md-12">
		<hr>
	</div>
	
	<div class="card-body">
		<form action="update.do" method="post" id="update">
<%-- 		<input type="hidden" name = "page" value="${param.page }"> --%>
<%-- 		<input type="hidden" name = "perPageNum" value="${param.perPageNum }"> --%>
<%-- 		<input type="hidden" name = "key" value="${param.key}"> --%>
<%-- 		<input type="hidden" name = "word" value="${param.word }"> --%>
			
			<div class="form-group">
				<label>질문 번호</label>
				<input name="siteNo" class="form-control" id="siteNo" readonly="readonly" value="${vo.siteNo }">
			</div>
			<div class="form-group">
				<label>제목</label>
				<input name="title" class="form-control" id="title" value="${vo.title }">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea rows="5" class="form-control" id="title" name = "content">${vo.content }</textarea>
			</div>
			
			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로작성</button>
			<button class="btn btn-default" type="button">취소</button>
		</form>
	</div>
</div>

</body>
</html>