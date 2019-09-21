module.exports = (app) => {
    const home = require('./data/home');
    const image = require('./data/image');

    app.get('/home/banner', home.getBannerData);
    app.get('/home/category', home.getCategoryData);
    app.get('/home/coupon', home.getCouponData);
    app.get('/home/goods', home.getGoodsData);

    // 图片资源
    app.get('/image/banner/:id', image.banner);
    app.get('/image/category/:id', image.category);
    app.get('/image/goods/:id', image.goods);
};
