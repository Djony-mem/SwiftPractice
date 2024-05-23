
const log = (msg) => {
    const logElement = document.querySelector('#log p');
    if (logElement) {
        logElement.textContent = msg;
    }
}

webkit.messageHandlers.download.onMessage = (msg) => {
    log(msg)
}

function downloadFile(url) {
    log("Идет загрузка...")
    window.webkit.messageHandlers.download.postMessage(url);
}

// Функция для копирования данных в буфер обмена
function copyCode(button) {
    let codeText = button.dataset.codeText;
    let textArea = document.createElement("textarea");
    textArea.value = codeText;
    document.body.appendChild(textArea);
    textArea.select();
    textArea.setSelectionRange(0, 99999);
    document.execCommand("copy");
    document.body.removeChild(textArea);

    button.textContent = "Copied!";
    setTimeout(function () {
        button.textContent = "Copy";
    }, 2000);
}

document.addEventListener("DOMContentLoaded", function () {
  const scrollProgress = document.getElementById("scroll-progress");
  // Функция для обновления значения прогресса на основе скролла
  function updateScrollProgress() {
    const scrollableHeight = document.documentElement.scrollHeight - window.innerHeight;
    const scrolledPercent = (window.scrollY / scrollableHeight) * 100;
    scrollProgress.value = scrolledPercent;
  }

  // Вызываем функцию обновления при скролле
  window.addEventListener("scroll", updateScrollProgress);
});


document.addEventListener("DOMContentLoaded", function () {
  // Предотвращаем оттягивание страницы при отрицательном скроллинге
  window.addEventListener("scroll", function (event) {
    if (window.scrollY < 0) {
      event.preventDefault();
      window.scrollTo(0, 0);
    }
  });
});

document.querySelectorAll('a.yakor').forEach(link => {
    link.addEventListener('click', function (e) {
        e.preventDefault()

        const href = this.getAttribute('href').substring(1)

        const scrollTarget = document.getElementById(href)

        const topOffset = 0
        const elementPosition = scrollTarget.getBoundingClientRect().top

        const offsetPosition = elementPosition - topOffset

        window.scrollBy({
            top: offsetPosition,
            behavior: 'smooth',
        })
    });
});

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
