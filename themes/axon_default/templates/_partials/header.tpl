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
<header id="header">

<div class="mobile hidden-lg-up">{**Mobile-Nav*}
     <div id="nav-mobile">
        <div class="nav-button col-xs-4 text-center" data-wrapper="menu">
            <i class="fa fa-reorder"></i>
        </div>
        <div class="nav-button col-xs-4 text-center" data-wrapper="cart">
            <div id="_mobile_cart">
                <span class="fa fa-shopping-basket"></span>
                <span id="count_cart_mobile"></span>
            </div>
        </div>
        <div class="nav-button col-xs-4 text-center" data-wrapper="myaccount">
            <div id="_mobile_acount">
                <span class="fa fa-user"></span>
            </div>
        </div>
	 </div>
     <div id="wrapper-mobile">
     	<div class="wrapper-tab menu">
            <div id="_mobile_language"></div>
            <div id="_mobile_currency"></div>
            <div id="header_mobile_menu" class="navbar-inactive visible-sm visible-xs">
                <nav id="nrtmegamenu-mobile" class="nrtmegamenu">
                    <ul id="_mobile_megamenu"></ul>
                </nav>
            </div>
        </div>
     	<div class="wrapper-tab cart">
			<div id='_mobile_cart_tab'></div>
        </div>
     	<div class="wrapper-tab myaccount">
			{include file="_partials/quick-login.tpl"}
        </div>
     </div>
	 <div id="_mobile_logo" class="text-center"></div>
     <div class="container">
     	<div id="_mobile_search"></div>
     </div>
</div>{**End-Mobile-Nav*}

<div class="desktop hidden-md-down">
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}
<div id="block-nav-center">
    <div class="container">
    	<div class="wraper_nav">
            <div class="nav_right">
            	{hook h='displayNav2'}
            </div>
            <div class="nav_left">
            	{hook h='displayNav1'}
            </div>
        </div>
    </div>
</div>
<div id="block-header-center">
    <div class="container">
    	<div class="header-left">
            {hook h='displayMobileTopSiteMap'}
        </div>
    	<div id="_desktop_logo" class="header-logo">
            <a href="{$urls.base_url}"> 
				<img class="logo_home img-responsive" src="{$link->getMediaLink($shop.logo)}" alt="{$shop.name}" width="{Configuration::get('SHOP_LOGO_WIDTH')}" height="{Configuration::get('SHOP_LOGO_HEIGHT')}"/>
            </a>
        </div>
        <div class="header-right">
        {hook h='displayTop'}
        </div>
        <div id="header_menu" class="visible-lg visible-md">
            <div class="container">
                <div class="row">
    				<nav id="nrtmegamenu-main" class="nrtmegamenu inactive">
                    	{hook h='megamenu'}
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</header>