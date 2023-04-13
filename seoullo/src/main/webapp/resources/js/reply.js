/*
* 댓글 처리
*/

//ajax 함수 - $.getJSON(url, function(){}).fail(function(){})

console.log("Reply Module.............");


let  replyService = (function(){

//list(전달데이터, 성공-콜백, 실패-에러)--------------------------------------------------------------------
	function list(param, callback, error){
		let anonyNo = param.anonyNo;
		let page = param.page;
		
		//ajax
		$.getJSON(
				//url
			"/anonyreply/list.do?page="+page+"&anonyNo="+anonyNo,
			function(data){
				if(callback){
					//alert("data= "+data);
					//성공하면 실행 할 함수
					callback(data);					
				}//if(callback) 의 끝 
				else{
					//alert(data);
				}
			}//function(data)의 끝
		).fail(function(xhr,status,err){ //실패했을때 처리 시작 
			if(error){
				error(); //실패면 아무것도 실행 안됨.
		}else{
			console.log("xhr = "+xhr);
			console.log("status = "+status);
			console.log("err = "+err);
			alert("댓글 리스트 로딩 중 오류");
			}	//if else의 끝 
		});  //  .fail(function()의 끝
	}  //replyService.list()  -> 함수 호출.
	
	
	
	
//write(전달데이터, 성공-콜백, 실패-에러)--------------------------------------------------------------------
	//reply -> json데이터 {anonyNo: anonyNo, reply : "~~"}
	function write(reply, callback, error){
		console.log("reply  코멘트.............................");
		console.log("reply = " + JSON.stringify(reply));
		
		//서버로 데이터를 보내서 댓글등록을 시킨다.
		$.ajax({
			//key : value
			type : "post",
			url : "/anonyreply/write.do",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}else{
					alert("댓글 등록이 되었습니다.")
					console.log(result);
				}
			},
			//서버에 오류가 있을경우 실행되는 함수. error
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 등록에 실패했습니다.");
				}
			} //error의 끝
		}); // $.ajax의 끝
	}; //function write() 의 끝
	
	
	
	
//update(전달데이터, 성공-콜백, 실패-에러)--------------------------------------------------------------------
	//reply -> json데이터 {rno:rno, reply : "~~"}
	function update(reply, callback, error){
		console.log("reply  코멘트qq.............................");
		console.log("reply = " + JSON.stringify(reply));
		
		//서버로 데이터를 보내서 댓글등록을 시킨다.
		$.ajax({
			type : "post",
			url : "/anonyreply/update.do",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}else{
					alert("댓글 수정 되었습니다.")
					console.log(result);
				}
			},
			//서버에 오류가 있을경우 실행되는 함수. error
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 수정등록에 실패했습니다.js");
				}
			} //error의 끝
		}); // $.ajax의 끝
	}; //function update() 의 끝
		
	
	
	
	
//delete(전달데이터, 성공-콜백, 실패-에러)--------------------------------------------------------------------
	
	function deleteFunc(modalRno, callback, error){
		console.log("delete  코멘트11.............................");
		console.log("modalRno = " + modalRno);
		
		//서버로 데이터를 보내서 댓글등록을 시킨다.
		$.ajax({
			url : "/anonyreply/delete.do?rno=" +modalRno,
			type : "delete",
			success : function(result,status,xhr){
				if(callback){
					callback(result);
				}else{
					alert("성공적으로 댓글 삭제 되었습니다.")
					console.log(result);
				}
			},
			//서버에 오류가 있을경우 실행되는 함수. error
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
				if(error){
					error();
				}else{
					alert("댓글 삭제에 실패했습니다.");
				}
			} //error의 끝
		}); // $.ajax의 끝
	} //function delete() 의 끝
		
	
	
	return {
		//JSON 데이터  key:value , key:value , .......
		//함수리턴
		list:list, // 실행 replyService.list()
		write:write, // 실행 replyService.wrtie()
		update:update, // 실행 replyService.update()
		delete:deleteFunc, // 실행 replyService.delete()
	};
})();

 