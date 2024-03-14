<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>서버의 데이터를 대상 엘리먼트에 삽입하기</title>
<link href="../css/ex2.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$('button').click(function() {
			$('button').text('로딩 완료').css('color','red');
		// html파일 가져옵니다.
		$('#container').load('resource1.html');
		});
	});
</script>
</head>
<body>
	<button> 서버로부터 데이터 가져오기 </button>
	<div id="container"> 데이터 가져오기 전</div>
</body>
</html>