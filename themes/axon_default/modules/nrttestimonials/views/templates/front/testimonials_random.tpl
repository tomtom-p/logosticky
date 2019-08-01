<div class="block_testimonials block">
        <div class="container">
        <div class="row">
        	<div class="col-md-6 col-xs-12">
                <div class="bg_testimonial">
                    <div class="overlay_testimonials">
                        {if $conf_testimonials.show_background && $background != ""}
                            <img class="hidden-md-down" src="{$link->getMediaLink("`$module_dir`$background")}" alt="" />
                        {/if}
                        <div class="content_title">  
                            <h4 class="title_block title_font">
                                <span class="title_text">
                                    {l s='OUR TESTIMONIALS'}
                                </span>
                            </h4>
                            <p>{l s='Customers talk about us'}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-12">
                    <div id="wrapper_testimonials" class="block_content horizontal_mode arrows_oncolum">
                        {if $testimonials}
                          <div id="slide-panel">
                            <div id="slide" class="owl-carousel owl-theme">
                              {foreach from=$testimonials key=test item=testimonial}
                                <div class="item">
                                {if $testimonial.active == 1}
                                  <div class="main-block">
                                    <div class="content_test_top">
                                      {if $conf_testimonials.show_info}
                                        <div class="content_test_box">
                                          <p class="des_namepost">{$testimonial.name_post}</p>
                                          <p class="des_company">{$testimonial.company}</p>
                                        </div>
                                      {/if}
                                      <p class="des_testimonial"><span class="fa fa-quote-left"></span>{$testimonial.content nofilter}<span class="fa fa-quote-right"></span></p>
                                    </div>
                                  </div>
                                {/if}
                                </div>
                              {/foreach}
                            </div>
                          </div>
                          <div class="data_img">
                              {foreach from=$testimonials key=test item=testimonial}
                                {if $testimonial.active == 1}
                                    {if $conf_testimonials.show_info}
                                        {if $testimonial.media}
                                            {if in_array($testimonial.media_type,$conf_testimonials.arr_img_type)}
                                                <div class="data_img_{$test}" data-src="{$conf_testimonials.mediaUrl}{$testimonial.media}"></div>
                                            {/if}
                                        {/if}
                                    {/if}
                                {/if}
                              {/foreach}
                        </div>
                        {/if}
                    </div>
            </div>
        </div>
        </div>
</div>
