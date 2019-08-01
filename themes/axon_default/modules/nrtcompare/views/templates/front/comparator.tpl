{extends file=$layout}

{block name='content'}
<section id="main">
<div id="mycompare">
<header class="page-header">
	<h2>{l s='Products Comparison'}</h2>
</header>
{if $list_products}
			<table>
					<tr>
						<td></td>
                        {foreach from=$list_products item="product"} 
                            <td class="comparison_infos product-{$product.id_product}">
                                <div class="item-inner-compare">
                                <a href="javascript:void(0)" class="remove_to_compare" data-id-product="{$product.id_product}" title="{l s='Remove to Compare'}">
                                    <i class="fa fa-trash-o"></i>
                                </a>
                                 <div class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
                                 <div class="left-product-compare">
                                      <a href="{$product.url}" title="{$product.name}">
                                        <span class="cover_image">
                                            <img
                                              class="img-responsive"
                                              src = "{$product.cover.bySize['home_default'].url}"
                                              alt=""
                                            >
                                        </span>       
                                      </a> 
                                         {if isset($product.show_condition) && isset($product.condition.type) && $product.show_condition == 1}
                                             <span class="new_product"><span>{$product.condition.type}</span></span>
                                         {/if} 
                                            {if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price }
                                            <span class="sale_product"><span>{l s='Sale'}</span></span>
                                            {/if}  
                                    </div>  
                                    <div class="right-product-compare">       
                                        <div class="product-description">
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
                                        </div>
                                        
                                    </div>
                                    <div class="button-action-product">
                                        <form action="{$urls.pages.cart}" method="post">
                                            <input type="hidden" name="token" value="{$static_token}">
                                            <input type="hidden" name="id_product" value="{$product.id}">
                                              <button class="btn" data-button-action="add-to-cart" type="submit" {if !$product.quantity && !isset($order_out_of_stock)}disabled{/if}>
                                              {if $product.quantity || isset($order_out_of_stock)}
                                                    {l s='Add to cart'}
                                              {else}
                                                    {l s='Out of stock'}
                                              {/if}  
                                              </button>
                                        </form>
                                        </div>
                                </div>
                           </div>
                            </td>
                        {/foreach}	
					</tr>
			{if $ordered_features}
                <tr class="comparison_header">
                    <td>
                        {l s='Features:'}
                    </td>
                    {section loop=$list_ids_product|count step=1 start=0 name=td}
                        <td></td>
                    {/section}
                </tr>
				{foreach from=$ordered_features item=feature}
					<tr>
						<td>
							{$feature.name|escape:'html':'UTF-8'}
						</td>
						{foreach from=$list_products item=product name=for_products}
							{assign var='product_id' value=$product.id_product}
							{assign var='feature_id' value=$feature.id_feature}
							{if isset($product_features[$product_id])}
								{assign var='tab' value=$product_features[$product_id]}
								<td class="comparison_infos product-{$product_id}">
                                	{if (isset($tab[$feature_id]))} {$tab[$feature_id]|escape:'html':'UTF-8'}{/if}
                                </td>
							{else}
								<td class="comparison_infos product-{$product_id}"></td>
							{/if}
						{/foreach}
					</tr>
				{/foreach}
			{else}
				<tr>
					<td></td>
					<td colspan="{$list_products|@count}" class="text-center">{l s='No features to compare'}</td>
				</tr>
			{/if}
			{hook h='extraProductComparison' list_ids_product=$list_ids_product}
			</table>
{else}
	<p  style="margin-bottom:30px;" class="alert alert-warning">{l s='There are no products selected for comparison.'}</p>
{/if}
    {block name='my_account_links'}
    <footer class="page-footer">
      <a href="{$urls.pages.index}" class="account-link">
        <i class="material-icons">&#xE5CB;</i>
        <span>{l s='Continue Shopping'}</span>
      </a>
      </footer>
    {/block}
</div>
</section>
{/block}
