$(document).ready(function(){
	$('.slider_carousel').each(function() {
		var this_= $(this);		
	var datafiltercarousel=$(this).attr('data-filter-carousel').split(",");
	if(datafiltercarousel[3]==1){ var auto_scroll=true;}else{var auto_scroll=false;}
	if(datafiltercarousel[4]==1){ var pause_onhover=true;}else{var pause_onhover=false;}
	if(datafiltercarousel[5]==1){ var show_pagination=true;}else{var show_pagination=false;}
	if(datafiltercarousel[6]!=2){ var show_navigation=true;}else{var show_navigation=false;}
	if(datafiltercarousel[8]==1){ var config_loop=true;}else{var config_loop=false;}

		this_.find('.owl-carousel').first().owlCarousel({
			autoplay:auto_scroll,
			autoplayTimeout:datafiltercarousel[7],
			autoplayHoverPause:pause_onhover,
			lazyLoad:true,
			nav:show_navigation,
			dots:show_pagination,
			loop:config_loop,
			navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
			responsive:{
				0:{items:1,nav:false,dots:false},
				320:{items:1,nav:false,dots:false},
				480:{items:datafiltercarousel[2],nav:false,dots:false},
				568:{items:datafiltercarousel[2],nav:false,dots:false},
				768:{items:datafiltercarousel[1],nav:false,dots:false},
				992:{items:datafiltercarousel[1]},
				1200:{items:datafiltercarousel[0]}
			}
		});
	});
 });