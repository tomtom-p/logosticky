{if !Context::getContext()->customer->isLogged()}
{hook h='facebookconnect'}
<h3>{l s='Already registered?'} </h3>
<hr>
<form action="index.php?controller=authentication&back=my-account" method="post">
  <div class="form-group row ">
    <label class="col-xs-12 form-control-label required">
    	{l s='Email'} 
    </label>
    <div class="col-xs-12">
          <input 
          class="form-control" 
          name="email" 
          type="email"
          value=""
          required
          >
    </div>
  </div>
  <div class="form-group row ">
    <label class="col-xs-12 form-control-label required">
    	{l s='Password'}      
    </label>
    <div class="col-xs-12">
          <div class="input-group js-parent-focus">
            <input
              class="form-control js-child-focus js-visible-password"
              name="password"
              type="password"
              value=""
              pattern=".{literal}{{/literal}5,{literal}}{/literal}"
              required
            >
            <span class="input-group-btn">
              <button
                class="btn"
                type="button"
                data-action="show-password"
                data-text-show="{l s='Show'}"
                data-text-hide="{l s='Hide'}"
              >
                {l s='Show'}
              </button>
            </span>
          </div>
    </div>
  </div>    
  <div class="forgot-password">
    <a href="{$urls.pages.password}" rel="nofollow">
      {l s='Forgot your password?'}
    </a>
  </div>
  <div class="form-footerclearfix" style="margin-top:15px;">
    <input name="submitLogin" value="1" type="hidden">
      <button class="btn btn-primary" data-link-action="sign-in" type="submit">
        {l s='Sign in'}
      </button>
  </div>
  </form>
  <hr>
  <div class="no-account">
    <a href="{$urls.pages.register}" data-link-action="display-register-form">
      {l s='No account? Create one here'}
    </a>
  </div>
{else}
<h3>
	<a class="h3" 
    href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='My Account'}" rel="nofollow"> 
		{Context::getContext()->customer->firstname}
        {Context::getContext()->customer->lastname}
    </a>
</h3>
<span>
<a href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='My Account'}" rel="nofollow"> 
	{l s='My Account'}
</a>
<span class="separator">|</span>
<a  href="{$link->getPageLink('index', true, null, 'mylogout')}" title="{l s='Log out'}" rel="nofollow">
	{l s='Log out'}
</a>
</span>
<hr>
  <div class="row">
    <div class="links">

      <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.identity}">
        <span class="link-item">
          <i class="material-icons">&#xE853;</i>
          {l s='Information'}
        </span>
      </a>

      {if $customer.addresses|count}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.addresses}">
          <span class="link-item">
            <i class="material-icons">&#xE56A;</i>
            {l s='Addresses'}
          </span>
        </a>
      {else}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.address}">
          <span class="link-item">
            <i class="material-icons">&#xE567;</i>
            {l s='Add first address'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.history}">
          <span class="link-item">
            <i class="material-icons">&#xE916;</i>
            {l s='Order history and details'}
          </span>
        </a>
      {/if}

      {if !$configuration.is_catalog}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.order_slip}">
          <span class="link-item">
            <i class="material-icons">&#xE8B0;</i>
            {l s='Credit slips'}
          </span>
        </a>
      {/if}

      {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.discount}">
          <span class="link-item">
            <i class="material-icons">&#xE54E;</i>
            {l s='Vouchers'}
          </span>
        </a>
      {/if}

      {if $configuration.return_enabled && !$configuration.is_catalog}
        <a class="col-lg-3 col-md-4 col-sm-6 col-xs-12" href="{$urls.pages.order_follow}">
          <span class="link-item">
            <i class="material-icons">&#xE860;</i>
            {l s='Merchandise returns'}
          </span>
        </a>
      {/if}
      {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
      {/block}
    </div>
  </div>
{/if}