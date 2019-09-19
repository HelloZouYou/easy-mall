module.exports = (app) => {
    const home = require('./data/home')

    app.get('/home/banner', home.getBannerData)
    app.get('/home/category', home.getCategoryData)
};
