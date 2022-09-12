<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/common.jsp"%>
<%@include file="../common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
li{
   list-style:none;
   }
</style>
</style>
<body>
<!--구구단 -->
<div style="width:200px; height:150px; float:left;"><h3>TEST2 - 구구단</h3>
<select id="dan" name="gugudan" onchange="aaaaa(this.value)">
  <option value="none">선택</option>
  <option value="1">1단</option>
  <option value="2">2단</option>
  <option value="3">3단</option>
  <option value="4">4단</option>
  <option value="5">5단</option>
  <option value="6">6단</option>
  <option value="7">7단</option>
  <option value="8">8단</option>
  <option value="9">9단</option>
</select>
<div id='result3'></div></div>

<!--색상변경 -->
<div style="width:200px; height:150px; float:left;" id="colorDiv"><h3>TEST4 - 색상변경</h3>
	<h5 id="fi">첫번째</h5>
	<h5 id="se">두번째</h5>
	<h5 id="th">세번째</h5>
	<h5 id="fo">네번째</h5>
<select id="idx"> 
  <option id="none" value="none">선택</option>
  <option id="all" value="전체">전체</option>
  <option id="first" value="0">첫번째</option>
  <option id="second" value="1">두번째</option>
  <option id="third" value="2">세번째</option>
  <option id="fourth"value="3">네번째</option>
</select>
<select id="color">
  <option id="none" value="none">선택</option>
  <option id="red" value="red">빨강</option>
  <option id="blue" value="blue">파랑</option>
  <option id="yellow" value="yellow">노랑</option>
  <option id="green" value="green">초록</option>
</select>
<!-- <select id="ccolor" name="ccolor" onchange="changeA()"> onchange="bbbbb(this.value)" -->
<!--   <option id="none" value="none">선택</option> -->
<!--   <option id="all" value="전체">전체</option> -->
<!--   <option id="first" value="첫번째">첫번째</option> -->
<!--   <option id="second" value="두번째">두번째</option> -->
<!--   <option id="third" value="세번째">세번째</option> -->
<!--   <option id="fourth"value="네번째">네번째</option> -->
<!-- </select> -->
<!-- <select id="ccolor2" name="ccolor2" onchange="changeA()"> onchange="ccccc(this.value)" -->
<!--   <option id="none" value="none">선택</option> -->
<!--   <option id="red" value="red">빨강</option> -->
<!--   <option id="blue" value="blue">파랑</option> -->
<!--   <option id="yellow" value="yellow">노랑</option> -->
<!--   <option id="green" value="green">초록</option> -->
<!-- </select> -->
<button type="button" onclick="changeA()">변경</button>
</div>
<!-- 표 -->
<h3>TEST6 - 표</h3>
<input type="number" id="txt1"><!-- 세로 -->
<button onclick="main(txt1.value)">선택</button>
<div id="area"></div>

<script>
//TEST3 - 구구단
function aaaaa() {
	  var dan;
	  dan = $("#dan").val();
	  console.log("dan=="+dan);
	  //구구단 과정
	  var result = "";
	  if(dan == "none"){
		  $('#result3').hide();
	  }else{for (var i = 1; i <= 9; ++i) {
	   result += dan + " X " + i + " = " + (dan * i) + "<br>";
	  		}
	  $('#result3').show();
	  document.getElementById("result3").innerHTML = result;
	  }
}
//TEST4 - 색상변경
//몇번째인지
function bbbbb() {
 	var ccolor = $("#ccolor").val();
 	var result4all = $("h5").text();
  	var result4fi = $("#fi").text();
  	var result4se = $("#se").text();
  	var result4th = $("#th").text();
  	var result4fo = $("#fo").text();
//  	console.log("color==="+color);
   	if(ccolor =="전체"){
    	console.log(result4all);
   		result4all
   	}else if(ccolor == "첫번째"){
//    		console.log(result4fi);
    	result4fi;
   	}else if(ccolor == "두번째"){
//    		console.log(result4se);
   		result4se;
   	}else if(ccolor == "세번째"){
//    		console.log(result4th);
    	result4th;
   	}else if(ccolor == "네번째"){
//    		console.log(result4fo);
    	result4fo;
   	}
}
//무슨색인지
function ccccc(){
	var ccolor = $("#color").val();
	var ccolor2 = $("#ccolor2").val();
	var result4all = $("h5").text();
  	var result4fi = $("#fi").text();
  	var result4se = $("#se").text();
  	var result4th = $("#th").text();
  	var result4fo = $("#fo").text();
//    	console.log("color2==="+color2);
// 	console.log("result4all==="+result4all);
// 	console.log("result4fi==="+result4fi);
// 	console.log("result4se==="+result4se);
// 	console.log("result4th==="+result4th);
// 	console.log("result4fo==="+result4fo);
	if(ccolor2 == "red"){
		ccolor.style.color = "red";
 	}else if(ccolor2 == "blue"){
 		ccolor.style.color = "blue";
 	}else if(ccolor2 == "yellow"){
 		ccolor.style.color = "yellow";
 	}else if(ccolor2 == "green"){
 		ccolor.style.color = "green";
 	 }
}

function changeA(){
	var idx = $("#idx").val();
	var color = $("#color").val();
	$("#colorDiv").find("h5").removeAttr("style");
	if(idx == "전체"){
		$("#colorDiv").find("h5").css("color", color);
	}else{
		$("#colorDiv").find("h5").eq(idx).css("color", color);
	}

	if(color == 'none'){
        window.alert("변경할 색상을 선택해 주세요.");
        return false;
	}
}
function main(a1) {
	var v = a1;
	var v4 = 0;
	if((4 - v%4) != 4) {
		v4 = (4 - v%4);
	}
	v = Number(v) + Number(v4);
	var h = "";
	for(var i = 1; i <= v; i ++) {
		if((i%4) == 1) {
			console.log("1=="+i);
			h += "<tr>";
		}
		if((v-v4) < i) {
			h += "<td>X<td>";
		}else{
			h += "<td>"+i+"<td>";
		}
		if((i%4) == 0) {
			h += "</tr>";
		}
		
	}
	$("#area").html(h);
//     var tag = "<table border='1'>";
//     var col = parseInt(a1);
//     var row = 4;
//     var num=1;
//     console.log("나머지==="+col%4);
//     	for(i=1; i<=col; i++){
//     		tag += "<td>"+num+"</td>";
// 			num++;
// 			if(col%4 !== 0){
// 				tag += "<td>x</td>";
// 			}
//     	}
//  	tag += "</tr>";
// 	tag += "</table>";
//   	area.innerHTML = tag;
}


// for(i=0; i<row; i++){
// 	tag +="<td></td>";
// 	for(j=0; j<=col; j++){
// 		if(col==''){
// 			tag = '';
// 		}else if{
// 			tag += "<td>"+num+"</td>";
// 			num++;
// 		}else if(row % 4 == 0){
// 			tag += "<td>"+X+"</td>";	
// 			}
// 	}
// }

//     for (j = 1; j <= col; j++) {
//       if(b1==''){
//           tag = '';
//       }else{
//       	tag += "<tr>";
//       for (i = 1; i <= row; i++) {
//     	  tag += "<td>"+row+"</td>";
//           for(k = 1; k<=num; k++){
//         tag += "<td>"+num+"</td>";
//       	  }
//       }
//       tag += "</tr>";
//     }
//     }
//     tag += "</table>";
//     area.innerHTML = tag;
// }



// 	var ccolor = $("#ccolor").val();
// 	var ccolor2 = $("#ccolor2").val();
// 	console.log("ccolor==="+ccolor);
// 	console.log("ccolor2==="+ccolor2);
// 	if(ccolor =="전체"){
// 		$("h5").text();
// 	}else if(ccolor == "첫번째"){
// 		$("#fi").text();
// 	}else if(ccolor == "두번째"){
// 		$("#se").text();
// 	}else if(ccolor == "세번째"){
// 		$("#th").text();
// 	}else if(ccolor == "네번째"){
// 		$("#fo").text();
// 	}else if(ccolor2 == "red"){
// 		$("h5").css('color','red');
//  	}else if(ccolor2 == "blue"){
//  		$("h5").css("color","blue");
//  	}else if(ccolor2 == "yellow"){
//  		$("h5").css("color","yellow");
//  	}else if(ccolor2 == "green"){
//  		$("h5").css("color","green");
//  	 }

</script>





</body>
</html>