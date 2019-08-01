{if (isset($nrtmegamenu) && $nrtmegamenu)}
<!-- MEGAMENU -->
        <ul id="_desktop_megamenu">
            {foreach $nrtmegamenu as $root}

                <li class="root root-{$root->id_nrtmegamenu} {$root->menu_class}">
                    <div class="root-item{if $root->description == ''} no-description{/if}">
                        {if $root->link != ''}<a href="{$root->link}" {if $root->open_in_new}target="_blank"{/if}>{/if}
                            <div class="title title_font">{if $root->icon_class != ''}<span class="fa {$root->icon_class}"></span>{/if}<span class="title-text">{$root->title}</span>{if isset($root->items)}<span class="icon-has-sub fa fa-angle-down"></span>{/if}</div>
                            {if $root->description != ''}<span class="description">{$root->description nofilter}</span>{/if}
                        {if $root->link != ''}</a>{/if}
                    </div>
					{if isset($root->items)}
                        <div class="navbar-toggler collapse-icons hidden-lg-up" data-toggle="collapse" data-target="#megamenu_{$root->id_nrtmegamenu}">
                          <i class="fa fa-plus add"></i>
                          <i class="fa fa-minus remove"></i>
                        </div>
                    {/if}
                    {if isset($root->items)}
                        <ul id="megamenu_{$root->id_nrtmegamenu}" class="collapse menu-items {$root->width_popup_class} col-xs-12">

                            {$depth = 1}

                            {foreach $root->items as $menuItem}
                                {if ($menuItem->depth > $depth)}
                                    <ul class="submenu submenu-depth-{$menuItem->depth}">
                                {elseif ($menuItem->depth < $depth)}
                                    {'</ul></li>'|str_repeat:($depth - $menuItem->depth) nofilter}
                                {/if}
                                    <li class="menu-item menu-item-{$menuItem->id} depth-{$menuItem->depth} {$menuItem->menu_type_name} {$menuItem->menu_layout} {$menuItem->menu_class} {if isset($menuItem->image) && $menuItem->image} withimage{/if}">

                                        {if ($menuItem->menu_type_name == 'customlink' || $menuItem->menu_type_name == 'category' || $menuItem->menu_type_name == 'cmspage')}

                                            <div class="title{if $menuItem->depth ==1 && $menuItem->menu_type_name !== 'cmspage'} title_font{/if}">
                                                {if $menuItem->link != ''}<a href="{$menuItem->link}" {if $menuItem->open_in_new}target="_blank"{/if}>{/if}
                                                    {if $menuItem->icon_class != ''}<span class="icon {$menuItem->icon_class}"></span>{/if}{$menuItem->title}
                                                    {if $menuItem->description != ''}<span class="description">{$menuItem->description nofilter}</span>{/if}
                                                {if $menuItem->link != ''}</a>{/if}
                                            </div>

                                        {elseif ($menuItem->menu_type_name == 'product')}
                            {assign var="product" value=$menuItem->product}
                            
                            <div class="horizontal_mode">
                            {if $menuItem->show_image}
                            <div class="item-inner{if isset($product.images[1])} second_image{/if}">
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
                                    <span class="hover_image" data-src-img="{$product.images[1].bySize.home_default.url}"></span>
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
                                        <form action="{$urls.pages.cart}" method="post">
                                            <input type="hidden" name="token" value="{$static_token}">
                                            <input type="hidden" name="id_product" value="{$product.id}">
                                                {if isset($NRT_quickView) && $NRT_quickView}
                                                  <a href="javascript:void(0)" class="button-action quick-view" data-link-action="quickview" title="{l s='Quick view'}">
                                                        <i class="fa fa-search"></i>
                                                  </a>
                                               {/if}
                                               {if !isset($is_catalog_mode)}
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
                                            {hook h='displayProductPriceBlock' product=$product type='unit_price'}
                                            {hook h='displayProductPriceBlock' product=$product type='weight'}
                                          </div>
                                        {/if}
                                        {hook h='displayProductListReviews' product=$product}
                                    </div>
                                    
                                </div>
                            </div>
                            
                       </div>
                       {else}
                       		<div class="item-inner">
                            <div class="right-product" style="margin:0">
                            <div class="product_name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></div>
                            </div>
                            </div>
                        {/if}
                            </div>
                            

                                        {elseif ($menuItem->menu_type_name == 'manufacturer')}

                                            {if isset($menuItem->image) && $menuItem->image}
                                                <a class="white-border-3px img-wrapper" href="{$menuItem->link}" {if $menuItem->open_in_new}target="_blank"{/if}>
                                                    <div class="manufacturer-image"><img src="{$menuItem->image}" /></div>
                                                </a>
                                            {/if}
                                            <div class="title">
                                                <a href="{$menuItem->link}" {if $menuItem->open_in_new}target="_blank"{/if}>
                                                    {if $menuItem->icon_class != ''}<span class="icon {$menuItem->icon_class}"></span>{/if}{$menuItem->title}
                                                    {if $menuItem->description != ''}<span class="description">{$menuItem->description nofilter}</span>{/if}
                                                </a>
                                            </div>

                                        {elseif ($menuItem->menu_type_name == 'supplier')}

                                            {if isset($menuItem->image) && $menuItem->image}
                                                <a class="white-border-3px img-wrapper" href="{$menuItem->link}" {if $menuItem->open_in_new}target="_blank"{/if}>
                                                    <div class="supplier-image"><img src="{$menuItem->image}" /></div>
                                                </a>
                                            {/if}
                                            <div class="title">
                                                <a href="{$menuItem->link}" {if $menuItem->open_in_new}target="_blank"{/if}>
                                                    {if $menuItem->icon_class != ''}<span class="icon {$menuItem->icon_class}"></span>{/if}{$menuItem->title}
                                                    {if $menuItem->description != ''}<span class="description">{$menuItem->description nofilter}</span>{/if}
                                                </a>
                                            </div>

                                        {elseif ($menuItem->menu_type_name == 'customcontent')}

                                            <div class="normalized">
                                  {$menuItem->content nofilter}
                                            </div>

                                        {/if}


                                {if ($menuItem@index != (count($root->items) - 1)) && ($root->items[($menuItem@index + 1)]->depth <= $menuItem->depth)}
                                    </li>
                                {/if}

                                {$depth = $menuItem->depth}

                                {if ($menuItem@index == count($root->items) - 1)}
                                    </li>{'</ul></li>'|str_repeat:($depth - 1) nofilter}
                                {/if}

                            {/foreach}
                        </ul>
                    {/if}

                </li>

            {/foreach}
        </ul>
 <!--END MEGAMENU -->
{/if}