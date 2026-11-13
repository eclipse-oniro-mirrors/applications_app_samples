# 开机自启状态查询（AppStartupAuto）

[English](<README.md>) | [测试说明](<ohosTest.md>)

## 介绍

本示例采用 Stage 模型和 ArkTS，通过 [@ohos.app.ability.autoStartupManager](<https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-autoStartupManager.md>)（由 `@kit.AbilityKit` 导入）查询设备的开机自启能力和**本应用**的开机自启状态：

- `autoStartupManager.isAutoStartupSupported()`：检测设备是否支持开机自启，起始版本为 `26.0.0`。
- `autoStartupManager.getAutoStartupStatusForSelf()`：异步查询本应用状态，接口从 API 21 提供。

使用 [@ohos.data.preferences](<https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md>)保存查询历史，使用 [@ohos.data.relationalStore](<https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-relationalStore.md>)保存本机查询证据，并通过 [@ohos.hilog](<https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md>)记录日志。应用提供手动设置回访、历史筛选与比较、独立诊断和归档管理。

## 效果预览

首页展示设备能力、本应用自启状态和最近查询结果，并提供历史、回访、独立诊断与证据归档入口。

## 使用说明

### 运行准备

1. 使用支持 OpenHarmony SDK `26.0.0`、Stage 模型和 ArkTS 的 DevEco Studio 打开工程，安装声明的依赖。
2. 在本机为 `default` 配置调试签名并部署到兼容的 OpenHarmony 标准系统设备。证书、私钥和签名口令由开发者自行准备。
3. 首次运行查看首页的设备能力、本应用状态和调用结果。

### 操作与预期

| 功能 | 具体操作 | 预期表现 |
|---|---|---|
| 状态查询 | 进入首页，点击刷新，展开调用详情或查询记录 | 分别显示设备能力和本应用状态，附查询来源、时间及实际返回；失败和超时有独立提示 |
| 手动设置回访 | 获得十分钟内的成功样本后开始回访，离开应用，再返回查看关联样本 | 记录离开、返回时间及前后查询关联 |
| 历史查看与比较 | 打开历史，按来源、结果和时间筛选，查看详情并选择比较样本 | 列表、统计和比较对应当前范围；样本不足时显示提示 |
| 历史导出与清空 | 分别导出当前范围和全量历史；按需清空历史 | 导出文本脱敏且范围明确；取消保留历史，确认仅清空历史，独立归档保留 |
| 独立诊断 | 分别执行能力检测和自身状态查询 | 各自显示阶段、结果、错误码和耗时 |
| 手动归档与恢复 | 保存查询结果，成功后关闭并重新进入应用 | 提交成功后显示已保存，重新进入后恢复记录；保存失败时显示错误 |
| 自动归档 | 阅读隐私说明，先取消启用确认，再按需确认启用或停用 | 默认关闭；取消保持原状态，启用后按规则采集，停用保留已有证据 |
| 归档清理 | 筛选或翻页查看记录，预览清理结果，再取消或确认 | 按有效预览清理，保护最近有效样本和未知时间记录；归档变化后需重新预览 |
| 参考与语言 | 查看故障和归档规则；切换系统英文或 `zh_CN` 后重新进入应用 | 显示当前语言文本，来源标识、规则编号和存储字段保持稳定 |

## 工程目录

```text
AppScope/                              应用配置和应用级资源
entry/src/main/ets/
  pages/Index.ets                       入口页面
  startup/pages/                       回访、历史、诊断和故障场景页面
  entryability/                        生命周期及资源、存储挂接
  autostart/                           平台查询、持久化、日志和场景业务
    AutoStartupRuntime.ets             查询 API、时钟、共享请求协调和 Preferences
    StoragePorts.ets                   应用内部存储接口
    SampleLogger.ets                   安全 Hilog 实现
    archive/                           归档编解码、仓库、清理和 RDB 适配
    diagnostics/                       独立诊断与参考规则
    history/                           历史筛选和展示模型
    revisit/                           手动设置回访状态机
    text/                              资源和消息目录
  components/                          调用详情、记录弹层和归档面板
entry/src/main/resources/              默认英文及中文资源
entry/src/ohosTest/ets/                 受控模型、原生 RDB 和隔离 UI 测试
```

## 具体实现

- **平台与存储（entry）**：[AutoStartupRuntime](<entry/src/main/ets/autostart/AutoStartupRuntime.ets>)在本应用内封装平台查询、时钟、Preferences 和共享请求协调；[StoragePorts](<entry/src/main/ets/autostart/StoragePorts.ets>)定义内部存储接口。[RdbDocumentStore](<entry/src/main/ets/autostart/archive/RdbDocumentStore.ets>)串行读写文档，在事务内检查版本并执行业务校验。
- **查询场景（entry）**：[入口页面](<entry/src/main/ets/pages/Index.ets>)展示查询和场景入口；[AutoStartupService](<entry/src/main/ets/autostart/AutoStartupService.ets>)组织查询阶段、超时、前台刷新、保存和回访关联。
- **历史与回访（entry）**：[AutoStartupHistory](<entry/src/main/ets/autostart/AutoStartupHistory.ets>)维护最多 20 条、最长 30 天的历史并脱敏导出；[RevisitTracker](<entry/src/main/ets/autostart/revisit/RevisitTracker.ets>)关联回访和查询。[AutoStartupTypes](<entry/src/main/ets/autostart/AutoStartupTypes.ets>)定义稳定的 `initial/manual/foreground/settings` 来源标识，兼容历史中文来源输入。
- **归档（entry）**：[StartupArchive](<entry/src/main/ets/autostart/archive/StartupArchive.ets>)提供保存、筛选、分页和清理，展示已提交记录，容量上限为 500 条、1 MiB。[StartupArchiveRdbStorage](<entry/src/main/ets/autostart/archive/StartupArchiveRdbStorage.ets>)负责业务编解码、隐私校验和 RDB 适配，长期归档对平台错误信息脱敏。
- **资源与日志**：[MessageCatalog](<entry/src/main/ets/autostart/text/MessageCatalog.ets>)按当前资源提供界面文本。日志使用 `0xF811` 和 `[Sample_AppStartupAuto]`，记录查询阶段、结果及脱敏参数。

## 相关权限

主模块未声明额外 `requestPermissions`。系统设置由用户手动操作。

## 依赖

- 工程仅包含 entry 应用模块，平台、存储和业务实现均在 entry 内；不依赖独立公共模块或其他 Sample。
- 除介绍中的 API 外，使用 [ArkUI](<https://gitee.com/openharmony/docs/tree/master/zh-cn/application-dev/reference/apis-arkui>)和 [BasicServicesKit](<https://gitee.com/openharmony/docs/tree/master/zh-cn/application-dev/reference/apis-basic-services-kit>)提供的基础能力。
- 测试使用 `@ohos/hypium` `1.0.25` 和 [@kit.TestKit](<https://gitee.com/openharmony/docs/tree/master/zh-cn/application-dev/reference/apis-test-kit>)。

## 约束与限制

1. 适用于 OpenHarmony 标准系统，主模块声明 `default` 设备类型，接口能力以目标系统返回为准。
2. compile、target 和 compatible SDK 均为 `26.0.0`，runtimeOS 为 OpenHarmony；IDE 需支持该 SDK、Stage 模型和 ArkTS。测试准备见[环境与运行入口](<ohosTest.md#环境与运行入口>)。
3. 本示例只查询自身状态，不修改自启开关、不管理其他应用，也不注册 `StartupTask`。能力不支持、开关关闭、失败和超时分别处理。
4. 查询超时后原生请求继续占用共享请求位置，完成后释放；正常查询和独立诊断按此规则串行。归档读取失败时暂停写入，恢复使用已成功提交的数据。
5. 回访记录离开、返回和查询关联；系统设置变更及重启拉起需单独取得系统证据。版本、权限、设备和提醒目录用于说明规则。

## 测试入口

[测试说明](<ohosTest.md>)包含基本操作、自动化场景、用例索引和执行记录格式。

## 下载

在**空目录**中执行以下命令；Git 版本须支持 `sparse-checkout`。仅检出仓库中的 `code/BasicFeature/Ability/AppStartupAuto/`：

```shell
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppStartupAuto/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

如需其他分支，将最后一条命令中的 `master` 替换为对应分支。
