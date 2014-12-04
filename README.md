Fisp amd 测试项目
============================

用来测试 amd 各种用法， 同时也演示了如何去让 Fis 去支持 amd。同样适用于 Yogurt 项目。

目前已有 zrender 和 echarts 的使用示例。

**我们的目标是支持所有的 amd 用法，如果发现有不支持的用法，请提交示例，我们第一时间修复！**

## 为什么要用 amd

现有太多 amd 组件、模块都是以 amdjs 规范使用的，原来的 mod.js 不支持，导致每次都要手动修改后才能在 fis 中使用。
非常不便于维护与升级。

## 体验此demo
1. git clone 下来此仓库。

    ```
    git clone git@github.com:fex-team/fis-amd-demo.git
    ```
2.  更新 submodule，由于要修改 fisp smarty 插件，记得一定要用最新的 plugin.

    ```
    git submodule init
    git submodule update
    ```
3. release 模块

    ```
    fisp release -r common
    fisp release -r amdtest
    ```
4. 开启服务。

    ```
    fisp server start
    ```
5. 打开 `http://127.0.0.1:8080/amdtest/page/echarts` 开始预览。

## 如何让 fisp 支持 amd?

1. 安装 [fis-postprocessor-amd](https://github.com/fex-team/fis-postprocessor-amd) 编译插件.

    ```bash
    npm install fis-postprocessor-amd -g
    ```
2. 给 js 和 tpl 启动此插件。

    ```javascript
    fis.config.set('modules.postprocessor.tpl', 'amd');
    fis.config.set('modules.postprocessor.js', 'amd');
    ```
3. 有两种方案:

    * 此方案比较简单，但是不够标准，推荐老项目升级使用。

        1. 使用此项目中 /common/static/js/mod.js。
    * 此方法相对复杂点，但是比较合理，推荐新项目使用。

        1. 修改 framework 为新的 [mod-amd.js](https://raw.githubusercontent.com/fex-team/mod/master/mod-amd.js)，或者可以直接使用 els.js 或者 require.js.
        2. 修改 plugin/FISResource.class.php 替换成本项目下 plugin 目录下的 FISResource.class.php 文件。

5. 更多信息请查看 [fis-postprocessor-amd 说明](https://github.com/fex-team/fis-postprocessor-amd)

## 兼容性问题

不用担心，对于原来 require.async 和 require(id) 非标准 amd 用法都兼容。

## 注意

由于 FIS 产出的 module id 为这种格式 ns:path/xxxx, require.js 认为它是 url 导致发送 script 请求而报错。

需要对 require.js 做修改，直接在最下面加上如下配置

```javascript
// 修改 require.js
// 由于 fis 中生成的 module id 格式为 xxx:path 这种格式，被认为是 url 导致 require.js 会发请求
require.jsExtRegExp = /^\/|:\/\/|\?|\.js$/;
```
