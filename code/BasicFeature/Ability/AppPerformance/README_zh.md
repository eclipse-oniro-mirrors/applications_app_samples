# 应用内存优化与快启（AppPerformance）

[English](<README.md>) · [测试用例归档](<ohosTest.md>)

## 介绍

本示例采用 OpenHarmony Stage 模型和 ArkTS，演示应用文件页缓存释放请求、应用快启（HyperSnap）管理及可重复的随包负载实验。应用包名为 `com.samples.appperformance`。采用单 entry 实现：执行、账本和报告实现在其 core 目录内，与平台和资源适配、页面及 Ability 生命周期一同归属 entry。

| 完整 API 模块与官方文档 | Kit 导入 | 本示例中的用途 |
|---|---|---|
| [@ohos.app.ability.appMemoryOptimizer](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-appmemoryoptimizer/) | `@kit.AbilityKit` | 发现自身文件或模块目标后请求释放文件页缓存。文件目标接受 `.so`、`.hap`、`.hsp`，实验同时校验随包配置。 |
| [@ohos.app.ability.hyperSnapManager](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-app-ability-hypersnapmanager/) | `@kit.AbilityKit` | 设置本应用快启开关并请求重建；请求结果与实际快启启动分开记录。 |
| [@ohos.resourceManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | `@kit.LocalizationKit` | 读取文本、笔记列表、图片索引和表单草稿四类随包负载，并校验重读完整性。 |
| [@ohos.data.preferences](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | `@kit.ArkData` | 保存有界调用记录、实验账本和系列元信息。 |
| [@ohos.pasteboard](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-pasteboard.md) | `@kit.BasicServicesKit` | 按用户操作复制调用记录、脱敏账本和 Markdown / CSV 报告。 |
| [Node-API](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/napi/napi-introduction.md) | Native | 为独立诊断 Runner 提供私有文件校准和持有映射采样。 |

## 效果预览

主工具页包括内存优化、应用快启、调用记录、维护计划和检查结果。业务负载实验台用于选择负载与模式、运行单次或重复实验，并查看结果和历史。

## 使用说明

### 运行准备

1. 按文末命令下载工程，在 DevEco Studio 中打开 `AppPerformance` 工程根目录。保留 AppScope、entry 和根构建文件的相对位置，不单独导入 entry。
2. 准备 OpenHarmony SDK `26.0.0` 及 Native / CMake 工具链。在 IDE 中同步依赖，或在工程根目录执行 `ohpm install --all`。
3. 在 IDE 中为 `default` 产品配置本机调试签名，选择兼容的标准系统设备，构建并运行 entry。
4. 第一次进入主工具页后，可先读取资源并运行无回收对照，再体验其余功能。

### 内存优化与资源完整性

1. 在内存优化页刷新目标，查看实际发现的文件和模块。选择目标或输入合法文件名；空值、目录形式和非法后缀会被阻止。
2. 读取随包资源建立基线，再执行完整性校验。界面显示资源身份、字节数、校验结果和读取失败原因。
3. 选择文件或模块目标后发送回收请求，在调用记录中查看状态、错误码与耗时。

### 负载实验、历史与报告

1. 进入负载实验台，选择文本、笔记列表、图片索引或表单草稿，先运行“无回收对照”。流程包含目标发现、配置校验、负载读取、对照或回收请求、同资源重读、配置回读六阶段。
2. 按需选择文件或模块模式。对比实验应使用相同的设备、应用/系统版本、前后台状态、目标和负载内容。
3. 设置 1–10 次重复实验，默认 3 次。“本次完成后停止”会结束后续次数；“取消等待”结束本地等待，已发送的 SDK 请求继续处理。
4. 在历史中选择一个系列，查看计划数、开始数、完成数及样本引用。报告基于当前系列生成，缺失样本会显示为缺口。
5. 复制 Markdown / CSV 报告或脱敏账本，分享前检查内容。清空操作仅影响对应本地记录，不修改系统快启设置。

### 应用快启

1. 在应用快启页开启或关闭本应用的快启功能，需要重新初始化时点击重建。
2. 重建操作有冷却时间，处理状态和错误信息显示在调用记录中。
3. 系统实际使用快启启动时，应用通过 `AbilityStage.onLaunchFromHyperSnap` 记录启动路径。

## 工程目录

```text
AppScope/                                  应用身份与应用级资源
entry/src/main/
  ets/pages/Index.ets                       主工具入口与既有路由
  ets/workload/pages/WorkloadLabPage.ets     负载实验场景
  ets/core/
    AppService.ets                         服务与实验编排
    AppPlatform.ets                        I/O 端口及 SDK、资源与存储适配
    SafeExecutor.ets                       超时、取消与未结束任务隔离
    Types.ets                              共享数据类型
    Experiment*.ets                        账本、记录与系列实现
    SeriesHistory.ets                      系列元信息与样本引用
    report/                                条件分组、统计与报告
    TextMessages.ets                       formatter、文本端口与 Context 适配
    MessageCatalog.ets                     消息 ID、资源名与回退文本
  ets/entryability/                        页面加载与 UIAbility 生命周期
  ets/entrystage/                          实际启动路径记录
  ets/components/                          场景组件
  cpp/
    pageprobe.cpp                          Native 探针
    CMakeLists.txt                         Native 构建定义
    types/libpageprobe/                     本地 libpageprobe.so 类型包
  resources/                               中英文资源、配置与随包负载
entry/src/ohosTest/                         自动化用例、隔离 UI 和独立 Runner
```

## 具体实现

1. **单 entry 实现**。[AppService.ets](<entry/src/main/ets/core/AppService.ets>) 直接使用 [SafeExecutor.ets](<entry/src/main/ets/core/SafeExecutor.ets>)、[ExperimentLedger.ets](<entry/src/main/ets/core/ExperimentLedger.ets>) 和 [ReportExport.ets](<entry/src/main/ets/core/report/ReportExport.ets>) 的 `exportReport`。core 目录保存真实实现而非转发桥，不需要独立特性 facade 或公共导出模块。
2. **平台适配与实验编排**。[AppPlatform.ets](<entry/src/main/ets/core/AppPlatform.ets>) 同时包含 I/O 端口及系统查询、目标发现、资源读取和 Preferences 适配。[AppService.ets](<entry/src/main/ets/core/AppService.ets>) 统一处理互斥、冷却、六阶段流程、系列引用和串行保存；[SafeExecutor.ets](<entry/src/main/ets/core/SafeExecutor.ets>) 区分本地等待结束和底层请求完成。[负载实验台](<entry/src/main/ets/workload/pages/WorkloadLabPage.ets>) 场景与 [Index.ets](<entry/src/main/ets/pages/Index.ets>) 路由保持不变。
3. **完整性与报告**。[配置文件](<entry/src/main/resources/rawfile/memory_optimizer.json>) 随包读取并参与实验检查。[ExperimentLedger.ets](<entry/src/main/ets/core/ExperimentLedger.ets>) 保留条件、完整性和缺口，[ReportExport.ets](<entry/src/main/ets/core/report/ReportExport.ets>) 按条件分组生成有长度限制的脱敏报告；报告辅助实现保留在 core 的 report 子目录。
4. **语言与启动记录**。[TextMessages.ets](<entry/src/main/ets/core/TextMessages.ets>) 合并 formatter、可注入文本端口与当前 Context 资源适配，[MessageCatalog.ets](<entry/src/main/ets/core/MessageCatalog.ets>) 提供消息标识和回退文本。显示语言不改写持久化事实或负载内容。[EntryStage.ets](<entry/src/main/ets/entrystage/EntryStage.ets>) 记录实际系统启动回调，[EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>) 记录内容加载完成。
5. **独立 Native 诊断**。[pageprobe.cpp](<entry/src/main/cpp/pageprobe.cpp>)、[CMakeLists.txt](<entry/src/main/cpp/CMakeLists.txt>) 及本地 [libpageprobe.so 类型声明](<entry/src/main/cpp/types/libpageprobe/index.d.ts>) 均为保留的 Native 组成，向独立 Runner 提供私有文件校准和持有映射采样；参数和结果含义见[测试说明](<ohosTest.md>)。

## 相关权限

本示例无需额外申请权限。文件访问和 Native 采样受系统权限策略控制，参见[访问控制概述](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/Readme-CN.md)。

## 依赖

1. 应用逻辑在单 entry 内实现，无独立特性模块，也不依赖其余 Sample。
2. entry 下的本地 `libpageprobe.so` 类型包和 CMake / Node-API 源码保留；它们是 Native 依赖，不是独立 ArkTS 特性模块。
3. 测试依赖 [@ohos/hypium](https://gitee.com/openharmony/testfwk_arkxtest) `1.0.25`；Hvigor OpenHarmony 插件由匹配工具链提供。

## 约束与限制

1. 适用于 OpenHarmony 标准系统，采用 Stage 模型，设备类型为 `default`。compile / target / compatible SDK 均为 `26.0.0`；`modelVersion` 单独表示构建模型版本。
2. `appMemoryOptimizer` 从 `26.0.0` 起提供，快启设置与重建从 API 24 起提供。接口是否可用取决于目标 OpenHarmony 系统；本工程使用 `26.0.0` 接口范围。
3. 回收 API 返回 `Promise<void>`，只给出请求处理结果，没有回收字节数。快启快照的生成与使用由系统调度，实际启动路径由 `onLaunchFromHyperSnap` 记录。
4. Native 采样依赖文件权限和内核的 pagemap / mincore 支持，不可观测项显示为缺口或 `null`。
5. 默认英文并提供 `zh_CN` 资源，切换系统语言后重新打开应用。调试签名由开发者在本机配置，证书和私钥不随工程发布。

## 测试说明

[测试说明](<ohosTest.md>)列出基本操作、自动化场景、444 个带编号 leaf case 和 2301 处源码断言，并说明安全断言日志和显式中英文显示契约。上述数字是源码覆盖口径，不是执行数或通过数。执行人应记录实际环境，并依据 Hypium 报告及真实回收、快启启动、Native 诊断和设备语言/布局专项证据填写结果。

## 下载

在空目录中使用支持 `sparse-checkout` 的 Git，执行：

```shell
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppPerformance/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

如需其余发布或评审分支，将 `master` 替换为对应分支。下载后在 DevEco Studio 中打开 `code/BasicFeature/Ability/AppPerformance/` 工程根目录。
