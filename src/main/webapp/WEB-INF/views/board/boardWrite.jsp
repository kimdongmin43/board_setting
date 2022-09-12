<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2 {
	text-align: center;
}
</style>
<body>

<h2> 게시글 작성 </h2>
 
<div class="container">
    <form name=frm1 action="/board/boardInsert" method="post" onsubmit="return checkfrm();">
      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요">
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
      </div>
    </form>
    <button type="button" id="checkfrm" class="btn btn-info" onclick="checkfrm()">작성</button>
    <button type="submit" class="btn btn-primary" onClick="location.href='/board/boardList'" >목록</button>
</div>


<script type="text/javascript">

function checkfrm() {
    var title = document.getElementById("title");
    var writer = document.getElementById("writer");
    var content = document.getElementById("content");
    console.log("title.value==="+title.value)
    // 제목 입력 체크
    if(title.value == ''){
        window.alert("제목 입력하시오");
        title.focus();
        return false; // 제목 입력이 안되어 있다면 submint 이벤트를 중지
    }
    // 작성자 입력 체크
    if(writer.value == ''){
        window.alert("작성자 입력하시오");
        writer.focus();
        return false; // 작성자 입력이 안되어 있다면 submint 이벤트를 중지
    }
    // 내용 입력 체크
    if(content.value == ''){
        window.alert("내용 입력하시오");
        content.focus();
        return false; // 내용 입력이 안되어 있다면 submint 이벤트를 중지
    }
    document.frm1.submit();
}
</script>

</body>
</html>