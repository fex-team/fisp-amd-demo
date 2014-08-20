{%extends file="./layout.tpl"%}

{%block name="content"%}
<div id="main" style="height:400px"></div>
{%script%}
define('router', function() {
    require(['/app/echarts.js'], function (app) {
        app();
    });
});
require(['router']);
{%/script%}
{%require name="amdtest:page/echartsasync.tpl"%}
{%/block%}