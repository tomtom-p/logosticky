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
<footer id="footer">
	<div class="footer-container">
		{hook h='displayFooterCustom'}
    </div>
    {hook h='popupnewsletter'}
<div id='footer-bar'>
    <div id="bar-left-column" class="hidden-lg-up">
    	<i class="fa fa-toggle-left"></i>
        <p>{l s='Left Column'}</p>
    </div>
    {if isset($link_compare) && $link_compare}
    <a id="goto-compare" href="{$link_compare}" title="{l s='Go To Compare'}">
    	<i class="fa fa-retweet"></i>
        <p>{l s='Compare'}</p>
    </a>
    {/if}
    <div id="back-top">
    	<i class="fa fa-chevron-up"></i>
        <p>{l s='Back Top'}</p>
    </div>
    <div id="bar-right-column" class="hidden-lg-up">
    	<i class="fa fa-toggle-right"></i>
        <p>{l s='Right Column'}</p>
    </div>
</div>
</footer>