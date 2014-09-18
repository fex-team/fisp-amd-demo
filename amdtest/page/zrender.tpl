{%extends file="common/page/layout.tpl"%}

{%block name="content"%}
<div id="main" style="height:400px"></div>
{%script%}
require(['/app/zrender.js'], function (app) {
    app();
});
{%/script%}
{%require name="amdtest:page/zrender.tpl"%}
{%/block%}