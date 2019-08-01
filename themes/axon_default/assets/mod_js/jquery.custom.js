$(document).ready(function() {
	$('.tab_home').tabs();
	/* End-Cart */
	$('body').on('click','.popover_wishlist',(function(e) {
		 $(this).find('.box-content-wishlist').toggle();
    }));
	$('.second_image').hover(function(e) {
        var data_img=$(this).find('.hover_image').attr('data-src-img');
		$(this).find('.hover_image').html('<img class="img-responsive" src = "'+data_img+'" alt="">');
    });
	$("#click-md-down").click(function(e) {
        $(".click-md-down").slideToggle();
    });
	
	$(".expand-more-setting").click(function(e) {
       $(this).siblings(".dropdown-menu-setting").slideToggle();
	   $(this).toggleClass('active');
    });
	$(window).scroll(function() {
	 $('.ui-widget-content.ui-autocomplete').slideUp();
	});
    /* INIT GO TO TOP BUTTON */initScrollTop();
		nrt_maps();
		click_cart();
});

$(document).ready(function(e) {
	if($(window).width() > 991){
		/* Sticky*/ sticky_unit();
	}
});

$(window).on('resize', function() {
	if($(window).width() > 991){
		/* Sticky*/ sticky_unit();
	}
});
function click_cart() {
	/* Cart */
	$('body').on('click','.click-cart',(function(e) {
		$(".cart_ajax").toggleClass('active_cart');
		e.stopPropagation();
    }));
	$('body').on('click','.cart_top_ajax',(function(e) {
		 e.stopPropagation();
    }));
	$("body").click(function(e) {
		 $(".cart_ajax").removeClass('active_cart');
    });
}


function sticky_unit() {
    /* INIT STICKY MENU */var _topSticky = $('#header').innerHeight();
    var _margintopSticky = $('#block-header-center').innerHeight();
    var sticky_all = 0;
    var sticky_Cart = 0;
    var sticky_Search = 0;
    if (typeof (NRT_stickySearch) != 'undefined' && NRT_stickySearch && typeof (NRT_stickyCart) != 'undefined' && NRT_stickyCart) {
	var sticky_all = 1;
    } else {
	if (typeof (NRT_stickySearch) != 'undefined' && NRT_stickySearch) {
	    var sticky_Search = 1;
	}
	if (typeof (NRT_stickyCart) != 'undefined' && NRT_stickyCart) {
	    var sticky_Cart = 1;
	}
    }
    if (typeof (NRT_stickyMenu) != 'undefined' && NRT_stickyMenu) {
	$(window).scroll(function() {
	    if ($(this).scrollTop() >= _topSticky) {
		$('#block-header-center').addClass('nrtmegamenu-sticky');
		$('#block-header-center').css({'position': 'fixed', 'z-index': '1028', 'top': '0', 'left': '0', 'right': '0'});
		$('#header').css({'margin-bottom': _margintopSticky});
		if (sticky_all) {
		   // $('.sticky_top').addClass('sticky-fixed-top');
		} else {
		    if (sticky_Search) {
			$('#search_block_top').addClass('sticky-fixed-top');
		    }
		    if (sticky_Cart) {
			$('#cart_block_top').addClass('sticky-fixed-top');
		    }
		}
		if (sticky_all || sticky_Cart || sticky_Search) {
		    var _containerPaddingRight = parseInt($('header .container').css('padding-right'));
		    var _containerPaddingLeft = parseInt($('header .container').css('padding-left'));
		    if (LANG_RTL != 1){
			$('.sticky-fixed-top').css({'right': ($('body').outerWidth() - $('.container').outerWidth()) / 2 + _containerPaddingRight});
		    } else {
			$('.sticky-fixed-top').css({'right': 'auto', 'left': ($('body').outerWidth() - $('.container').outerWidth()) / 2 + _containerPaddingLeft});
		    }
		}
	    } else {
			$('.sticky-fixed-top').css({'right': 'auto', 'left': ''});
			$('.sticky_top').removeClass('sticky-fixed-top');
			$('#search_block_top').removeClass('sticky-fixed-top');
			$('#cart_block_top').removeClass('sticky-fixed-top');
			$('#block-header-center').removeClass('nrtmegamenu-sticky');
			$('#block-header-center').attr('style','');
			$('#header').css({'margin-bottom': 0});
	    }
	});
		
		/*$(window).scroll(function() {
			if ($(this).scrollTop() >= _topSticky) {
			$('#header').addClass('nrtmegamenu-sticky');
			$('#header').css({'position': 'fixed', 'z-index': '1028', 'top': '0', 'left': '0', 'right': '0'});
			$('main').css({'margin-top': _margintopSticky});
			} else {
			$('#header').removeClass('nrtmegamenu-sticky');
			$('#header').attr('style','');
			$('main').css({'margin-top': 0});
			}
		});*/
    }
}
	
$(document).ready(function() {
    /* ITEM COUNTDOWNS */if (typeof (NRT_enableCountdownTimer) != 'undefined' && NRT_enableCountdownTimer) {
	$('.item-countdown-time').each(function() {
	    initCountdown($(this));
	});
	$('.item-countdown-time-circle').each(function() {
	    initCountdowncircle($(this));
	});
    }
    /* Load percent CMS */
    if (LANG_RTL != 1){
	LoadPercCMS();
    } else {
	LoadPercCMS_rtl();
    }
	collapseCMS();
});
function initCountdown(el) {
    el.countdown(el.attr('data-time')).on('update.countdown', function(event) {
	var format = '';
	if (event.offset.totalDays > 1) {
	    format = format + '<span class="section_cout"><span class="Days">%D </span><span class="text">' + countdownDays + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Days">%D </span><span class="text">' + countdownDay + '</span></span>';
	}
	if (event.offset.hours > 1) {
	    format = format + '<span class="section_cout"><span class="Hours">%H </span><span class="text">' + countdownHours + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Hours">%H </span><span class="text">' + countdownHour + '</span></span>';
	}
	if (event.offset.minutes > 1) {
	    format = format + '<span class="section_cout"><span class="Minutes">%M </span><span class="text">' + countdownMinutes + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Minutes">%M </span><span class="text">' + countdownMinute + '</span></span>';
	}
	if (event.offset.seconds > 1) {
	    format = format + '<span class="section_cout"><span class="Seconds">%S </span><span class="text">' + countdownSeconds + '</span></span>';
	} else {
	    format = format + '<span class="section_cout"><span class="Seconds">%S </span><span class="text">' + countdownSecond + '</span></span>';
	}
	el.html(event.strftime(format)).fadeIn();
    });
}
function initCountdowncircle(el) {
    el.countdown(el.attr('data-time')).on('update.countdown', function(event) {
	var format = '';
	
	var start=new Date(el.attr('data-time-from'));
	var end=new Date(el.attr('data-time'));
	var sumdays=new Date(end - start);
	sumdays=sumdays/1000/60/60/24;
	if (event.offset.totalDays > 1) {
		format = format + AddCountdownCircle(sumdays,event.offset.totalDays,'Days','%D',countdownDays);
	} else {
		format = format + AddCountdownCircle(sumdays,event.offset.totalDays,'Days','%D',countdownDay);
	}
	if (event.offset.hours > 1) {
		format = format + AddCountdownCircle(24,event.offset.hours,'Hours','%H',countdownHours);
	} else {
		format = format + AddCountdownCircle(24,event.offset.hours,'Hours','%H',countdownHour);
	}
	if (event.offset.minutes > 1) {		
		format = format + AddCountdownCircle(60,event.offset.minutes,'Minutes','%M',countdownMinutes);
	} else {
		format = format + AddCountdownCircle(60,event.offset.minutes,'Minutes','%M',countdownMinute);
	}
	if (event.offset.seconds > 1) {
		format = format + AddCountdownCircle(60,event.offset.seconds,'Seconds','%S',countdownSeconds);
	} else {
		format = format + AddCountdownCircle(60,event.offset.seconds,'Seconds','%S',countdownSecond);
	}
	el.html(event.strftime(format)).fadeIn();
    });
}
function AddCountdownCircle(a,b,c,d,e) {
	var half=a/2;
	var deg=180/half;
var format = '';	
if(b>half){	
format ='<div class="pie"><div class="clip1"><div class="slice1" style="transform: rotateZ('+(a-b)*(deg)+'deg);"></div></div><div class="clip2"><div class="slice2"></div></div><div class="pie2"></div><span class="section_cout"><span class="'+c+'">'+d+' </span><span class="text">' + e + '</span></span></div>';
}else{
format ='<div class="pie"><div class="clip1"><div class="slice1" style="transform: rotateZ(180deg);"></div></div><div class="clip2"><div class="slice2" style="transform:rotateZ('+(half-b)*(deg)+'deg)"></div></div><div class="pie2"></div><span class="section_cout"><span class="'+c+'">'+d+' </span><span class="text">' + e + '</span></span></div>';	
}
return format;
}
function initScrollTop() {
    var el = $('#back-top');
    el.on('click', function() {
	$('html, body').animate({scrollTop: 0}, '400');
    });
}
function collapseCMS() {
	$('body').on('click','.experience_box:not(.active) .navbar-toggler',(function(e) {
		$('.experience_box .navbar-toggler').siblings('.collapse').slideUp();
		$('.experience_box').removeClass('active');
        $(this).siblings('.collapse').slideDown();
		$(this).parent().addClass('active');
    }));
	$('body').on('click','.experience_box.active .navbar-toggler',(function(e) {
		$(this).siblings('.collapse').slideUp();
		$(this).parent().removeClass('active');
     }));
}
function LoadPercCMS() {
    $('.cms-line').each(function() {
	var t = $(this);
	var dataperc = t.attr('id'), dataperc_int = dataperc.replace("a", ""), barperc = Math.round(dataperc_int);
	t.find('.cms-line-comp').animate({width: barperc + "%"}, dataperc_int * 25);
	t.find('.label').append('<div class="perc"></div>');
	function perc() {
	    var t_length = parseInt($('.cms-line').css('width'));
	    var length = t.find('.cms-line-comp').css('width'), perc_div = (parseInt(length) / t_length * 100), perc = Math.round(parseInt(perc_div)), labelpos = (100 - perc);
	    t.find('.label').css('right', labelpos + '%');
	    t.find('.perc').text(perc + '%');
	}
	perc();
	setInterval(perc, 0);
    });
}
function LoadPercCMS_rtl() {
    $('.cms-line').each(function() {
	var t = $(this);
	var dataperc = t.attr('id'), dataperc_int = dataperc.replace("a", ""), barperc = Math.round(dataperc_int);
	t.find('.cms-line-comp').animate({width: barperc + "%"}, dataperc_int * 25);
	t.find('.label').append('<div class="perc"></div>');
	function perc() {
	    var t_length = parseInt($('.cms-line').css('width'));
	    var length = t.find('.cms-line-comp').css('width'), perc_div = (parseInt(length) / t_length * 100), perc = Math.round(parseInt(perc_div)), labelpos = (100 - perc);
	    t.find('.label').css('left', labelpos + '%');
	    t.find('.perc').text(perc + '%');
	}
	perc();
	setInterval(perc, 0);
    });
}
/*** Google Map ***/
function nrt_maps() {	
    var active = false;
    $('.nrt-maps').click(function() {
        $(this).addClass("active");
    });
    $('.nrt-maps').hover(function() {}, function() {
        if ($(this).hasClass('active')) {
            setTimeout(function() {
                $('.nrt-maps').removeClass('active');
            }, 1000);
        }
    });
}
function nrt_gmap_initialize( map_content_obj, address, zoom, map_type, title ){
        var geocoder, map;
        geocoder = new google.maps.Geocoder();

        geocoder.geocode( {'address': address}, function(results, status) {
                if( status == google.maps.GeocoderStatus.OK ){
                        var _ret_array =  new Array(results[0].geometry.location.lat(),results[0].geometry.location.lng());
                        map.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                                map: map
                                ,title: title
                                ,position: results[0].geometry.location
                        });
                }
        });

        var mapCanvas = map_content_obj.get(0);
        var mapOptions = {
                center: new google.maps.LatLng(44.5403, -78.5463)
                ,zoom: zoom
                ,mapTypeId: google.maps.MapTypeId[map_type]
                ,scrollwheel : true
                ,zoomControl : true
                ,panControl : true
                ,scaleControl : true
                ,streetViewControl : false
                ,overviewMapControl : true
                ,disableDoubleClickZoom : false
        }
        map = new google.maps.Map(mapCanvas, mapOptions)
}
$(window).bind('load resize', function(){
    if (typeof (NRT_GGMapsJava) != 'undefined' && NRT_GGMapsJava) {
        $('.nrt-maps').each(function(){
                var element = $(this);
                var map_content = $(this).find('> div');
                var address = element.data('address');
                var zoom = element.data('zoom');
                var map_type = element.data('map_type');
                var title = element.data('title');
                nrt_gmap_initialize( map_content, address, zoom, map_type, title );
        });
    }
});
/* Mobile*/
$(document).ready(function() {
	$('body').on('click','.nav-button:not(.active)',(function(e) {
        $('#wrapper-mobile').addClass('active');
		$('html').addClass('mobile-open');
		$('.wrapper-tab').removeClass('active');
		$('.wrapper-tab.' + $(this).attr('data-wrapper')).addClass('active');
		$('.nav-button').removeClass('active');
		$(this).addClass('active');
		e.stopPropagation();
    }));
	$('body').on('click','.nav-button.active',(function(e) {
        $('#wrapper-mobile').removeClass('active');
		$('html').removeClass('mobile-open');
		$(this).removeClass('active');
		e.stopPropagation();
    }));
});

$(window).on('resize', function() {
	if($(window).width() > 991){
        $('#wrapper-mobile').removeClass('active');
		$('html').removeClass('mobile-open');
		$('.nav-button').removeClass('active');
		$('.wrapper-tab').removeClass('active');
	}
});
/* Column*/
$(document).ready(function() {
	$('#bar-left-column').click(function(e) {
		$('#bar-right-column').removeClass('active');
		$(this).toggleClass('active');
        $('html').toggleClass('column-left-open');
		$('html').removeClass('column-right-open');
        $('#wrapper-mobile').removeClass('active');
		$('html').removeClass('mobile-open');
		$('.nav-button').removeClass('active');
    });
	$('#bar-right-column').click(function(e) {
		$('#bar-left-column').removeClass('active');
		$(this).toggleClass('active');
        $('html').toggleClass('column-right-open');
		$('html').removeClass('column-left-open');
        $('#wrapper-mobile').removeClass('active');
		$('html').removeClass('mobile-open');
		$('.nav-button').removeClass('active');
    });
});
$(window).on('resize', function() {
	if($(window).width() > 991){
        $('#bar-left-column').removeClass('active');
		$('#bar-right-column').removeClass('active');
		$('html').removeClass('column-right-open');
		$('html').removeClass('column-left-open');
	}
});