// 이메일 정규표현식
  var regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

// 비밀번호 정규표현식
  var regPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;

function validation() {
    if(email.value == "") {
        document.getElementById("emailError").innerText = "아이디를 입력하세요";
        email.focus();
        return false;
    } else if (!regEmail.test(email.value)) {
        document.getElementById("emailError").innerText = "이메일 형식에 맞게 입력해주세요";
        email.focus();
        return false;
    } else {
        // 에러 없을시 에러 메세지 삭제
        document.getElementById("emailError").innerText = "";
    }

    if(pw.value == "") {
        document.getElementById("pwError").innerText = "비밀번호를 입력하세요";
        pw.focus();
        return false;
    } else if(!regPw.test(pw.value)) {
        document.getElementById("pwError").innerText = "비밀번호 형식에 맞게 입력해주세요";
        pw.focus();
        return false;
    } else {
        // 에러 없을시 에러 메세지 삭제
        document.getElementById("pwError").innerText = "";
    }
    
    return false;
}