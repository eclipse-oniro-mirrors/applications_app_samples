# AtomicServiceComponents

## 介绍

本示例演示 OpenHarmony ArkUI 提供的原子化服务高级组件。工程以 `AtomicServiceNavigation` 作为页面根容器，首页提供组件目录与搜索入口；六个原子化服务组件与三个通用场景（应用间跳转、半模态、Preferences）分别有独立的演示页；所有交互与生命周期事件写入统一日志（hilog + 页面内日志面板），布局按设备形态与断点自适应。

示例使用以下组件（完整包名与文档链接）：

| 组件 | 完整包名 | 起始 API | 文档 |
| --- | --- | --- | --- |
| `AtomicServiceNavigation` | `@ohos.atomicservice.AtomicServiceNavigation` | 12 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceNavigation.md) |
| `AtomicServiceSearch` | `@ohos.atomicservice.AtomicServiceSearch` | 18 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceSearch.md) |
| `AtomicServiceTabs` | `@ohos.atomicservice.AtomicServiceTabs` | 12 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceTabs.md) |
| `AtomicServiceWeb` | `@ohos.atomicservice.AtomicServiceWeb` | 12 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-AtomicServiceWeb.md) |
| `DownloadFileButton` | `@ohos.arkui.advanced.DownloadFileButton` | 12 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-DownloadFileButton.md) |
| `HalfScreenLaunchComponent` | `@ohos.atomicservice.HalfScreenLaunchComponent` | 18 | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-atomicservice-HalfScreenLaunchComponent.md) |

组件统一从 `@kit.ArkUI` 导入；工程还使用了以下基础能力包：

| Kit | 使用的模块 | 文档 |
| --- | --- | --- |
| `@kit.AbilityKit` | `@ohos.app.ability.UIAbility`、`@ohos.app.ability.common`、`@ohos.bundle.bundleManager` | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md) |
| `@kit.ArkData` | `@ohos.data.preferences` | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) |
| `@kit.CoreFileKit` | `@ohos.file.fs`、`@ohos.file.picker` | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-core-file-kit/js-apis-file-fs.md) |
| `@kit.BasicServicesKit` | `@ohos.deviceInfo`、`@ohos.base`（BusinessError） | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md) |
| `@kit.PerformanceAnalysisKit` | `@ohos.hilog` | [链接](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) |

主要功能：

- 六个组件与三个通用场景各有独立演示页，覆盖标题栏 / 渐变背景 / 分栏切换、搜索与选择、页签切换守卫、本地 H5 与控制器、文件下载、半屏拉起，以及应用间跳转、`bindSheet` 半模态与 `preferences` 持久化；
- 首页支持关键字搜索与分类过滤，组件卡片和搜索结果均可点击进入对应演示页；
- 统一日志：同一份事件同时写入 hilog 与页面内日志面板，WARN / ERROR 分级标注；
- 按 `deviceType` 与 display 尺寸构建布局 profile，断点切换时重建布局，Tab / Web 高度随视口推导并夹取；
- 109 个本地纯逻辑用例 + 336 个开发板用例，覆盖组件形态 × 断点、格式化边界、日志容量与级别、下载状态迁移、跳转错误码与超时、高度分档、Preferences 裁剪与落盘、关键字过滤与色板常量等维度；验证设备为 RK3568（OpenHarmony 7.0.0.46 / API 26）。

## 效果预览

首页（渐变背景、组件目录、设备 profile 与中央日志）：

![首页](screenshots/gradient_home.svg)

### 使用说明

1. 安装并启动应用，首页展示当前设备 profile、组件目录与首页事件日志；
2. 在首页搜索区输入关键字或切换分类，组件目录实时过滤；点击组件卡片（或 Search 页中的匹配结果）进入对应演示页；
3. 各演示页的操作方式：
   - **AtomicServiceNavigation**：在调节页切换标题预设、渐变背景、Stack / Split 模式和隐藏标题栏，“恢复默认”按设备 profile 重新计算；
   - **AtomicServiceSearch**：输入关键字、切换类别，点击匹配结果可直接进入对应演示页；
   - **AtomicServiceTabs**：点击页签或按钮切换；开启“锁定”后两种切换均被拦截并记 WARN；
   - **AtomicServiceWeb**：在本地两页之间跳转，使用控制器前进 / 后退 / 刷新，观察按 25% 分档的进度日志；
   - **DownloadFileButton**：点击下载按钮，手机 / 平板 / 2in1 走 `DocumentViewPicker`，开发板直接写入沙箱并显示真实路径；
   - **HalfScreenLaunchComponent**：使用占位 appId，点击后进入 `onError` 打桩路径，页面显示错误码与“属预期”说明；
   - **应用间跳转**：选择系统设置、本应用或未安装应用，观察成功、拒绝（如 16000001）与 3 秒超时三类结果；
   - **半模态面板**：打开 `bindSheet`，拖动切换半屏 / 全屏档位，切换 CENTER / POPUP 样式与关闭按钮显隐，关闭原因写入日志；
   - **Preferences 存储**：输入文本后写入并 flush，读取、删除或清空，重启应用后仍可恢复已保存内容；
4. 每个演示页底部的 `LogPanel` 显示本页事件，首页显示全部最近 30 条，支持一键清空；
5. 通过命令行查看全量日志：

   ```bash
   hdc hilog | grep AtomicServiceComponents
   ```

编译、签名与安装（以 DevEco Studio 安装目录为 `<DevEco Studio>`）：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p product=default --no-daemon
```

未配置签名时产物为 `entry/build/default/outputs/default/entry-default-unsigned.hap`。本地开发使用 SDK 默认签名即可（无需自行生成证书，仓库内不包含任何签名材料）：在 DevEco Studio 的 `File > Project Structure > Signing Configs` 中启用自动签名后直接运行。启用自动签名后：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} start -a EntryAbility -b com.samples.atomicservicecomponents"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 工程目录

```
AtomicServiceComponents
├── AppScope                                  应用级配置（bundleName、图标、名称）
├── entry/src/main
│   ├── ets
│   │   ├── common
│   │   │   ├── AppConstants.ets              AppStorage key、路由 key、页签数、日志容量、超时、hilog domain/tag
│   │   │   └── Theme.ets                     颜色、间距、圆角、字号、固定尺寸常量
│   │   ├── model
│   │   │   ├── DemoLogic.ets                 组件目录、分类、搜索过滤、页签切换守卫
│   │   │   ├── LogStore.ets                  日志条目、追加/查询/计数/清空（纯函数）
│   │   │   ├── DeviceProfile.ets             设备形态、断点、列数与布局参数（纯函数）
│   │   │   └── DownloadFlow.ets              下载目标判定、attempt token、超时降级、状态迁移
│   │   ├── utils
│   │   │   ├── FormatUtil.ets                时间/时长/字节/百分比格式化、进度分档、文件名与内容生成
│   │   │   ├── ErrorUtil.ets                 错误信息格式化、选择器错误码提示
│   │   │   ├── Logger.ets                    hilog 封装 + AppStorage 中央日志
│   │   │   ├── DeviceUtil.ets                deviceInfo/display 读取、display 变化监听
│   │   │   ├── FileUtil.ets                  沙箱文本写入
│   │   │   └── PickerUtil.ets                DocumentViewPicker 封装：attempt token、3 秒超时、dispose
│   │   ├── components                        LogPanel（按 source 过滤）、DemoPageScaffold
│   │   ├── pages
│   │   │   ├── Index.ets                     AtomicServiceNavigation 外壳与首页
│   │   │   └── demos                         九个场景的演示页
│   │   └── entryability / entrybackupability 生命周期与备份扩展
│   └── resources/rawfile                     AtomicServiceWeb 使用的本地 H5 页面
├── entry/src/test                            本地纯逻辑单测（11 个文件，109 个用例）
├── entry/src/ohosTest                        开发板侧测试（19 个套件，336 个用例）
├── screenshots                          效果预览截图
├── ohosTest.md                               设备侧测试用例归档
└── README.md
```

## 具体实现

### 1. 应用入口与导航外壳

- [`EntryAbility.ets`](entry/src/main/ets/entryability/EntryAbility.ets)：应用入口，记录生命周期、窗口阶段与配置变化日志，加载首页；
- [`Index.ets`](entry/src/main/ets/pages/Index.ets)：使用 `AtomicServiceNavigation` 作为根容器，绑定 `NavPathStack`、标题预设、渐变背景参数、Stack / Split 模式与 `hideTitleBar`；`pageMap` 将路由 key 映射为 `NavDestination` 并挂载九个演示页；
- 首页内容区使用 `GridRow` / `GridCol` 按布局 profile 的列数排布组件卡片，顶部嵌入 `AtomicServiceSearch` 实现关键字与分类过滤。

### 2. 组件与场景演示页

| 组件 | 演示页 | 关键实现 |
| --- | --- | --- |
| `AtomicServiceNavigation` | [`NavigationDemo.ets`](entry/src/main/ets/pages/demos/NavigationDemo.ets) | 通过 `@StorageLink` 实时修改标题、渐变、分栏、隐藏标题栏；恢复默认按设备 profile 计算 |
| `AtomicServiceSearch` | [`SearchDemo.ets`](entry/src/main/ets/pages/demos/SearchDemo.ets) | 搜索区 + 选择区 + 辅助/独立功能区；结果列表可点击跳转到对应演示页 |
| `AtomicServiceTabs` | [`TabsDemo.ets`](entry/src/main/ets/pages/demos/TabsDemo.ets) | 三个图文页签，演示 `onTabBarClick`、`onChange`、`onContentWillChange` 与布局模式；锁定后切换被拦截 |
| `AtomicServiceWeb` | [`WebDemo.ets`](entry/src/main/ets/pages/demos/WebDemo.ets) | 加载本地 `rawfile/index.html`、`page2.html`，控制器前进/后退/刷新，进度按 25% 分档记录 |
| `DownloadFileButton` | [`DownloadDemo.ets`](entry/src/main/ets/pages/demos/DownloadDemo.ets) | 切换图标与排列方式；按形态选择 `DocumentViewPicker` 或沙箱写入 |
| `HalfScreenLaunchComponent` | [`HalfScreenDemo.ets`](entry/src/main/ets/pages/demos/HalfScreenDemo.ets) | 以占位 appId 挂载组件，展示 `onError` 降级路径与错误码 |
| 应用间跳转 | [`CrossAbilityDemo.ets`](entry/src/main/ets/pages/demos/CrossAbilityDemo.ets) | `UIAbilityContext.startAbility` + 显式 Want；成功、拒绝（错误码提示）与 3 秒超时三类结果，attempt token 丢弃迟到回调 |
| 半模态面板 | [`SheetDemo.ets`](entry/src/main/ets/pages/demos/SheetDemo.ets) | `bindSheet` 双向绑定显隐，半屏 / 全屏两档 detents，CENTER / POPUP 样式与关闭按钮显隐，`onHeightDidChange` 高度分档 |
| Preferences 存储 | [`PreferencesDemo.ets`](entry/src/main/ets/pages/demos/PreferencesDemo.ets) | `preferences` 写入 / 读取 / 删除 / 清空并 flush，读取次数随内容一起持久化 |

### 3. 设备形态与断点适配

[`DeviceProfile.ets`](entry/src/main/ets/model/DeviceProfile.ets) 以纯函数构建布局 profile：启动时读取 `deviceInfo.deviceType` 与 `display.getDefaultDisplaySync()`（宽高换算为 vp，读取失败回落 360×780vp），断点规则为 `<600vp` 为 sm、`600–839` 为 md、`≥840` 为 lg；[`DeviceUtil.ets`](entry/src/main/ets/utils/DeviceUtil.ets) 通过 `display.on` 监听显示参数变化并重建 profile，写回 `AppStorage('layoutProfile')`。

| 形态 | sm (<600) | md (600–839) | lg (≥840) |
| --- | --- | --- | --- |
| phone | 1 列 | 1 列 | 1 列 |
| default（dayu200） | 1 列 | 2 列 | 2 列，内容限宽 960，分栏默认关，选择器不可用 |
| tablet | 1 列 | 2 列 | 2 列，默认分栏 |
| 2in1 | 2 列 | 2 列 | 3 列，默认分栏 |

Tab / Web 高度随视口推导并夹取：web `clamp(0.55×h, 320, 640)`，tabs `clamp(0.5×h, 300, 520)`。

### 4. 统一日志

[`Logger.ets`](entry/src/main/ets/utils/Logger.ets) 提供 `debug/info/warn/error(source, tag, detail)`：始终写 hilog（domain `0x0000`，tag `AtomicServiceComponents`，格式 `[source][LEVEL] tag: detail`，参数统一 `%{public}s`），同时以新数组整体替换写入 `AppStorage('appLogs')`，容量 200。[`LogPanel.ets`](entry/src/main/ets/components/LogPanel.ets) 按 `source` 过滤展示最近 20 条，首页展示全部最近 30 条，支持一键清空，WARN 橙色、ERROR 红色标注。

`source` 取值为 `首页 / Navigation / Search / Tabs / Web / Download / HalfScreen / Jump / Sheet / Prefs / Ability`；`build()` 内不记日志，Web 进度按 25% 分档，超时、越界、降级、导航栈为空等异常分支记 WARN / ERROR。

### 5. 下载与选择器

[`DownloadFlow.ets`](entry/src/main/ets/model/DownloadFlow.ets) 以纯函数描述下载目标判定、attempt token、超时降级与状态迁移；[`PickerUtil.ets`](entry/src/main/ets/utils/PickerUtil.ets) 封装 `DocumentViewPicker` 的 `DOWNLOAD` 模式，3 秒无响应时丢弃迟到回调并降级；[`FileUtil.ets`](entry/src/main/ets/utils/FileUtil.ets) 负责向传入的 `filesDir` 写入文本。`DownloadFileButton` 本身只提供统一样式，点击行为由页面 `.onClick` 调用上述逻辑实现。

### 6. 跳转、半模态与 Preferences

[`AbilityJump.ets`](entry/src/main/ets/model/AbilityJump.ets) 定义跳转目标、状态文案与错误码提示，页面为每次请求生成 attempt token，3 秒内无结果判定超时，迟到的成功 / 失败回调按 token 丢弃。[`SheetFlow.ets`](entry/src/main/ets/model/SheetFlow.ets) 负责样式文案、重复打开拦截与拖拽高度分档（<300 / 300–600 / ≥600vp）。[`PrefsStore.ets`](entry/src/main/ets/model/PrefsStore.ets) 提供输入裁剪（80 字符）、空白判定、计数推进与摘要文案，[`PrefsUtil.ets`](entry/src/main/ets/utils/PrefsUtil.ets) 封装 `preferences.getPreferencesSync`、`putSync` / `deleteSync` / `clearSync` 与 `flush`。

### 7. 测试与验证

本地单测位于 `entry/src/test/`，按模块拆分为 11 个文件、共 109 个用例，通过 `List.test.ets` 聚合：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  test --mode module -p module=entry@default -p product=default --no-daemon
```

结果文件：`entry/.test/default/intermediates/test/coverage_data/test_result.txt`，本机结果 `Tests run: 109, Failure: 0, Error: 0, Pass: 109`。

开发板测试位于 `entry/src/ohosTest/ets/test/`，19 个套件、共 336 个用例：纯逻辑用例覆盖各模型的取值与边界；设备集成用例覆盖沙箱写入/读回/删除、`Logger` → `AppStorage` 往返、打包 `rawfile` 资源校验、真实 display profile 与选择器能力判定、`preferences` 落盘与重开读取、安装包名称与跳转目标一致性；组合用例把「形态 × 断点」「格式化边界」「日志级别 × 容量 × 过滤」「attempt × 超时 × 状态」「错误码 × 提示」「关键字 × 分类」「色板 × 常量」逐条展开为显式用例；`IndexUi` 通过 `@kit.TestKit` 的 `Driver` 验证三个通用场景可进入、半模态可开关、Preferences 可写入。每条用例带完整 `@tc` 注释，断言直接落在真实实现上。

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.atomicservicecomponents -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 300000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

开发板用例已在 RK3568（API 26）上通过上面的设备侧测试命令全量执行，结果 `Tests run: 336, Failure: 0, Error: 0, Pass: 336`。

### 8. dayu200 实机验证记录

以下为 dayu200 实机验证记录：

- 首页：设备 profile 行、中央日志聚合（首页 30 条上限）、一键清空；
- Navigation：标题预设切换、隐藏标题栏后的返回（导航栈判空修复）、Split 分栏（手动开启）、恢复默认回落到 `navSplitDefault=false`；
- Search：关键字 `web` 命中 1 项、结果可点击进入对应演示页、返回，全部入中央日志；
- Tabs：锁定后页签与按钮切换均被拦截（WARN `尝试 x → y，被拦截`）、布局 AUTO/VERTICAL、高度 427vp；
- Web：本地页加载、进度分档日志（10%/70%/100%）、控制器刷新、JS SDK 未注入时 H5 状态区提示、高度 469vp；
- Download：`pickerSupported=false` 降级写入沙箱，页面显示真实路径 `/data/storage/el2/base/haps/entry/files/atomic-service-demo-<时间>.txt`（204 B）；
- HalfScreen：占位 appId 触发 `onError`（16000050 Internal error），页面与日志同时给出错误码和“属预期”说明；
- 应用间跳转：系统设置目标实时拉起，未安装目标返回 16000001 并给出提示；
- 半模态面板：半屏 / 全屏两档可拖动切换，`onHeightDidChange` 连续记录高度，按钮与拖拽关闭均触发 `onDisappear`；
- Preferences 存储：写入后 flush，重新进入页面与重启应用均能读回，删除与清空后落盘状态同步更新；
- hilog 输出格式 `[Tabs][WARN] 拦截: ...` 与级别（I/W/E）符合预期。

## 相关权限

无。Web 页面为本地 `rawfile` 资源；开发板保存到应用沙箱，手机 / 平板通过系统文件选择器完成下载，均不需要申请存储或网络权限。

## 依赖

无第三方运行时依赖，也不依赖其它 sample。`oh-package.json5` 中仅包含测试框架依赖 `@ohos/hypium` 与 `@ohos/hamock`。

## 约束与限制

| 项目 | 要求 |
| --- | --- |
| 开发环境 | DevEco Studio 6.1.1 |
| SDK | 编译 SDK API 26（`compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` 均为 `26.0.0`，`runtimeOS: OpenHarmony`） |
| 系统版本 | OpenHarmony 7.0.0.46（API 26）及以上 |
| 验证设备 | RK3568 开发板（`deviceType=default`）；`module.json5` 声明 `default / tablet` |
| 签名 | 使用 SDK 默认签名或 DevEco Studio 自动签名即可本地调试；仓库不包含签名证书、私钥与口令 |

其它限制：

- **HalfScreenLaunchComponent**：嵌入式拉起要求目标原子化服务在 AGC 分配了真实 `appId`，且目标 Ability 继承 `EmbeddableUIAbility`。开发板离线环境不具备条件，示例使用占位 appId `576000000000000000`（集中在 [`AppConstants.ets`](entry/src/main/ets/common/AppConstants.ets)），点击后进入 `onError` 降级路径；接入真实服务时替换为真实 appId。
- **DownloadFileButton**：`phone / tablet / 2in1` 调用 `DocumentViewPicker` 获取公共下载目录，超时或出错时降级写入沙箱；RK3568（`default`）的文档选择器没有可见界面且会拦截后续触摸，因此直接写入 `filesDir` 并在页面显示真实路径。
- **渐变背景**：`gradientBackground`（API 18+）在本 ROM 上只渲染标题栏下方一条很窄的淡色带，示例通过 `alpha: GradientAlpha.OPACITY_100`、`mixMode: MixMode.TOWARDS` 以及内容根容器的同色 `linearGradient` 让效果可见，两者共用 `navGradient` 开关。
- **AtomicServiceWeb**：DevEco Previewer 不支持该组件，需在开发板或模拟器上运行；H5 的“向 ArkTS 发送消息”按钮依赖运行环境注入的 JS SDK（`has.asWeb`），未注入时页面状态区会给出提示，不影响加载。
- **AtomicServiceSearch**：从 API 18 开始提供；选择区和功能区最多各两个操作项，示例使用辅助 / 独立各一个。
- **AtomicServiceNavigation 系统日志**：OpenHarmony 7.0.0.46 初次渲染会打印 `State variable 'navPathStack' has changed during render!`，官方最小示例同样复现，属系统组件自身行为，页面功能正常。
- **平板 / 2in1 适配**：无实机验证，适配逻辑由断点单测覆盖边界（599 / 600 / 839 / 840）；实机启动日志会输出真实 profile 便于核对。
- **签名配置**：仓库内 `build-profile.json5` 不包含签名配置，本地签名由 DevEco Studio 自动生成，不要将个人证书材料提交到仓库。

## 下载

本工程当前以独立目录维护，直接复制 `AtomicServiceComponents` 目录即可使用。合入应用示例仓后，工程位于 `UI/AtomicServiceComponents`，可通过以下命令单独获取：

```bash
git clone https://gitcode.com/openharmony/applications_app_samples.git
cp -r applications_app_samples/UI/AtomicServiceComponents .
```

获取后在 DevEco Studio 中打开 `AtomicServiceComponents` 根目录运行。
