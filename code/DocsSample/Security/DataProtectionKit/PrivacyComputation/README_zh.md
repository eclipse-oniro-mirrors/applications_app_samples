# 隐私计算

## 介绍

本示例使用[@ohos.security.privacyComputation](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-data-protection-kit/js-apis-privacyComputation.md)接口，展示了隐私计算的两类协议：PSI（隐私集合求交）与PIR（隐私信息检索）的开发流程。

一次完整的隐私计算包含三个步骤：发起端调用`genPrivacyTarget`生成隐私目标，响应端调用`privacySearch`执行隐私搜索并返回结果密文，发起端调用`getSearchResult`解密结果密文得到命中结果及响应端的原始附加值。具体开发步骤可参考[使用PSI协议进行隐私集合求交](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit/privacy-computation-psi.md)和[使用PIR协议进行隐私信息检索](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit/privacy-computation-pir.md)。

## 效果预览

| 首页效果图 |
|--------|
| ![Index](screenshots/index.png) |

## 使用说明

1. 启动应用进入主界面。
2. 点击"PSI协议验证"按钮，执行PSI协议的隐私集合求交流程，结果显示是否命中。
3. 点击"PIR协议验证"按钮，执行PIR协议的隐私信息检索流程，结果显示是否命中及附加值数量。

## 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ts                         // 入口Ability
|---operations
|   |---common.ets                               // 通用工具
|   |---index.ets                                 // 操作导出
|   |---psi.ets                                   // PSI协议流程代码
|   |---pir.ets                                   // PIR协议流程代码
|---pages
    |---Index.ets                                 // 主页面
```

## 具体实现

* `psi.ets`和`pir.ets`中包含隐私计算的完整示例代码，通过`// [Start xxx]`和`// [End xxx]`标记与开发指南示例代码同源同步。
    * **PSI协议流程**（对应[使用PSI协议进行隐私集合求交](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit/privacy-computation-psi.md)）：构造`TargetElement`与`PrivacyProtocol`（SIZE_512 + PSI_PROTOCOL），调用`genPrivacyTarget`生成隐私目标；构造`Element`数组（仅含elemKey与hashAlg），调用`privacySearch`执行隐私搜索；调用`getSearchResult`解密结果，`matchedResult`指示是否命中。
    * **PIR协议流程**（对应[使用PIR协议进行隐私信息检索](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/security/DataProtectionKit/privacy-computation-pir.md)）：构造`TargetElement`与`PrivacyProtocol`（SIZE_256 + PIR_PROTOCOL），调用`genPrivacyTarget`生成隐私目标；构造`Element`数组（含elemKey、hashAlg与elemValue附加值），调用`privacySearch`执行隐私搜索；调用`getSearchResult`解密结果，命中时`attachedValues`返回附加值。

源码参考：[psi.ets](entry/src/main/ets/operations/psi.ets)、[pir.ets](entry/src/main/ets/operations/pir.ets)

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。

2. 本示例可在API26及其以上版本的SDK上运行。

3. 本示例需要使用DevEco Studio 5.0 Release及以上版本才可编译运行。

4. 本示例使用的隐私计算能力需设备支持SystemCapability.Security.Asset，可使用canIUse判断该SysCap是否可调用。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/Security/DataProtectionKit/PrivacyComputation/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
