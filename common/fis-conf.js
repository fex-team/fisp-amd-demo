fis.config.set('namespace', 'common');
fis.config.set('project.exclude', /^\/plugin\/test\/.*/i);

fis.config.set('modules.postprocessor.tpl', 'amd');
fis.config.set('modules.postprocessor.js', 'amd');

fis.config.set('pack', {
    'pkg/lib/zrender.js': 'widget/lib/zrender/**.js'
});