    <div class="nrt-slideshow-container">
	<div class="flexslider nrt-nivoslider block">
        <div class="nrt-loading"></div>
            <div id="nrt-slideshow-home" class="slides">
                {$count=0}
                {foreach from=$slides key=key item=slide}
                    {if $slide.link}
                            <a href="{$slide.link}"><img style ="display:none" src="{$slide.image}" alt="#htmlcaption{$slide.id_nrtbannerslider}"  /></a>
                    {else}
                            <img style ="display:none" src="{$slide.image}" alt="#htmlcaption{$slide.id_nrtbannerslider}"  />
                    {/if}
                {/foreach}
            </div>
            {if $slideOptions.show_caption != 0}
                {foreach from=$slides key=key item=slide}
                    <div id="htmlcaption{$slide.id_nrtbannerslider}" class="nrt-slideshow-caption nivo-html-caption nivo-caption">
                            {if $slide.title}
                            <div class="nrt-slideshow-title">
                                   <h3>{$slide.title}</h3>
                            </div>
                            {/if}
                            {if $slide.description}
                            <div class="nrt-slideshow-des">
                                    <strong>{$slide.description}</strong>
                            </div>
                            {/if}
                            {if $slide.link}
                            <div class="nrt-slideshow-readmore">
                                <a href="{$slide.link}">{l s=('Read more')}</a>	
                            </div>
                            {/if}
                    </div>
                 {/foreach}
             {/if}
        </div>
    </div>
 <script type="text/javascript">
    $(document).ready(function() {
        $('#nrt-slideshow-home').nivoSlider({
			effect: '{if $slideOptions.animation_type != ''}{$slideOptions.animation_type}{else}random{/if}',
			slices: 15,
			boxCols: 8,
			boxRows: 4,
			animSpeed: '{if $slideOptions.animation_speed != ''}{$slideOptions.animation_speed}{else}600{/if}',
			pauseTime: '{if $slideOptions.pause_time != ''}{$slideOptions.pause_time}{else}5000{/if}',
			startSlide: {if $slideOptions.start_slide != ''}{$slideOptions.start_slide}{else}0{/if},
			directionNav: {if $slideOptions.show_arrow != 0}{$slideOptions.show_arrow}{else}false{/if},
			controlNav: {if $slideOptions.show_navigation != 0}{$slideOptions.show_navigation}{else}false{/if},
			controlNavThumbs: false,
			pauseOnHover: true,
			manualAdvance: false,
			prevText: 'Prev',
			nextText: 'Next',
                        afterLoad: function(){
                         $('.nrt-loading').css("display","none");
                        },     
                        beforeChange: function(){ 
                            $('.nrt-slideshow-title, .nrt-slideshow-des').css("left","-100%" );
                            $('.nrt-slideshow-readmore').css("left","-100%"); 
                        },
                        afterChange: function(){ 
                            $('.nrt-slideshow-title, .nrt-slideshow-des, .nrt-slideshow-readmore').css("left","0") 
                        }
 		});
    });
    </script>
