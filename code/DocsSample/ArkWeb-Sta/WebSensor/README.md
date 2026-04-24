# 使用运动和方向传感器监测设备状态

### UseMotionDirSensor

#### 介绍

1. 实现对以下指南文档中 https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/web/web-sensor.md 示例代码片段的工程化，保证指南中示例代码与sample工程文件同源。

#### 效果预览

| 主页                                                         | 弹窗                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="screenshots\UseMotionDirSensor_1.png" width="360;" /> | <img src="screenshots\UseMotionDirSensor_2.png" width="360;" /> |

使用说明

1. 点击加速度按钮申请权限，获取请求权限的资源类型，弹出提示框。
2. 点击onConfirm进行传感器授权处理。

## 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---Cache_one
|---|---|---Cache_two
|---|---|---CookieManagement
|---|---|---DomStorage
|---|---|---UserAgent_one.ets
|---|---|---UserAgent_three.ets
|---|---|---UserAgent_two.ets
|---|---|---UseMotionDirSensor.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

## 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

[ohos.permission.ACCELEROMETER](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionaccelerometer)

[ohos.permission.GYROSCOPE](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissiongyroscope)

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例支持API14版本SDK，SDK版本号(API Version 14 Release)。
3. 本示例需要使用DevEco Studio 版本号(5.0.1Release)才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb/SetBasicAttrsEvts/SetBasicAttrsEvtsTwo > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
