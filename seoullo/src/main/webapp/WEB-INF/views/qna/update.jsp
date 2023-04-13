<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
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
		<form action="update.do" method="post" id= "updateForm">
		<input type="hidden" name = "page" value="${param.page }">
		<input type="hidden" name = "perPageNum" value="${param.perPageNum }">
		<input type="hidden" name = "key" value="${param.key}">
		<input type="hidden" name = "word" value="${param.word }">
			
			<div class="form-group">
				<label>질문 번호</label>
				<input name="qnaNo" class="form-control" id="qnaNo" readonly="readonly" value="${vo.qnaNo}">
			</div>
			<div class="form-group">
				<label>투어 장소</label>
				<input name="region" class="form-control" id="region" readonly="readonly" value="${vo.region}">
			</div>
			<div class="form-group">
				<label>질문 제목</label>
				<input name="title" class="form-control" id="title" value="${vo.title }">
			</div>
			<div class="form-group">
				<label>질문 내용</label>
				<textarea rows="5" name="content" class="form-control" id="content" style="white-space:pre;" >${vo.content }</textarea>
			</div>

			<button class="btn btn-default">수정등록</button>
			<button type="reset"  class="btn btn-default">새로입력</button>
			<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
		</form>
	</div>

 </div>
</body>
</html>