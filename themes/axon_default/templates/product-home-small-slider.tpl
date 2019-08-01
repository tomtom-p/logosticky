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
{if isset($nodecontent.products) && $nodecontent.products}
	{if isset($image_type) && isset($image_types[$image_type])}  
			{assign var='imageSize' value=$image_types[$image_type].name}
		{else}
			{assign var='imageSize' value='small_default'} 
	{/if}
 <div class="products slider_carousel vertical_mode{if $nodecontent.line_lg} lady_load_img{/if}" data-filter-carousel="{$nodecontent.line_md},{$nodecontent.line_sm},{$nodecontent.line_xs},{$nodecontent.ap},1,{$nodecontent.dt},{$nodecontent.ar},5000,{$nodecontent.line_ms}">
 <div class="row">
 <div class="owl-carousel owl-theme">
        {assign var="i" value="0"}
        {if isset($nodecontent.colnb) && $nodecontent.colnb}{assign var="y" value=$nodecontent.colnb}{else}{assign var="y" value=1}{/if}
              {foreach from=$nodecontent.products item="product"} 
                    {if $i mod $y eq 0}
                    <div class="item">
                    {/if}
             	<div class="item-inner {if isset($product.images[1])} second_image{/if}">
                 <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                <div class="left-product">
                      <a href="{$product.url}" title="{$product.name}">
                      <span class="cover_image">
                            <img
                              class="{if $nodecontent.line_lg}owl-lazy{/if} img-responsive"
                              {if $nodecontent.line_lg}data-{/if}src = "{$product.cover.bySize[{$imageSize}].url}"
                              {if $nodecontent.line_lg}src="#"{/if}
                              alt=""
                              {if isset($image_type) && isset($image_types[$image_type])}  width="{$image_types[$image_type].width}" height="{$image_types[$image_type].height}" {elseif isset($image_types['small_default'])} width="{$image_types['small_default'].width}" height="{$image_types['small_default'].height}" {/if}
                            >
                        </span>  
                      {if isset($product.images[1])}
                        <span class="hover_image" data-src-img="{$product.images[1].bySize[{$imageSize}].url}"></span>
                       {/if}       
                      </a>   
                      {if $product.has_discount}
                      {if $product.discount_type === 'percentage'}
                        <span class="discount-percentage-product">{$product.discount_percentage}</span>
                      {/if}
                      {/if}
                      <a href="{$product.url}" class="view-product" title="{l s='view detail' mod='nrtbestsellers'}">
                            <i class="fa fa-link"></i> 
                     </a>
                    </div>  
                    <div class="right-product">       
                        <div class="product-description">
                        	<div class="category_default">{$product.category_name}</div>
                            <div class="product_name" itemprop="name"><a href="{$product.url}">{$product.name|truncate:20:'...'}</a></div>          
                            {if $product.show_price}
                              <div class="product-price-and-shipping">
                                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                <span class="label_price">{l s='Price :'}</span>
                                <span class="price">{$product.price}</span>
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                              </div>
                            {/if}
                            {hook h='displayProductListReviews' product=$product}
                        </div>
                          
                    </div>
                </div>
                
           </div>
                    {assign var="i" value="`$i+1`"}
                   {if $i mod $y eq 0 || $i eq count($nodecontent.products)}
                    </div>
                    {/if}
            {/foreach}	
            </div>
    </div>
 </div>
{else}
    <p class="alert alert-warning" style="clear:both;margin-bottom:30px;">{l s='No products at this time.'}</p>
{/if}
