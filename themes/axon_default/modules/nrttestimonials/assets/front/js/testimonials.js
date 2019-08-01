$(document).ready(function() {
  $('#slide').owlCarousel({
	autoplay:false,
	autoplayTimeout:5000,
	autoplayHoverPause:false,
    lazyLoad:false,
	nav:true,
	dots:true,
	navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
	responsive:{
		0:{items:1,nav:false},
		320:{items:1,nav:false},
		568:{items:1,nav:false},
		768:{items:1,nav:false},
		992:{items:1}
	}
  });
  var ii=0;
  $('#slide .owl-dots .owl-dot').each(function() {
	  $(this).html('<img class="img-responsive" src="'+$('.data_img .data_img_'+ii).attr('data-src')+'" alt="" />');
	  ii++;
	}); 
});
