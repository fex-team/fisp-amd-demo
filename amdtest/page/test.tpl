{%extends file="common/page/layout.tpl"%}
{%block name="content"%}
{%script%}
require(['/app/test'], function (app) {
alert(app.add(1,2));
});
{%/script%}
{%require name="amdtest:page/test.tpl"%}
{%/block%}