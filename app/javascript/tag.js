// インクリメントサーチの実装

document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.querySelector("#post_search");
  console.log("searchInputスタート");
  if (searchInput){
    const inputElement = document.getElementById("post_search");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("post_search").value;
      fetch(`/posts/search?title=${keyword}`)
        .then(response => response.text())
        .then(data => {
          const searchResult = document.getElementById("search-result");
          searchResult.innerHTML = data;
          searchResult.querySelectorAll('.child').forEach(childElement => {
            childElement.addEventListener("click", () => {
              document.getElementById("post_search").value = childElement.textContent;
              childElement.remove();
            });
          });
        });
    });
  };
});
