



/*

 * HTML5 Web Worker

 * 2012.10.17
 * 

 */

//�ʱⰪ 100
var i = 1;
var i2=1;
var i3=1;
var i4=1;

//�ݺ� ȣ�� �Լ�

function run() {
		
		i =  i + Math.random()*10;
		i2 =  i2 + Math.random()*10;
		i3 =  i3 + Math.random()*10;
		i4 =  i4 + Math.random()*10;
		
		var a = i+"!@#"+ i2+"!@#"+ i3+"!@#"+ i4;
		postMessage(a);
	
	setTimeout("run()", (Math.random()*100)+30);
	

}

//�� ó�� ȣ��

run();
