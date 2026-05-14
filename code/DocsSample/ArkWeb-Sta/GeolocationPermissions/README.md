#  管理位置权限

### ManageLocPerms

#### 介绍

1. 本示例主要介绍管理位置权限，可以通过onGeolocationShow()接口对某个网站进行位置权限管理。Web组件根据接口响应结果，决定是否赋予前端页面权限。
2. 实现对以下指南文档中 https://gitee.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/web/web-geolocation-permission.md 示例代码片段的工程化，保证指南中示例代码与sample工程文件同源。

#### 效果预览

| 主页                                                        | 提示框                                                      |
| ----------------------------------------------------------- | ----------------------------------------------------------- |
| <img src="screenshots\ManageLocPerms_1.png" width="360;" /> | <img src="screenshots\ManageLocPerms_2.png" width="360;" /> |

### 工程目录

```
├── entry
│   └── src
│       └── main
│           ├── ets                                 // ArkTS代码区
│           │   ├── entryability
│           │   │   └── EntryAbility.ets            // 入口类
│           │   └── pages
│           │       └── Index.ets                   // 主页
|           |       |── ApplyGeolocation.ets        // 申请位置权限
|           |       |── GeolocationPermissions.ets  // 管理位置权限
│           └── resources                           // 应用资源文件
```

#### 具体实现

1. 通过onGeolocationShow()接口对某个网站进行位置权限管理。
1. 点击按钮，Web组件通过弹窗的形式通知应用侧位置权限请求消息，参考源码：[ManageLocPerms.ets](./entry/src/main/ets/pages/ManageLocPerms.ets)。
  
### 相关权限

[ohos.permission.INTERNET](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

[ohos.permission.LOCATION](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

[ohos.permission.APPROXIMATELY_LOCATION](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

[ohos.permission.LOCATION_IN_BACKGROUND](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissioninternet)

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行。
2. 本示例支持API23版本SDK，SDK版本号(API Version 23 Release)。
3. 本示例需要使用DevEco Studio 版本号(7.0.0Release)才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/ArkWeb-Sta/CreatePdf > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```