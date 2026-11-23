# 应用触发数据备份恢复（仅对系统应用开放）

## 介绍

仅系统应用可以触发数据备份恢复，触发后备份恢复框架会确认各个应用是否接入了数据备份恢复。如果应用已接入，备份恢复框架将会根据应用的配置文件备份、恢复数据。本实例实现了获取能力文件、应用备份数据和应用恢复数据三大功能，应用还涉及到权限申请方式和系统应用签名，该工程中展示的代码详细描述可查如下链接。

- [获取能力文件](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/file-management/app-file-backup.md#获取能力文件)
- [应用备份数据](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/file-management/app-file-backup.md#应用备份数据)
- [应用恢复数据](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/file-management/app-file-backup.md#应用恢复数据)

## 效果预览

| <img src="./screenshots/start.jpg" width = "450"/> |
| :------------------------------------------------: |
|                                                    |

使用说明：

1. 本应用主要用于拉起应用数据备份，依赖于FileBackupExtension应用，在使用前确保安装FileBackupExtension应用。
2. 启动该应用后，通过点击相关的按钮可以拉起FileBackupExtension应用的数据备份和恢复，备份和恢复将会按照FileBackupExtension应用中配置的数据 备份和恢复框架进行。

## 工程目录

```
├──entry/src/main
|	├──ets
|	|	├──backuprestore
|	|	|	└──BackupRestore.ets        // 备份恢复函数封装
|	|	├──commom
|	|	|	├──Logger.ts				// 日志工具
|	|	├──entryability
|	|	|	└──EntryAbility.ets         // 程序入口类
|	|	├──entrybackupability
|	|	|	└──EntryBackupAbility.ets   
|	|	└──pages                        // 页面文件
|	|		└──Index.ets 				// 主界面
|	├──resources						// 资源文件目录	
```

## 具体实现

1. 导入依赖模块@ohos.file.backup，申请系统权限ohos.permission.BACKUP，详情请参考：[权限申请的方式](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/security/AccessToken/determine-application-mode.md)
2. 获取能力文件需要调用backup.getLocalCapabilities，函数封装在BackupRestore.ets。
3. 启动应用备份过程中，备份恢复服务会将应用的数据打包成文件，通过创建实例时所注册的回调onFileReady接口返回文件句柄。
4. 备份恢复服务会根据开发者调用getFileHandle的请求内容，将应用待恢复数据的文件句柄，通过创建实例时注册的回调onFileReady]接口返回。

## 相关权限

| 权限名                 | 权限说明                   | 级别         |
| ---------------------- | -------------------------- | ------------ |
| ohos.permission.BACKUP | 允许应用拥有备份恢复能力。 | system_basic |

## 依赖

该应用作为系统级应用程序，为了实现备份和恢复功能，必须预先安装文件备份扩展应用。

## 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568。
2. 本示例为Stage模型，当前工程配置为OpenHarmony API 26（SDK版本字段26.0.0），备份服务接口为系统API，需要包含`backup`导出的完整系统SDK。原API14说明仅为历史环境，不作为本轮构建依据。
3. 本示例需要使用DevEco Studio 5. 1Release (Build Version: 5.0.5.306, built on December 6, 2024)及以上版本才可编译运行。
4. 本示例涉及部分接口需要配置系统应用签名，可以参考[特殊权限配置方法](https://gitcode.com/openharmony/docs/blob/OpenHarmony-5.0.1-Release/zh-cn/application-dev/security/hapsigntool-overview.md) ，把配置文件中的“apl”字段信息改为“system_basic”。

## 自动化测试与本轮验证

设备套件包含2个真实FileIo场景和768个文件传输逻辑矩阵用例，连同11个基础逻辑共781例；另有1个本地逻辑用例。完整Hypium启动、静态注册与场景说明见[ohosTest.md](ohosTest.md)。

本地主机检查可运行`node host-regression.cjs`，仅转译实际BackupFileTransfer生产逻辑并注入记录端口，禁止执行FileIo、系统备份服务、UI或Native接口；结果不是设备通过证明。最终主机回归780/780通过，实际执行16,467次断言，运行器25项契约检查通过。测试目录54,637物理行，包含注释和空行，不宣称五万行纯业务代码；源码绑定的782条逐例目录见测试归档。

本轮使用当前 API 26 SDK（26.0.0）完成 main 和 ohosTest 编译，并恢复原有 `ohos.permission.BACKUP` 声明。真实 FileIo、备份服务和 UI 仍需系统签名设备及配套 FileBackupExtension 应用验证；编译成功不代表设备通过。未修改或补丁化共享 SDK。

## 下载

```
git init
git config core.sparsecheckout true
echo code/DocsSample/CoreFile/AppFileBackup > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

