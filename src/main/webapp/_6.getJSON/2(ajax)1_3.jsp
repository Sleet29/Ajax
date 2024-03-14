<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>JSON 이용하기</title>
<style>
	#error{color:green}
	#com{color:blue}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script>
$(function() {
	$("button").click(function() { // 버튼을 클릭하면
		$("table").remove();
		$(".container div").remove()
		
		$.ajax({
			url :"item_error.json",	// 요청 전송 url
			dataType : "json" , // return data의 Type (에이잭스 성공 후 돌려받은 자료 형을 정의)
			cache : false,		// 브라우저 캐시 값이 아닌 현재의 데이터를 받아오도록 합니다.
			success : function(rdata) { // HTTP 요청이 성공한 경우 실행할 함수 정의(이벤트 핸들러)
				if (rdata.length > 0) {  // rdata는 서버에서 보낸 데이터입니다.
					let output = "<table class='table'><thead><tr><th>id</th><th>name</th>"
							   + "<th>price</th><th>description</th></tr></thead><tbody>";
					rdata.forEach(function(item) { // 반복문
						output += "<tr><td>" + item.id + "</td>"
							   + "<td>" + item.name + "</td>"   
							   + "<td>" + item.price + "</td>"   
							   + "<td>" + item.description + "</td></tr>";
					});
					output += "</tbody></table>";
					$('button').after(output);
				} else {
					$("button").after("<div>요청한 데이터가 없습니다.</div>");
				}
			},
			error : function(request, status, error){
				$(".container").append("<div id='error'>code :"
						+ request.status + "<br>"
						+ "받은 데이터 :" + request.responseText + "<br>"
						+ "error status :" + status + "<br>"
						+ "error 메시지 :" + error + "</div>");
			},
			complete : function(){
				$(".container").append("<div id='com'>Ajax가 완료되었습니다.</div>");
				console.log('ajax() - complete')
			}
		}); //ajax end
		
		console.log('ajax() 뒤')
	});// click end
});// ready end
</script>
</head>
<body>
	<div class="container">
		<button class="btn btn-info">JSON 데이터를 불러옵니다.</button>
	</div>
</body>
</html>