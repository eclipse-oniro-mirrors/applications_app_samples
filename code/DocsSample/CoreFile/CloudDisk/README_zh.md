# 网盘服务底座（C/C++）

## 介绍

本实例主要实现了使用C/C++的方式对接网盘服务底座的能力，通过NAPI封装`OH_CloudDisk_RegisterSyncFolder`、`OH_CloudDisk_UnregisterSyncFolder`、`OH_CloudDisk_ActiveSyncFolder`、`OH_CloudDisk_RegisterSyncFolderChanges`、`OH_CloudDisk_CreatePlaceholder`、`OH_CloudDisk_HydratePlaceholder`、`OH_CloudDisk_DehydrateFile`、`OH_CloudDisk_RegisterCallbackTable`、`OH_CloudDisk_Execute`等API，接口的详细说明请参考[CloudDisk C API参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/capi-oh-cloud-disk-manager-h.md)。主要实现的功能包括：同步根的注册/解注册/激活/去激活、同步根文件变更监听与历史操作记录查询、文件同步状态设置与查询、占位符文件创建/查询/更新/转换、按需水合与脱水、回调表注册与回调响应。该工程中展示的代码详细描述可查如下链接。

- [网盘服务底座概述](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/clouddisk-overview.md)
- [网盘服务底座适配指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/clouddisk-guidelines.md)

## 使用说明

1. 启动应用后，在"同步根管理"页面中点击"选择文件夹"按钮，通过文件选择器选择一个目录作为同步根路径。
2. 输入别名后点击"注册同步根"按钮注册同步根，注册成功后文件管理器侧边栏展示网盘入口。
3. 点击"激活同步根"按钮激活同步根，激活后可对该同步根进行文件变更监听与同步状态管理。
4. 点击"注册监听"按钮注册同步根文件变更监听，同步根下文件增删改会通过回调实时通知。
5. 点击"读取操作记录""设置同步状态""获取同步状态"按钮进入对应子页面操作。
6. 切换到"占位符与水合"页面，左侧菜单选择功能模块，包括创建占位符文件、判断占位符文件、更新占位符元数据、占位符转普通文件、脱水、水合、注册/解注册回调表、响应回调请求等操作。
7. 在水合前需先注册回调表，水合触发后通过回调获取reqKey，再调用Execute回传数据完成落盘。

## 工程目录

```
CloudDisk
├──entry/src/main
│  ├──cpp
│  │  ├──common
│  │  │  ├──logger_common.h            // 日志公共头文件
│  │  │  ├──napi_object_parser.h        // NAPI对象解析公共头文件
│  │  │  └──utils.h                    // 工具公共头文件
│  │  ├──types
│  │  │  └──libentry
│  │  │     ├──Index.d.ts              // NAPI接口类型声明
│  │  │     └──oh-package.json5
│  │  ├──CMakeLists.txt                // CMake脚本文件
│  │  └──napi_init.cpp                 // NAPI函数封装，实现网盘服务底座全部能力
│  ├──ets
│  │  ├──common
│  │  │  └──Utils.ets                  // 公共工具类
│  │  ├──entryability
│  │  │  └──EntryAbility.ets           // 程序入口类
│  │  ├──entrybackupability
│  │  │  └──EntryBackupAbility.ets     // 备份恢复ExtensionAbility
│  │  └──pages
│  │     ├──Index.ets                  // 主界面，同步根管理 + 占位符与水合
│  │     ├──OperationLog.ets           // 历史操作记录查询页面
│  │     ├──SetFileSyncStates.ets      // 设置文件同步状态页面
│  │     └──GetFileSyncStates.ets      // 查询文件同步状态页面
│  ├──resources                        // 资源文件目录
```

## 具体实现

具体实现请参考[网盘服务底座适配指导](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/clouddisk-guidelines.md)。

## 相关权限

| 权限名 | 权限说明 |
|-------|---------|
| ohos.permission.FILE_ACCESS_PERSIST | 文件访问持久化权限，用于持久化授权用户选择的同步根目录 |

## 依赖

不涉及

## 约束与限制

1. 本示例仅支持API版本26.0.0 Release及以上版本运行，支持设备：PC/2in1。

2. 本示例为Stage模型，支持API版本26.0.1 Release及以上版本SDK。

3. 本示例需要使用DevEco Studio 26.0.0 Release及以上版本才可编译运行。

4. 本示例依赖系统预置文件管理器应用，注册同步根后文件管理器侧边栏展示网盘入口。

## 下载

```
git init
git config core.sparsecheckout true
echo code/DocsSample/CoreFile/CloudDisk > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
