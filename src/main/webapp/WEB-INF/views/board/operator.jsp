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
#container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
}
 
#container > div {
  border: 3px solid gray;
}
 
#display,
#result {
  width: 400px;
  height: 80px;
  font-size: 60px;
  font-weight: bold;
  text-align: right;
  padding-right: 8px;
}
 
.buttonWrap {
  display: flex;
  flex-direction: row;
}
 
.buttonWrap button {
  width: 100px;
  height: 80px;
  font-size: 20px;
  padding: 10px;
}
.buttonWrap button:active{
  background-color: gray;
}

</style>
<body>
<div id="container">
      <div>
        <div>
          <input id="display" name="val" disabled/>		<!-- disabled는 비활성화와 함께 form으로 전송하여도 절대 전송 되지 않습니다. -->
        </div>
 
        <div>
          <div class="buttonWrap">
<!--             <button onclick="addOutput('%')">%</button> -->
			<button onclick="addOutput(7)">7</button>
			<button onclick="addOutput(8)">8</button>
			<button onclick="addOutput(9)">9</button>
			<button id="multiply" onclick="addOutput('*')">*</button>
          </div>
          <div class="buttonWrap">
          	<button onclick="addOutput(4)">4</button>
          	<button onclick="addOutput(5)">5</button>
          	<button onclick="addOutput(6)">6</button>
          	<button id="minus" onclick="addOutput('-')">-</button>
          </div>
          <div class="buttonWrap">
          	<button onclick="addOutput(1)">1</button>
          	<button onclick="addOutput(2)">2</button>
          	<button onclick="addOutput(3)">3</button>
            <button id="plus" onclick="addOutput('+')">+</button>
          </div>
          <div class="buttonWrap">
          	<button onclick="del()">del</button>
			<button onclick="addOutput(0)">0</button>
			<button id="divide" onclick="addOutput('.')">.</button>
			<button style="width:200px" onclick="calculate()">=</button>
          </div>
        </div>
      </div>
    </div>
 <script type="text/javascript">
var r = [];
var egExp =  /[-+=*.]/;
function addOutput(num) {
    console.log(num);
    r.push(num);
    const display = document.getElementById("display");
    var displayString = display.toString();
    console.log("r==="+r);
    if(egExp.test(r[0])){
      num = '';
      r = [];
    }
    if(egExp.test(r[r.length-1]) && egExp.test(r[r.length-2]) ){
         display.value = display.value.substring(0, display.value.length - 1);
      }
      display.value = display.value + num;
     }

function calculate() {
   var display = document.getElementById("display");
    if(egExp.test(r[r.length-1])){
       display.value += display.value[display.value.length-2]
       var result = eval(display.value);
   }else if (egExp.test(r[r.length-1]) == false){
    var result = eval(display.value);
   }
   var displayResult = document.getElementById("display");
   displayResult.value = result;
}
function del() {
   var display = document.getElementById("display");
   display.value = display.value.substring(0, display.value.length - 1);
   if(egExp.test(r[r.length-1]) == true){
	   r.push(display.value);
   }
}
 </script>
</body>
</html>