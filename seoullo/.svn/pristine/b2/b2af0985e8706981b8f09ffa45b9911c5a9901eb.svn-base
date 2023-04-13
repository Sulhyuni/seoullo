/**
 * utility JS
 */

function displayTime(timeValue){
	// 오늘 날짜 객체 생성 - 24 시간이 지났는지 알아내기 위해서 필요
	var today = new Date();
	
	// 댓글 작성 시간과의 차이
	// 날짜객체.getTime() - long 타입의 날짜 데이터가 나온다.
	var gap = today.getTime() - timeValue;
	
	// 작성 날짜에 대한 형식을 만들려 작성 날짜를 날짜객체로 만들어야 한다.
	var dateObj = new Date(timeValue);
	var str = "";
	
	
	
		var yy = dateObj.getFullYear();
		// 월은 날짜 객체는 0 ~ 11 까지만 운영을 한다. 우리가 사용하는 월은 + 1 처리해야만 한다.
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		// join(구분문자) 배열을 이어주는 함수. 배열 사이에 구분문자를 넣어 줘서 이어준다. 
		return [
			yy, '-',
			(mm > 9 ? '' : '0') + mm, '-',
			(dd > 9 ? '' : '0') + dd
		].join('');
	
	
	
} // displayTime()의 끝