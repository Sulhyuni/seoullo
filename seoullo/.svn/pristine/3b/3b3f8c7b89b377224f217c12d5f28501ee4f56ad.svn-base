/**
 * 댓글 이벤트 처리
 */
$(function(){ 
	
	console.log("bookingdate - ro_no : " + ro_no);
	
	//var pageNum = 1; replyPagination 에서 전역변수 선언했다.
	bookingUL = $(".chat");

	//맨 처음에 댓글 데이터를 가져와서 처리 - 자동실행
	showList(1);
	
	//자동으로 실행이 안되고 호출해야 실행된다.
	function showList(page){
		replyService.list(
			//param JSON 데이터
			{ro_no:ro_no, page:page}, 
			//reply.js->list() - callback(data.pageObject, data.list)에 맞춰서 코딩
			function(pageObject, list){
			
				// 넘어오는 데이터 확인하기
				console.log("pageObject : " + JSON.stringify(pageObject));
				console.log("list : " + JSON.stringify(list));
				// list가 넘어오지 않았거나 데이터가 없는 경우 처리하지 않게한다.
				if(list == null || list.length == 0){
					bookingUL.html("<div>예약 데이터가 존재하지 않습니다.</div>");
					return;
					}
						var str = "";
//						// list에 데이터가 있는 경우의 처리
						for(var i = 0, len = list.length || 0; i < len; i++){
							str += "<tr>";
							str += "<td>" + list[i].bono + "</td>";
							str += "<td>"+ list[i].ro_no + "</td>";
							str += "<td>"+ list[i].hbno + "</td>";
							str += "<td>"+ displayTime(list[i].checkin) + "</td>";
							str += "<td>"+ displayTime(list[i].checkout) + "</td>";
							str += "</tr>";
						} // for 문의 끝 - str완성 : 데이터가 있는 만큼 li tag가 생긴다.
						bookingUL.html(str);
						
						
	
			const calendarEl = document.getElementById("calendar"); //캘린더를 넣어줄 html div
	
			let calendar;
			calendar_rendering();
			
			function calendar_rendering() {
				$(function () {
					console.log("calendar_rendering(). list : " + JSON.stringify(list));
						var voArray = [];
						// list foreach문을 돌려서
						list.forEach(vo =>{
							// vo로 json로 만든다.
							console.log("request.done().list.each(). vo : "+vo);
							var voJson = {};
							voJson.title = "예약";
							voJson.start = moment(vo.checkin).format('YYYY-MM-DD');
							voJson.end = moment(vo.checkout).format('YYYY-MM-DD');
							
//							// json을 voArray에 추가
							voArray.push(voJson);
						});
						
						console.log(voArray);
					
					  	calendar = new FullCalendar.Calendar(calendarEl, {
						    initialView: "dayGridMonth",
							
							selectable : true,
							droppable : true,
							editable : true,
							
							locale : 'ko',
							events: voArray
//							events: [{title: '예약', start: '2022-09-01', end: '2022-09-10'}, {title: '예약', start: '2022-09-19', end: '2022-09-25'}]
						  });

						  calendar.render();
				
				
				});  // end of $(function () {})
				
			}; // end of calendar_rendering()
		
			} // end of success callback - showList() 안에 전달 함수
		);
	} // showList() 함수의 끝
	
	
});