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

	
	{if $node.type==1}
    {if isset($node.row_s.bgw ) && $node.row_s.bgw == 1}<div class="container">{/if}
    <div class="content-{$node.elementId}">
    {if isset($node.row_s.prlx) && $node.row_s.prlx}<div class="{$node.row_s.prlx}">{/if}
 {if (isset($node.row_s.bgh ) && $node.row_s.bgh == 1 && isset($node.row_s.bgw) && $node.row_s.bgw != 1) || (!isset($node.row_s.bgw) && isset($node.row_s.bgh ) && $node.row_s.bgh == 1)}<div class="container">{/if} 
	<div class="row">
    
	{elseif $node.type==2}
		<div  class="{if $node.width_p==13}hidden-xs{else}col-xs-{$node.width_p}{/if} {if $node.width_t==13}hidden-sm{else}col-sm-{$node.width_t}{/if} {if $node.width_d==13}hidden-md hidden-lg{else}col-md-{$node.width_d}{/if} {if $node.contentType==0}empty-column{/if} {if $node.contentType==6}text-center hover-banner{/if}" >
			<div class="column-inner {if isset($node.content.ar) && $node.content.ar ==0}arrows_center{elseif isset($node.content.ar) && $node.content.ar ==1}arrows_oncolum{/if}">
	{elseif $node.type==4}
		<div  class="{if $node.width_p==13}hidden-xs{else}col-xs-{$node.width_p}{/if} {if $node.width_t==13}hidden-sm{else}col-sm-{$node.width_t}{/if} {if $node.width_d==13}hidden-md hidden-lg{else}col-md-{$node.width_d}{/if} content-tabs {if $node.contentType==0}empty-column{/if}">
			<div class="tab_home">
	{/if}
		{include file="./front_content_inner.tpl" node=$node}

			{if $node.type==2 || $node.type==1 || $node.type==4}
				{if isset($node.children) && $node.children|@count > 0}
					{foreach from=$node.children item=child name=categoryTreeBranch}
						{if $child.type==3}
						{if $smarty.foreach.categoryTreeBranch.first}  <ul class="nav nav-tabs">{/if} 
							<li class="nav-item"><a href="#content-tab-{$child.elementId}"  {if isset($child.tabtitle)}title=""{/if} data-toggle="tab">{if isset($child.tabtitle)}{$child.tabtitle nofilter}{else}{l s='Set tab title'}{/if}</a></li>
						{if $smarty.foreach.categoryTreeBranch.last}</ul> {/if} 
						{/if}
					{/foreach}

					{foreach from=$node.children item=child name=categoryTreeBranch}
						{if $child.type==3}
						{if $smarty.foreach.categoryTreeBranch.first}  <div class="tab-content">{/if} 
							{include file="./front_content.tpl" node=$child }
						{if $smarty.foreach.categoryTreeBranch.last}  </div> {/if} 
						{else}
							{include file="./front_content.tpl" node=$child }
						{/if}
					{/foreach}
				{/if}
			
			{elseif $node.type==3}
			
				{if isset($node.children) && $node.children|@count > 0}
                
				<div id="content-tab-{$node.elementId}"  class="tab-pane content-{$node.elementId} clearfix">
					{foreach from=$node.children item=child name=categoryTreeBranch}
						{include file="./front_content.tpl" node=$child }
					{/foreach}
				</div>
				{/if}

			{/if}



		{if $node.type==2 || $node.type==4}</div>{/if}
		{if $node.type==1 || $node.type==2 || $node.type==4}</div>{/if}
        {if $node.type==1}
 		{if (isset($node.row_s.bgh ) && $node.row_s.bgh == 1 && isset($node.row_s.bgw) && $node.row_s.bgw != 1) || (!isset($node.row_s.bgw) && isset($node.row_s.bgh ) && $node.row_s.bgh == 1)}</div>{/if} 
        {if isset($node.row_s.prlx) && $node.row_s.prlx}</div>{/if}
        </div>
    	{if isset($node.row_s.bgw ) && $node.row_s.bgw == 1}</div>{/if}
        {/if}
