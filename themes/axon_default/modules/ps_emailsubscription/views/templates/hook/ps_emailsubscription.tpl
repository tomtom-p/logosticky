{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}


<div class="links">
<div class="box-links">
<h3>{l s='Newsletter'}</h3>
<div class="title hidden-lg-up" data-target="#footer_sub_menu_col_email" data-toggle="collapse">
<div class="navbar-toggler collapse-icons">
<div class="fa fa-plus add"></div>
<div class="fa fa-minus remove"></div>
</div>
</div>
<div id="footer_sub_menu_col_email" class="collapse">
<div class="newsletter">
      <form action="{$urls.pages.index}#footer" method="post">
              <input
                name="name"
                type="text"
                placeholder="{l s='Your name'}"
              >
              <input
              class="input-email"
                name="email"
                type="text"
                value="{$value}"
                placeholder="{l s='Your email address'}"
              >
            <button class="button-email title_font"
              name="submitNewsletter"
              type="submit">
             {l s='Subscribe'}
            </button>
            <input type="hidden" name="action" value="0">
              {if $msg}
                <span class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                  {$msg}
                </span>
              {/if}
      </form>
</div>
</div>
</div>
</div>
