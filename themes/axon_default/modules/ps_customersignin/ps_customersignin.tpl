<div class="mobile_links-wrapper child_nav_right">
<div id="mobile_links" class="dropdown js-dropdown">
    <span class="expand-more" data-toggle="dropdown"><span class="fa fa-user"></span>{l s='My Account'}<i class="fa fa-angle-down"></i></span>
    <ul class="dropdown-menu">
    <li>
    <a class="dropdown-item" href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='My Account'}" rel="nofollow">
      {l s='My Account'}</a></li>
    <li>
       <a class="dropdown-item" href="{$link->getPageLink('cart',null,Context::getContext()->language->id,['action' => 'show'],false,null,true)}" title="{l s='My Cart'}" rel="nofollow">
        {l s='My Cart'}
        </a>
    </li>
    {hook h='linkwishlist'}
    <li>
       <a class="dropdown-item" href="{$urls.pages.contact}" title="{l s='Contact us'}" rel="nofollow">
        {l s='Contact us'}
        </a>
    </li>
    {if $logged}
      <li>
      <a class="dropdown-item"
        href="{$my_account_url}"
        title="{l s='View my customer account'}"
        rel="nofollow"
      >
        <span>{$customerName}</span>
      </a>
      </li>
      <li>
      <a class="dropdown-item"
        href="{$logout_url}"
        rel="nofollow"
      >
        {l s='Sign out'}
      </a>
      </li>
    {else}
    <li>
      <a class="dropdown-item"
        href="{$my_account_url}"
        title="{l s='Log in to your customer account'}"
        rel="nofollow"
      >
        <span>{l s='Sign in'}</span>
      </a>
      </li>
    {/if}
    {hook h='facebookconnect'}
</ul>
</div>
</div>