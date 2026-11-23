# 应用及文件系统空间统计

### 介绍

本示例（AppFsSpcaeStatisticsSample，包名 com.example.appfsspcaestatisticssample）展示文件系统空间和应用空间统计。通过 @kit.CoreFileKit 的 statfs、storageStatistics 查询应用大小及文件系统总容量、空闲容量，使用统一逻辑验证字节数并显示二进制单位。相关接口说明如下。

- [应用及文件系统空间统计](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/file-management/app-fs-space-statistics.md)

### 效果预览

|主页|
|--------------------------------|
| 本轮未采集设备截图；界面包含六个原查询按钮及结果区。 |

使用说明:

1. 在主界面，然后点击getFreeSize按钮，界面下方显示“getFreeSize success”内容。
2. 在主界面，然后点击getCurrentBundleStats按钮，界面下方显示“getCurrentBundleStats success”内容。
3. 在主界面，然后点击getTotalSize按钮，界面下方显示“getTotalSize success”内容。
4. 在主界面，然后点击getTotalSizeSync按钮，界面下方显示“getTotalSizeSync success”内容。
5. 在主界面，然后点击storageGetFreeSize按钮，界面下方显示“storageGetFreeSize success”内容。
6. 在主界面，然后点击getFreeSizeSync按钮，界面下方显示“getFreeSizeSync success”内容。

### 工程目录

```text
entry/src/
├── main/
│   ├── ets/
│   │   ├── entryability/EntryAbility.ets
│   │   ├── entrybackupability/EntryBackupAbility.ets
│   │   ├── model/StorageQuery.ets
│   │   └── pages/Index.ets
│   └── resources/
├── ohosTest/ets/
│   ├── test/List.test.ets
│   ├── test/StorageTestSupport.ets
│   ├── test/StorageQuery.test.ets
│   ├── test/StorageRouting.test.ets
│   ├── test/StorageUsage.test.ets
│   ├── test/StorageFormat.test.ets
│   ├── testability/TestAbility.ets
│   └── testrunner/OpenHarmonyTestRunner.ets
└── test/LocalUnit.test.ets
```

测试场景、分组子文件、步骤和验证边界见 [ohosTest.md](ohosTest.md)。

### 具体实现

- 使用 @kit.CoreFileKit 的 [storageStatistics](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-file-storage-statistics.md) 查询应用大小、文件系统总容量及空闲容量，使用同 Kit 的 statfs 查询应用 sandbox 路径的空闲容量。
- [StorageQuery.ets](entry/src/main/ets/model/StorageQuery.ets) 封装六条查询路由、容量快照和二进制单位格式化，校验非负安全整数，并支持注入 SDK 适配器进行逻辑测试。

### 相关权限

不涉及

## 依赖

生产功能使用系统 Kit；测试使用 @ohos/hypium 1.0.24，工程另声明 @ohos/hamock 1.0.0 测试依赖。

## 约束与限制

1.本示例仅支持标准系统上运行，支持设备：PC/2in1。

2.本示例为 Stage 模型，当前编译、目标及兼容 SDK 均为 OpenHarmony API26，版本号 26.0.0；构建需要已安装对应 SDK。

3.本示例需要使用DevEco Studio 6.0.0 Release (构建版本：6.0.0.858，构建 2025年9月24日)及以上版本才可编译运行。

## 下载

以下命令默认使用 master；用于 PR 时，应将拉取分支改为实际目标分支。

```bash
git init
git config core.sparsecheckout true
echo code/DocsSample/CoreFile/AppFsSpcaeStatisticsSample > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```