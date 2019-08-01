{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($NRTSLS_SLIDESHOW) && $NRTSLS_SLIDESHOW && !empty($NRTSLS_SLIDESHOW) && $page.page_name=='index'}

	{assign var="moduleclass_sfx" value=( isset( $NRTSLS_CLASSSFX ) ) ?  $NRTSLS_CLASSSFX : ''}
	<div class="nrt-main-slider {$moduleclass_sfx}" style="overflow: hidden; position:relative;">
    <div id="max_width_ct" class="container" style="opacity:0;"></div>
    		<div class="loading" style="height:{$NRTSLS_SLHEIGHT}px">
		        <div class="bg-loading"></div>
		        <div class="icon-loading"></div>
		    </div>
		<div id="insideslider_mod" class="outer-slide" style="width: {$NRTSLS_SLWIDTH}px; height: {$NRTSLS_SLHEIGHT}px">
		    <div data-u="slides" style="width: {$NRTSLS_SLWIDTH}px; height: {$NRTSLS_SLHEIGHT}px">
            {assign var="i" value="0"}
				{foreach from=$NRTSLS_SLIDESHOW item=slide name=slides}
                 {assign var="i" value="`$i+1`"}
				<div class="{if $slide.porder==0}position_center{else if $slide.porder==1}position_left{else}position_right{/if}">
                    <a {if isset($slide.link) && !empty($slide.link)}href="{$slide.link}"{else}href="#"{/if}>
                    <img class="img-slider" src="{$slide.image}" alt="" data-u="image">
                     </a>
                     <div class="box-slider">
					{if isset($slide.title1) && !empty($slide.title1)}
					<div class="large-slide-title title_font"  data-u="caption" {if $i == 1}data-t="T-*IB" data-t2="ZML|TR" data-d="-300"{elseif $i == 2}data-t="ZM*JUP1|T" data-t2="FLTTRWN|LT"{else}data-t="ZM*WVR|RT" data-t2="WVC|B" data-d="-300"{/if}>
						{$slide.title1 nofilter}
					</div>
					{/if}
					{if isset($slide.title2) && !empty($slide.title2)}
					<div class="big-slide-title title_font" data-u="caption" {if $i == 1}data-t="ZM*WVR|LB" data-t2="WVC|R" data-d="-300"{elseif $i == 2}data-t="ZM*JUP1|T" data-t2="FLTTRWN|LT"{else}data-t="ZM*WVR|LB" data-t2="WVC|T" data-d="-300"{/if}>
						{$slide.title2 nofilter}
					</div>
					{/if}
                                        {if isset($slide.description) && !empty($slide.description)}
					<div class="small-slide-title"  data-u="caption" {if $i == 1}data-t="TORTUOUS|HL" data-t2="JDN|B" data-d="-300"{elseif $i == 2}data-t="ZM*JUP1|L" data-t2="TORTUOUS|HL"{else}data-t="DDGDANCE|RB" data-t2="WVC|T" data-d="-300"{/if}>
						{$slide.description nofilter}
					</div>
                                        {/if}
                                        {if isset($NRTSLS_SHOWBUTTON) && $NRTSLS_SHOWBUTTON && $slide.link && !empty($slide.btntext)}
					<div class="div-slide-button shop_now" data-u="caption" {if $i == 1}data-t="B-R*"{elseif $i == 2}data-t="ZM*JUP1|B"{else}data-t="ZM*WVR|LB" data-t2="WVC|T" data-d="-300"{/if}>
						<a class="slide-button title_font" href="{$slide.link}">
							{$slide.btntext nofilter}
						</a>
					</div>
                        {/if}
                      </div>
                </div>
				{/foreach}
		    </div> 
            {*<div data-u="navigator">
		        <div data-u="prototype"></div>
		    </div>*}
            <span data-u="arrowleft"><i class="fa fa-long-arrow-left"></i></span>
			<span data-u="arrowright"><i class="fa fa-long-arrow-right"></i></span>
		</div>
		<script>
		    $(document).ready(function () {
                        var _SlideshowTransitions = [ {$NRTSLS_SLIDETRANSITIONS} ];
		        var _CaptionTransitions = [];
		        	{$NRTSLS_CAPTIONTRANSITIONS nofilter}
		        var options = {
		            $FillMode: 2,
		            {if $NRTSLS_AUTOPLAY} $AutoPlay: true, {else} $AutoPlay: false, {/if}
		            {if $NRTSLS_DELAY} $AutoPlayInterval: {$NRTSLS_DELAY}, {/if}
		            {if $NRTSLS_PAUSEONHOVER} $PauseOnHover: 1, {else} $PauseOnHover: 0, {/if}

		            $ArrowKeyNavigation: true,
		            $SlideEasing: $JssorEasing$.$EaseOutQuint,
		            $SlideDuration: 800,
		            $MinDragOffsetToSlide: 20,
		            
		            
		            $SlideSpacing: 0,
		            $DisplayPieces: 1,
		            $ParkingPosition: 0,
		            $UISearchMode: 1,
		            $PlayOrientation: 1,
		            $DragOrientation: 1,
		                
		            $SlideshowOptions: {
		                $Class: $JssorSlideshowRunner$,
		                $Transitions: _SlideshowTransitions,
		            	{if $NRTSLS_SLTRANSITIONSRAND} $TransitionsOrder: 0, {else} $TransitionsOrder: 1, {/if}
		                $ShowLink: true
		            },
		            	
		            $CaptionSliderOptions: {
		                $Class: $JssorCaptionSlider$,
		                $CaptionTransitions: _CaptionTransitions,
		                $PlayInMode: 10,
		                $PlayOutMode: 4
		            },

		            $BulletNavigatorOptions: {
		                $Class: $JssorBulletNavigator$,
		                $ChanceToShow: 2,
		                $AutoCenter: 1,
		                $Steps: 1,
		                $Lanes: 1,
		                $SpacingX: 8,
		                $SpacingY: 8,
		                $Orientation: 1
		            },

		            $ArrowNavigatorOptions: {
		                $Class: $JssorArrowNavigator$,
		                $ChanceToShow: 2,
		                $AutoCenter: 2,
		                $Steps: 1
		            }
		        };

		        var insideslider_mod = new $JssorSlider$("insideslider_mod", options);
		        
				$('.homepage-slideshow [data-u="arrowleft"]').on('click', function(){
					insideslider_mod.$Prev();
				});
				$('.homepage-slideshow [data-u="arrowleft"]').on('click', function(){
					insideslider_mod.$Next();
				}); 
		        
		        function ScaleSlider() {
		        	var cfgWidth = {$NRTSLS_SLWIDTH};
		        	var cfgHeight = {$NRTSLS_SLHEIGHT};
		            var parentWidth = insideslider_mod.$Elmt.parentNode.clientWidth;
		            var slideCurrWidth = $('#insideslider_mod').outerWidth();
					if($(window).width() > 1199){
		            	var baseWidthMax = $('#max_width_ct').width();
					}else{
						var baseWidthMax = 1170;
					}
		            var slideWrapRate = baseWidthMax / cfgHeight;
		            var arrowleft = $('#insideslider_mod [data-u="arrowleft"]');
		            var arrowright = $('#insideslider_mod [data-u="arrowright"]');
					if(cfgWidth <= baseWidthMax) {
						arrowleft.css({ 'left' : 30 });
						arrowright.css({ 'right' : 30 });
						$('.position_left .box-slider').css({ 'left' : 30 });
						$('.position_right .box-slider').css({ 'right' : 30 });
						
					} else {
						arrowleft.css({ 'left' : ((cfgWidth - baseWidthMax) / 2)});
						arrowright.css({ 'right' : ((cfgWidth - baseWidthMax) / 2)});
						$('.position_left .box-slider').css({ 'left' : ((cfgWidth - baseWidthMax) / 2)});
						$('.position_right .box-slider').css({ 'right' : ((cfgWidth - baseWidthMax) / 2)});
					}
		            $('#insideslider_mod').css({ 'left' : '50%', 'margin-left' : -(slideCurrWidth / 2) })
					if (parentWidth){
			            if(cfgWidth > baseWidthMax) {
				            if (parentWidth <= baseWidthMax) {
				            	insideslider_mod.$ScaleHeight(parentWidth / slideWrapRate);
				            } else {
				            	insideslider_mod.$ScaleHeight(cfgHeight);
				            }
			            } else {
				            insideslider_mod.$ScaleWidth(Math.min(cfgWidth, parentWidth));
			            }
		            } else {
		                window.setTimeout(ScaleSlider, 30);
					}
		        }
		        ScaleSlider();
		        if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
		            $(window).on('resize', ScaleSlider);
		        }
		        
		        $(window).bind("load", ScaleSlider);
                        $(window).bind("resize", ScaleSlider);
                        $(window).bind("orientationchange", ScaleSlider);
		    });
		    $(document).ready(function(e) {
               $('.nrt-main-slider .loading').fadeOut(); 
            });
		</script>
	</div>
{/if}