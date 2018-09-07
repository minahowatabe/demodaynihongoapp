
/*ログイン・サインアップ画面のcss http://codedoit.com/2017/01/19/%E3%82%B3%E3%83%94%E3%83%9A%E3%81%A7%E5%8F%82%E7%85%A7%E3%81%A7%E3%81%8D%E3%82%8B%E3%81%8A%E3%81%97%E3%82%83%E3%82%8C%E3%81%AA%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B310/*/
 $("#login-button").click(function(event){
         event.preventDefault();
     
     $('form').fadeOut(500);
     $('.wrapper').addClass('form-success');
});