let tourlistService = (function() {

	function arrayByHit(list, callback, error) {
		$.ajax({
			type: 'post',
			url: '/tourlist/arraybyhit.do',
			traditional: true,
			data: {"list": list},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function arrayByRegdate(list, callback, error) {
		$.ajax({
			type: 'post',
			url: '/tourlist/arraybyregdate.do',
			traditional: true,
			data: {"list": list},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function exceptClosed(list, callback, error) {
		$.ajax({
			type: 'post',
			url: '/tourlist/exceptClosed.do',
			traditional: true,
			data: {"list": list},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function includeClosed(condition, callback, error) {
		console.log(condition);
		$.getJSON("/tourlist/includeClosed.do?searchKey=" + condition.searchKey +
			"&searchWord=" + condition.searchWord + "&region=" + condition.region,
			function(result) {
				if (callback) {
					callback(result);
				}
			}).fail(function(xhr, status, er) {
				if (error) {
					error(er);
				}
			});
		
	}
	
	return {
		arrayByHit : arrayByHit,
		arrayByRegdate : arrayByRegdate,
		exceptClosed : exceptClosed,
		includeClosed : includeClosed
	};
})();