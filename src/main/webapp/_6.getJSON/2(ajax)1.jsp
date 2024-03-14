<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>JSON 이용하기</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script>
/*
 $.ajax(object)
 1) url : 요청 전송 url,
 2) type : 전송 방식(get(기본) 또는 post),
 3) data: 전송할 자료들,
 4) cache: false를 설정하면 jQuery는 Ajax 요청에 대해 브라우저의 캐시를 사용하지 않도록 합니다.
 		   이렇게 하면 매번 서버로부터 최신 데이터를 가져오며, 캐시된 응답을 사용하지 않습니다.
 5) dataType : return data의 Type(에이잭스 성공 후 돌려받은 자료의 형을 정의-"json","xml","html"), 
 6) success : HTTP 요청이 성공한 경우 실행할 함수 정의,
 7) error: HTTP 요청이 실패한 경우 실행할 함수 정의,
 8) complete : 요청의 실패, 성공과 상관 없이 완료 될 경우 실행할 함수 정의
*/
$(function() {
	$("button").click(function() { // 버튼을 클릭하면
		$.ajax({
			url :"item.json",	// 요청 전송 url
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
			error : function(request, status, error){},
			complete : function(){}
		}); //ajax end
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