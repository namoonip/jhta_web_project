window.onload = function formcheck() {
	var titleEL = document.getElementById("blog-title");
	var title = titleEL.trim();
	if(title == "") {
		alert("제목을 입력하세요");
		titleEL.focus();
		return false;
	}
	
	var contentsEL = document.getElementById("blog-contents");
	var contents = contentsEL.trim();
	if(contents=="") {
		alert("내용을 입력하세요");
		contentsEL.focus();
		return false;
	}
	
	var pwdEL = document.getElementById("blog-pwd");
	var pwd = pwdEL.trim();
	if(pwd=="") {
		alert("비밀번호를 입력하세요");
		pwdEL.focus();
		return false;
	}
	
	var pwdPattern = /[0-9]{4,4}/;
	if (!pwdPattern.test(pwd)) {
		alert("4자리 숫자만 가능합니다.");
		pwdEL.focus();
		return false();
	}
	
	return true;
}