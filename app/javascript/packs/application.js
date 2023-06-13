// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap"
import "../stylesheets/application"
// require("../main")
require("../preview")
require("../search")
// require("../external")
// require("../tag")＃インクリメントサーチの実装、json形式でデータを返すため、実装中断
require("../revert_check");
require("../visible_password");
require("../menu")  // ドロップダウンをカーソルを載せるだけで表示させる機能
require("../review")  // レビューの星マークにカーソルを載せた時の処理




// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
