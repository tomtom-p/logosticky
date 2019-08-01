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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
   <div class="nrt-search {if $NRTSEARCH_SHOW_CAT != 1} no-show-cat {/if}">
    	<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox" data-search-controller-url="{$link->getPageLink('search')|escape:'html'}">
            <input type="hidden" name="controller" value="search" />
                {if $NRTSEARCH_SHOW_CAT == 1}
                <div class="input-group-btn search_filter">
                    {$category_html nofilter}
                </div>
                {/if}
                <input type="hidden" name="orderby" value="position" />
                <input type="hidden" name="orderway" value="desc" />
                <input class="search_query form-control" type="text" id="search_query_top" name="s" value="{$search_query}"  placeholder="{l s='Search...'}" />
                <button type="submit" name="submit_search" class="btn button-search">
                    <span class="fa fa-search"></span>
                </button>
    	</form>
        {if isset($tags) && !empty($tags)}
            <div class="nrt_search_tags">
                <label>{l s='Popular keywork:'}</label>
                {foreach from=$tags  item='value'}
                    {if $value}
                        <a href="{$value.link|escape:'html'}">{$value.tag_name|escape:html:'UTF-8'},</a>
                    {/if}
                {/foreach}
            </div>
        {/if}
    </div>

