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
<div class="images-container">
  {block name='product_cover'}
    <div class="product-cover">
      <img class="js-qv-product-cover img-responsive" src="{$product.cover.bySize.large_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image"
            {if isset($size_large_default.width)}width="{$size_large_default.width}"{/if}
            {if isset($size_large_default.height)}height="{$size_large_default.height}"{/if}
      >
      <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
        <i class="fa fa-arrows-alt zoom-in"></i>
      </div>
      <p>{l s='Scroll mouse to zoom in or zoom out'}</p>
    </div>
  {/block}
  {block name='product_images'}
    <div class="js-qv-mask mask">
      <div class="product-images slider-images-detail owl-carousel owl-theme js-qv-product-images">
        {foreach from=$product.images item=image}
          <div class="thumb-container">
            <img
              class="thumb owl-lazy js-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
              data-image-medium-src="{$image.bySize.medium_default.url}"
              data-image-large-src="{$image.bySize.large_default.url}"
              data-src="{$image.bySize.home_default.url}"
              alt="{$image.legend}"
              title="{$image.legend}"
              itemprop="image"
            >
          </div>
        {/foreach}
      </div>
    </div>
  {/block}
</div>
<script type="text/javascript">
$(document).ready(function() {
  $('.slider-images-detail').owlCarousel({
	items:4,
	autoplay:false,
	autoplayTimeout:5000,
	autoplayHoverPause:false,
	lazyLoad:true,
	nav:true,
	dots:false,
	navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>']
  });
});
</script>
{if isset($HOOK_ELEVATEZOOM) && !empty($HOOK_ELEVATEZOOM) && $page.page_name=='product'}
    {$HOOK_ELEVATEZOOM nofilter}
{/if}
