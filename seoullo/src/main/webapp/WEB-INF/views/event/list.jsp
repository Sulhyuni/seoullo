<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트</title>
<script type="text/javascript">
$(function(){
	
	$(".dataRow").click(function(){
	//	let no =$(this).find(".e_no").text();
		var no = $(this).data("e_no");
// 		var ano = $(this).data("apply_no");
		alert("글번호:"+no)
// 		alert("상태:"+ano)
		
		location="view.do?no="+no+"&inc=1&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
		+"&key=${pageObject.key}&word=${pageObject.word}";
		
		
	});
});
</script>
</head>
<body>
<div class="container">
			<div class="row">
				<c:forEach items="${list }" var="vo" varStatus="vs">
				<c:if test="${vs.index > 0 && vs.index % 4 ==0 }">
					${"</div><div class='row'>" }
					</c:if>
					<div class="col-md-3 dataRow" data-e_no="${vo.e_no}">
						<div class="thumbnail">
<%-- 							<a href="view.do?no=${vo.e_no }&inc=1&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}">  --%>
						
							<img src="${vo.filename }" alt="Lights" style="width: 100%">
									<span>${vo.e_title }</span>
									<span><p>이벤트 기간:
								<fmt:formatDate value="${vo.e_startDate }" pattern="yyyy/MM/dd"/>~
								<fmt:formatDate value="${vo.e_endDate }" pattern="yyyy/MM/dd"/>	
									</p></span>
									<span>
								당첨자 발표일:<fmt:formatDate value="${vo.e_date }" pattern="yyyy/MM/dd"/>	</span>
								<span>조회수:<fmt:formatNumber value="${vo.e_hit }" pattern="#,###"/>	</span>
								
							</a>
						</div>
					</div><!-- col-md-4의 끝 -->
					
				</c:forEach>
			
			</div><!-- row의 끝 -->
			<c:if test="${login!=null&&login.gradeNo==9 }">
 <a href="write.do" class="btn btn-default">이벤트 등록</a></c:if>
</div> 
</body>
</html>