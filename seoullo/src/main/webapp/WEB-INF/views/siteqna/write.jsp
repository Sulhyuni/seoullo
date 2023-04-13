<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Site QNA</title>

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
		<h1>Site QnA WRITE</h1>
	</div>
	<div class="col-md-12">
		<hr>
	</div>
	
	<div class="card-body">
		<form action="write.do" method="post" id="writeForm">
			<div class="form-group">
				<label>제목</label>
				<input name="title" class="form-control" id="title" required="required">
			</div>
			<div  class="form-group">
				<label>내용</label>
				<textarea rows="5" name="content" class="form-control" id="content" required="required" style="white-space:pre;"></textarea>
			</div>
			
			<button class="btn btn-default">등록</button>
			<button class="btn btn-default" type="reset">새로작성</button>
			<button class="btn btn-default" type="button" onclick="history.back()">취소</button>
		</form>
	</div>
</div>

</body>
</html>