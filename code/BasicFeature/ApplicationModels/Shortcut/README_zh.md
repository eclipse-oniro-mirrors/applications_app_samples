# 快捷方式（Shortcut）

[English](<README.md>) · [测试场景与用例索引](<ohosTest.md>)

## 介绍

本示例采用 OpenHarmony Stage 模型和 ArkTS/ArkUI，展示静态桌面快捷方式与应用内本地工作区。应用包名为 `com.samples.shortcut`。全部实现位于单一 `entry` 模块，按既有 services、model、i18n、business 和 navigation 目录组织系统接口、显隐批次、本地业务与页面导航。

- **桌面快捷方式**：检测支持能力，查询本应用静态入口，单项或批量设置显隐，通过桌面进入“新建便签”“今日待办”和“收藏资料”。
- **应用内工作区**：管理便签、草稿、修订与回收站，编辑和筛选按日期归档的待办，搜索本地资料并管理收藏，查看本地规则。

主要使用的系统 API 如下。Kit 名称是源码导入入口，链接标题给出 API 模块完整包名。

| 完整包名与官方文档 | Kit 导入 | 本示例中的用途 |
|---|---|---|
| [@ohos.bundle.shortcutManager](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-shortcutManager.md) | `@kit.AbilityKit` | `isShortcutSupported()` 检测设备能力，`getAllShortcutInfoForSelf()` 查询本应用静态快捷方式，`setShortcutVisibleForSelf()` 设置指定入口显隐。 |
| [@ohos.app.ability.UIAbility](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) 与 [@ohos.app.ability.Want](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-want.md) | `@kit.AbilityKit` | `onCreate()` 和 `onNewWant()` 接收冷启动和热启动入口，校验路由参数。 |
| [@ohos.data.preferences](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | `@kit.ArkData` | `getPreferences()`、`get()`、`put()`、`flush()` 保存业务工作区与显隐批次；`removePreferencesFromCache()` 支持不确定写入后的重新读取。 |
| [@ohos.router](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-router.md)、[@ohos.promptAction](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-promptAction.md) 与 [@ohos.window](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkts-apis-window.md) | `@kit.ArkUI` | 页面跳转、离开编辑确认、提示和加载首页。 |
| [@ohos.resourceManager](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | `@kit.LocalizationKit` | 解析默认英文及 `zh_CN` 中文资源，支持字符串型接口和延迟解析的场景说明。 |
| [@ohos.hilog](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md)、[@ohos.hiTraceMeter](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hitracemeter.md) 与 [@ohos.hiAppEvent](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hiviewdfx-hiappevent.md) | `@kit.PerformanceAnalysisKit` | 记录固定诊断阶段、批次异步追踪及脱敏耗时事件。 |
| [@ohos.systemDateTime](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-date-time.md) 与 [@ohos.base](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-base.md) | `@kit.BasicServicesKit` | 获取系统运行时长，处理系统接口的 `BusinessError`。 |

## 效果预览

首页提供新建便签、今日待办和收藏资料入口，以及桌面快捷入口和批次管理。业务页面支持返回首页。

## 使用说明

### 运行准备

1. 按“下载”章节获取工程，在 DevEco Studio 中打开 `code/BasicFeature/ApplicationModels/Shortcut/` 工程根目录。安装 SDK `26.0.0` 及兼容的构建工具链，同步 `entry` 声明的工程依赖。SDK 配置与 `modelVersion` 的区别见“约束与限制”。
2. 在本机配置与 `com.samples.shortcut` 匹配的开发签名。选择设备，安装并运行 `entry` 模块，先从普通应用入口打开并检查首页。
3. 解锁设备后进行页面操作，按下文分别体验桌面快捷方式与应用内工作区。设备要求见“约束与限制”，测试准备、场景和验证结果见[测试说明](<ohosTest.md>)。

### 桌面快捷方式

1. 在首页查看支持状态，重新检测或刷新快捷方式列表。进入入口详情和调用记录，查看入口信息与接口结果。
2. 在支持的桌面长按应用图标，选择“新建便签”“今日待办”或“收藏资料”。配置见 [shortcuts_config.json](<entry/src/main/resources/base/profile/shortcuts_config.json>)。分别在应用未运行（冷启动）与已在后台运行（热启动）时验证三个入口。两种路径均校验 `sc.action`、`sc.version` 和 `sc.filter`，拒绝未知动作和不匹配参数。
3. 在首页显示或隐藏单个入口，再检查实际桌面菜单并刷新应用列表。批量设置时选择入口和目标显隐，生成预览，核对后确认。仅预览不会修改系统入口；结果区分已确认、已核对失败、未知和未执行，最多保留5批历史。
4. 未知结果先核对再重试。补偿按每项已知原态生成新预览；发现外部改动时选择保留或覆盖，审查后再确认。

### 应用内便签、待办与收藏

1. **便签**：输入标题和正文，保存便签或保留草稿。编辑已有便签可查看修订、行级差异或保存冲突分支。离开未保存编辑时选择“保存/保留后离开”“放弃更改”或“继续编辑”。
2. **回收站**：删除测试便签后进入回收站，在保留期内恢复。永久删除前核对所选测试项。批量恢复或删除须审查预览并确认，以一个根文档提交。
3. **待办**：切换日期、查看历史、新建或编辑任务、切换完成状态并按完成状态筛选。**收藏**：输入关键词、选择分类，切换资料收藏标记及收藏筛选。
4. **规则与显示**：规则中心演示本地路由、待办流转、到期与重复、标签检索、筛选链、便签保存和回收规则。切换系统语言后重新进入页面查看中英文，并在设备上检查深色主题和长文本布局；已保存内容、稳定 ID、持久化键、协议值和中文检索样例保持原样。

## 工程目录

```text
Shortcut/
├── AppScope/                              # 应用身份与应用级资源
└── entry/
    └── src/
        ├── main/
        │   ├── ets/
        │   │   ├── entryability/EntryAbility.ets # 生命周期与冷/热启动
        │   │   ├── pages/Index.ets             # 首页
        │   │   ├── scenes/pages/               # 六个业务、详情与规则页面
        │   │   ├── scenes/data/                # 本地化展示与固定规则输入
        │   │   ├── services/                   # API、显隐批次、存储、遥测与Logger
        │   │   ├── model/                      # ShortcutModels及既有ShortcutScenes
        │   │   ├── i18n/                       # Context、文本端口、英文回退与展示标签
        │   │   ├── business/                   # 便签、待办、收藏及业务规则
        │   │   ├── navigation/                 # Want校验与导航协调
        │   │   └── components/                 # 共用UI与回收站组件
        │   └── resources/                      # 英文、中文、深色主题及入口配置
        └── ohosTest/                           # 用例、夹具、Runner和隔离UI
```

## 具体实现

1. **快捷方式接口与服务**. [ShortcutApi.ets](<entry/src/main/ets/services/ShortcutApi.ets>) 封装三个 `shortcutManager` 接口，[ShortcutService.ets](<entry/src/main/ets/services/ShortcutService.ets>) 协调能力检测、查询、显隐与批次。页面与测试通过本地相对路径直接使用具体实现；[ShortcutModels.ets](<entry/src/main/ets/model/ShortcutModels.ets>) 保存接口视图模型，与既有场景目录模型并列。
2. **显隐批次**. [VisibilityBatch.ets](<entry/src/main/ets/services/VisibilityBatch.ets>) 定义预览与结果模型，[BatchStorage.ets](<entry/src/main/ets/services/BatchStorage.ets>) 保存 `shortcut_visibility_batches_v1/journal`。系统修改前记录未知标记，修改后回读确认，核对、重试和补偿分别处理。
3. **启动与导航**. [EntryAbility.ets](<entry/src/main/ets/entryability/EntryAbility.ets>) 接收冷/热启动 Want，[LaunchRequest.ets](<entry/src/main/ets/navigation/LaunchRequest.ets>) 进行校验，[AppNavigation.ets](<entry/src/main/ets/navigation/AppNavigation.ets>) 协调初始化、离开编辑确认与跳转。[ShortcutScenes.ets](<entry/src/main/ets/model/ShortcutScenes.ets>) 将应用场景目录保留在 `entry`。
4. **本地工作区**. [BusinessStore.ets](<entry/src/main/ets/business/BusinessStore.ets>) 管理便签、草稿、修订、回收、待办与收藏。[BusinessStorage.ets](<entry/src/main/ets/business/BusinessStorage.ets>) 保存 `shortcut_business_v1/workspace`，写结果不确定时先重读再重试。[NoteRecyclePanel.ets](<entry/src/main/ets/components/NoteRecyclePanel.ets>) 是应用回收站组件，也供隔离 UI 测试复用。
5. **资源、诊断与测试**. [Strings.ets](<entry/src/main/ets/i18n/Strings.ets>) 同处管理 Context/resolver 绑定、快捷方式文本端口及英文回退；静态 UI 优先使用 `$r`。[Logger.ets](<entry/src/main/ets/services/Logger.ets>) 使用 Domain `0xF811` 和 Tag `[Sample_Shortcut]`，[BatchTelemetry.ets](<entry/src/main/ets/services/BatchTelemetry.ets>) 仅记录脱敏阶段和耗时，不记录用户内容。[List.test.ets](<entry/src/ohosTest/ets/test/List.test.ets>) 注册测试套件；[测试说明](<ohosTest.md>) 区分人工验收、受控逻辑、原生 API 和隔离 UI，提供执行记录填写区和完整索引。

## 相关权限

主模块 [module.json5](<entry/src/main/module.json5>) 未声明 `requestPermissions`。`ForSelf` 接口管理本应用的静态快捷方式。权限定义与申请方式见[访问控制概述](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/security/AccessToken/Readme-CN.md)。

## 依赖

1. 单一 `entry` 模块使用自身本地实现文件，无外部 Sample 依赖或本地特性包依赖。
2. 系统能力由 SDK 提供，Kit 及对应完整包名见介绍。
3. 自动化用例依赖 [@ohos/hypium](https://gitee.com/openharmony/testfwk_arkxtest)，版本 `1.0.25`，由 [工程依赖声明](<oh-package.json5>) 管理；设备自动化使用 [@ohos.UiTest](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-test-kit/js-apis-uitest.md) 和 [@ohos.app.ability.abilityDelegatorRegistry](https://github.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-test-kit/js-apis-app-ability-abilityDelegatorRegistry.md)，导入入口为 `@kit.TestKit`。

## 约束与限制

1. 适用于 OpenHarmony 标准系统，工程设备类型为 `default`。桌面功能要求 `SystemCapability.BundleManager.BundleFramework.Launcher` 和支持快捷方式的桌面；设备桌面不支持时，便签、待办、收藏及其余应用内本地页面仍可使用。
2. `compileSdkVersion`、`targetSdkVersion` 和 `compatibleSdkVersion` 使用 SDK `26.0.0`；`modelVersion` 使用工程/构建模型版本 `26.0.0`。使用与两者兼容的 DevEco Studio 和构建工具。测试环境要求见[测试准备](<ohosTest.md#测试范围与环境>)。
3. 应用身份为 `com.samples.shortcut`。部署时在本机配置匹配的开发签名，不提交个人证书、密钥或签名配置。
4. 活跃便签与回收站各最多50条，总历史最多100条修订，根文档 UTF-8 预算为8 MiB，超限写入会被拒绝。回收站保留期为30天，永久删除不可撤销，请使用可丢弃测试数据。
5. 显隐批次逐项执行。未知状态先核对，权限终止错误、在途调用和存档失败按提示处理；补偿按已知原态生成计划，平台不提供整批原子回滚。
6. 规则中心提供本地规则演示，后台闹钟、网络业务和跨设备同步不在示例范围内。

## 测试说明

[测试说明](<ohosTest.md>)包含基本操作、自动化场景和完整用例索引。执行结果按实际设备、版本、范围和证据填写。

## 下载

使用支持 `sparse-checkout` 的 Git，在空目录中执行以下命令。工程目录为 `code/BasicFeature/ApplicationModels/Shortcut/`。

```sh
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/ApplicationModels/Shortcut/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

如工程由其余分支交付，将 `master` 替换为实际包含本工程的分支。
