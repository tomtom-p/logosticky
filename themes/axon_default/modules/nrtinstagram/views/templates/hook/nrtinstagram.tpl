{if isset($instagram_pics) && $instagram_pics|count > 0}
<div class="block_instagram tab-content block">
	<div class="bg_instagram title_font hidden-md-down">{l s='Instagram'}</div>
	<div class="row">
    	<div class="col-md-4 col-xs-12">
            <div class="content_title">
                <h4 class="title_block title_font">
                    <a class="title_text" href="https://www.instagram.com/{$instagram_user.username}/" target="_blank" rel="nofollow">{l s='#AxonCloset'}</a>
                </h4>
            	<p>{l s='Become our style icon. Tag us on
Instagram or Twitter and get featured'}</p>
            </div>
        </div>
        <div class="col-md-8 col-xs-12">
        	<ul>
            	{assign var="i" value="1"}
                {foreach $instagram_pics as $pic}
                    <li {if $i == 4 }class="colspan_left"{else if $i == 5 }class="colspan_right"{/if}>
                        <a href="{$pic.link}" title="{$pic.caption|escape:'html':'UTF-8'}" target="_blank" rel="nofollow">					
                            <img src="{$pic.image}" class="img-responsive" alt="" width="{$pic.image_width}" height="{$pic.image_height}" />
                            <span class="text-center">
                                <i class="fa fa-heart"></i><span>{$pic.likes}</span>&nbsp;&nbsp;
                                <i class="fa fa-comment"></i><span>{$pic.comments}</span>
                            </span>
                        </a>
                    </li>
                    {assign var="i" value="`$i+1`"}
                    {if $i == 8 }{assign var="i" value="1"}{/if}
                {/foreach}
            </ul>
        </div>
	</div>
</div>
{/if}