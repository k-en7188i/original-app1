window.addEventListener('load', function() {
  console.log("読み込み完了");
  const articleCheckButtons = document.querySelectorAll(".article-check-button");
  articleCheckButtons.forEach(function(button) {
    console.log("読み込み完了?");
    button.addEventListener("click", () => {
      const postId = button.getAttribute("data-post-id");
      const deleteFlg = window.confirm('記事の既読の状態を変更しますか？');
      if (deleteFlg) {
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/checks/revert/${postId}`, true);
        XHR.send();
        XHR.onload = () => {
          button.parentNode.remove();
        };
      } else {
        // 削除しない場合の処理
      }
    });
  });
});
