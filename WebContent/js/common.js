// 올해 날짜 출력
const thisYear = document.querySelector('.this-year');
thisYear.textContent = new Date().getFullYear();

// 오늘 날짜와 시간 출력
function getTime(){
    const timeNow = document.querySelector('.time-now');
    const today = new Date;
    timeNow.textContent = today.toLocaleString();
}

function init(){
    setInterval(getTime, 1000);
}

init();

// 기사 삭제 확인
function deleteNews(num){
    if(confirm("기사를 삭제합니까?") == true)
    location.href="../write/delete.jsp?num=" + num;
else
    return;
}

// 가입 취소 확인
function signUpClear(){
    if(confirm("가입을 취소합니까?") == true)
    window.history.go(-1)
else
    return;
}
// 작성 중 취소 확인
function wClear(){
    if(confirm("작성 중인 문서가 있습니다.\n(정보는 저장되지 않습니다.)") == true)
    window.history.go(-1)
else
    return;
}



// 헤드라인 뉴스 Swiper
new Swiper('.btm-line .swiper-container', {
    direction: 'vertical',
    autoplay: true,
    loop: true
});

function setThumb(event){
    const reader = new FileReader();

    reader.onload = function(event){
        let img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("div.pic-view").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}