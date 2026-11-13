# 应用接续（AppContinuation）

## 介绍

本示例使用 OpenHarmony `@kit.AbilityKit` 的 `continueManager` 和 `UIAbility` 展示准备接续监听的注册/注销、普通接续及快速拉起接续。应用可恢复文本选区、笔记草稿、阅读位置和表单步骤，并分别展示同步受理、异步结果、窗口就绪、业务位置回执及持久化提交。

应用在单一 entry 模块内实现接续监听客户端、平台适配、业务控制器、载荷协议和场景页面。应用身份为 `com.samples.appcontinuation`。下表列出 Kit 导出所对应的完整模块名及接口参考。

| Kit | 完整模块名与接口参考 | 用途 |
|---|---|---|
| `@kit.AbilityKit` | [`@ohos.app.ability.continueManager`](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-continueManager.md)：`on/off` | 注册/注销准备接续监听 |
| `@kit.AbilityKit` | [`@ohos.app.ability.UIAbility`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md)，[`@ohos.app.ability.AbilityConstant`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-abilityConstant.md)，[`@ohos.app.ability.wantConstant`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-wantConstant.md) | 接续生命周期、启动原因与接续参数 |
| `@kit.AbilityKit` | [`@ohos.abilityAccessCtrl`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-abilityAccessCtrl.md) | 检查及主动申请分布式数据权限 |
| `@kit.ArkData` | [`@ohos.data.preferences`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | 本地文本、场景工作区与保存基线 |
| `@kit.BasicServicesKit` | [`@ohos.deviceInfo`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md)，[`@ohos.pasteboard`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-pasteboard.md)，[`@ohos.base`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-base.md)：`BusinessError` | 公开环境信息、用户主动复制与错误处理 |
| `@kit.ArkUI` | [`@ohos.window`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-window.md)，[`@ohos.router`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-router.md)，[`@ohos.arkui.UIContext`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-arkui-UIContext.md) | 窗口、固定场景路由与确认对话框 |
| `@kit.LocalizationKit` | [`@ohos.resourceManager`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | 中英文资源解析 |
| `@kit.PerformanceAnalysisKit` | [`@ohos.hilog`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) | 脱敏日志 |
| `@kit.CoreFileKit` | [`@ohos.application.BackupExtensionAbility`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-application-backupExtensionAbility.md) | 系统备份扩展生命周期 |

## 效果预览

工作台展示监听与接续阶段；文本、笔记、阅读和表单页面分别展示编辑内容、保存状态和恢复位置。

## 使用说明

### 运行准备

1. 下载工程后，在支持 SDK `26.0.0` 的 DevEco Studio 中打开示例根目录，安装匹配的 SDK/Hvigor 工具链并同步依赖。
2. 配置自己的调试签名，构建并安装应用，正常启动进入工作台。单设备可体验本地编辑、保存、历史和备份。
3. 双设备操作前，在两台兼容标准系统设备安装同一版本，确认应用身份和 `continueType` 一致，按系统要求完成网络、账号或互信准备，并确认所需接续入口可用。
4. 使用虚构资料。在工作台检查环境、申请权限，再按页面操作注册准备接续监听。

### 本地功能

| 页面或区域 | 操作步骤 | 可观察结果 |
|---|---|---|
| 工作台 | 主动检查环境和权限，注册 `on`；完成后注销 `off`，打开记录/调用详情 | 同步受理、异步通知、错误码与观察超时分别显示；可筛选并查看脱敏事实/事件，按需主动复制摘要 |
| 文本 | 输入带换行或 emoji 的虚构文本，选择区间，保存；需要独立身份时另存新文档 | 正文、选区、本机文档身份、修订与保存状态更新 |
| 笔记 | 进入笔记，编辑标题/正文并保存；再修改后放弃，查看历史并选择恢复 | 草稿与保存基线分离；放弃恢复基线，恢复历史形成新修订 |
| 阅读 | 切换章节/段落，添加书签，移动到其它位置后点击书签，再保存进度 | 当前章节、段落与书签可核对；接续传递书籍标识和位置，不传书籍文件 |
| 表单 | 用虚构姓名、格式有效号码和地址分步填写；检查校验提示，保存草稿，完整填写后确认 | 当前字段、步骤与本地确认状态可核对；不会向服务端提交 |
| 协议与场景指南 | 查看字段、准入、冲突、重试与恢复规则 | 展示教学模型的输入、规则和计算结果 |

### 普通接续（两台设备）

1. **源端准备**：编辑并保存文本，记录正文、选区、文档身份和修订。接续笔记、阅读或表单时，进入对应页面，记录当前选区、章节/段落或表单步骤。
2. **目标端准备**：确认同版本应用可启动，查看本机未保存内容。首次体验可先保存本机草稿，随后再尝试冲突选择。
3. **源端发起**：通过设备的**普通系统接续入口**选择目标设备，观察系统反馈和工作台记录。
4. **目标端观察**：核对收到的数据、窗口和业务位置：文本与笔记检查正文/选区，阅读检查章节/段落，表单检查字段/步骤。
5. **目标端确认**：遇到冲突时选择保留本机或接受接续。查看最终提交、身份和修订，继续编辑并保存。
6. **结束**：按需注销监听，在记录中查看完成通知或超时提示。

### 快速拉起接续（两台设备）

1. **两端准备**：确认系统快速拉起入口可用，使用相同应用身份和对应 `continueType`；`_ContinueQuickStart` 后缀遵循平台约定。
2. **源端准备**：进入要接续的文本、笔记、阅读或表单，记录身份、修订和当前位置，按需检查权限并注册准备监听。
3. **目标端准备**：分别体验冷启动和热启动，记录本机草稿状态。
4. **源端发起**：通过系统的**快速拉起接续入口**选择目标，观察系统反馈。
5. **目标端观察**：查看启动原因、快速结果、数据、窗口和业务位置回执。这些信号可能先后到达，到齐后页面显示最终提交结果。
6. **目标端处理**：按提示处理冲突，核对恢复后的选区/段落/步骤，继续编辑并保存；遇到失败或超时可在调用详情中查看所在阶段。

### 本地备份与恢复

1. 展开备份面板并生成工作区副本；阅读隐私提示，确认后才复制到本机剪贴板。界面预览不是完整导出文本。
2. 在导入区主动粘贴**完整备份**，勾选需要恢复的笔记、阅读或表单，查看预览和未保存内容提示。
3. 先尝试取消，确认业务与存储未变化；再次预览并确认恢复后，核对选中范围的身份、修订与历史。未选场景保留当前状态和草稿。
4. 输入、范围或工作区变化会使旧预览令牌失效。写入失败时应用保留原状态并尝试补偿；持久值不确定时暂停后续写入，可先导出内存草稿，再处理存储问题。

## 工程目录

```text
AppScope/                              应用身份与应用名称资源
entry/src/main/ets/
├── pages/Index.ets                     唯一入口页
├── continuation/pages/                六个场景及详情页面；业务页面转发生命周期
├── continuation/components/           正式笔记、阅读、表单视图，也供隔离 UI harness 使用
├── learning/                          接续客户端、平台端口、控制器与文本载荷
│   ├── ContinueClient.ets              注册/注销、代次隔离和结果脱敏
│   ├── LearningPorts.ets               时钟、存储、权限和原生接续适配
│   ├── scene/                         笔记、阅读、表单、备份与页面会话
│   ├── payload/                       字段、编解码、校验、冲突和合并模型
│   ├── document/                      文档及表单教学模型
│   ├── guide/                         接续场景目录
│   ├── recovery/                      恢复策略
│   ├── rules/                         准入模型
│   └── session/                       重试策略
├── common/                            Context 资源适配与英文回退
│   └── ContinuationText.ets            客户端动态文本接口与默认值
├── components/                        工作台与备份展示组件
├── entryability/                      UIAbility 生命周期与内容加载
└── entrybackupability/                系统备份扩展
entry/src/main/resources/              base 英文、zh_CN 中文与路由配置
entry/src/ohosTest/                     模型、组合、Preferences 与 UI 用例
```

## 具体实现

| 模块职责 | 实现与源码 |
|---|---|
| entry 接续客户端与平台适配 | [ContinueClient](<entry/src/main/ets/learning/ContinueClient.ets>)封装 `continueManager.on/off`，隔离监听/注销代次；[LearningPorts](<entry/src/main/ets/learning/LearningPorts.ets>)提供可替换平台边界；[ContinuationText](<entry/src/main/ets/common/ContinuationText.ets>)与现有本地化适配器对接，提供客户端字符串接口和英文默认值 |
| 生命周期与接续协调 | [EntryAbility](<entry/src/main/ets/entryability/EntryAbility.ets>)转发启动原因和窗口回调给唯一的 [LearningController](<entry/src/main/ets/learning/LearningController.ets>)；Controller 处理候选校验、冲突、信号汇合与提交，采用固定页面路由，源端设置 `SUPPORT_CONTINUE_PAGE_STACK_KEY=false`，不混用自动页面栈恢复 |
| 业务定位与本地工作区 | [ScenePageSession](<entry/src/main/ets/learning/scene/ScenePageSession.ets>)关联当前场景、文档、修订、request 与实际位置回执；[SceneWorkbench](<entry/src/main/ets/learning/scene/SceneWorkbench.ets>)管理保存基线、草稿和历史 |
| 备份预览与恢复 | [SceneWorkspaceBackupModel](<entry/src/main/ets/learning/scene/SceneWorkspaceBackupModel.ets>)分离预览和提交；[SceneWorkspaceBackup](<entry/src/main/ets/components/SceneWorkspaceBackup.ets>)处理范围选择与显式确认 |
| 教学协议与本地化 | [PayloadValidator](<entry/src/main/ets/learning/payload/PayloadValidator.ets>)分离字段/交叉规则及错误/告警，教学载荷与正式文本/场景协议分别实现；静态标签使用 `$r`，[LocaleStrings](<entry/src/main/ets/common/LocaleStrings.ets>)为动态文本提供 Context 资源解析和无 Context 英文回退 |

## 相关权限

[模块声明](<entry/src/main/module.json5>)仅请求 [`ohos.permission.DISTRIBUTED_DATASYNC`](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/permissions-for-all.md)，由用户主动操作时申请。接续前还需完成设备互信并确认系统入口可用。

## 依赖

应用仅注册 entry 生产模块，直接调用 OpenHarmony SDK，不依赖其它 Sample 或本地特性包。[entry 包配置](<entry/oh-package.json5>)不含本地包依赖；ohosTest 位于 entry 内，使用 `@ohos/hypium` 与 SDK UiTest 接口。

## 隐私与数据安全

- 备份是**未加密**文本，可能含笔记、姓名、电话、地址和历史。复制需确认，并设置 `LOCALDEVICE` 范围；请使用虚构数据，妥善保管并清理副本。普通启动不自动读取剪贴板。
- 普通日志和诊断摘要不输出业务正文或设备敏感标识。Hilog 域为 `0xF811`，标签为 `[Sample_AppContinuation]`。
- 备份 UiQa 的**输入助手会将合成备份写入系统剪贴板再粘贴**，覆盖原内容，结束后不恢复。请在专用环境运行；正式场景 UI smoke 使用 `Component.inputText`。详见[测试说明](<ohosTest.md>)。

## 约束与限制

1. 工程的 compile、target、compatible SDK 均为 `26.0.0`，`runtimeOS=OpenHarmony`，设备类型为 `default`。使用支持该 SDK 的 DevEco Studio 和匹配 Hvigor 工具链；具体执行版本随测试记录填写。
2. 开发者配置自己的调试签名。工程不包含个人证书、私钥、口令或设备签名材料。
3. bundle、`continueType` 和文本/场景载荷命名空间采用 `com.samples.appcontinuation`，两端需使用相同安装身份；各安装的本地沙箱独立。
4. 普通接续和快速拉起均从系统对应入口发起。注销观察期限为 8 秒，业务阶段期限为 15 秒；结果未知的原生调用需人工确认后再处理。
5. 场景指南中的设备分类和策略供教学使用，设备支持情况以实际系统为准。
6. 表单确认在本地完成，阅读内容来自随包资源。工作区版本、业务存储键、序列化枚举、规则编号和控件 ID 保留各自业务语义。
7. 切换系统语言后重开 Ability，使同一会话使用一致语言。

## 测试说明

[测试说明](<ohosTest.md>)包含基本操作、自动化场景、用例索引与执行记录模板。执行时按应用版本、实际环境和场景逐项填写结果。

## 下载

在**新建空目录**中执行以下五条命令。需使用支持 `git sparse-checkout init --no-cone` 和 `git sparse-checkout set` 的 Git（Git 2.25 或更新版本，建议使用当前维护版），并确保可访问 GitCode。获取后打开 `code/BasicFeature/Ability/AppContinuation/`。

```bash
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppContinuation/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

[English](<README.md>)
