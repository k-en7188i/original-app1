document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.querySelector("#post_search");
  console.log("searchInputスタート");
  if (searchInput) {
    const inputElement = document.getElementById("post_search");
    const searchResult = document.getElementById("search-result");
    inputElement.addEventListener("input", () => {
      const keyword = inputElement.value;
      if (keyword.trim() === "") {
        searchResult.innerHTML = "";
        return;
      }
      fetch(`/posts/search?title=${keyword}`)
        .then((response) => response.text())
        .then((data) => {
          searchResult.innerHTML = data;
          searchResult.querySelectorAll(".child").forEach((childElement) => {
            childElement.addEventListener("click", () => {
              inputElement.value = childElement.textContent;
              childElement.remove();
            });
          });
        });
    });
  }
});
