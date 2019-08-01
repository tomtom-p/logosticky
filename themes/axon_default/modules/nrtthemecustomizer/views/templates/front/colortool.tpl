<div class="nrt-demo-wrap">
    <h2 class="nrt-demo-title">{l s='Theme Settings'}</h2>
    <div class="nrt-demo-option">
        <div class="cl-wrapper">
            <div class="cl-container">
                <div class="cl-table">
                    <div class="cl-tr cl-tr-style-label"><span>{l s='Mode Layout'}</span></div>
                    <div class="cl-tr cl-tr-mode">
                        <div class="cl-td-l"><input id="mode_box" type="radio" name="mode_css" value="box"/><label for="mode_box">{l s='Box'}</label></div>
                        <div class="cl-td-r"><input id="mode_full" type="radio" name="mode_css" value="wide"/><label for="mode_full">{l s='Wide'}</label></div>
                    </div>
                    <div class="cl-tr cl-tr-style-label"><span>{l s='Curent color'}</span></div>
                    <div class="cl-tr-style-curent">
                        <div class="cl-tr cl-tr-style">
                            <div class="cl-td-l cl-td-layout cl-td-layout1">
                                <a href="javascript:void(0)" id="1f1c3b" title="1f1c3b">
                                    <span style="background:#1f1c3b"></span>
                                </a>
                                <a href="javascript:void(0)" id="c74747" title="c74747">
                                    <span style="background:#c74747"></span>
                                </a>
                            </div>
                            <div class="cl-td-r cl-td-layout cl-td-layout2">
                                <a href="javascript:void(0)" id="2bbbd8" title="2bbbd8">
                                    <span style="background:#2bbbd8"></span>
                                </a>
                                <a href="javascript:void(0)" id="837a6b" title="837a6b">
                                    <span style="background:#837a6b"></span>
                                </a>
                            </div>
                        </div>
                        <div class="cl-tr cl-tr-style">
                            <div class="cl-td-l cl-td-layout cl-td-layout3">
                                <a href="javascript:void(0)" id="ffb502" title="ffb502">
                                    <span style="background:#ffb502"></span>
                                </a>
                                <a href="javascript:void(0)" id="563d7c" title="563d7c">
                                    <span style="background:#563d7c"></span>
                                </a>
                            </div>
                            <div class="cl-td-r cl-td-layout cl-td-layout4">
                                <a href="javascript:void(0)" id="b8a279" title="b8a279">
                                    <span style="background:#b8a279"></span>
                                </a>
                                <a href="javascript:void(0)" id="282828" title="282828">
                                    <span style="background:#282828"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="cl-tr cl-tr-style-label"><span>{l s='Active color'}</span></div>
                    <div class="cl-tr-style-hover">
                        <div class="cl-tr cl-tr-style">
                            <div class="cl-td-l cl-td-layout cl-td-layout1">
                                <a href="javascript:void(0)" id="eb5f60" title="eb5f60">
                                    <span style="background:#eb5f60"></span>
                                </a>
                                <a href="javascript:void(0)" id="a0913d" title="a0913d">
                                    <span style="background:#a0913d"></span>
                                </a>
                            </div>
                            <div class="cl-td-r cl-td-layout cl-td-layout2">
                                <a href="javascript:void(0)" id="dc143c" title="dc143c">
                                    <span style="background:#dc143c"></span>
                                </a>
                                <a href="javascript:void(0)" id="3c3c3c" title="3c3c3c">
                                    <span style="background:#3c3c3c"></span>
                                </a>
                            </div>
                        </div>
                        <div class="cl-tr cl-tr-style">
                            <div class="cl-td-l cl-td-layout cl-td-layout3">
                                <a href="javascript:void(0)" id="d80018" title="d80018">
                                    <span style="background:#d80018"></span>
                                </a>
                                <a href="javascript:void(0)" id="22a7f0" title="22a7f0">
                                    <span style="background:#22a7f0"></span>
                                </a>
                            </div>
                            <div class="cl-td-r cl-td-layout cl-td-layout4">
                                <a href="javascript:void(0)" id="2e9063" title="2e9063">
                                    <span style="background:#2e9063"></span>
                                </a>
                                <a href="javascript:void(0)" id="89c144" title="89c144">
                                    <span style="background:#89c144"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="label_chosen">
                        <div class="cl-tr cl-tr-style-label"><span>{l s='Choose your colors'}</span></div>
                    </div>
                    <div class="cl-tr cl-tr-background">
                        <div class="cl-td-l">{l s='Curent Color'}:</div>
                        <div class="cl-td-r">
                                <div class="colorSelector cl-tool" id="backgroundColor">
                                        <div style="background-color: {$NRT_mainColorScheme}"></div>
                                </div>
                        </div>
                    </div>
                    <div class="cl-tr cl-tr-link">
                        <div class="cl-td-l">{l s='Active Color'}:</div>
                        <div class="cl-td-r">
                                <div class="colorSelector cl-tool" id="hoverColor">
                                        <div style="background-color: {$NRT_activeColorScheme}"></div>
                                </div>
                        </div>
                    </div>
                    <div class="cl-tr cl-row-reset">
                        <span class="cl-reset">{l s='Reset'}</span>
                    </div>
                </div>
            </div>		
        </div>
    </div>
    <div class="control inactive"><a href="javascript:void(0)"></a></div>
</div>