function favorite(){
  const favoriteButtons = document.querySelectorAll(".favorite-btn");
  favoriteButtons.forEach((btn) => {
    btn.addEventListener("click", () => {
      console.log("イベント発火");
    });
  });
};

window.addEventListener('load', favorite);