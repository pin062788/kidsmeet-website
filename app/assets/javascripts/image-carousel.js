$(function() {
  $('.jcarousel-control-prev')[0].onclick = function () {
    $('.jcarousel').jcarousel('scroll', '-=1');
  };
  $('.jcarousel-control-next')[0].onclick = function () {
    $('.jcarousel').jcarousel('scroll', '+=1');
  };

  $('.jcarousel').jcarousel({
    wrap: 'circular'
  });
});