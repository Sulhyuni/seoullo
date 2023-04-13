<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
padding: 4px 7px 7px 4px;
}
button{
background-color: #ccffcc;
border:0px;
 width: 50px;
 height: 30px;
}

</style>

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
<div class="path">
			<span>main</span>
			 <span>&gt;</span>
			<span>login</span>
			  <span>&gt;</span> 
			<span>아이디 찾기</span>
			 
		</div>
<div style="border: 2px solid #339933;">
	<h1>아이디 찾기 </h1>

	<form action="findId.do" method="post" id="findId">
		<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="name" name="name">
		</div>
	
		<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" class="form-control" id="email" name="email">
		</div>
	
		<div align="right">
		<button type="submit"  id="acBtn">확인</button>
		<button type="button" id="cancelBtn" >취소</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>