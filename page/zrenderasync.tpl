{%extends file="./layout.tpl"%}

{%block name="content"%}
<div id="main" style="height:400px"></div>
{%script%}
define('router', function() {
    require(['/app/zrender.js'], function (app) {
        app();
    }); 
});
require(['router']);
{%/script%}
{%require name="amdtest:page/zrenderasync.tpl"%}
{%/block%}