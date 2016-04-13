# Demo
http://139.162.57.223/

# Description

这是一个使用 `Rails` 搭建的图片上传分享应用（练习作品）

有用户登录注册功能，使用 `ActionMailer` 和 `Sidekiq` 发送注册成功提示邮件。

使用 `CarrierWave` 和 `RMagick` 实现图片上传。

用户可以在首页或照片详情页面 Like 一张照片，使用 `Redis` 管理 Photo 的 view counts 和 like counts。

已登录用户可以对照片发表评论。

使用 `Capistrano` 实现自动部署到 Linode 服务器。

Production 使用 `MySQL`，`Puma`，`Nginx`

# Screen Shot

![Demo Picture](https://raw.githubusercontent.com/although2013/use_cap_deploy/master/screen_shot_1.jpg)
![Demo Picture](https://raw.githubusercontent.com/although2013/use_cap_deploy/master/screen_shot_2.jpg)
