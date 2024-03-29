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

<nav class="breadcrumb hidden-md-down">
  <ol itemscope itemtype="http://schema.org/BreadcrumbList">
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{$path.url}">
          <span itemprop="name">{$path.title}</span>
        </a>
        <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
      </li>
    {/foreach}
  </ol>
</nav>
 *}
 
 <nav class="breadcrumb">
 <div class="container">
  <ol itemscope itemtype="http://schema.org/BreadcrumbList">
     {if $breadcrumb.links[count($breadcrumb.links)-1].title}
     <li  class="title_large title_font hidden-md-down"> {$breadcrumb.links[count($breadcrumb.links)-1].title} </li>
     {/if}
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
      {if $path.title}
          <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
            <a itemprop="item" href="{$path.url}">
              <span itemprop="name">{if $smarty.foreach.breadcrumb.iteration == 1}<i class="fa fa-home"></i>{else}{$path.title}{/if}</span>
            </a>
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
          </li>
      {/if}
    {/foreach}
  </ol>
  </div>
</nav>