# USB Key可信持有物认证

### 介绍

本示例展示如何通过MDM Kit的securityManager接口实现USB Key可信持有物的绑定、解绑、查询以及解锁策略的配置。USB Key是一种基于硬件的身份认证设备，通过MDM应用可以实现USB Key与企业设备的绑定/解绑管理。本示例依照开发指南[基于USB Key的身份认证](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/mdm/mdm-kit-ukey-auth.md)进行编写。

本示例涉及使用接口：
- @ohos.enterprise.securityManager中的[openSession](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanageropensession)、[closeSession](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagerclosesession)、[addUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanageradduserextendcredential)、[removeUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagerremoveuserextendcredential)、[getUserExtendCredential](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagergetuserextendcredential)、[setUnlockPolicy](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagersetunlockpolicy)、[getUnlockPolicy](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-mdm-kit/js-apis-enterprise-securityManager.md#securitymanagergetunlockpolicy)接口
- @ohos.userIAM.userAuth中的[getUserAuthInstance](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-user-authentication-kit/js-apis-useriam-userauth.md#userauthgetuserauthinstance10)接口

### 使用说明

1. 安装完成后，需要使用命令激活企业设备管理扩展能力。

2. 激活：`hdc shell edm enable-admin -n com.example.usbkeyauth -a EnterpriseAdminAbility`。

3. 解除激活：`hdc shell edm disable-admin -n com.example.usbkeyauth`。

4. 打开应用，在功能页面点击对应按钮可调用相关接口。例如：点击"绑定 USB Key"可发起USB Key绑定流程。

### 工程目录
```
entry/src/main/ets/
|---common
|   |---Constants.ets                      // 常量定义
|   |---Logger.ets                         // 日志工具
|---service
|   |---UsbKeyAuthService.ets              // USB Key认证业务逻辑
|---enterpriseadminability
|   |---EnterpriseAdminAbility.ets         // 企业设备管理扩展能力生命周期回调
|---entryability
|   |---EntryAbility.ets                   // 程序入口
|---pages
|   |---mainPage.ets                       // 主页
```

### 具体实现

* USB Key绑定：调用openSession获取挑战值，通过userAuth发起PIN认证获取authToken，再调用addUserExtendCredential完成绑定。
* USB Key解绑：先查询已绑定凭据获取credentialId，调用openSession获取挑战值，通过userAuth认证后调用removeUserExtendCredential完成解绑。
* 查询凭据：调用getUserExtendCredential查询已绑定的USB Key凭据列表。
* 解锁策略：调用setUnlockPolicy配置解锁模式，调用getUnlockPolicy查询当前解锁策略。

### 相关权限

1. 允许应用激活设备管理员应用权限：ohos.permission.MANAGE_ENTERPRISE_DEVICE_ADMIN

2. 允许设备管理应用管理安全策略权限：ohos.permission.ENTERPRISE_MANAGE_SECURITY

3. 允许访问生物特征认证权限：ohos.permission.ACCESS_BIOMETRIC

### 依赖

不涉及。

### 约束与限制

1. 本示例已适配API version 26版本SDK。

2. USB Key可信持有物认证功能仅支持PC和2in1设备。

3. 本示例需要使用DevEco Studio 6.1.0 Release及以上版本才可编译运行。

### 下载

如需单独下载此项目，执行如下命令：
```
git init
git config core.sparsecheckout true
echo code/DocsSample/MDMKit/UsbKeyAuth/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
