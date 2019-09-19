exports.banner = (req, res) => {
    res.status(200).sendFile('https://github.com/HelloZouYou/easy-mall/blob/master/easy-mall-app/mock/data/banner/' + req.params.id + '.png')
}
