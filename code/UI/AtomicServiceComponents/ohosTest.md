# AtomicServiceComponents 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26
- 应用：`com.samples.atomicservicecomponents`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26（`compileSdkVersion` / `compatibleSdkVersion 26.0.0`，`runtimeOS: OpenHarmony`）

## 测试设计

设备侧用例按覆盖类型分为四组，全部断言真实实现，不在测试内复刻业务类或校验逻辑：

- 纯逻辑覆盖：各模型的取值与边界，包括设备形态与断点、格式化换算、日志容量与级别、下载状态迁移、错误码提示、关键字过滤、色板与常量关系，以及应用间跳转状态与错误码提示、半模态样式与高度档位、Preferences 文本归一化与计数。
- 设备集成：真实沙箱写入/读回/删除、`Logger` → `AppStorage` 往返、打包 `rawfile` 页面校验、真实 display profile 与选择器能力判定、`preferences` 落盘与重开读取（模块 context）、安装包名称与跳转目标一致性。
- 组合覆盖：把上述维度逐条展开为独立用例，每条带完整 `@tc` 注释，运行期用例数与静态 `it` 数一致。
- 界面验证：`IndexUi` 通过 `@kit.TestKit` 的 `Driver` 在真机进入三个场景演示页，验证半模态开关、Preferences 写入提示与返回。

组合维度与套件分布：

| 套件 | 组合维度 | 用例数 |
| --- | --- | ---: |
| DeviceProfileMatrix | 形态（4）× 断点（3）列数；断点阈值 599/600/839/840；分栏默认；pxToVp 密度换算；web/tabs 高度夹取 | 50 |
| FormatUtilMatrix | 补零 / 时间 / 日期；毫秒-秒-分钟切换；B-KB-MB；百分比夹取；进度分档；中段截断；下载文件名与内容 | 50 |
| LogStoreMatrix | 容量 1/2/3/10/默认；最低级别 × 实际级别；来源 × 关键字 × 条数上限；标签计数 | 27 |
| DownloadFlowMatrix | 设备类型 × 选择器能力；attempt 递增与过期；超时降级真值表；状态名与迁移 | 27 |
| ErrorUtilMatrix | 6 个已知错误码 × 提示；未知码回落；describe / formatError 有无错误码 | 18 |
| DemoLogicMatrix | 关键字 × 分类；大小写 / 首尾空格；页签锁定与索引边界；导航栈判空；目录完整性 | 23 |
| ConstantsAndThemeMatrix | 路由 key 守卫；AppStorage key 唯一性；间距 / 圆角 / 字号 / 尺寸单调性；色板格式；日志上限关系 | 13 |

场景与界面套件：

| 套件 | 覆盖内容 | 用例数 |
| --- | --- | ---: |
| AbilityJump | 跳转目标定义与 describe、状态名、错误码提示、attempt 递增与过期判定 | 10 |
| SheetFlow | 样式切换、可打开判定、高度档位与标签、状态文案 | 9 |
| PrefsStore | 文本归一化、可保存判定、计数递增、读取回落、摘要拼装 | 10 |
| EnrichmentDevice | preferences 落盘读写/删除/清空/存储隔离；安装包名称与跳转目标一致性 | 6 |
| IndexUi | 三个场景演示页的入口、半模态开关与Preferences 写入提示 | 4 |

### 断言来源：不做镜像测试

- 所有设备侧套件都 `import` 产品模块并直接调用真实实现（`DeviceProfile`、`FormatUtil`、`LogStore`、`DownloadFlow`、`ErrorUtil`、`DemoLogic`、`AppConstants`、`Theme`、`DeviceUtil`、`FileUtil`、`Logger`、`AbilityJump`、`SheetFlow`、`PrefsStore`、`PrefsUtil`），不在测试内复刻业务类或校验逻辑；
- 期望值来自需求与公开约定：断点阈值 600 / 840vp、各形态列数规则、1024 字节换算、25% 进度分档、选择器错误码 13900001/02/12/15/20/42、跳转错误码 16000001/02/04/11/19/50/201、Preferences 文本上限 80 字符、日志容量与页面上限关系等；
- 测试内只保留两类辅助代码：生成输入的夹具（如四种级别的日志数组）与断言辅助（如十六进制色值格式判断）；
- 不采用「在测试里复刻一份业务类再测复刻品」的写法；界面入口与关键交互由 `IndexUi` 在真机驱动验证，视觉呈现由真机点按 + 截图确认，不在单元测试内做像素断言。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与首页渲染 | 设备已安装应用 | 启动 `EntryAbility` | 首页正常显示设备 profile、组件目录、搜索区和事件日志 | 否 | Pass |
| 首页关键字过滤 | 位于首页 | 输入关键字 `web` | 组件目录仅保留 `AtomicServiceWeb`，日志记录命中数量 | 否 | Pass |
| 首页分类与组合过滤 | 位于首页 | 切换分类「交互」，再组合关键字 | 结果同时满足分类与关键字条件，清空后恢复完整目录 | 否 | Pass |
| 首页组件卡片跳转 | 位于首页 | 点击任一组件卡片 | 进入对应演示页，日志记录打开的组件名 | 否 | Pass |
| Search 页搜索与选择 | 位于 Search 演示页 | 输入关键字、切换分类 | 匹配结果实时更新，日志记录关键字、分类与命中数 | 否 | Pass |
| Search 页结果跳转 | 位于 Search 演示页 | 点击任一匹配结果 | 进入对应组件演示页，日志记录导航动作 | 否 | Pass |
| Navigation 标题与渐变切换 | 位于 Navigation 演示页 | 切换标题预设、开关渐变背景 | 标题与背景即时变化，日志记录切换结果 | 否 | Pass |
| Navigation 分栏与隐藏标题栏 | 位于 Navigation 演示页 | 开启 Split 分栏、隐藏标题栏后返回 | 分栏生效；隐藏标题栏后仍可正常返回，导航栈判空不崩溃 | 否 | Pass |
| Navigation 恢复默认 | 位于 Navigation 演示页，已修改多项配置 | 点击“恢复默认” | 按设备 profile 重新计算，dayu200 回落为分栏关闭 | 否 | Pass |
| Tabs 页签切换 | 位于 Tabs 演示页 | 点击三个页签或按钮切换 | 内容随页签切换，`onTabBarClick` / `onChange` 写入日志 | 否 | Pass |
| Tabs 锁定拦截 | 位于 Tabs 演示页 | 开启锁定后点击其它页签或按钮 | 保持当前页签，日志记录 WARN 与“尝试 x → y，被拦截” | 否 | Pass |
| Web 本地资源完整性 | 已完成 HAP 构建 | 读取打包后的 `index.html`、`page2.html` | 两个文件均存在、内容标记正确，`index.html` 含跳转链接 | 是 | Pass |
| Web 页面加载与互跳 | 位于 Web 演示页 | 点击“前往第二页”、后退、前进 | 两页正常切换，`onPageBegin` / `onPageEnd` 写入日志 | 否 | Pass |
| Web 控制器刷新 | 位于 Web 演示页 | 点击刷新 | 页面重新加载，进度按 25% 分档记录（10% / 70% / 100%） | 否 | Pass |
| Web H5 消息 | 位于 Web 演示页 | 点击 H5“向 ArkTS 发送消息” | JS SDK 可用时回调写入日志；未注入时页面状态区给出提示 | 否 | Pass |
| Download 开发板沙箱写入 | 位于 Download 演示页（`deviceType=default`） | 点击下载按钮 | 不调用选择器，文本写入 `filesDir`，页面显示真实路径 | 是 | Pass |
| Download 超时降级逻辑 | 设备侧单元环境 | 构造选择器超时与迟到回调 | 3 秒后降级沙箱，过期 attempt 回调被丢弃 | 是 | Pass |
| HalfScreen 占位 appId 降级 | 位于 HalfScreen 演示页 | 点击拉起组件 | 触发 `onError`（16000050），页面与日志显示错误码及“属预期”说明 | 否 | Pass |
| 应用间跳转目标可达性 | 设备已安装系统设置应用 | 以显式 Want 拉起 `com.ohos.settings/com.ohos.settings.MainAbility` | 返回 `start ability successfully` | 是 | Pass |
| 应用间跳转错误码与超时 | 设备侧单元环境 | 断言状态名、7 个跳转错误码提示、attempt 递增与过期判定 | 与约定一致，过期回调被忽略 | 是 | Pass |
| 半模态样式与高度档位 | 设备侧单元环境 | 断言样式切换、可打开判定、高度档位与状态文案 | 与约定一致 | 是 | Pass |
| 半模态开关 | RK3568 已连接 | `IndexUi` 驱动打开、关闭面板 | 半模态内容区正常出现，关闭后回到演示页 | 是 | Pass |
| Preferences 归一化与计数 | 设备侧单元环境 | 断言去首尾空格、80 字符截断、计数递增与读取回落 | 与约定一致 | 是 | Pass |
| preferences 落盘与重开读取 | RK3568 已连接 | 模块 context 下写入、读回、删除、清空、存储隔离 | 内容一致，删除/清空后为空，存储互不影响 | 是 | Pass |
| Preferences 页面写入 | RK3568 已连接 | `IndexUi` 驱动写入内容 | 页面提示“已写入并 flush 落盘” | 是 | Pass |
| 日志面板展示与清空 | 任一演示页 | 产生若干日志后点击清空 | 面板清空，后续操作继续正常记日志 | 否 | Pass |
| Logger 双通道往返 | 设备侧单元环境 | 调用 `Logger.warn` 后读取 `AppStorage('appLogs')` | source / level / detail 正确，清空后为 0 条 | 是 | Pass |
| 设备 profile 与断点 | 设备已启动 | 读取真实 display 快照 | 断点与宽高自洽；dayu200 判定为不可用选择器形态 | 是 | Pass |
| 沙箱文件读写 | 设备侧单元环境 | 写入文本、读回、删除；再传入空 `filesDir` | 内容一致，删除后不存在，空路径被拒绝 | 是 | Pass |
| 本地纯逻辑单测 | 开发机 | 执行 `entry@default` 测试任务 | 109 条用例全部通过 | 是 | Pass |
| 开发板纯逻辑与设备集成用例 | RK3568 已连接 | 执行 `entry@ohosTest` 测试任务 | 124 条用例全部通过 | 是 | Pass |
| 开发板组合用例 | RK3568 已连接 | 执行 `entry@ohosTest` 测试任务 | 208 条组合用例全部通过 | 是 | Pass |
| 开发板界面用例 | RK3568 已连接 | 执行 `entry@ohosTest` 测试任务 | 4 条用例全部通过 | 是 | Pass |

## 执行方式

设备侧测试：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b com.samples.atomicservicecomponents -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 300000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

本地纯逻辑测试：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  test --mode module -p module=entry@default -p product=default --no-daemon
```

验证结果：本地 `Tests run: 109, Failure: 0, Error: 0, Pass: 109`；开发板 19 个套件 336 例在 RK3568（API 26）上全量执行 `Tests run: 336, Failure: 0, Error: 0, Pass: 336`。
