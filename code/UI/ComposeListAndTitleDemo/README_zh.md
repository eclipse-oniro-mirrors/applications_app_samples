# ComposeListAndTitleDemo

## 介绍

本示例演示 ArkUI 提供的组合列表与标题栏高级组件，覆盖 **ComposeListItem（V1）、ComposeListItemV2、ComposeTitleBar（V1）、ComposeTitleBarV2** 四个组件，并在同一页面内并列对比 V1 与 V2 的类型体系与能力差异。其中 ComposeListItemV2、ComposeTitleBarV2 为 API 26 新增组件。

示例使用以下组件（完整包名与文档链接）：

| 组件 | 完整包名 | 起始 API | 文档 |
| --- | --- | --- | --- |
| `ComposeListItem` | `@ohos.arkui.advanced.ComposeListItem` | 10 | [链接](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-composelistitem) |
| `ComposeListItemV2` | `@ohos.arkui.advanced.ComposeListItemV2` | 26 | [链接](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-composelistitemv2) |
| `ComposeTitleBar` | `@ohos.arkui.advanced.ComposeTitleBar` | 10 | [链接](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-composetitlebar) |
| `ComposeTitleBarV2` | `@ohos.arkui.advanced.ComposeTitleBarV2` | 26 | [链接](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ohos-arkui-advanced-composetitlebarv2) |

组件统一从 `@kit.ArkUI` 导入；工程还使用了以下能力：

| Kit | 使用的模块 | 用途 | 文档 |
| --- | --- | --- | --- |
| `@kit.ArkUI` | `ComposeListItem(V2)`、`ComposeTitleBar(V2)`、`IconType`、`ContentItem`、`OperateItem` | 列表项 / 标题栏组件与配置类型 | [ArkUI API 参考](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/Readme-CN.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo` | 读取设备类型、系统版本与 SDK API 版本 | [deviceInfo](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | hilog 与页面日志面板双通道输出 | [hilog](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility` | 应用入口与生命周期 | [UIAbility](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |

主要功能：

- **标题栏双版本**：页面顶部使用 ComposeTitleBar（V1，头像 + 标题 + 副标题 + 刷新 / 设置菜单）；分区 1 使用 ComposeTitleBarV2，副标题 `共 N 人 · 在线 M 人` 随数据仓库实时变化；
- **列表项 V1 全操作区**：联系人列表（头像 + 主 / 副文本 + 箭头）外，独立覆盖开关、按钮、复选框、单选、双图标、图片与文本操作区；
- **列表项 V2**：同数据 V2 版，`toggle` 开关联动数据仓库，覆盖按钮、箭头、复选框、双图标、文本与三行文本；
- **图标档位**：BADGE（8vp）、NORMAL_ICON（16vp）、SYSTEM_ICON（24vp）、HEAD_SCULPTURE（40vp）、APP_ICON（64vp）、PREVIEW（96vp）六档同屏对比；
- **搜索实时过滤**：按姓名或部门关键字过滤联系人，列表与标题栏人数同步刷新；
- **交互可读**：菜单、箭头、开关、按钮、复选框等交互全部写入带时间戳的日志，面板最新置顶、最多 120 条；
- **断点自适应**：sm（<600vp）单栏上下布局，md / lg 左右双栏；
- **数据与 UI 分离**：`ContactStore`、`ListConfigFactory` 为纯逻辑 / 配置构建层，配套 54 条设备侧用例。

## 效果预览

运行后页面从上到下依次为：ComposeTitleBar（V1）标题栏、设备信息行、搜索框、ComposeTitleBarV2 分区、ComposeListItem（V1）分区、ComposeListItemV2 分区；日志面板在窄屏下固定于底部 200vp，宽屏下位于右侧占 38%。

> 本仓库暂未附带运行截图，按下方“使用说明”在设备上运行即可查看全部组件效果。

### 使用说明

1. 用 DevEco Studio 打开工程，为 `default` 产品配置自动签名，运行到 RK3568 / DAYU200（API 26 镜像）；
2. 点击顶部标题栏的头像、“刷新”、“设置”，观察日志；点击“刷新”后列表与标题栏人数同步更新；
3. 在搜索框输入姓名或部门关键字，列表实时过滤；清空关键字恢复全部联系人；
4. 分区 2（V1）与分区 3（V2）分别操作箭头、开关 / toggle、按钮、复选框、双图标，观察日志；V2 联系人开关会同步修改在线人数，分区 1 的副标题随之变化；
5. 页面右侧（或底部）日志面板显示最近 120 条事件，最新日志置顶；同时输出到 hilog：

   ```bash
   hdc shell hilog | grep ComposeList
   ```

   hilog domain 为 `0x0001`。

命令行编译：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
```

未配置签名时产物为 `entry/build/default/outputs/default/entry-default-unsigned.hap`。安装到设备前需完成签名：在 DevEco Studio 的 `File > Project Structure > Signing Configs` 中启用自动签名后直接运行，或在命令行构建后使用自己的签名材料签名，再执行：

```bash
hdc install -r <已签名 HAP>
hdc shell aa start -a EntryAbility -b com.samples.composelistandtitledemo
```

## 工程目录

```
ComposeListAndTitleDemo
├── AppScope                                  应用级配置（bundleName、图标、名称）
├── entry/src/main
│   ├── ets
│   │   ├── model
│   │   │   ├── ListModels.ets                ContactStore 联系人仓库、ListConfigFactory 配置工厂（V1/V2 双套）
│   │   │   └── utils
│   │   │       ├── LogUtil.ets               统一日志（hilog + UI 面板双通道、级别过滤）
│   │   │       └── DeviceUtil.ets            设备档案读取与 sm / md / lg 断点划分
│   │   ├── pages
│   │   │   └── Index.ets                     标题栏 + 搜索 + 3 个演示分区 + 日志面板
│   │   ├── entryability                      应用入口与生命周期日志
│   │   └── entrybackupability                备份扩展
│   └── resources                             字符串、颜色、图标等资源
├── entry/src/test                            本地单测（1 条冒烟用例）
├── entry/src/ohosTest                        设备侧测试（4 个套件，54 条用例）
├── ohosTest.md                               设备侧测试用例归档
└── README_zh.md
```

## 具体实现

### 1. 页面结构

[`Index.ets`](entry/src/main/ets/pages/Index.ets) 以 `Column` 承载页面：ComposeTitleBar（V1）固定在顶部，其下为设备信息行、搜索框和演示区，日志面板随断点变化位置。

- `sm`（<600vp）：演示区 `Scroll` + `layoutWeight(1)`，日志面板固定高度 200vp；
- `md` / `lg`（≥600vp）：左侧演示区 `layoutWeight(1)`，右侧日志面板宽度 38%。

断点由根容器的 `onAreaChange` 读取窗口宽度后交给 [`DeviceUtil.getBreakpoint()`](entry/src/main/ets/model/utils/DeviceUtil.ets) 计算（600vp、840vp 两个阈值），切换时写入日志。

### 2. 标题栏 V1 与 V2

- V1 标题栏标题为“列表与标题”，副标题说明四个组件；右侧菜单项“刷新”“设置”与头像均绑定回调，点击写入日志；点击“刷新”会重新执行 `ContactStore.search()` 并记录当前展示人数；
- 分区 1 的 ComposeTitleBarV2 使用 `title`、`subtitle`、`item` 与 `menuItems`，副标题由 `store.count()` 与 `store.onlineCount()` 拼接，数据变化后自动刷新。

### 3. ComposeListItem（V1）

分区 2 以联系人数据驱动列表，覆盖以下形态：

- **内容区**：`IconType.HEAD_SCULPTURE` 头像 + 主文本（姓名）+ 副文本（部门 · 手机号）；
- **操作区**：箭头（`OperateItem` arrow）、开关（switch）、按钮、复选框、单选、双图标（icon + subIcon），另有文本操作区与图片操作区；
- **图标档位**：BADGE（8vp 小徽标）、NORMAL_ICON（16vp）、SYSTEM_ICON（24vp）、APP_ICON（64vp）、PREVIEW（96vp）；
- **三行文本**：`primaryText` + `secondaryText` + `description`，description 支持换行展示。

### 4. ComposeListItemV2

分区 3 使用同一批联系人数据构造 V2 版本：

- `new ContentItemV2(options)`、`new OperateItemV2(options)` 构造配置对象；
- 开关字段由 V1 的 `switch` 变为 `toggle`，切换时调用 `store.toggleOnline(id)` 并 `refreshList()`，日志记录切换结果；
- 覆盖 toggle、按钮、箭头、复选框、双图标、文本操作区以及 PREVIEW 档位 + 三行文本。

### 5. V1 与 V2 的类型差异

| 对比项 | V1 | V2 |
| --- | --- | --- |
| 配置对象构造 | `ContentItem` / `OperateItem` 等为无构造 class，字面量需 `as 显式类型` | `ContentItemV2` / `OperateItemV2` 等带 `constructor(options?)`，用 `new` 构造 |
| 开关字段 | `switch` | `toggle` |
| 图标枚举 | `IconType` | `IconTypeV2` |
| 组件属性名 | `contentItem` / `operateItem` | `contentItemV2` / `operateItemV2` |

页面通过 `ListConfigFactory` 封装差异，业务代码无需关心字段名。

### 6. 数据模型与配置工厂

[`ListModels.ets`](entry/src/main/ets/model/ListModels.ets) 提供两层纯逻辑：

- `ContactStore`：`add` / `remove` / `toggleOnline` / `search` / `findById` / `getAll`（返回副本）/ `count` / `onlineCount` / `clear`，id 单调递增且删除后不复用；
- `ListConfigFactory`：V1 / V2 两套构建方法，覆盖内容项（含 description 三行文本）、8 种操作区（箭头、开关 / toggle、按钮、复选框、单选、双图标、图片、文本）与标题栏菜单项，测试可直接断言字段映射并手动触发回调。

### 7. 日志

[`LogUtil.ets`](entry/src/main/ets/model/utils/LogUtil.ets) 提供 `debug / info / warn / error`，同时写 hilog 与页面日志面板：

- hilog domain `0x0001`，tag `ComposeListTitle`（`EntryAbility` 使用 tag `ComposeListAndTitle`，`grep ComposeList` 可同时覆盖）；
- 页面日志最多 120 条，最新置顶；
- 支持级别过滤（`LogLevel.DEBUG / INFO / WARN / ERROR`），未注入面板回调时仅输出 hilog。

### 8. 测试

设备侧测试位于 `entry/src/ohosTest/ets/test/`，共 4 个套件、54 条用例，通过 `List.test.ets` 聚合：

| 套件 | 用例 | 覆盖 |
| --- | --- | --- |
| `ListModels.test.ets` | 35 | ContactStore 增删 / 缺失删除 / 在线切换 / 搜索（含特殊字符与部分关键字）/ 副本返回 / 清空 / id 不复用与单调递增 / findById（15 条）；配置工厂 V1/V2 内容项、7 种操作区、菜单项与字段透传（20 条） |
| `LogUtil.test.ets` | 9 | 回调投递、行格式与时间戳、级别过滤与标记、时间补零、错误级别投递、重复 init 替换回调、省略级别时保持最小值 |
| `DeviceUtil.test.ets` | 9 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840）、档案字段、宽屏与双栏阈值一致性、极值 |
| `Ability.test.ets` | 1 | Ability 冒烟用例 |

本地单测位于 `entry/src/test/`，为 1 条冒烟用例。设备侧测试执行命令：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.composelistandtitledemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

## 相关权限

无。组件数据为内存中的示例数据，图标来自工程资源，不需要网络、存储或其他权限。

## 依赖

无第三方运行时依赖，也不依赖其他 sample。`oh-package.json5` 中仅包含测试框架依赖 `@ohos/hypium` 与 `@ohos/hamock`。

## 约束与限制

| 项目 | 要求 |
| --- | --- |
| 开发环境 | DevEco Studio 6.1.1 |
| SDK | 编译 SDK API 26（`targetSdkVersion 26.0.0`），`compatibleSdkVersion 6.1.1(24)` |
| 系统版本 | **API 26 及以上**：ComposeListItemV2、ComposeTitleBarV2 为 API 26 新增组件，低于 API 26 的设备上 V2 分区不可用 |
| 验证设备 | RK3568 / DAYU200（API 26）；`module.json5` 声明 `phone / tablet / 2in1` |
| 签名 | 使用 DevEco Studio 自动签名；仓库中不包含签名配置、证书与密钥文件 |

其他限制：

- **V1 字面量类型**：`ContentItem` / `OperateItem` 等 V1 类型无构造函数，对象字面量必须 `as 显式类型`，否则 ArkTS 严格模式编译报错；
- **V2 构造方式**：V2 类型必须使用 `new` + Options 接口构造，直接写字面量无法通过编译；
- **字段名差异**：V1 开关字段为 `switch`，V2 为 `toggle`，迁移时需同步修改；
- **截图**：仓库暂未附带运行截图，效果以设备实际运行为准；
- **平板 / 2in1 适配**：无实机验证，断点逻辑由单测覆盖 599 / 600 / 839 / 840 边界，实机启动日志会输出真实设备档案便于核对。

## 下载

本工程当前以独立目录维护，直接复制 `ComposeListAndTitleDemo` 目录即可使用。合入应用示例仓后，工程位于 `UI/ComposeListAndTitleDemo`，可通过以下命令单独获取：

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/UI/ComposeListAndTitleDemo .
```

获取后在 DevEco Studio 中打开 `ComposeListAndTitleDemo` 根目录运行。
