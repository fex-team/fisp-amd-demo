{%extends file="./layout.tpl"%}

{%block name="content"%}
<div id="main" style="height:400px"></div>
{%script%}
require(['/app/echarts.js'], function (app) {
    app();
});
{%/script%}
{%require name="amdtest:page/echarts.tpl"%}
{%/block%}