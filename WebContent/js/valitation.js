const n_tit = document.getElementById("news-title");
const n_tit_v = document.querySelector(".valitation_1");
const n_author = document.getElementById("news-author");
const n_author_v = document.querySelector(".valitation_2");
const n_con = document.getElementById("news-context");
const n_con_v = document.querySelector(".valitation_3");

function checkTit(){
    if(n_tit.value.length < 4 || n_tit.value.length > 40){
        n_tit_v.innerHTML = "최소 4자에서 최대 40자로 입력하세요.";
        n_tit.select();
        n_tit.focus();
        return false;
    }
}

function checkAuthor(){
    if(n_author.value.length < 3 || n_author.value.length > 10){
        n_author_v.innerHTML = "최소 3자에서 최대 10자로 입력하세요.";
        n_author.select();
        n_author.focus();
        return false;
    }
}

function checkContext(){
    if(n_con.value.length < 3){
        n_con_v.innerHTML = "최소 3자 이상 입력하세요.";
        n_con.select();
        n_con.focus();
        return false;
    }
}

const id = document.querySelector("#sign_id");
const pw = document.querySelector("#sign_pw");
const pwc = document.querySelector("#sign_pw_c");
const name = document.querySelector("#sign_name");
const mail = document.querySelector("#sign_mail");
const v_id = document.querySelector(".valitation_id");
const v_pw = document.querySelector(".valitation_pw");
const v_pwc = document.querySelector(".valitation_pwc");
const v_name = document.querySelector(".valitation_name");
const v_mail = document.querySelector(".valitation_mail");

function checkId(id){
const idRegExp = /^[a-z]{2, 6}*$/;
if(!idRegExp.test(id.value)){
    v_id.innerHTML = "ID는 영소문자 2~6자로만 입력하세요.";

    return false;
}
}

function checkPw(pw){
const pwRegExp = /^[0-9]{2, 6}$/g;
if(!pwRegExp.test(pw.value)){
    v_pw.innerHTML = "비밀번호는 숫자 2~6자로만 입력하세요.";
    pw.select();
    pw.focus();
    return false;
}
}

function checkPwc(){
if(pw.value != pwc.value){
    v_pwc.innerHTML = "비밀번호가 동일하지 않습니다.";
    pwc.select();
    pwc.focus();
    return false;
}
}

function checkName(name){
const nameRegExp = /^[a-zA-Z가-힣]{2, 6}$/;
if(!nameRegExp.test(name.value)){
    v_name.innerHTML = "이름은 한글 또는 영문 2~6자로만 입력하세요.";
    name.select();
    name.focus();
    return false;
}
}

function checkMail(mail){
const mailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
if(!mailRegExp.test(mail.value)){
    v_mail.innerHTML = "이메일 형식이 맞지 않습니다."
    mail.select();
    mail.focus();
    return false;
}
}