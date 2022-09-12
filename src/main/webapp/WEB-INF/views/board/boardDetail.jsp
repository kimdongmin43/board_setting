<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/common.jsp"%>
<%@include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
</head>
<style>
h1 {
	text-align: center;
}

table {
	width: 100%;
}

textarea {
	width: 100%;
}

#outter {
	display: block;
	width: 30%;
	margin: auto;
}
</style>
<body>

	<h1>게시글 상세</h1>
	<br>
	<br>
	<br>
	<div id="outter">
		<table class="table">
			<tr>
				<td>번호  ${vo.bno }</td>
			</tr>
			<tr>
				<td>제목  ${vo.title }</td>
			</tr>
			<tr>
				<td>작성자  ${vo.writer } <span style="float: right;"><fmt:formatDate
							value="${board.ddate }" pattern="yyyy.MM.dd" /></span>
				</td>
			</tr>
			<tr>
				<td><div
						style="height: 300px; margin: 10px; display: inline-block">내용<br>${vo.content }</div></td>
			</tr>
		</table>
		<button onclick="location.href='/board/boardUpdate?bno=${vo.bno}'"
			class="btn btn-info">수정</button>
		<button onclick="location.href='/board/boardDelete?bno=${vo.bno}'"
			class="btn btn-primary">삭제</button>
		<button onclick="location.href='/board/boardList'"
			class="btn btn-danger">목록</button>
	</div>
</body>
</html>