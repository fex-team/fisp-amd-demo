<!doctype html>
{%html lang="en" framework="amdtest:static/js/esl.js"%}
    {%head%}
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>{%$title%}</title>
        {%require name="amdtest:static/css/style.css"%}
    {%/head%}

    {%body%}
        <div id="wrapper">
            {%widget name="amdtest:widget/header/header.tpl" navs=$navs%}

            {%block name="beforecontent"%}{%/block%}

            <div id="middle" class="container">
                {%block name="content"%}{%/block%}
            </div>

            {%block name="aftercontent"%}{%/block%}

            {%widget name="amdtest:widget/footer/footer.tpl"%}
        </div>

    {%/body%}

    {%require name="amdtest:page/layout.tpl"%}
{%/html%}
