/**
 * 댓글 관련 JS
 */
 
 // js가 동작된다.
console.log("hotelbookingdate Module .......................");

var module = "/imagereply"; 




replyService = {
	// list(reply JSON(param), success, error, module)
	list : function(param, callback, error){
		console.log("booking list . param ........" + JSON.stringify(param));
		var ro_no = param.ro_no; // param - json data
 		var page = param.page || 1; // param.page 데이터가 존재하지 않으면 1을 대신 사용하게 한다.
		
		// ajax를 통해서 json 데이터로 댓글 리스트를 가져오는 처리
 		// $.getJSON(url, [data,] function);
 		$.getJSON(
 			 module + "/list.do?page="+ page + "&ro_no=" + ro_no ,
		 	// function(서버에서 전달하는 데이터 - json)
 			// 데이터 가져오기를 성공했을 때 처리되는 함수 - data == List<ReplyVO>와 PageObject가 들어있는 map -> json data -> foreach 
 			function(data){ // data{pageObject, list}
 				//alert(JSON.stringify(data));
 				// callback 함수가 있으면 callback 함수를 실행하자.
 				if(callback){
 					callback(data.pageObject, data.list);
 				// callback 함수가 없으면 처리되는 처리문
 				} else {
	 				if(data.list != null && data.list.length > 0) {alert("데이터가 있습니다.");}
	 				else {alert("데이터가 없습니다.");}
 				}
 				
 			}
 		// 데이터 가져오기 실패했을 때 처리되는 함수.
 		).fail(function(xhr, status, err){
 			if(error) error();
 		});
 		// getJSON()의 끝
	
	}, // list의 끝
	
	write : function(reply, callback, error){
		
	 	console.log("booking write ....... booking : " + JSON.stringify(reply));
 		
 		// ajax를 이용해서 서버에 데이터 전달(URL - /reply/new)
 		$.ajax(
 			{
 				type : "post", // 전달 방식
 				url : module +"/write.do", // url
 				data : JSON.stringify(reply), // 브라우저 -> 서버 전달 데이터
 				contentType : "application/json; charset=utf-8", // 전달 데이터의 형식
 				success : function(result, status, xhr){ // 서버 처리가 성공 후 브라우저에서 실행된 함수 
 							 if(callback) {
 							 	callback(result);
 							 }
 					},
 				error : function(xhr, status, er) { // 서버 처리가 실패 후 브라우저에서 실행된 함수 
 							if(error) {
 								error(er);
 							} else {
 								console.log(xhr);
 								console.log(status);
 								console.log(er);
 							}
 					}
 			}
 		  );	
	},// write의 끝
	
	
	
//
//	
//	// 댓글 수정
//	update : function(reply, callback, error){
//
//		console.log("reply.js");	
// 		// ajax를 이용해서 서버에 수정 요청한다.
// 		$.ajax({
// 			type : "put", // 전달 방식
// 			url : module+"/update.do", // 요청 URL
// 			data : JSON.stringify(reply), // 서버에 넘어가는 데이터
// 			contentType : "application/json; charset=utf-8", // 서버에 넘어가는 데이터의 형식
// 			success : function(result, status, xhr){ // 서버에서 처리가 성공하면 실행하는 js의 처리 
// 				if(callback) callback(result);
// 			},
// 			error : function(xhr, status, er){ // 서버에서 처리가 실패하면 실행하는 js의 처리 
// 				if(error) error(er);
// 				else {
// 					console.log(xhr);
// 					console.log(status);
// 					console.log(er);
// 				}
// 			}
//		});
//	},// 댓글 수정의 끝

	//댓글 삭제
//	delete : function(rno, callback, error){
// 		// alert("remove rno : " + rno);
// 		
// 		// ajax를 이용해서 서버에 수정 요청한다.
// 		
// 		$.ajax({
// 			type : "delete", // 전달 방식
// 			url : module+"/delete.do?rno=" + rno, // 요청 URL
// 			success : function(result, status, xhr){ // 서버에서 처리가 성공하면 실행하는 js의 처리 
// 				if(callback) callback(result);
// 			},
// 			error : function(xhr, status, er){ // 서버에서 처리가 실패하면 실행하는 js의 처리 
// 				if(error) error(er);
// 				else {
// 					console.log(xhr);
// 					console.log(status);
// 					console.log(er);
// 				}
// 			}
// 		});
//     },
}
 