<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/common.jsp"%>
<%@include file="../common/nav.jsp"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<style>
tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
.th333{
	text-align: right;
}
.td333{
	text-align: left;
}
</style>
<body>

<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">게시판</h1>
				</div>
				<div class="row">
					<div class="col-lg-12"></div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th class="th333">날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="BoardVo">
									<tr>
										<td >${BoardVo.bno}</td>
										<td><a href="/board/boardDetail?bno=${BoardVo.bno}">${BoardVo.title}</a></td>
										<td>${BoardVo.writer}</td>
										<td>
										<td class="td333"><fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value="${BoardVo.ddate}"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<button onclick="location.href='/board/boardWrite'" class="btn btn-success">
								<i class="fa fa-edit fa-fw"></i> 글쓰기
							</button>
			</div>
		</div>
	</div>

</body>
</html>