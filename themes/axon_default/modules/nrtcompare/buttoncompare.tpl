<a href="javascript:void(0)" 
class="button-action add_to_compare{if isset($products_id) && $product.id_product|in_array:$products_id} checked{/if}" data-id-product="{$product.id_product}" 
title="{if isset($products_id) && $product.id_product|in_array:$products_id}{l s='Remove to Compare'}{else}{l s='Add to Compare'}{/if}">
	<i class="fa fa-retweet"></i>
</a>