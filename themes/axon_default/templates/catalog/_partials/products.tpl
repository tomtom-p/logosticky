{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{if Configuration::get('PS_ORDER_OUT_OF_STOCK')}
{assign var="order_out_of_stock" value='ok'}
{/if}
{if Configuration::get('PS_CATALOG_MODE')}
{assign var="is_catalog_mode" value='ok'}
{/if}
{assign var="NRT_quickView" value=Configuration::get('NRT_quickView')}
{assign var="pages_cart" value=Context::getContext()->link->getPageLink('cart')}
{assign var="static_token" value=Tools::getToken(false)}
<div id="js-product-list">
  <div class="products">
      <div id="box-product-grid" class="row horizontal_mode">
            {foreach from=$listing.products item="product"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product}
              {/block}
            {/foreach}
      </div>
      <div id="box-product-list">
                {foreach from=$listing.products item="product"}
                	<div class="item-product-list">
<div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
					<div class="row flex_row">
					<div class="item-productlist"> 
                    <div class="left-product">
                        <a href="{$product.url}" class="thumbnail product-thumbnail">
                            <span class="cover_image">
                                <img class="img-responsive"
                                  src = "{$product.cover.bySize.home_default.url}"
                                  data-full-size-image-url = "{$product.cover.large.url}"
                                  alt="{$product.name}"
                                  {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                                  {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if}
                                >
                            </span>
                            {if isset($product.images[1])}
                            <span class="hover_image">
                                <img  class="img-responsive"
                                src = "{$product.images[1].bySize.home_default.url}"
                                data-full-size-image-url = "{$product.images[1].bySize.home_default.url}"
                                alt="{$product.name}"
                                {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                                {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if}
                                > 
                            </span>
                        {/if}               
                        </a> 
                        {if isset($product.show_condition) && isset($product.condition.type) && $product.show_condition == 1}
                            <span class="new_product"><span>{$product.condition.type}</span></span>
                        {/if} 
                        {if $product.has_discount}
                         {if $product.discount_type === 'percentage'}
                            <span class="sale_product"><span>{$product.discount_percentage}</span></span>
                         {/if}
                        {/if}
                        {if isset($NRT_quickView) && $NRT_quickView}
                          <a href="javascript:void(0)" class="button-action-view quick-view" data-link-action="quickview">
                            <i class="fa fa-search"></i>
                          </a>
                        {/if}
                    </div> 
                    </div>
                    <div class="item-productlist"> 
                   <div class="right-product">       
                        <div class="description-product">
                            <div class="product_name" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div>          
                            {if $product.show_price}
                              <div class="product-price-and-shipping">
                                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                <span class="price">{$product.price}</span>
                    			{if $product.has_discount}
                                  {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                  <span class="regular-price">{$product.regular_price}</span>
                                {/if}
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                              </div>
                            {/if}
                            {hook h='displayProductListReviews' product=$product}
                        </div>
                        <div class="decriptions-short">
                        {$product.description_short nofilter}
                        </div>
                       <div class="product-availability-list">
                          {if $product.show_availability && $product.availability_message}
                            {if $product.availability == 'available'}
                              <i class="fa fa-check"></i>
                            {elseif $product.availability == 'last_remaining_items'}
                              <i class="fa fa-warning"></i>
                            {else}
                              <i class="fa fa-ban"></i>
                            {/if}
                            {$product.availability_message}
                          {/if}
                        </div>
                        <div class="variant-links-list">
                          {foreach from=$product.main_variants item=variant}
                            <a href="{$variant.url}"
                               class="{$variant.type}"
                               title="{$variant.name}"
                               {*
                                  TODO:
                                    put color in a data attribute for use with attr() as soon as browsers support it,
                                    see https://developer.mozilla.org/en/docs/Web/CSS/attr
                                *}
                              {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
                              {if $variant.texture} style="background-image: url({$variant.texture})" {/if}
                            ><span class="sr-only">{$variant.name}</span></a>
                          {/foreach}
                        </div>
                        <form action="{$pages_cart}" method="post">
                        	{if !isset($is_catalog_mode)}
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}">
                                <button class="button-action" data-button-action="add-to-cart" type="submit" {if !$product.quantity && !isset($order_out_of_stock)}disabled{/if}>
                                {if $product.quantity || isset($order_out_of_stock)}
                                <i class="fa fa-shopping-basket"></i>
                                <span class="bg">
                                    <span class="text">
                                    {l s='Add to cart'}
                                    </span>
                                </span>
                                {else}
                                <i class="fa fa-ban"></i>
                                <span class="bg">
                                    <span class="text">
                                    {l s='Out of stock'}
                                    </span>
                                </span>   
                                {/if}  
                                </button>
                            {/if}  
                            {hook h='displayProductListFunctionalButtons' product=$product}
                            {hook h='buttoncompare' product=$product}
                        </form>
                    </div>   
                    </div>  
                    </div>          
                            </div>
                    </div>
                {/foreach}
        </div>
      </div>

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}
<script type="text/javascript">
$(document).ready(function () {
	$(".click-product-grid").click(function(e) {
		$("body").removeClass("active_list");
        $("body").addClass("active_grid");
		setCookie('status_list_product','active_grid',1);
    });
	$(".click-product-list").click(function(e) {
        $("body").removeClass("active_grid");
		$("body").addClass("active_list");
		setCookie('status_list_product','active_list',1);
    });
	if(getCookie('status_list_product')!=="" && getCookie('status_list_product')!=="active_grid"){
		$("body").removeClass("active_grid");
		$("body").addClass("active_list");
	}
});

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}
</script>
</div>

