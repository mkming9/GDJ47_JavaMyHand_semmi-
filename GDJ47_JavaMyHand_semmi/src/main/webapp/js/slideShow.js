const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
const slideImg = document.querySelectorAll('.slides>li'); //모든 슬라이드들
let currentIdx = 0; //현재 슬라이드 index
const slideCount = slideImg.length; // 슬라이드 개수
const left = document.querySelector('.left'); //이전 버튼
const right = document.querySelector('.right'); //다음 버튼



function moveSlide(num) {
    slides.style.left = -num * 1920 + 'px';
    currentIdx = num;
}

left.addEventListener('click', function () {
  if (currentIdx !== 0) moveSlide(currentIdx - 1);
  console.log(currentIdx);
});

right.addEventListener('click', function () {
  if (true) {
    moveSlide((currentIdx + 1)%4);
  }
  console.log(currentIdx);
});



