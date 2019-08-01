{*
* 2007-2017 PrestaShop
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
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
  {if $contact_infos.phone}
  <div class="contact-link-wrapper child_nav_left">
      <div class="dropdown">
        <a href="tel:{$contact_infos.phone}" class="expand-more"><span class="fa fa-phone"></span>{$contact_infos.phone}</a>
      </div> 
  </div>
  {/if}
  
  {if $contact_infos.email}
  <div class="contact-link-wrapper child_nav_left">
      <div class="dropdown">
        <a href="mailto:{$contact_infos.email}" class="expand-more"><span class="fa fa-envelope"></span>{$contact_infos.email}</a>
      </div> 
  </div>
  {/if}
  {if !$contact_infos.phone && !$contact_infos.email}
  <div class="contact-link-wrapper child_nav_left">
      <div class="dropdown">
        <a href="{$urls.pages.contact}" class="expand-more"><span class="fa fa-envelope"></span>{l s='Contact us' d='Shop.Theme.Global'}</a>
      </div> 
  </div>
  {/if}
