<!-- MODULE News Products Products -->
<div class="nrtbestsellers {if isset($nodecontent.ar) && $nodecontent.ar ==0}arrows_center{elseif isset($nodecontent.ar) && $nodecontent.ar ==1}arrows_oncolum{/if}">
{if isset($nodecontent.title) && $nodecontent.title != ''}
    {if isset($nodecontent.href) && $nodecontent.href != ''}
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}<div class="content_title">{/if}
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}
              <p>{$nodecontent.legend}</p>
        {/if}
        <h4 class="title_block title_font">
            <a class="title_text" href="{$nodecontent.href}">
                {$nodecontent.title} 
            </a>
        </h4>
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}</div>{/if}
    {else}
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}<div class="content_title">{/if}
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}
              <p>{$nodecontent.legend}</p>
        {/if}
        <h4 class="title_block title_font">
            <span class="title_text">
                {$nodecontent.title} 
            </span>
        </h4>
        {if isset($nodecontent.legend) && $nodecontent.legend != ''}</div>{/if}
    {/if}
{/if}      
{if $nodecontent.view==1}
	{include file="product-home-slider.tpl" nodecontent=$nodecontent image_types=$images_types}
{else $nodecontent.view==2}
	{include file="product-home-small-slider.tpl" nodecontent=$nodecontent image_types=$images_types}
{/if}   
</div>
<!-- /MODULE News Products -->


