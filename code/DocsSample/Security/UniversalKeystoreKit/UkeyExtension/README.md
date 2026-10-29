# UkeyExtension

本示例展示了密钥管理扩展能力的使用，包括Provider注册/注销、资源打开/关闭、PIN认证状态查询、密钥生成/导出/导入、资源ID获取、属性设置等操作。

## 功能介绍

- Provider注册与注销（ArkTS + C/C++）
- 资源打开与关闭（ArkTS + C/C++）
- PIN认证状态查询与清除（ArkTS + C/C++）
- 扩展密钥生成、公钥导出、密钥导入（ArkTS）
- 获取资源ID与属性设置（ArkTS）
- 浏览器双向SSL认证场景完整实践（ArkTS + C/C++）

## 效果预览

暂不提供效果图。

## 工程目录

```text
entry/src/main/
|---cpp/
|   |---napi_init.cpp                          // C/C++接口实现
|   |---CMakeLists.txt                         // CMake构建配置
|   |---types/libentry/
|       |---Index.d.ts                         // C/C++接口声明
|---ets/
|   |---entryability/
|   |   |---EntryAbility.ets                   // 入口Ability
|   |---entrybackupability/
|   |   |---EntryBackupAbility.ets             // 备份Ability
|   |---pages/
|       |---Index.ets                          // 首页入口
|       |---RegisterProvider.ets               // 注册Provider
|       |---RegisterProviderWithAuthUI.ets     // 注册Provider与定制化认证UI
|       |---UnregisterSingleAbility.ets        // 注销单个Ability
|       |---UnregisterAllAbilities.ets         // 批量注销
|       |---OpenResource.ets                   // 打开资源
|       |---CloseResource.ets                  // 关闭资源
|       |---QueryAuthState.ets                 // 查询PIN认证状态
|       |---ClearPinAuthState.ets              // 清除PIN认证状态
|       |---ExtensionKeyGeneration.ets         // 扩展密钥生成
|       |---ExtensionKeyExport.ets             // 公钥导出
|       |---ExtensionKeyImport.ets             // 密钥导入
|       |---GetResourceId.ets                  // 获取资源ID
|       |---SetProperty.ets                    // 属性设置
|       |---OpenAuthorizeDialog.ets            // 打开授权弹窗
|       |---UkeyAuthDialog.ets                 // 打开UKey认证弹窗
|       |---UkeyBestPractice.ets               // 浏览器双向SSL最佳实践
|---module.json5                               // 模块配置
```

## 具体实现

- Provider注册与注销的功能接口封装在huksExternalCrypto模块，源码参考：[RegisterProvider.ets](entry/src/main/ets/pages/RegisterProvider.ets)
    - 调用huksExternalCrypto.registerProvider注册Provider
    - 调用huksExternalCrypto.unregisterProvider注销Provider
- 资源打开与关闭的功能接口封装在huksExternalCrypto模块，源码参考：[OpenResource.ets](entry/src/main/ets/pages/OpenResource.ets)
    - 调用huksExternalCrypto.openResource打开资源
    - 调用huksExternalCrypto.closeResource关闭资源
- PIN认证状态查询与清除的功能接口封装在huksExternalCrypto模块，源码参考：[QueryAuthState.ets](entry/src/main/ets/pages/QueryAuthState.ets)
    - 调用huksExternalCrypto.getUkeyPinAuthState查询PIN认证状态
    - 调用huksExternalCrypto.clearUkeyPinAuthState清除PIN认证状态
- 扩展密钥生成、公钥导出、密钥导入的功能接口封装在huks和huksExternalCrypto模块，源码参考：[ExtensionKeyGeneration.ets](entry/src/main/ets/pages/ExtensionKeyGeneration.ets)
    - 调用huks.generateKeyItem生成密钥，需指定HUKS_TAG_KEY_CLASS为HUKS_KEY_CLASS_EXTENSION
    - 调用huks.exportKeyItem导出公钥
    - 调用huks.importWrappedKeyItem导入加密封装密钥
- 浏览器双向SSL认证场景的C/C++实现，源码参考：[napi_init.cpp](entry/src/main/cpp/napi_init.cpp)
    - 调用OH_CertManager_GetUkeyCertificate获取UKey证书
    - 调用OH_Huks_OpenResource打开资源
    - 调用OH_Huks_GetUkeyPinAuthState查询PIN认证状态
    - 调用OH_Huks_InitSession和OH_Huks_FinishSession完成三段式签名

## 相关权限

| 权限名称 | 权限说明 | 授权方式 |
| --- | --- | --- |
| ohos.permission.CRYPTO_EXTENSION_REGISTER | 允许应用注册外部密钥管理扩展能力 | system_grant |

## 依赖

不依赖其他sample工程。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568;
2. 本示例支持API 22及以上版本SDK，其中API 22支持Provider注册/注销、资源打开/关闭、PIN认证状态查询等能力，API 26.0.0及以上支持密钥生成/导出/导入、资源ID获取、属性设置等能力;
3. 本示例需要使用DevEco Studio才可编译运行;
4. 本示例涉及ohos.permission.CRYPTO_EXTENSION_REGISTER权限为system_basic级别，需要配置高权限签名;

## 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/DocsSample/Security/UniversalKeystoreKit/UkeyExtension/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
