Fisp amd 测试项目
============================

用来测试 amd 各种用法， 同时也演示了如何去让 Fis 去支持 amd。同样适用于 Yogurt 项目。

目前已有 zrender 和 echarts 的使用示例。

**我们的目标是支持所有的 amd 用法，如果发现有不支持的用法，请提交示例，我们第一时间修复！**

## 修改步骤说明

1. 安装 [fis-postprocessor-amd](https://github.com/fex-team/fis-postprocessor-amd).

    ```bash
    npm install fis-postprocessor-amd -g
    ```
2. 给 js 和 tpl 启动此插件。

    ```javascript
    fis.config.set('modules.postprocessor.tpl', 'amd');
    fis.config.set('modules.postprocessor.js', 'amd');
    ```
3. 修改 framework 为新的 [mod-amd.js](https://raw.githubusercontent.com/fex-team/mod/master/mod-amd.js)。原来的 mod.js 已经不能适用。
4. 修改 plugin/FISResource.class.php 把原来的生成 resourceMap 的逻辑删了。

    ```php
    private static function getModJsHtml(){
        $html = '';
-       self::getResourceMap();
+       $resourceMap = false; // self::getResourceMap();
-       $loadModJs = (self::$framework && (isset(self::$arrStaticCollection['js']) || $resourceMap));
+       $loadModJs = true; // (self::$framework && (isset(self::$arrStaticCollection['js']) || $resourceMap));
        //require.resourceMap要在mod.js加载以后执行
        if ($loadModJs) {
            $html .= '<script type="text/javascript" src="' . self::$framework . '"></script>' . PHP_EOL;
        }
        if ($resourceMap) {
            $html .= '<script type="text/javascript">';
            $html .= 'require.resourceMap('.$resourceMap.');';
            $html .= '</script>';
        }
        return $html;
    }
    ```

## 兼容性问题

除了 `require.async` 外，其他写法都兼容。其实原来的写法 `require.async(id | deps, callback)` 等价于 `require(deps, callback)`。

另外不在 `define` 中的 require(id) 这种用法，不是 amd 的标准用法，但是有很多老用户是这么写的，所以做了兼容处理，但是不推荐这么用, 因为这样你是没法把 mod-amd.js 直接换成 require.js 使用。
