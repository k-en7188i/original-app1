document.addEventListener("DOMContentLoaded", (event) => {

	console.log("review.js読み込み完了");

// class = "ratings"の子要素を取得
const stars = document.querySelector(".ratings").children;
// id = "rating-value"の要素を取得
const ratingValue = document.getElementById("rating-value");
// id = "rating-value-display"の要素を取得
const ratingValueDisplay = document.getElementById("rating-value-display");
// indexという変数を定義
let index;

for(let i=0; i<stars.length; i++){
    console.log(stars.length)
    stars[i].addEventListener("mouseover",function(){
        for(let j=0; j<stars.length; j++){
            console.log(stars.length)
            // まず全て星をくり抜く
            stars[j].classList.remove("fa-solid");
            stars[j].classList.remove("fa-star");
            stars[j].classList.add("fa-regular");
            stars[j].classList.add("fa-star");
        }
        for(let j=0; j<=i; j++){
            console.log(stars.length)
            stars[j].classList.remove("fa-regular");
            stars[j].classList.remove("fa-star");
            // カーソルが乗った星まで星を塗りつぶす
            stars[j].classList.add("fa-solid");
            stars[j].classList.add("fa-star");
        }
    })
    stars[i].addEventListener("click",function(){
        ratingValue.value = i+1;
        ratingValueDisplay.textContent = ratingValue.value;
        index = i;
    })
    stars[i].addEventListener("mouseout",function(){
        for(let j=0; j<stars.length; j++){
            // まず全ての星をくり抜く
            stars[j].classList.remove("fa-solid");
            stars[j].classList.remove("fa-star");
            stars[j].classList.add("fa-regular");
            stars[j].classList.add("fa-star");
        }
        for(let j=0; j<=index; j++){
            // クリックされている星まで塗りつぶす
            stars[j].classList.remove("fa-regular");
            stars[j].classList.remove("fa-star");
            stars[j].classList.add("fa-solid");
            stars[j].classList.add("fa-star");
        }
    })
}

	
});