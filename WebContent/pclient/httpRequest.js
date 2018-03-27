/**
 * Ajax 통신과 관련된 함수 라이브러리
 */

var httpRequest = null;

function getHttpRequest(){

	if(window.ActiveXOBject){
		return new ActiveXOBject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else 
		return null;

}

function sendProcess(method, url, params,callback){

	httpRequest = getHttpRequest();		
	httpRequest.onreadystatechange = callback;
	httpMethod = method.toUpperCase();  //대문자로변경해 주는 메소드
	if(httpMethod != 'GET' && httpMethod != 'POST')//method를 잘못썻을때(오타로)-->default값으로 GET방식 설정
		httpMethod ='GET';
	/*
	 * param의 값을 javascript 형식으로 가져왔을때 {'name':'gong','age':'12'} 이런식
	 * 
	 */

	var httpParams = '';
	if(params != null && params !=''){  
		if(typeof params =='object'){ //name=hong&age=12&addr=seoul ->이렇게 들어올때는 typeof찍어보면 string으로 찍힘   다른건 객체형태로 넘어옴
			for(var key in params){
				if(httpParams != ''){
					httpParams += '&'; //javascript값이 name=gong이렇게 들어올때 다음 인자를 붙일때 &를 붙여서 보내줘야 함으로
				}
				httpParams += key + "=" + params[key]; //key값은 var params = {'name' : name ,'age':age , 'addr' : addr}; 여기서 ''안에 값이고 params[key]는 :의 우측값s 
			}	
			
		}else{  //name=hong&age=12&addr=seoul 이런식으로 값이 바로 들어올때는 그냥 넣어줌.
			httpParams = params;
		}
	}

	var httpUrl =url;
	if(httpMethod =='GET' && httpParams != ''){
		httpUrl = url + '?' +httpParams;
	}

	//요청처리
	httpRequest.open(httpMethod,httpUrl,true);

	if(httpMethod == 'POST'){
		httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	}

	httpRequest.send(httpMethod =='GET' ?null : httpParams);



}