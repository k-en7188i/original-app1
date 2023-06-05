window.addEventListener('DOMContentLoaded', function(){
  console.log('visible_password.js起動');
  let btn_passview = document.getElementById('btn_passview');
  let btn_passview_confirmation = document.getElementById('btn_passview_confirmation');
  let btn_passview_current = document.getElementById('btn_passview_current');
  let input_pass = document.getElementById('password');
  let input_pass_confirmation = document.getElementById('password_confirmation');
  let input_pass_current = document.getElementById('current-password');
  let img_visible = document.getElementById('img-visible');
  let img_hidden = document.getElementById('img-hidden');
  let img_visible_confirmation = document.getElementById('img-visible-confirmation');
  let img_hidden_confirmation = document.getElementById('img-hidden-confirmation');
  let img_visible_current = document.getElementById('img-visible-current');
  let img_hidden_current = document.getElementById('img-hidden-current');

  btn_passview.addEventListener("click", togglePasswordVisibility.bind(null, input_pass, img_visible, img_hidden));
  btn_passview_confirmation.addEventListener("click", togglePasswordVisibility.bind(null, input_pass_confirmation, img_visible_confirmation, img_hidden_confirmation));
  btn_passview_current.addEventListener("click", togglePasswordVisibility.bind(null, input_pass_current, img_visible_current, img_hidden_current));
});

function togglePasswordVisibility(inputField, visibleImage, hiddenImage) {
  if (inputField.type === 'password') {
    inputField.type = 'text';
    visibleImage.style.display = 'none';
    hiddenImage.style.display = 'block';
  } else {
    inputField.type = 'password';
    visibleImage.style.display = 'block';
    hiddenImage.style.display = 'none';
  }
}
