fis.config.set('namespace', 'amdtest');
fis.config.set('modules.postprocessor.tpl', 'amd');
fis.config.set('modules.postprocessor.js', 'amd');

fis.config.set('settings.postprocessor.amd', {
    baseUrl: './widget',
    packages: [

        // zrender 模块下的
        {
            name: 'zrender',
            location: 'common:widget/lib/zrender',
            main: 'zrender'
        },

        // 本模块下的

        {
            name: 'echarts',
            location: 'lib/echarts',
            main: 'echarts'
        }
    ]
});

fis.config.set('pack', {
    'pkg/lib/echart.js': 'widget/lib/echarts/**.js'
});