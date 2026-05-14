#  设置深色模式

## 介绍

1. 实现对以下指南文档中[设置深色模式](https://gitcode.com/openharmony/docs/blob/OpenHarmony_feature_sta_20260331/zh-cn/application-dev/web/web-set-dark-mode.md)示例代码片段的工程化，保证指南中示例代码与sample工程文件同源。

## DarkMode_two

### 介绍

1. 本示例主要介绍对前端页面进行深色模式配置，通过forceDarkAccess()接口可将前端页面强制配置深色模式。

### 效果预览

| 主页                                                    |
| ------------------------------------------------------- |
| <img src="screenshots\DarkMode_two.png" width="360;" /> |

使用说明

1. 将深色模式配置成WebDarkMode.On，并通过forceDarkAccess()接口将页面强制配置为深色模式。

## 工程目录

```
entry/src/main/
|---ets
|---|---entryability
|---|---|---EntryAbility.ets
|---|---pages
|---|---|---Index.ets						// 首页
|---|---|---DarkMode_two.ets
|---|---|---DarkMode_three.ets
|---|---|---DarkMode_four.ets
|---resources								// 静态资源
|---ohosTest
|---|---ets
|---|---|---tests
|---|---|---|---Ability.test.ets            // 自动化测试用例
```

## 具体实现
* 通过darkMode接口配置Web深色模式。参考源码：[DarkMode_two.ets](./entry/src/main/ets/pages/DarkMode_two.ets)

## 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v5.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例支持SDK版本号(API Version 26.0.0 Canary)。
3. 本示例需要使用DevEco Studio 版本号(6.0.0.94SP4)才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/WebSetDarkMode > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```