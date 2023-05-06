window.onload = function() {
  const searchModal = document.getElementById('search-modal');
  const searchIcon = document.getElementById('search-icon');

  searchIcon.onclick = function() {
    searchModal.style.display = "block";
  }
  
  window.onclick = function(e) {
    if (e.target == searchModal) {
      searchModal.style.display = "none";
    }
  }
}
