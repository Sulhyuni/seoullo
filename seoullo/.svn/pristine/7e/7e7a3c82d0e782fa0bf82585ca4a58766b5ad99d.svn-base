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
<meta http-equiv="refresh" content="5; url=/">

<script type="text/javascript">

$(function(){
	
	let cnt = 5;
	
	let Timer = setInterval(function(){
		
		if(cnt<0){
			clearInterval(Timer);
		}
		
		$("#timer").text(cnt-1);
		cnt--;
		
	}, 1000);
	
});

</script>

</head>
<body>
<div class="container">
	<h1>회원탈퇴 완료</h1>
	
	<h2>
		<span id="timer">5</span>초 후 메인으로 이동됩니다.
	</h2>
</div>
</body>
</html>