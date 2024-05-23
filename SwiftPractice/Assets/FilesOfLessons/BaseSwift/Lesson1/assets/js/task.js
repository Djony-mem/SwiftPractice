/*Первая задача*/
const redButton = document.querySelector(".btn");
const reviewBlock = document.querySelector(".container-subtask");

redButton.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock.classList.toggle("collapsed");
});

/*Вторая задача*/
const redButton1 = document.querySelector(".btn-one");
const reviewBlock1 = document.querySelector(".container-subtask-one");

redButton1.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock1.classList.toggle("collapsed");
});

/*Третья задача*/
const redButton2 = document.querySelector(".btn-two");
const reviewBlock2 = document.querySelector(".container-subtask-two");

redButton2.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock2.classList.toggle("collapsed");
});

/*Четвертая задача*/
const redButton3 = document.querySelector(".btn-three");
const reviewBlock3 = document.querySelector(".container-subtask-three");

redButton3.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock3.classList.toggle("collapsed");
});

/*Пятая задача*/
const redButton4 = document.querySelector(".btn-four");
const reviewBlock4 = document.querySelector(".container-subtask-four");

redButton4.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock4.classList.toggle("collapsed");
});

/*Шестая задача*/
const redButton5 = document.querySelector(".btn-five");
const reviewBlock5 = document.querySelector(".container-subtask-five");

redButton5.addEventListener("click", function (event) {
    event.preventDefault();
    reviewBlock5.classList.toggle("collapsed");
});
