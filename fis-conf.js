fis.config.set('namespace', 'amdtest');

fis.config.set('modules.postprocessor.tpl', 'amd');
fis.config.set('modules.postprocessor.js', 'amd');

fis.config.set('settings.postprocessor.amd', {
    baseUrl: './widget',
    packages: [
        {
            name: 'zrender',
            location: 'lib/zrender',
            main: 'zrender'
        },

        {
            name: 'echarts',
            location: 'lib/echarts',
            main: 'echarts'
        }
    ]
});

fis.config.set('pack', {
    'pkg/lib/zrender.js': 'widget/lib/zrender/**.js',
    'pkg/lib/echart.js': 'widget/lib/echarts/**.js'
});