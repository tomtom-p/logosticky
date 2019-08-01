  <div class="currency-selector-wrapper child_nav_right">
  <div class="currency-selector dropdown js-dropdown">
    <span class="expand-more _gray-darker" data-toggle="dropdown"><span>{$currency.sign}</span>{$current_currency.iso_code}<i class="fa fa-angle-down"></i></span>
    <ul class="dropdown-menu">
      {foreach from=$currencies item=currency}
        <li {if $currency.current} class="current" {/if}>
          <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item">{$currency.iso_code} {$currency.sign}</a>
        </li>
      {/foreach}
    </ul>
  </div>
    <div id="_desktop_currency" class="hide">
         {foreach from=$currencies item=currency}
              <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" {if $currency.current} class="current" {/if}>{$currency.iso_code}</a>
         {/foreach}
    </div>
  </div>
  
  
