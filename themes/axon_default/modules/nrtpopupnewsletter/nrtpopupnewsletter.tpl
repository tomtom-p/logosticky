	{if $nrt_ppp.NRT_NEWSLETTER == 1}
<div id="moda_popupnewsletter" class="modal fade nrtpopup" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document" style="max-width:{if $nrt_ppp.NRT_WIDTH}{$nrt_ppp.NRT_WIDTH}px;{else}100%{/if};">
    <div class="modal-content">
<div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         <span aria-hidden="true">×</span>
       </button>
 </div>
<div class="nrtpopupnewsletter" style="{if $nrt_ppp.NRT_WIDTH}width:{$nrt_ppp.NRT_WIDTH}px;{/if}{if $nrt_ppp.NRT_HEIGHT}height:{$nrt_ppp.NRT_HEIGHT}px;{/if}{if $nrt_ppp.NRT_BG == 1 && !empty($nrt_ppp.NRT_BG_IMAGE)}background-image: url({$nrt_ppp.NRT_BG_IMAGE});{/if}">
	<div id="newsletter_block_popup">
		<div class="block_content">
		{if isset($msg) && $msg}
			<p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
		{/if}
			<form action="{$link->getPageLink('index')|escape:'html'}" method="post">
                            {if $nrt_ppp.NRT_TITLE}<div class="popup_title title_font">{$nrt_ppp.NRT_TITLE|stripslashes nofilter}</div>{/if}
                            {if $nrt_ppp.NRT_TEXT}<div class="popup_text">{$nrt_ppp.NRT_TEXT|stripslashes nofilter}</div>{/if}
                            {if isset($nrt_ppp.NRT_COUNTDOWN_POPUP) && !empty($nrt_ppp.NRT_COUNTDOWN_POPUP) && $nrt_ppp.NRT_COUNTDOWN_POPUP != '0000-00-00 00:00:00'}
                                <span class="item-countdown">
                                    <span class="bg_tranp"></span>
                                    <span class="item-countdown-time" data-time="{$nrt_ppp.NRT_COUNTDOWN_POPUP}"></span>
                                </span>
                            {/if}
                            <div class="send-response"></div>
                            <input class="inputNew form-control" id="newsletter-input-popup" type="text" name="email" placeholder="{l s='Enter Email Address Here'}"/>
                            <div class="send-reqest button_unique main_color_hover title_font">{l s='Subscribe'}</div>
			</form>
		</div>
                <div class="newsletter_block_popup-bottom">
                    <input id="newsletter_popup_dont_show_again" type="checkbox">
                    <label for="newsletter_popup_dont_show_again">{l s='Don\'t show this popup again'}</label>
                </div>
	</div>
</div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	{/if}