  <div class="language-selector-wrapper child_nav_right">
    <div class="language-selector dropdown js-dropdown">
     <span class="expand-more" data-toggle="dropdown">
    {*<img src="{$link->getMediaLink($smarty.const._THEME_LANG_DIR_)}{$current_language.id_lang}.jpg" alt="{$current_language.name_simple}" width="16" height="11" />*}
      <span class="fa fa-globe"></span>{$current_language.name_simple}<i class="fa fa-angle-down"></i></span>
      <ul class="dropdown-menu">
        {foreach from=$languages item=language}
          <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
            <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item">
          	{*<img src="{$link->getMediaLink($smarty.const._THEME_LANG_DIR_)}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" />*}
            {$language.name_simple}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
    
    <div id="_desktop_language" class="hide">
    {foreach from=$languages item=language}
        <a href="{url entity='language' id=$language.id_lang}" title="{$language.name_simple}" {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
        <img src="{$link->getMediaLink($smarty.const._THEME_LANG_DIR_)}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" /></a>
    {/foreach}
    </div>
  </div>



