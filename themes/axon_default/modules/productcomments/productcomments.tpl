{*
* 2007-2016 PrestaShop
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
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<script type="text/javascript">
var productcomments_controller_url = '{$productcomments_controller_url}';
var confirm_report_message = '{l s='Are you sure that you want to report this comment?' js=1}';
var secure_key = '{$secure_key}';
var productcomments_url_rewrite = '{$productcomments_url_rewriting_activated}';
var productcomment_added = '{l s='Your comment has been added!' js=1}';
var productcomment_added_moderation = '{l s='Your comment has been submitted and will be available once approved by a moderator.' js=1}';
var productcomment_title = '{l s='New comment' js=1}';
var productcomment_ok = '{l s='OK' js=1}';
var moderation_active = {$moderation_active};
</script>
<div class="tab-pane fade in" id="product-comment-tab">
	<div id="product_comments_block_tab">
	{if $comments}
        <div class="comments_avg">	
        	<div class="content_rating">
                <div class="label_rating">{l s='Item Rating :'}</div>
                <div class="star_content clearfix">
                {section name="i" start=0 loop=5 step=1}
                    {if $averageTotal le $smarty.section.i.index}
                        <div class="star"></div>
                    {else}
                        <div class="star star_on"></div>
                    {/if}
                {/section}
                </div>
            </div>
            <div class="nbr_comment"> 
            	<span>{l s='%s'|sprintf:$averageTotal}</span>
                {l s='average based on'} 
                {$comments|@count}
                <span>
                    {if ($comments|@count) > 1 } 
                        {l s='ratings.'} 
                    {else}
                        {l s='rating.'} 
                    {/if}
                </span>
            </div>
        </div>
		{foreach from=$comments item=comment}
			{if $comment.content}
			<div class="comment clearfix">
            <div class="row">
				<div class="comment_author col-sm-3">
					<span>{l s='Grade'}</span>
					<div class="star_content clearfix">
					{section name="i" start=0 loop=5 step=1}
						{if $comment.grade le $smarty.section.i.index}
							<div class="star"></div>
						{else}
							<div class="star star_on"></div>
						{/if}
					{/section}
					</div>
					<div class="comment_author_infos">
                    	<span class="author">
                        	{l s='By'}
                            <span class="author_name">{$comment.customer_name|escape:'html':'UTF-8'}</span>
                        </span>
                        <span class="date_comment">
                        	{l s='on'}
                            <span>{dateFormat date=$comment.date_add|escape:'html':'UTF-8' full=0}</span>
                        </span>
					</div>
				</div>
				<div class="comment_details col-sm-9">
					<h4 class="title_coment">{$comment.title}</h4>
					<p>{$comment.content|escape:'html':'UTF-8'|nl2br}</p>
					<ul>
						{if $comment.total_advice > 0}
							<li>{l s='%1$d out of %2$d people found this review useful.' sprintf=[$comment.total_useful,$comment.total_advice]}</li>
						{/if}
						{if $logged}
							{if !$comment.customer_advice}
							<li>{l s='Was this comment useful to you?'}<button class="usefulness_btn btn" data-is-usefull="1" data-id-product-comment="{$comment.id_product_comment}">{l s='yes'}</button><button class="usefulness_btn btn" data-is-usefull="0" data-id-product-comment="{$comment.id_product_comment}">{l s='no'}</button></li>
							{/if}
							{if !$comment.customer_report}
							<li><span class="report_btn" data-id-product-comment="{$comment.id_product_comment}">{l s='Report abuse'}</span></li>
							{/if}
						{/if}
					</ul>
				</div>
			</div>
            </div>
			{/if}
		{/foreach}
        {if (!$too_early AND ($logged OR $allow_guests))}
		<p class="align_center">
			<a id="new_comment_tab_btn" class="open-comment-form btn" href="javascript:void(0)">{l s='Write your review'} !</a>
		</p>
        {/if}
	{else}
		{if (!$too_early AND ($logged OR $allow_guests))}
		<p class="align_center no_comment">
			<a id="new_comment_tab_btn" class="open-comment-form btn" href="javascript:void(0)">{l s='Be the first to write your review'} !</a>
		</p>
		{else}
		<p class="align_center no_comment">{l s='No customer reviews for the moment.'}</p>
		{/if}
	{/if}	
	</div>
</div>

{if isset($product) && $product}
<div id="moda_productcomment" class="modal fade mod_productcomment" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
  	<div class="modal-header">
	<h2 class="title"><i class="fa  fa-pencil-square-o"></i>{l s='Write your review'}</h2>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="modal-body">
	<div id="new_comment_form">
		<form id="id_new_comment_form" action="#">
            <div class="row">
			{if isset($product) && $product}
					<div class="product clearfix  col-xs-12 col-sm-6">
						<img src="{$productcomment_cover_image}" height="{$mediumSize.height}" width="{$mediumSize.width}" alt="{$product->name|escape:'html':'UTF-8'}" />
						<div class="product_desc">
							<p class="product_name">
								<strong>{$product->name}</strong>
							</p>
							{$product->description_short nofilter}
						</div>
					</div>
			{/if}
            
			<div class="new_comment_form_content col-xs-12 col-sm-6">
				<div id="new_comment_form_error" class="error" style="display:none;">
					<ul></ul>
				</div>
				{if $criterions|@count > 0}
					<ul id="criterions_list">
					{foreach from=$criterions item='criterion'}
						<li>
							<label>{$criterion.name|escape:'html':'UTF-8'}</label>
							<div class="star_content">
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="1" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="2" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="3" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="4" />
								<input class="star" type="radio" name="criterion[{$criterion.id_product_comment_criterion|round}]" value="5" checked="checked" />
							</div>
							<div class="clearfix"></div>
						</li>
					{/foreach}
					</ul>
				{/if}
				<label for="comment_title">{l s='Title for your review'}<sup class="required">*</sup></label>
				<input id="comment_title" name="title" class="form-control" type="text" value=""/>

				<label for="content">{l s='Your review'}<sup class="required">*</sup></label>
				<textarea name="content" class="form-control"></textarea>

				{if $allow_guests == true && !$logged}
				<label>{l s='Your name'}<sup class="required">*</sup></label>
				<input id="commentCustomerName" class="form-control" name="customer_name" type="text" value=""/>
				{/if}

				<div id="new_comment_form_footer">
					<input id="id_product_comment_send" class="form-control" name="id_product" type="hidden" value='{$id_product_comment_form}' />
					<p class="fl required"><sup>*</sup> {l s='Required fields'}</p>
					<p class="fr">
						<button id="submitNewMessage" class="btn" name="submitMessage" type="submit">{l s='Send'}</button>&nbsp;
						{l s='or'}&nbsp;
                       <button type="button" class="close_comment" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">{l s='Cancel'}</span></button>
					</p>
					<div class="clearfix"></div>
				</div>
			</div>
            </div>
		</form><!-- /end new_comment_form_content -->
	</div>
    </div>
    </div>
  </div>
</div>

<div id="moda_choosebox" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
  	<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    </div>
    <div class="modal-body">
    	<div id="data_content_choosebox">......</div>
    </div>
    </div>
  </div>
</div>
{/if}
