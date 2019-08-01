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

{if isset($nodecontent.manu.id)}
  {assign var="manufacturer_id" value=$nodecontent.manu.id}
{else}
	{assign var="manufacturer_id" value=$nodecontent.ids}
{/if}
{if isset($manufacturer_id) && $manufacturer_id[0] != 0}
<div class="manufacturers horizontal_mode">
    <div class="row">
        {foreach from=$manufacturer_id item=manufacturer name=manufacturerSlider}
            	<div class="item {if isset($nodecontent.line_xs) && $nodecontent.line_xs}col-xs-{$nodecontent.line_xs}{/if} {if isset($nodecontent.line_sm) && $nodecontent.line_sm}col-sm-{$nodecontent.line_sm}{/if} {if isset($nodecontent.line_md) && $nodecontent.line_md}col-md-{$nodecontent.line_md}{/if}">
                <div class="item-inner">
            {assign var="myfile" value="img/m/{$manufacturer|escape:'htmlall':'UTF-8'}-manufacturer.jpg"}
                {if file_exists($myfile)}
                        <a href="{$link->getmanufacturerLink($manufacturer)}">
                            <img 
                            src="{$link->getMediaLink($manu_dir)}{$manufacturer|escape:'htmlall':'UTF-8'}-manufacturer.jpg" class="img-responsive logo_manufacturer " {if isset($manufacturerSize)} width="{$manufacturerSize.width}" height="{$manufacturerSize.height}"{/if} alt="" />
                        </a>
                {/if}
                </div>
            	</div>
        {/foreach}
    </div>
 </div>
{else}
    <p class="alert alert-warning" style="clear:both;margin-bottom:30px;">{l s='No brand at this time.'}</p>
{/if}