window.onscroll = function(){

  var sbPageHeaer = $('.sb-page-header');
  if( window.pageYOffset >= 100 &&  $(sbPageHeaer).css('position')!='fixed') {
    $(sbPageHeaer).css('position','fixed');
    $(sbPageHeaer).css('top','-100px');
    $('.space-block').show();
  }

  if( window.pageYOffset <= 100 &&  $(sbPageHeaer).css('position')=='fixed') {
    $(sbPageHeaer).css('position','relative');
    $(sbPageHeaer).css('top','0px');
    $('.space-block').hide();
  }
}