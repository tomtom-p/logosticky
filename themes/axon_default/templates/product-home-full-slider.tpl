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
        {assign var='imageSize' value='medium_default'} 
    {/if}
    <div class="products slider_carousel horizontal_mode product-full{if $nodecontent.line_lg} lady_load_img{/if}" data-filter-carousel="1,1,1,{$nodecontent.ap},1,{$nodecontent.dt},{$nodecontent.ar},5000,{$nodecontent.line_ms}">
        <div class="row" style="margin:0">
            <div class="owl-carousel owl-theme">
                {assign var="i" value="0"}
        {if isset($nodecontent.colnb) && $nodecontent.colnb}{assign var="y" value=$nodecontent.colnb}{else}{assign var="y" value=1}{/if}
        {foreach from=$nodecontent.products item="product"} 
            <div class="item">
                <div class="item-inner{if isset($product.images[1])} second_image{/if}">
                    <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                        <div class="row" style="margin:0">
                            <div class="col-md-6 col-xs-12 left-product-fix">
                                <div class="left-product">
                                    <a href="{$product.url}" title="{$product.name}">
                                        <span class="cover_image">
                                            <img
                                                class="{if $nodecontent.line_lg}owl-lazy{/if} img-responsive"
                                                {if $nodecontent.line_lg}data-{/if}src = "{$product.cover.bySize[{$imageSize}].url}"
                                                {if $nodecontent.line_lg}src="#"{/if}
                                                alt=""
                                                {if isset($image_type) && isset($image_types[$imageSize])}  width="{$image_types[$imageSize].width}" height="{$image_types[$imageSize].height}"{/if}
                                                >
                                        </span>  
                                        {if isset($product.images[1])}
                                            <span class="hover_image" data-src-img="{$product.images[1].bySize[{$imageSize}].url}"></span>
                                        {/if}             
                                    </a> 
                                    {* {if isset($product.show_condition) && $product.condition.type == "new" && $product.show_condition == 1  && isset($product.new) && $product.new == 1 }
                                    <span class="new_product"><span>{l s='New'}</span></span>
                                    {/if} 
                                    {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                                    <span class="sale_product"><span>{l s='Sale'}</span></span>
                                    {/if}  *}
                                </div>
                            </div> 
                            <div class="col-md-7 col-xs-12 right-product-fix">
                                <div class="right-product-full"> 
                                    <div class="product-description">
                                	 <div class="category_default">{$product.category_name}</div>
                                        <div class="product_name" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div>
                                        {if $product.show_price}
                                            <div class="product-price-and-shipping">
												<span class="lable">{l s='Price: '}</span>
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
                                        <div class="product-comment-avg">
                                            <span class="lable">{l s='Rating: '}</span>
                                            {hook h='displayProductListReviews' product=$product}
                                        </div>
                                        <div class="description-short">{$product.description_short nofilter}</div> 
                                        <div class="button-action-product-full">
                                        <form action="{$urls.pages.cart}" method="post">
                                            <input type="hidden" name="token" value="{$static_token}">
                                            <input type="hidden" name="id_product" value="{$product.id}">
                                              <button class="button-action-full" data-button-action="add-to-cart" type="submit" {if !$product.quantity && !isset($order_out_of_stock)}disabled{/if}>
                                              {if $product.quantity || isset($order_out_of_stock)}
                                                    {l s='By Now'}
                                              {else}
                                                    {l s='Out of stock'}
                                              {/if}  
                                              </button>
                                        </form>
                                        <a href="{$product.url}" class="button-action-full" title="{l s='Read more'}">
                                            {l s='Read more'}
                                        </a>
                                       </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        {/foreach}	
    </div>
</div>
</div>
{else}
    <p class="alert alert-warning" style="clear:both;margin-bottom:30px;">{l s='No products at this time.'}</p>
{/if}
