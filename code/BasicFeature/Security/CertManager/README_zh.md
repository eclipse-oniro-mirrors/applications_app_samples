# 证书管理

### 介绍

本示例使用了[@kit.DeviceCertificateKit](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-device-certificate-kit/js-apis-certManager.md)相关接口实现了证书安装，签名及签名校验的功能。

实现场景如下：

1. 使用正确的原始数据和签名数据进行签名校验场景：模拟服务端通过客户端证书获取公钥，对签名数据进行校验，验证客户端身份和原始数据完整性，校验通过。

2. 使用错误的原始数据或签名数据进行签名校验场景：模拟攻击者修改原始数据或签名数据，服务端进行签名校验时，攻击者身份不可信或原始数据不完整，校验失败。

### 效果预览

|                 主页                 |                   校验通过                   |             校验失败             |
|:----------------------------------:|:------------------------------------------:|:---------------------------------------:|
| ![](screenshots/device/index.jpeg) | ![](screenshots/device/verify_success.jpeg) | ![](screenshots/device/verify_fail.jpeg) |

### 使用说明

1. 点击**安装证书**按钮，页面弹出提示**安装成功**。

2. 点击**数据展示**按钮，页面文本框中分别显示证书数据和原始数据内容。

3. 点击**签名**按钮，页面文本框中显示签名数据内容，并弹出提示**签名通过**。

4. 点击**修改原始数据**按钮，页面显示修改后的原始数据和正确的签名数据；点击**签名校验**按钮，页面弹出提示**校验失败**。

5. 点击**修改签名数据**按钮，页面显示修改后的签名数据和正确的原始数据；点击**签名校验**按钮，页面弹出提示**校验失败**。

6. 点击**签名校验**按钮，页面弹出提示**校验通过**。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ts                                       // 程序入口
|---model
|   |---Data.ts                                               // 证书与签名测试数据
|   |---Model.ts                                              // 证书安装，签名与验签封装
|   |---Logger.ts                                             // 日志工具
|---pages
|   |---Index.ets                                             // 主界面
entry/src/ohosTest/ets/
|---TestRunner
|   |---OpenHarmonyTestRunner.ts                               // 测试运行器
|---test
|   |---*.test.ets                                            // 测试用例，详见ohosTest.md
|---testability                                               // 测试辅助页面与能力
```

### 具体实现

* 证书安装，签名与验签等功能封装在[Model.ts](entry/src/main/ets/model/Model.ts)的CertManagerModel类中，主界面[Index.ets](entry/src/main/ets/pages/Index.ets)通过按钮调用对应方法，证书与签名测试数据定义在[Data.ts](entry/src/main/ets/model/Data.ts)。
    * 安装私有凭据：调用[certificateManager.installPrivateCertificate](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-device-certificate-kit/js-apis-certManager.md#certificatemanagerinstallprivatecertificate)接口，使用Data.ts中预置的PKCS12私钥数据，密钥库口令和别名安装证书，并获取返回结果cmResult。
    * 数据展示：dataDisplay方法通过util.Base64Helper将证书数据Base64编码后，与原始数据一并返回展示。
    * 使用凭据进行签名：调用[certificateManager.init](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-device-certificate-kit/js-apis-certManager.md#certificatemanagerinit)接口初始化签名，参数CMSignatureSpec使用PSS填充，SHA1摘要和SIGN用途，然后调用[certificateManager.update](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-device-certificate-kit/js-apis-certManager.md#certificatemanagerupdate)接口填充源数据，最后调用[certificateManager.finish](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-device-certificate-kit/js-apis-certManager.md#certificatemanagerfinish)接口完成签名，并获取签名结果。
    * 使用凭据进行验签：以VERIFY用途调用certificateManager.init接口初始化验签，然后调用certificateManager.update接口填充源数据，最后调用certificateManager.finish接口传入签名数据完成验签，未抛出异常即校验通过。
    * 修改原始数据与修改签名数据：分别通过modifyOriginData与modifySignatureData方法，将原始数据或签名数据替换为Data.ts中预置的篡改内容后展示。

### 相关权限

[ohos.permission.ACCESS_CERT_MANAGER](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionaccess_cert_manager)：允许应用安装私有凭据，并使用凭据进行签名与验签。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持在标准系统上运行，支持设备类型：default，tablet。

2. 本示例基于Stage模型开发，已适配API version 26版本SDK，SDK版本号：26.0.0。

3. 本示例需要使用DevEco Studio 26及以上版本才可编译运行。

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Security/CertManager/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
