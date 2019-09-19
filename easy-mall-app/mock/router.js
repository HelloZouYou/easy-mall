module.exports = (app) => {
    const home = require('./data/home');
    const image = require('./data/image');

    app.get('/home/banner', home.getBannerData);
    app.get('/home/category', home.getCategoryData);

    // 图片资源
    app.get('/image/banner/:id', image.banner);
    app.get('/image/category/:id', image.category);
};
