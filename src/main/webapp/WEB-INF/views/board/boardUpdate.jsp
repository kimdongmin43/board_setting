<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@include file="../common/common.jsp"%>
<%@include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<h2>게시글 수정</h2>
	<br>
	<br>
	<br>
    <form name=frm1 action="/board/boardUpdate?bno=${vo.bno}" method="post" onsubmit="return checkfrm();">
      <div class="form-group">
      	<label for="bno">번호${vo.bno}</label><br>
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${vo.title}">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" value="${vo.writer}">
      </div>
      <div class="form-group">
        <label for=content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3">${vo.content}</textarea>
      </div>
    </form>
    <button type="button" id="checkfrm" class="btn btn-info" onclick="checkfrm()">수정</button>
    <button type="submit" class="btn btn-primary" onClick="location.href='/board/boardList'">목록</button>
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



/* $(document).ready(function(){
		$('#checkfrm').click(function(){
			checkfrm22();
		});
	});
	
	function checkfrm22(){
		var title = document.update.title;
		var writer = document.update.writer;
		var content = document.update.content;
	
		if(title.value==""){
			alert("제목을 입력해주세요.");
			title.focus();
			return false;	
		}else if(writer.value==""){
				alert("작성자를 입력해주세요.");
				writer.focus();
				return false;
		}else if(content.value==""){
				alert("내용을 입력해주세요.");
				content.focus();
				return false;
		}else{
				alert("글이 등록되었습니다.")
				return true;
			}
		} */
</script>

</body>




</html>