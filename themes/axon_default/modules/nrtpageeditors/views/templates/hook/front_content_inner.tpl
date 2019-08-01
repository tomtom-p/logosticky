{*
	* 2007-2014 PrestaShop
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
	*  @author    PrestaShop SA <contact@prestashop.com>
	*  @copyright 2007-2014 PrestaShop SA
	*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
	*  International Registered Trademark & Property of PrestaShop SA
	*}

	
{if $node.type==2 || $node.type==4}
    {if isset($node.content_s.title)}
        {if isset($node.content_s.href)}
        {if isset($node.content_s.legend)}<div class="content_title">{/if}
        <h4 class="title_block title_font">
            <a class="title_text" href="{$node.content_s.href}">
                {$node.content_s.title} 
            </a>
        </h4>
        {if isset($node.content_s.legend)}
              <p>{$node.content_s.legend}</p>
        {/if}
        {if isset($node.content_s.legend)}</div>{/if}
        {else}
        {if isset($node.content_s.legend)}<div class="content_title">{/if}
        <h4 class="title_block title_font">
            <span class="title_text">
                {$node.content_s.title} 
            </span>
        </h4>
        {if isset($node.content_s.legend)}
              <p>{$node.content_s.legend}</p>
        {/if}
        {if isset($node.content_s.legend)}</div>{/if}
        {/if}
    {/if}
    {if $node.contentType==1}
    
        {if isset($node.content.ids) && $node.content.ids}
            {$node.content.ids nofilter}
        {/if}

    {elseif $node.contentType==2}
        {if isset($node.content.products)}
                {if $node.content.view==0}
                   {include file="product-home-grid.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==1}
                    {include file="product-home-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==2}
                   {include file="product-home-small-grid.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==3}
                    {include file="product-home-small-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype} 
                {else}
                    {include file="product-home-full-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype} 
                {/if}
        {/if}

    {elseif $node.contentType==4}
        {if isset($node.content.ids)}
                {if $node.content.view==0}
                   {include file="product-home-grid.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==1}
                    {include file="product-home-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==2}
                   {include file="product-home-small-grid.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype}
                {elseif $node.content.view==3}
                    {include file="product-home-small-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype} 
                {else}
                     {include file="product-home-full-slider.tpl" nodecontent=$node.content image_types=$images_types image_type=$node.content.itype} 
                {/if}
        {/if}
    {elseif $node.contentType==6}
        {if isset($node.content.source)}			
            <a {if isset($node.content.href)}href="{$node.content.href}" {if isset($node.content.window) && $node.content.window == 1}target="_blank"{/if} {/if}>
                <img src="{$node.content.source}" class="img-responsive banner-image" alt=" " width="auto" height="auto" />
            </a>
        {/if}
    {elseif $node.contentType==7}
        {if $node.content.view == 1}
            {include file="manufacturer-home-slider.tpl" nodecontent=$node.content manufacturerSize=$manufacturerSize} 
        {else}
            {include file="manufacturer-home-grid.tpl" nodecontent=$node.content manufacturerSize=$manufacturerSize} 
        {/if}
    {elseif $node.contentType==8}
        {hook h=$node.content.hook}
    {elseif $node.contentType==9}	
        {$node.content.module nofilter} 
    {/if}
{/if}
