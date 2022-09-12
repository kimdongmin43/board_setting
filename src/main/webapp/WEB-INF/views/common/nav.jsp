<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li role="presentation" class="home"><a href="/board/home">Home</a></li>
	<li role="presentation" class="dropdown board">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"> 게시판<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="/board/boardList">게시판 목록</a></li>
			<li><a href="/board/boardListAjax">게시판 목록 Ajax</a></li>
		</ul>
	</li>
	<li role="presentation" class="test"><a href="/board/test">TEST</a></li>
	<li role="presentation" class="operator"><a href="/board/operator">계산기</a></li>
	<li role="presentation" class="calendar"><a href="/board/calendar">calendar</a></li>


</ul>
<script type="text/javascript">
$(document).ready(function() {
	console.log("[네비게이션바] 적용 jsp");
	var loc = location.pathname.split("/")[2];
	console.log("loc => "+loc);
	// 해당 페이지에 맞는 네비게이션바 강조 옵션 적용
	if(loc.indexOf("board") > -1){
		$(".board").addClass("active");
	}else if(loc.indexOf("home") > -1){
		$(".home").addClass("active");
	}else if(loc.indexOf("test") > -1){
		$(".test").addClass("active");
	}else if(loc.indexOf("operator") > -1){
		$(".operator").addClass("active");
	}
});

</script>