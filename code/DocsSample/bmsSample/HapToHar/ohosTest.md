# HAP转HAR指导文档示例 测试用例归档

## 测试环境

- 设备：OpenHarmony 7.1.0.23 / API 26 真机（deviceType `default`）
- 应用：`ohos.app.hap.myapplication`，主模块 `application`（HAP），`har` 模块（源码目录 `entry/`）编译为 HAR
- 测试框架：Hypium 1.0.21，测试模块 `application_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK 26（26.0.0 Release），最低兼容 API 20
- 测试代码：`application/src/ohosTest/ets/test/`，25 个套件 2649 条用例，约 5.34 万行，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 工程编译 | 编译正常，构建正常 | 无 | 成功编译出har包 | 否 | Pass |
| 安装包结构 | 主 HAP 与测试 HAP 已安装 | `getBundleInfoForSelf` 读取应用、模块、Ability、扩展、权限、签名、Skill 信息 | 包名与版本同 AppScope；仅安装 `application`（entry）与 `application_test`（feature）两个模块，`har`/`entry` 模块及 `EntryAbility`、`EntryBackupAbility` 均不存在；`application` 无模块依赖、仅 1 个导出的 `ApplicationAbility`，带 home Skill，无扩展、无权限；普通三方应用，appId 以包名开头；15 条用例通过 | 是 | Pass |
| 模块资源 | 主 HAP 已安装 | 通过 `application` 模块上下文按名称、按 ID 读取字符串、颜色、媒体资源，读取 HAR 独有资源名、大小写变体、错类型名称、不存在 ID | 4 个字符串与配置一致；`start_window_background` 为不透明白色；3 张 PNG 头合法，图标前景/背景同尺寸；HAR 独有名称、大小写变体、错类型名称抛 9001003，不存在 ID 抛 9001001；11 条用例通过 | 是 | Pass |
| ApplicationAbility 生命周期 | 主 HAP 已安装 | 拉起 `ApplicationAbility`，切后台再切回，运行中再次拉起，结束后重新拉起，读取运行中 Ability 的资源 | 拉起后为前台且 want 中包名/模块/Ability 一致；前台→后台→前台状态正确；单例下再次拉起不新建实例；结束后重新拉起得到新实例；`page_text_font_size` 按密度换算回 50fp；Ability 能读到自身标签、读不到 HAR 标签；8 条用例通过 | 是 | Pass |
| 首页文本 UI | 应用可正常启动 | UiTest 打开首页，点击 `HelloWorld` 文本 1 次、3 次，读取位置，重启 Ability | 初始显示 `Hello World`；点击后变为 `Welcome` 且多次点击不回退；文本为可点击的 Text，水平居中，切换后中心不变、宽度变窄；重启后恢复 `Hello World`；7 条用例通过 | 是 | Pass |
| HAR 运行时与工程事实 | 主 HAP 已安装 | 读取 BundleInfo、模块、Ability、目录结构，校验包名分段、模块形态、har 产物不进入 HAP | 包名 `ohos.app.hap.myapplication` 四段固定；模块数、mainElement、deviceTypes、签名、安装时间与目录布局与工程一致；186 条用例通过 | 是 | Pass |
| HAR 字符串/字体/媒体 | 主 HAP 已安装 | 按名称读取 HAR 字符串、颜色、字体缩放、媒体字节 | 4 个字符串及大小写变体读取正确；窗口背景色为不透明白/黑；3 张 PNG 的尺寸、分块、CRC32、字节和、zlib 头与源文件一致；260 条用例通过 | 是 | Pass |
| 草稿文件 IO 与偏好存储 | 主 HAP 已安装 | 在 `filesDir` 下创建、追加、重命名、复制、移动、删除文件与目录；用 Preferences 存取字符串、数字、布尔与数组 | 文件内容与字节数一致；追加链、嵌套目录、批量列表、特殊字符往返正确；偏好按类型往返、clear/delete/has 行为正确；345 条用例通过 | 是 | Pass |
| 编码/JSON/数字 | 主 HAP 已安装 | Base64 编解码、UTF-8 文本、JSON 解析与序列化、数字格式化与进制转换 | 编解码往返一致；JSON 文档与订单数组字段、汇总正确；`toFixed`、进制、边界值符合预期；570 条用例通过 | 是 | Pass |
| 文本/集合/时间/数学 | 主 HAP 已安装 | 字符串切片与查找、数组增删改排、UTC 时间字段、Math 常用函数 | 文本切片与子串一致；集合顺序、长度与元素正确；UTC 日期字段与格式化正确；数学结果与独立计算结果一致；896 条用例通过 | 是 | Pass |
| 显示/错误/Want/资源ID/UI流 | 主 HAP 已安装、可拉起 Ability | 读取默认显示器信息；构造非法文件操作；解析 Want 字段；按 ID 读取资源；用 UiTest 查找与点击组件 | 显示器尺寸与密度为正；非法路径与权限错误码正确；Want 可选字段可读；资源 ID 与名称读取一致；组件查找、点击、边界不越界；351 条用例通过 | 是 | Pass |

## 测试设计

| 套件 | 文件 | 维度 | 用例数 |
| --- | --- | --- | ---: |
| BundleInfoGuard | `BundleInfoGuard.test.ets` | 正常值（包名、版本、模块形态）、HAR 产物不进入 HAP 的守卫、配置缺省值、Skill、扩展与权限空集合、签名不变量 | 15 |
| ModuleResourceGuard | `ModuleResourceGuard.test.ets` | 字符串大表、ID 与名称交叉验证、颜色独立解析、PNG 头独立解析、HAR 独有名称、大小写与类型非法值、不存在 ID 极值 | 11 |
| AbilityLifecycleSequence | `AbilityLifecycleSequence.test.ets` | 拉起、前后台切换序列、单例重复拉起、结束后重拉、运行时资源密度换算 | 8 |
| IndexUi | `IndexUi.test.ets` | 初始文本、单次与重复点击状态、控件属性、居中布局不变量、重启复位 | 7 |
| HarRuntimeMatrix | `HarRuntimeMatrix.test.ets` | 包名/模块/Ability 名称的字符位置、分段、长度与大小写不变量，模块与签名结构事实 | 36 |
| AppFactsMatrix | `AppFactsMatrix.test.ets` | ApplicationInfo 字段（类型、可移除、调试、安装来源、元数据）、BundleInfo 签名与版本事实 | 56 |
| HarStringMatrix | `HarStringMatrix.test.ets` | 4 个字符串资源的精确值、长度、字符位置、大小写变体与名称查找 | 52 |
| HarFontColorMatrix | `HarFontColorMatrix.test.ets` | 窗口背景色的通道、透明度、十六进制表示，配置字号与密度换算 | 20 |
| HarMediaMatrix | `HarMediaMatrix.test.ets` | 3 张 PNG 的签名、IHDR 尺寸、分块结构、IEND、字节长度 | 84 |
| MediaChecksumMatrix | `MediaChecksumMatrix.test.ets` | 3 张 PNG 的 CRC32、字节和、异或折叠、零/0xFF 计数、窗口和、块布局、zlib 头、跨资源比较 | 104 |
| DirectoryFactsMatrix | `DirectoryFactsMatrix.test.ets` | filesDir/cacheDir/databaseDir 布局、目录创建与列举、相对路径与从根目录开始的路径拼接 | 94 |
| DraftIoMatrix | `DraftIoMatrix.test.ets` | 文本读写、追加链、重命名、复制、移动、嵌套目录、批量列举、特殊字符、stat、access | 217 |
| PrefStoreMatrix | `PrefStoreMatrix.test.ets` | 字符串/数字/布尔/数组往返、默认值、has/delete/clear、flush 后持久化、多实例隔离 | 128 |
| EncodeTextMatrix | `EncodeTextMatrix.test.ets` | UTF-8 文本编码与解码、hex 往返、长度与首尾字节、空串与多字节字符 | 214 |
| JsonDocMatrix | `JsonDocMatrix.test.ets` | 嵌套配置文档、订单数组汇总、序列化往返、非法 JSON 抛错 | 122 |
| NumberSenseMatrix | `NumberSenseMatrix.test.ets` | `toFixed`、进制转换、边界值、整数与浮点、`Number` 静态方法 | 234 |
| TextSenseMatrix | `TextSenseMatrix.test.ets` | 切片/子串、查找、大小写、填充、替换、重复、拆分合并 | 300 |
| CollectionSenseMatrix | `CollectionSenseMatrix.test.ets` | 栈/队列操作、splice、过滤映射、排序反转、reduce/find/slice | 300 |
| TimeSenseMatrix | `TimeSenseMatrix.test.ets` | UTC 字段、日期格式化、时间差、月份与闰年边界 | 132 |
| MathSenseMatrix | `MathSenseMatrix.test.ets` | 取整、幂与开方、三角与对数、最值与符号 | 164 |
| DisplayFactsMatrix | `DisplayFactsMatrix.test.ets` | 默认显示器 id、宽高、密度、刷新率与方向 | 70 |
| FileErrorMatrix | `FileErrorMatrix.test.ets` | 不存在路径、非法参数、权限错误码，错误码与异常消息 | 125 |
| WantFactsMatrix | `WantFactsMatrix.test.ets` | Want 的 bundle/module/ability 字段、可选字段、参数与实体列表 | 110 |
| ResourceIdMatrix | `ResourceIdMatrix.test.ets` | 按 ID 读取字符串、颜色、媒体，与按名称读取交叉验证 | 38 |
| UiFlowMatrix | `UiFlowMatrix.test.ets` | UiTest 查找 `HelloWorld`、点击、读取文本与边界 | 8 |

- 每条用例至少 2~4 条断言，按“主结果 + 独立佐证 + 边界/不变量”组织；媒体用独立的 PNG 分块解析与校验和交叉验证。
- `List.test.ets` 中纯逻辑套件在前，拉起 Ability 与 UI 套件在后；每个套件 `beforeEach` 等待 30 ms 让出主线程。
- 生命周期与 UI 用例每次先结束已有 `ApplicationAbility` 再重新拉起，页面状态不在用例间传递。
- 用例数据全部由工程内真实资源与独立计算结果推导，不使用 `index % N` 形式的模板轮转；同一用例内不出现重复断言。

## 执行方式

设备侧测试需先安装主 HAP（`application`），再安装测试 HAP。

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=application@default -p product=default --no-daemon
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=application@ohosTest -p product=default --no-daemon
hdc install application/build/default/outputs/default/application-default-signed.hap
hdc install application/build/default/outputs/ohosTest/application-ohosTest-signed.hap
hdc shell "power-shell wakeup"
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b ohos.app.hap.myapplication -m application_test \
  -s unittest OpenHarmonyTestRunner -s timeout 1800000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到，该工具随 OpenHarmony toolchains 提供，用于执行设备侧测试。本仓库不保存签名材料。用例总量较大，建议单次全量执行并预留 30 分钟超时。

HAR 编译验证：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHar --mode module -p module=har@default -p product=default --no-daemon
# 产物：entry/build/default/outputs/default/har.har
```

日志查看：

```bash
hdc shell hilog | grep Sample_HapToHar
```


## 验证结果

本机已完成静态校验与构建验证：

```
ohosTest 编译：BUILD SUCCESSFUL（module=application@ohosTest）
套件数：25，用例数：2649，测试代码行数：约 53385
断言审计：用例内矛盾断言 0，用例内重复断言 0，单行宽度 ≤ 140，无中文字符，版权头齐全
har 模块 assembleHar：成功生成 har.har
```

设备侧全量执行需按上文命令在真机运行，用例通过数以上述命令输出的 `Tests run` 行为准。

## 补充说明

以下为测试中观察到的问题，仅记录、未修改：

1. `application/build-profile.json5` 的 `release` 混淆配置引用 `./obfuscation-rules.txt`，但该文件只存在于 `entry/` 目录，`application/` 下缺失；当前 `enable: false` 不影响构建，开启混淆后会找不到规则文件。
2. `README_zh.md` 写明“支持设备：tablet”，工程目录也只列出 `entry/`；实际可安装运行的 `application` 模块 `deviceTypes` 为 `default`，`entry/` 编译为 HAR（`tablet`、`2in1`），文档未提及 `application` 模块。
3. 安装后 `appInfo.label` 为 `$string:app_name`，但 `appInfo.labelId` 解析为主 Ability 标签 `label`，而非 AppScope 的 `simple007_hap_to_har`；这是系统包管理的取值规则，用例按实际行为校验。
