// ドロップダウンをカーソルを載せるだけで表示させる機能

window.addEventListener('DOMContentLoaded', function() {
  const dropdown1 = document.querySelector('.dropdown#dropdownUser2');
  const dropdown2 = document.querySelector('.dropdown#dropdownNavLink');
  dropdown1.addEventListener('mouseover', function() {
    this.classList.add('show');
  });
  
  console.log("dropdown起動");
  dropdown1.addEventListener('mouseout', function() {
    this.classList.remove('show');
  });

  dropdown2.addEventListener('mouseover', function() {
    this.classList.add('show');
  });

  dropdown2.addEventListener('mouseout', function() {
    this.classList.remove('show');
  });
});
