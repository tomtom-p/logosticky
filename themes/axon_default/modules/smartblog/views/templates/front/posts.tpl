{extends file=$layout_details}
{block name='head_seo'}
  <title>{$meta_title}</title>
{/block}
{block name='breadcrumb'}
{if isset($breadcrumb)}
 <nav class="breadcrumb">
  <div class="container">
  <ol itemscope itemtype="http://schema.org/BreadcrumbList">
  	  <li  class="title_large title_font hidden-md-down">{$meta_title}</li>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{$breadcrumb.links[0].url}">
          <span itemprop="name"><i class="fa fa-home"></i></span>
        </a>
      </li>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{smartblog::GetSmartBlogLink('smartblog')}">
        <span itemprop="name">{l s='All Blog News' }</span>
        </a>
      </li>
      {if $title_category != ''}
     {assign var="link_detail" value=null}
    {$link_detail.id_post = $id_post} 
    {$link_detail.slug = $link_rewrite_}
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{smartblog::GetSmartBlogLink('smartblog_post',$link_detail)}">
        <span itemprop="name">{$meta_title}</span>
        </a>
      </li>
    {/if}
  </ol>
  </div>
</nav>
{/if}
{/block}
{block name='content'}
<div id="content" class="block">
    <div itemtype="#" itemscope="" id="sdsblogArticle" class="blog-post">
	<div class="sdsblogArticle-inner" itemprop="articleBody">
         <div id="lipsum">
		{assign var="activeimgincat" value='0'}
		{$activeimgincat = $smartshownoimg} 
		{if ($post_img != "no" && $activeimgincat == 0) || $activeimgincat == 1}
		    <a id="post_images" href="{$link->getMediaLink($smarty.const._MODULE_DIR_)}/smartblog/images/{$post_img}-single-default.jpg"><img class="img-responsive" src="{$link->getMediaLink($smarty.const._MODULE_DIR_)}smartblog/images/{$post_img}-single-default.jpg" alt="{$meta_title}"></a>
		{/if}
	    </div>
        <div class="box_post_detail">
	    <div class="page-item-title">
		<h1 class="title_font">{$meta_title}</h1>
	    </div>
	    <div class="info-category">
	       {assign var="catOptions" value=null}
		{$catOptions.id_category = $id_category}
		{$catOptions.slug = $cat_link_rewrite}
		{if $smartshowauthor ==1}
                <span>
                    {if $smartshowauthorstyle != 0}
                        <i class="fa fa-edit"></i>{$firstname} {$lastname}
                    {else}{$lastname} {$firstname}
                    {/if}
                </span>
                <span><i class="fa fa-calendar"></i>{$created|date_format}</span>
        {/if}
        <span itemprop="articleSection">
        	<i class="fa fa-tags"></i>
        	<a href="{smartblog::GetSmartBlogLink('smartblog_category',$catOptions)}">{$title_category}</a>
        </span>
        <span>
        	<i class="fa fa-comments"></i>{if $countcomment != ''}{$countcomment}{else}{l s='0' }{/if}{l s=' Comments' }
        </span>
        
		<a title="" style="display:none" itemprop="url" href="#"></a>
	    </div>
            <div class="sdsarticle-des">
               {$content nofilter}
            </div>
            {if $tags != ''}
                <div class="sdstags-update">
                    <span class="tags"><b>{l s='Tags:' } </b> 
                        {foreach from=$tags item=tag}
                            {assign var="options" value=null}
                            {$options.tag = $tag.name}
                            <a title="tag" href="{smartblog::GetSmartBlogLink('smartblog_tag',$options)}">{$tag.name}</a>
                        {/foreach}
                    </span>
                </div>
           {/if}
           </div>
	</div>
	{if isset($HOOK_SMART_BLOG_POST_FOOTER) && !empty($HOOK_SMART_BLOG_POST_FOOTER)}
	    <div class="sdsarticleBottom">
		{$HOOK_SMART_BLOG_POST_FOOTER}
	    </div>
	{/if}
    </div>

{if $countcomment != ''}
<div id="articleComments">
	<h3>{if $countcomment != ''}{$countcomment}{else}{l s='0' }{/if}{l s=' Comments' }<span></span></h3>
        <div id="comments">      
            <ul class="commentList">
		{$i=1}
                {foreach from=$comments item=comment}
                       {include file="modules/smartblog/views/templates/front/comment_loop.tpl" childcommnets=$comment}
		{/foreach}
            </ul>
        </div>
</div>
 {/if}

</div>
{if Configuration::get('smartenablecomment') == 1}
{if $comment_status == 1}
<div class="smartblogcomments" id="respond">
    <!-- <h4 id="commentTitle">{l s="Leave a Comment"  mod="smartblog"}</h4> -->
	<h4 class="comment-reply-title" id="reply-title">
	    {l s='Leave your reply'  } 
	    <small style="float:right;">
                <a style="display: none;" href="/wp/sellya/sellya/this-is-a-post-with-preview-image/#respond" id="cancel-comment-reply-link" rel="nofollow">{l s='Cancel Reply'  }</a>
            </small>
        </h4>
	<div id="commentInput">
	    <div class="row">
		<form action="" method="post" id="commentform">
		    <div class="required form-group col-xs-12 col-sm-12 col-md-6">
			<label>{l s='Name:'  }</label><sup>*</sup>
			<input type="text" tabindex="1" class="inputName form-control grey" value="" name="name">
		    </div>
		    <div class="required form-group col-xs-12 col-sm-12 col-md-6">
			<label>{l s='E-mail:'  }</label><sup>*</sup><span class="note"><sup>*</sup>{l s='Not Published'  }</span>
			<input type="text" tabindex="2" class="inputMail form-control grey" value="" name="mail">
		    </div>
		    <div class="required form-group col-xs-12">
			<label>{l s='Website:'  }</label><span class="note"><sup>*</sup>{l s='Site url with'  }&nbsp;http://</span>
			<input type="text" tabindex="3" value="" name="website" class="form-control grey">
		    </div>																
		    <div class="required form-group col-xs-12">
			<label>{l s='Comment:'  }</label><sup>*</sup>
			<textarea tabindex="4" class="inputContent form-control grey" rows="8" cols="50" name="comment"></textarea>
		    </div>

		    {if Configuration::get('smartcaptchaoption') == '1'}
			    <div class="captcha-type required form-group col-xs-12">
				<label>{l s='Type Code' }</label>
				<img src="{$link->getMediaLink($smarty.const._MODULE_DIR_)}smartblog/classes/CaptchaSecurityImages.php?width=100&height=40&characters=5">
				<input type="text" tabindex="" value="" name="smartblogcaptcha" class="smartblogcaptcha form-control grey">
			    </div>
		    {/if}
		    <input type='hidden' name='comment_post_ID' value='1478' id='comment_post_ID' />
		    <input type='hidden' name='id_post' value='{$id_post}' id='id_post' />
		    <input type='hidden' name='comment_parent' id='comment_parent' value='0' />
		    <div class="submit title_font  col-xs-12">
			<input type="submit" name="addComment" id="submitComment" class="bbutton btn btn-default button-medium" value="{l s='Submit comment' }">
		    </div>
		</form>
	    </div>
	</div>
</div>

<script type="text/javascript">
$('#submitComment').bind('click',function(event) {
event.preventDefault();
 
 
var data = { 'action':'postcomment', 
'id_post':$('input[name=\'id_post\']').val(),
'comment_parent':$('input[name=\'comment_parent\']').val(),
'name':$('input[name=\'name\']').val(),
'website':$('input[name=\'website\']').val(),
'smartblogcaptcha':$('input[name=\'smartblogcaptcha\']').val(),
'comment':$('textarea[name=\'comment\']').val(),
'mail':$('input[name=\'mail\']').val() };
	$.ajax( {
	  url: baseUri + 'modules/smartblog/ajax.php',
	  data: data,
	  
	  dataType: 'json',
	  
	  beforeSend: function() {
				$('.success, .warning, .error').remove();
				$('#submitComment').attr('disabled', true);
				$('#commentInput').before('<div class="attention"><img src="http://321cart.com/sellya/catalog/view/theme/default/image/loading.gif" alt="" />Please wait!</div>');

				},
				complete: function() {
				$('#submitComment').attr('disabled', false);
				$('.attention').remove();
				},
		success: function(json) {
			if (json['error']) {

					 
						$('#commentInput').before('<div class="warning">' + '<i class="icon-warning-sign icon-lg"></i>' + json['error']['common'] + '</div>');
						
						if (json['error']['name']) {
							$('.inputName').after('<span class="error">' + json['error']['name'] + '</span>');
						}
						if (json['error']['mail']) {
							$('.inputMail').after('<span class="error">' + json['error']['mail'] + '</span>');
						}
						if (json['error']['comment']) {
							$('.inputContent').after('<span class="error">' + json['error']['comment'] + '</span>');
						}
						if (json['error']['captcha']) {
							$('.smartblogcaptcha').after('<span class="error">' + json['error']['captcha'] + '</span>');
						}
					}
					
					if (json['success']) {
						$('input[name=\'name\']').val('');
						$('input[name=\'mail\']').val('');
						$('input[name=\'website\']').val('');
						$('textarea[name=\'comment\']').val('');
				 		$('input[name=\'smartblogcaptcha\']').val('');
					
						$('#commentInput').before('<div class="success">' + json['success'] + '</div>');
						setTimeout(function(){
							$('.success').fadeOut(300).delay(450).remove();
													},2500);
					
					}
				}
			} );
		} );
		
 




    var addComment = {
	moveForm : function(commId, parentId, respondId, postId) {

		var t = this, div, comm = t.I(commId), respond = t.I(respondId), cancel = t.I('cancel-comment-reply-link'), parent = t.I('comment_parent'), post = t.I('comment_post_ID');

		if ( ! comm || ! respond || ! cancel || ! parent )
			return;
 
		t.respondId = respondId;
		postId = postId || false;

		if ( ! t.I('wp-temp-form-div') ) {
			div = document.createElement('div');
			div.id = 'wp-temp-form-div';
			div.style.display = 'none';
			respond.parentNode.insertBefore(div, respond);
		}


		comm.parentNode.insertBefore(respond, comm.nextSibling);
		if ( post && postId )
			post.value = postId;
		parent.value = parentId;
		cancel.style.display = '';

		cancel.onclick = function() {
			var t = addComment, temp = t.I('wp-temp-form-div'), respond = t.I(t.respondId);

			if ( ! temp || ! respond )
				return;

			t.I('comment_parent').value = '0';
			temp.parentNode.insertBefore(respond, temp);
			temp.parentNode.removeChild(temp);
			this.style.display = 'none';
			this.onclick = null;
			return false;
		};

		try { t.I('comment').focus(); }
		catch(e) {}

		return false;
	},

	I : function(e) {
		return document.getElementById(e);
	}
};

      
      
</script>
{/if}
{/if}
{if isset($smartcustomcss)}
    <style>
        {$smartcustomcss}
    </style>
{/if}
 {/block}