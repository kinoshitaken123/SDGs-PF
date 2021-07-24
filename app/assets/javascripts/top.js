document.addEventListener("turbolinks:load", function() {
$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: true,           // 自動スライド
    speed: 1000,          // スライドするスピード
    mode:'fade',
    moveSlides: 1,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
	  randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true,       // ホバー時に自動スライドを停止
    pager: false,
  });
});
});

document.addEventListener("turbolinks:load", function() {
$(function(){
  let display_num = 3;
  $(".more").on("click", function() {
     $('#recommend > li').each(function() {
      // コンソールに1つずつ出力
      /*if (index > (display_num - 1)) {
        console.log(this);
        $(this).hide();
      }*/
      //console.log('&&&&')
      if( $(this).is(':visible') ){
          $(this).hide();
      }else{
          $(this).show(); 
      }
    // $(this).toggleClass("on-click");
    // $(".txt-hide").slideToggle(1000);
    });
  });
  
  /*$(".more").on("click", function() {
    $('#recommend > li').each(function(index) {
      // コンソールに1つずつ出力
      if (index > (display_num - 1)) {
        $(this).show();
      }
    // $(this).toggleClass("on-click");
    // $(".txt-hide").slideToggle(1000);
    });
  });*/
});
});