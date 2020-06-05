function checkWriteForm(){
    //if(document.writeForm.name.value == "") { // 이거는 name 속성으로만 해서 찾는거다
	if(document.getElementById("name").value == "") { // 이거는 id속성으로 해서 찾는거다
        alert("이름을 입력하세요.");
        document.writeForm.name.focus();
    } else if(document.writeForm.id.value == ""){
        alert("아이디를 입력하세요.");
        document.writeForm.id.focus();
    } else if(document.writeForm.pwd.value == "") {
    	alert("비밀번호를 입력하세요.");
    	document.writeForm.pwd.focus();
    } else if(document.writeForm.repwd.value == ""){
    	alert("재확인비밀번호를 입력하세요.");
    	document.writeForm.repwd.focus();
    } else if(document.writeForm.pwd.value != document.writeForm.repwd.value){
    	alert("비밀번호가 일치하지 않습니다.");
    	document.writeForm.pwd.focus();
    } else if(document.writeForm.checkValue != true){
    	alert("중복체크 하세요!");
    } else  {
    	document.writeForm.submit();
    } 
 }

function checkLoginForm(){
	if(document.loginForm.id.value == ""){
		alert("아이디를 입력하세요.");
		document.loginForm.id.focus();
    } else if(document.loginForm.pwd.value == "") {
       alert("비밀번호를 입력하세요.");
       document.loginForm.pwd.focus();
    } else  {
    	document.loginForm.submit();
    } 
}

function checkId(){
	let id = document.writeForm.id.value;
	if(id == ""){
		alert("아이디를 입력하세요.");
		document.writeForm.id.focus();		
	} else window.open("checkId.jsp?id="+id,"","width=400 height=200") // 맨앞이랑 가운데랑 둘중 한개만 쓴다.
}

function checkIdClose(id){
		opener.document.writeForm.checkValue = true;
		opener.document.writeForm.id.value = id;
		window.close();
		opener.writeForm.pwd.focus();		
}

function checkPost(){
	window.open("checkPost.jsp","","width=500 height=500 scrollbers=yes")
}

function overlapCheck(){
	 document.writeForm.checkValue = false;
}

function checkPostClose(zipcode, address){
	opener.document.getElementById("zipcode").value = zipcode;
	opener.document.getElementById("addr1").value = address;
	window.close();
	opener.document.getElementById("addr2").value = "";
	opener.document.getElementById("addr2").focus();
}



function checkModifyForm(){
	if(document.getElementById("name").value == "") { // 이거는 id속성으로 해서 찾는거다
        alert("이름을 입력하세요.");
        document.modifyForm.name.focus();
    } else if(document.modifyForm.pwd.value == "") {
    	alert("비밀번호를 입력하세요.");
    	document.writemodifyFormorm.pwd.focus();
    } else if(document.modifyForm.repwd.value == ""){
    	alert("재확인비밀번호를 입력하세요.");
    	document.modifyForm.repwd.focus();
    } else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value){
    	alert("비밀번호가 일치하지 않습니다.");
    	document.modifyForm.pwd.focus();
    } else  {
    	document.modifyForm.submit();
    } 
 }