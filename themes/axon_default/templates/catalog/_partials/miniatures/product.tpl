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
<div class="item col-xs-6 col-sm-4 col-md-4">
             	<div class="item-inner">
                 <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                 <div class="left-product">
                      <a href="{$product.url}" title="{$product.name}">
                      	<span class="cover_image">
                            <img
                            class="img-responsive"
                              src = "{$product.cover.bySize.home_default.url}"
                              data-full-size-image-url = "{$product.cover.large.url}"
                              alt="{$product.name}"
                              {if isset($size_home_default.width)}width="{$size_home_default.width}"{/if}
                              {if isset($size_home_default.height)}height="{$size_home_default.height}"{/if}
                            >
                        </span> 
                        {if isset($product.images[1])}
                        <span class="hover_image">
                            <img 
                              class="img-responsive"
                              src = "{$product.images[1].bySize.home_default.url}"
                              data-full-size-image-url = "{$product.images[1].bySize.home_default.url}"
                              alt=""
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
                        {if $product.main_variants}
                        <div class="pick-color">
                                  {foreach from=$product.main_variants item=variant}
                                    <a href="{$variant.url}"
                                       class="{$variant.type}"
                                       title="{$variant.name}"
                                      {if $variant.html_color_code} style="background-color: {$variant.html_color_code}" {/if}
                                      {if $variant.texture} style="background-image: url({$variant.texture})" {/if}>
                                    </a>
  								  {/foreach}
                          </div>
                          {/if}
                        <div class="button-action-product">
                            <form action="{$pages_cart}" method="post">
                                    {if isset($NRT_quickView) && $NRT_quickView}
                                      <a href="javascript:void(0)" class="button-action quick-view" data-link-action="quickview" title="{l s='Quick view'}">
                                            <i class="fa fa-search"></i>
                                      </a>
                                   {/if}
                                   {if !isset($is_catalog_mode)}
                                        <input type="hidden" name="token" value="{$static_token}">
                                        <input type="hidden" name="id_product" value="{$product.id}">
                                        <button class="button-action" data-button-action="add-to-cart" type="submit" {if !$product.quantity && !isset($order_out_of_stock)}disabled{/if}>
                                        {if $product.quantity || isset($order_out_of_stock)}
                                            <i class="fa fa-shopping-basket"></i>
                                        {else}
                                            <i class="fa fa-ban"></i>
                                        {/if}  
                                        </button>
                                  {/if}
                                  {hook h='displayProductListFunctionalButtons' product=$product}
                                  {hook h='buttoncompare' product=$product}
                            </form>
                        </div>
                    </div>  
                    <div class="right-product">       
                        <div class="product-description">
                            <div class="product_name" itemprop="name">
                                <a href="{$product.url}">{$product.name|truncate:20:'...'}</a>
                                <span class="category_default">{$product.category_name}</span>
                            </div>    					
                            {if $product.show_price}
                              <div class="product-price-and-shipping">
                                {hook h='displayProductPriceBlock' product=$product type="before_price"}
                                <span class="label_price">{l s='Price:'}</span>
                                <span class="price">{$product.price}</span>
                    			{if $product.has_discount}
                                  {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                  <span class="line_product"></span>
                                  <span class="regular-price">{$product.regular_price}</span>
                                {/if}
                                {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                {hook h='displayProductPriceBlock' product=$product type='weight'}
                              </div>
                            {/if}
                            {hook h='displayProductListReviews' product=$product}
                        </div>
                        
                    </div>
                </div>
                
           </div>
</div>
