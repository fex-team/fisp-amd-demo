__inline('./esl.js');


// 如果不想替换 smarty plugin， 那么就用此方法转换下.
require.resourceMap = function(config) {
    var paths = {};
    var res = config.res || {};
    var pkg = config.pkg || {};
    var rJs = /\.js$/i;
    var item, url;

    for (var key in res) {
        if (res.hasOwnProperty(key)) {
            item = res[key];
            url = item.pkg ? pkg[item.pkg].url : item.url;
            paths[key.replace(rJs, '')] = url.replace(rJs, '');
        }
    }

    require.config({paths: paths});
};