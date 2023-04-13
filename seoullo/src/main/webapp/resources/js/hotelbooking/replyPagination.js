/**
 * 댓글의 페이지네이션 처리 JS
 */

//$(function(){
	
	//페이지 초기값 세팅 -- 전역변수
	var pageNum = 1;

	// 댓글의 페이지네이션을 위한 처리 함수
	function showReplyPage(pageObject){
		
		console.log("replyPagination - pageObject :" +JSON.stringify(pageObject))

		// 밖에다 사용하면 $(function()) 주석 처리해서 없앴다. JS 부분이 이곳이 먼저 실행 -> HTML 은 나중에. 그래서 못찾는다. 그래서 function안으로
		//var replyPageFooter = $("#footer_pagination");
		 //******************** 페이지 표시하기 *********************************//
		var str = "<ul class='pagination pull-right'>";

		// 이전 페이지 표시
		if(pageObject.startPage > 1){
			str += "<li class='page-item'><a class='page-link' href='" + (pageObject.startPage - 1) + "'>Previous</a></li>";
		}

		// 시작 페이지 ~ 끝페이지까지 표시
		for(var i = pageObject.startPage ; i <= pageObject.endPage ; i++){
			// 현재 페이지 표시 - active에 i가 현재 페이지면 active라고 넣는다.
			var active = pageNum == i ? "active" : "";
			str += "<li class='page-item " + active + "' ><a class='page-link' href='" + i + "'>" + i + "</a></li>";
		}

		// 다음 페이지 표시 - 전체 페이지가 endPage보다 더 크면 나온다.
		if(pageObject.totalPage > pageObject.endPage){
			str += "<li class='page-item'><a class='page-link' href='" + (pageObject.endPage + 1) + "'>Next</a></li>";
		}
		
		str += "</ul>";

		console.log(str);

		// 페이네이션 객체에 html로 넣는다.
		$("#footer_pagination").html(str);
			
	} // 댓글의 페이지네이션을 위한 처리 함수 끝


		
//});
