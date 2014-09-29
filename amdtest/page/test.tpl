{%extends file="common/page/layout.tpl"%}
{%block name="content"%}
    {%script%}
    require(['/app/test'], function (app) {
    alert(app.add(1,2));
    });
    /*require(['/app/ui'], function (ui) {
    alert(ui.show());
    });*/
    var ui = require('/app/ui');
    ui.show()
    {%/script%}
    {%require name="amdtest:page/test.tpl"%}
{%/block%}