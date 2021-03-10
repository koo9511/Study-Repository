/*자바스크립트 소스 파일 : 파일명.js 로 저장함*/
/*<script> 태그 사용 안 함*/

function testFunc1(){
	alert("경고창을 출력하도록 하였습니다.\n" +
		typeof("apple") + ", " + typeof(123) + ", " +
		typeof(3.14) + ", " + typeof('banana') + "\n" 
		+ typeof(12+"3") + ", " + typeof(3==4) + "\n"
		+ typeof('A') + "\n" + typeof(num));
}

function calculate(){
	var n1 = document.getElementById("num1").value;
	var n2 = document.getElementById("num2").value;
	var result = Number(n1) + Number(n2);
	document.getElementById("result").innerHTML = result;
	console.log(n1 + n2);
}

function showAlert(){
	//window 객체만 생략 가능함
	window.alert("메세지만 출력되는 알림창입니다.");
}

function showConfirm(){
	//window.confirm() --> window 생략함
	var returnValue = confirm(
		"찬성이면 확인, 반대이면 취소를 누르시오.");
	document.getElementById("result").innerHTML =
		"리턴값 확인 : " + returnValue;
}

function showPrompt(){
	var returnValue = prompt("주소를 입력하시오");
	document.getElementById("result").innerHTML =
		"리턴값 확인 : " + returnValue;
}

function inputValue(){
	var name = document.getElementById("username").value;
	alert("입력된 이름 : " + name);
}

function calculator2(op){
	var n1 = Number(document.getElementById("num1").value);
	var n2 = Number(document.getElementById("num2").value);
	//변수에 담겨진 값은 string 임. "10"
	//"10"을 숫자형으로 바꾸려면 Number() 함수 사용함
	
	var result;

	switch(op){
	case '+':	result = n1 + n2;	break;
	case '-':	result = n1 - n2;	break;
	case 'x':	result = n1 * n2;	break;
	case '/':	result = n1 / n2;	break;
	case '%':	result = n1 % n2;	break;
	}

	document.getElementById("calc").innerHTML = result;
}

function check(){
	alert("== 연산자 : " + ('' == false) + ", " +
		('' == 0) + ", " + (0 == false) + ", " +
		('273' == 273) + "\n" +
		"=== 연산자 : " + ('' === false) + ", " +
		('' === 0) + ", " + (0 === false) + ", " +
		('273' === 273));
}

function checkSwitch(){
	var today = new Date();
	var currentHour = today.getHours();

	switch(currentHour){
	case currentHour == 9:
		alert("업무 시작 시간입니다.");	break;
	case currentHour < 11:
		alert("오전 간식 시간입니다.");	break;
	case currentHour < 15:
		alert("오후 간식 시간입니다.");	break;
	case currentHour > 18:
		alert("퇴근 시간입니다.");	break;
	default:	alert("일할 시간입니다.");	break;
	}

}

function checkLogic(){
	var input = Number(prompt("숫자를 입력하시오"));

	//짧은 조건문 : ||는 거짓이면 실행, &&는 참이면 실행
	input % 2 == 0 || alert("홀수입니다.");
	input % 2 == 0 && alert("짝수입니다.");
}