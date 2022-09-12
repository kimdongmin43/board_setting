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
<title>Insert title here</title>
</head>
<style>
.tbtb tr:nth-child(2n) {
    background-color: #bbdefb;
  }
.tbtb tr:nth-child(2n+1) {
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
<!-- 게시판 목록 -->
<div id="bla" class="page-wrapper">
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
									<th><input id="allCheck" type="checkbox" name="allCheck" onclick="allCheck(this);"/>전체선택</th>
									<button id="deleteBtn" class="btn btn-danger" onclick="deleteCheck()">선택삭제</button>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody id="boardT" class="tbtb">
							</tbody>
						</table>
					</div>
				</div>
				<button id="showBtn" class="btn btn-success" onclick="dis(); resett();">글쓰기</button>
			</div>
		</div>
	</div>
<!-- 게시판 목록 -->
<!-- 게시판 글쓰기 -->
<div id="showWrite" class="container">
    <form name=frm1 id="formData"> <!-- action="/board/boardInsertAjax" -->
      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요.">
      </div>
      <div class="form-group">
        <label for=content>내용</label>
        <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
      </div>
    </form>
    <button type="button" id="checkfrm" class="btn btn-info" onclick="checkfrm(); writeBtn(); resett();">작성</button>
</div>
<!-- 게시판 글쓰기 끝 -->
<!-- 게시글 상세보기 -->
<div id="showDetail">
		<table class="table">
			<tbody id="boardDT">
			</tbody>
		</table>
		<button id="showBtn" class="btn btn-primary" onclick="dis3()">닫기</button>
	</div>
<!-- 게시글 상세보기  끝-->


<script type="text/javascript">
$(document).ready(function() {
	boardListAjax();
	$("#showWrite").hide();
	$("#showDetail").hide();

	$("#")
});
//글쓰기 버튼 클릭시 show, hide
function dis(){
    if($('#showWrite').css('display') == 'none'){
    	$('#showWrite').show();
	}else{
    	$('#showWrite').hide();
	}
}
//글쓰기 버튼 클릭시 show, hide 끝
//게시글 상세보기 show, hide
function dis2(){
    if($('#showDetail').css('display') == 'none'){
    	$('#showDetail').show();
	}
}
function dis3(){
	$('#showDetail').hide();
}
//게시글 상세보기 show, hide 끝


//게시판 조회
function boardListAjax() {
	
	$.ajax({
		type: 'get',   
		url: '/board/boardListAjaxSel',   
		dataType: 'json',
		success: function(data) {
// 			console.log("data==="+data);
// 			console.log("JSON==="+JSON.stringify(data));
			var h = "";
			$.each(data, function(index, item) {
				h +="<tr>";
				h +="<td><input id='allCheck' type='checkbox' name='allCheckRow' value='"+item.bno+"'/>";
				h += "<td>"+item.bno+"</td>";
				h += "<td><a href='#'; onclick='dis2(); detailBtn("+item.bno+"); return false;'>"+item.title+"</a></td>";     /* "<td><a href='/board/boardDetail?bno="+item.bno+"'>"+item.title+"</a></td>" */
				h += "<td>"+item.writer+"</td>";
				h += "<td class='td333'>"+moment(item.ddate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
				h += '<td><button id="deleteBtn" class="btn btn-danger" onclick="deleteBtn('+item.bno+')">삭제</button></td>';
				h += "</tr>";
			})
			$("#boardT").html(h);
		},
		error: function(err) {
			
		}
	});
}
//게시판 조회 끝
//게시판 글쓰기 유효성 검사
function checkfrm() {
    var title = document.getElementById("title");
    var writer = document.getElementById("writer");
    var content = document.getElementById("content");
    // 제목 입력 체크
    if(title.value == ''){
        window.alert("제목 입력하시오");
        title.focus();
        return false;
    }
    // 작성자 입력 체크
    if(writer.value == ''){
        window.alert("작성자 입력하시오");
        writer.focus();
        return false;
    }
    // 내용 입력 체크
    if(content.value == ''){
        window.alert("내용 입력하시오");
        content.focus();
        return false;
    }
    	return true; //document.frm1.submit();
}
//게시판 글쓰기 유효성 검사 끝

//게시판 삭제
function deleteBtn(bno){
	console.log("deleteBtn===="+bno);
 	if (window.confirm("삭제하시겠습니까?")) {
 		$.ajax({
 			type: 'post',   
 			url: '/board/boardDeleteAjax',
 			data : {
 	 			bno : bno
 	 			},
//  			dataType: 'json',
 			success: function(data) {
 				boardListAjax();
 			},
 			error: function(err) {
 				
 			}
 		});
	} else {
	  console.log("취소. 변화 없음");
	}
}

//게시판 삭제 끝
//게시판 체크박스 선택삭제
function allCheck(allCheck)  {
  const checkboxes 
       = document.getElementsByName('allCheckRow');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = allCheck.checked;
  })
}

function deleteCheck(){
	var url = "/board/boardDeleteCheck";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
	$("input[name='allCheckRow']:checked").each(function(){						//jQuery 선택자 로 밑에 for문을 한줄로 해결함
		valueArr.push($(this).val());
	})
//     var list = $("input[name='allCheckRow']");
//     for(var i = 0; i < list.length; i++){
//         if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
//             valueArr.push(list[i].value);
//         }
//     }
    if (valueArr.length == 0){
    	alert("삭제할 대상을 선택하여 주십시요.");
    }
    else{
		var chk = confirm(valueArr);				 
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'POST',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                	boardListAjax();
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
	}
}
// function deleteCheck(){
// 	var cnt = $("input[name='allCheckRow']:checked").length;
//     var arr = new Array();
//     $("input[name='allCheckRow']:checked").each(function() {
//         arr.push($(this).attr('id'));
//     });
//     if(cnt == 0){
//         alert("삭제할 대상을 체크하여 주십시오.");
//     }
//     else{
//     	alert(arr);
//         $.ajax = {
//             type: "POST"
//             url: '/board/boardDeleteCheck',
//             data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
//             dataType:"json",
//             success: function(jdata){
//                 if(jdata != 1) {
//                     alert("삭제 오류");
//                 }
//                 else{
//                     alert("삭제 성공");
//                 }
//             },
//             error: function(){alert("서버통신 오류");}
//         };
//     }
// }
//게시판 체크박스 선택삭제 끝
//게시판 글쓰기
function writeBtn(){
	console.log("writeBtn");
	var title = $("#title").val();
	var writer = $("#writer").val();
	var content = $("#content").val();

    if(title == ''){
        window.alert("제목 입력하시오");
        title.focus();
        return false;
    }
    // 작성자 입력 체크
    if(writer == ''){
        window.alert("작성자 입력하시오");
        writer.focus();
        return false;
    }
    // 내용 입력 체크
    if(content == ''){
        window.alert("내용 입력하시오");
        content.focus();
        return false;
    }
// 	console.log("title==="+title);
// 	console.log("writer==="+writer);
// 	console.log("content==="+content);
 	var data = {
		  title : title
		, writer : writer
	    , content : content
 	}
	var formData = $("#formData").serialize();
 		$.ajax({
 			type: 'post',   
 			url: '/board/boardInsertAjax',
 			data : JSON.stringify(data),
//  			data : formData,
//  			data : {
// 				title : title,
// 				writer : writer,
// 				content : content
//  	 			},
			contentType : "application/json; charset=utf-8",
  			dataType: 'text',
 			success: function(data) {
 	 			console.log("aaaaaaa==="+data);
//  				console.log("boardInsertAjaxdataJSON==="+JSON.stringify(data));
 				boardListAjax();
 			},
 			error: function(err) {
 				console.log(err)
 			}
 		});
}
function resett(){
	var obj = document.getElementsByClassName('form-control');
	 
    for (var i = 0; i < obj.length; i++) {
        obj[i].value = '';
	}
}
//게시판 글쓰기 끝
//게시판 상세보기
function detailBtn(bno){
	console.log("detailBtn===="+bno);
	$.ajax({
			type: 'get',   
			url: '/board/boardDetailAjax',
			data : {
	 			bno : bno
	 			},
			dataType: 'json',
			success: function(data) {
				console.log("detailBtndata==="+data.bno);
				console.log("JSON==="+JSON.stringify(data));
				 var h = "";
					h +="<tr>";
					h +="<td>번호<br>"+data.bno+"</td>";
					h +="</tr>";
					h +="<tr>";
					h +="<td>제목<br>"+data.title+"</td>";
					h +="</tr>";
					h +="<tr>";
					h +="<td>작성자<br>"+data.writer+"</td>";
					h +="</tr>";
					h +="<tr>";
					h +="<td>내용<br>"+data.content+"</td>";
					h +="</tr>";
				$("#boardDT").html(h);
			},
			error: function(err) {
				console.log(err)
			}
	});
}
//게시판 상세보기
</script>

</body>
</html>