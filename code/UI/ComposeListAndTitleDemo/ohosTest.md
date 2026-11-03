# ComposeListAndTitleDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.1.0.22 / API 26
- 应用：`com.samples.composelistandtitledemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，OpenHarmony SDK 26.0.0（runtimeOS OpenHarmony，compile / target / compatible 均为 26.0.0）
- 测试代码：`entry/src/ohosTest/ets/test/`，8 个套件 158 条用例，由 `List.test.ets` 聚合

## 测试设计

设备侧用例分布如下：

| 类别 | 套件 | 用例 | 状态 |
| --- | --- | --- | --- |
| 纯逻辑与设备集成套件 | `Ability` / `DeviceUtil` / `LogUtil` / `ListModels` | 59 | 已在 RK3568（API 26）真机全量执行通过 |
| 组合展开套件 | `ContactStoreMatrix` / `ListConfigFactoryMatrix` / `LogUtilMatrix` / `DeviceUtilMatrix` | 99 | 已在 RK3568（API 26）真机全量执行通过 |
| 手工 UI 用例 | 见用例表“是否自动 = 否”的行 | 17 | 需在设备上手工操作验证 |

组合套件的设计原则：

- **逐条显式用例**：每个测试点对应一个独立的 `it` 与完整 `@tc` 头（number / name / desc / size / type / level），不使用 `forEach` 批量注册，避免注释与用例脱节；
- **断言真实实现**：只调用 `ListModels.ets`、`LogUtil.ets`、`DeviceUtil.ets` 中的真实类与方法，测试内不复制实现、不引入镜像类；期望值来自 API 语义（id 单调不复用、搜索大小写不敏感、字段一一映射、日志行格式、600 / 840vp 断点）而非重写一遍逻辑；
- **覆盖分支与组合**：在主路径（增删一次、搜索一次、每个操作区一次、边界一步）之外，补充分支与组合（首 / 中 / 尾删除、非法 id、空串 / 中文 / Emoji、操作区字段隔离、回调独立性、分数宽度断点、级别中途切换等）。

| 组合套件 | 用例 | 覆盖维度 |
| --- | --- | --- |
| `ContactStoreMatrix.test.ets` | 31 | id 从 1 连续递增 / 清空后继续递增；空姓名、中文 / Emoji、字段原样保存、默认离线；首 / 中 / 尾删除、重复删除、负数与零 id、小数 id、全删；多联系人在线状态独立切换、二次切换回退、非法 id 返回 null、清空归零；搜索大小写不敏感、中文部分匹配、空关键字、纯空白关键字、未命中、删除后结果；findById 引用一致性、getAll 快照长度、增删循环保持顺序、50 人批量 id 连续 |
| `ListConfigFactoryMatrix.test.ets` | 30 | V1 / V2 内容区图标档位变体（NORMAL_ICON / SYSTEM_ICON / PREVIEW）、三行文本全字段、Resource 图标、无 description 时字段为 undefined；V1 开关与复选框初始 false、单选初始 true、按钮 / 文本空串、图片 Resource、双图标回调互不干扰、箭头资源值、操作区字段隔离；V2 toggle 初始 false、复选框初始 true、单选回调、按钮 / 文本空串、图片 Resource、双图标回调独立、操作区字段隔离、构建器每次返回新实例；V1 / V2 菜单项空 value 保真、Unicode 菜单值 |
| `LogUtilMatrix.test.ets` | 21 | init 不写面板、替换回调保留当前级别；级别调高 / 调低、ERROR 门槛、枚举顺序、日志中途切换级别；固定时刻 03:04:05 / 00:00:00 / 09:09:09 / 12:00:00 / 23:00:00 / 12:34:56 / 23:45:59 / 10:00:00 与时间令牌形状；四级行格式、空格与中文标签、含括号消息、DEBUG 标记、空消息与多行消息保真 |
| `DeviceUtilMatrix.test.ets` | 17 | 断点 480 / 1024 / 599.9 / 600.1 / 839.9 / 840.1 / 1366 的归属；档位序号单调递增；sm 单栏、md / lg 双栏；preferTwoColumn 与断点结论一致；同宽度重复查询稳定；标志与 deviceType 字面量一致；SDK API 正整数、市场名类型、logDeviceProfile 不抛异常且日志行送达面板 |

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面渲染 | 设备已安装应用 | 启动 `EntryAbility` | 显示标题栏、设备信息行、搜索框、3 个演示分区与日志面板，日志记录设备档案与初始联系人数量 | 否 | Pass |
| 标题栏 V1 菜单 | 位于首页 | 点击头像、「刷新」、「设置」 | 三次点击均写入日志；点击「刷新」后列表重新查询并记录当前展示人数 | 否 | Pass |
| 标题栏 V2 菜单 | 位于分区 1 | 点击头像、「搜索」、「更多」 | `menuItems` 回调触发并写入日志 | 否 | Pass |
| 标题栏 V2 动态副标题 | 位于首页 | 切换分区 3 中某位联系人的 toggle | 副标题“共 N 人 · 在线 M 人”中的在线人数随数据仓库变化 | 否 | Pass |
| 搜索实时过滤 | 位于首页，列表非空 | 输入姓名或部门关键字，再清空 | 列表按关键字实时过滤；清空后恢复全部联系人；无匹配时列表为空 | 否 | Pass |
| 列表项 V1 联系人与箭头 | 位于分区 2 | 点击任一联系人行的箭头 | 日志记录“V1 列表项箭头点击：姓名” | 否 | Pass |
| 列表项 V1 开关 | 位于分区 2 | 点击“消息免打扰”开关 | 开关状态切换，日志记录 `V1 开关切换 → true/false` | 否 | Pass |
| 列表项 V1 按钮与复选框 | 位于分区 2 | 点击“安装”按钮、切换“同步到云端”复选框 | 按钮显示正常；复选框切换并写入日志 | 否 | Pass |
| 列表项 V1 单选与双图标 | 位于分区 2 | 切换“默认铃声”单选，分别点击“收藏与分享”两个图标 | 单选切换写入日志；两个图标各自触发独立回调并区分为第一个 / 第二个 | 否 | Pass |
| 列表项 V1 三行文本与 BADGE | 位于分区 2 | 观察“未读消息”行 | BADGE 档位显示 8vp 小图标，description 换行展示，右侧文本操作区显示“3 条” | 否 | Pass |
| 列表项 V1 PREVIEW 与图片操作区 | 位于分区 2 | 观察“图片预览”行 | 内容区使用 96vp 预览图档位，操作区显示图片 | 否 | Pass |
| 列表项 V2 toggle 联动数据 | 位于分区 3 | 切换任一联系人的 toggle | 数据仓库在线状态更新、列表刷新，日志记录切换结果，标题栏副标题同步 | 否 | Pass |
| 列表项 V2 按钮与箭头 | 位于分区 3 | 点击“检查”按钮、点击“关于本机”箭头 | 按钮响应；箭头回调写入日志 | 否 | Pass |
| 列表项 V2 复选框与双图标 | 位于分区 3 | 切换“多选模式”复选框，分别点击两个图标 | 复选框与两个图标回调均写入日志 | 否 | Pass |
| 列表项 V2 三行文本与 PREVIEW | 位于分区 3 | 观察“图片预览”行 | PREVIEW 档位与 `primaryText` + `secondaryText` + `description` 三行文本正常展示 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 480×853vp 竖屏与 ≥600vp 窗口 | `sm` 单栏、日志固定 200vp；`md/lg` 左右双栏、日志占 38%，切换时日志记录断点 | 否 | Pass |
| 日志面板容量与置顶 | 位于首页 | 连续操作产生超过 120 条日志 | 最新日志置顶，最多保留 120 条 | 否 | Pass |
| ContactStore 联系人仓库 | 设备侧测试环境 | 执行 `ListModels.test.ets` 中 ContactStore 相关 16 条用例 | 增删、缺失删除、在线切换、搜索（特殊字符 / 部分关键字）、副本返回、清空、findById、id 不复用与单调递增、add 写入日志行均符合预期 | 是 | Pass |
| ListConfigFactory 配置工厂 | 设备侧测试环境 | 执行配置工厂相关 20 条用例 | V1/V2 内容项（含三行文本）、8 种操作区、菜单项、图标透传与回调触发字段映射正确 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 12 条用例 | 回调投递、行格式含时间戳、级别过滤与标记、时间补零、错误级别投递、重复 init 替换回调、省略级别保持最小值、未初始化时调用不抛异常、多行消息按序投递、未知级别标记 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 10 条用例 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840）、档案字段、宽屏与双栏阈值一致、极值、小数与负数宽度 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |
| ContactStore 组合 | 设备侧测试环境 | 执行 `ContactStoreMatrix.test.ets` 31 条用例 | id 连续与不复用、文本边界、删除边界、在线状态独立与回退、搜索变体、引用与快照一致、小数 id 拒绝、50 人批量、纯空白姓名与关键字 | 是 | Pass |
| ListConfigFactory 组合 | 设备侧测试环境 | 执行 `ListConfigFactoryMatrix.test.ets` 30 条用例 | 图标档位与 Resource、三行文本、初始状态与回调、空串保真、双图标独立、字段隔离、空菜单值、构建器返回新实例、无 description 字段、Unicode 菜单值 | 是 | Pass |
| LogUtil 组合 | 设备侧测试环境 | 执行 `LogUtilMatrix.test.ets` 21 条用例 | init 行为、级别过滤与切换、固定时间格式化、四级行格式、标签与消息保真、空消息与多行消息、全双位时刻 | 是 | Pass |
| DeviceUtil 组合 | 设备侧测试环境 | 执行 `DeviceUtilMatrix.test.ets` 17 条用例 | 分数宽度断点、档位单调、双栏结论一致、重复查询稳定、形态标志一致、档案字段类型、日志不抛异常、日志行送达面板 | 是 | Pass |

## 执行方式

设备侧测试（签名使用 SDK 自带的 OpenHarmony 默认调试签名，仓库内不保存任何证书或口令）：

```bash
export DEVECO_SDK_HOME="<DevEco Studio>/sdk"
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.composelistandtitledemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

未配置签名时 hvigor 仅输出 `No signingConfig found for product default` 警告并跳过签名，产物为 unsigned HAP；此时可直接编译验证用例代码，但无法安装到设备。

查看应用日志：

```bash
hdc shell hilog | grep ComposeList
```

## 验证结果

- **设备侧套件**：158 条用例已在 RK3568（API 26）真机全量执行（ListModels 36、LogUtil 12、DeviceUtil 10、Ability 1、ContactStoreMatrix 31、ListConfigFactoryMatrix 30、LogUtilMatrix 21、DeviceUtilMatrix 17）；
- **编译**：`entry@ohosTest` 构建 `BUILD SUCCESSFUL`，0 ArkTS 错误；
- **全量结果**：`Tests run: 158, Failure: 0, Error: 0, Pass: 158`（8 个套件）。

## 补充说明

- 设备侧用例全部为纯逻辑验证（联系人仓库、配置工厂、日志、设备档案），不依赖 UI 树，也不包含 UI 自动化用例；界面行为由上表中标为「否」的手工用例覆盖；
- 组合用例的期望值来自各实现类的 API 语义：`ContactStore` 的 id 单调不复用、`search` 的大小写不敏感与姓名 / 部门双字段匹配、`ListConfigFactory` 的 V1 / V2 字段一一映射、`LogUtil` 的 `[HH:mm:ss][级别][tag] 消息` 格式与级别门限、`DeviceUtil` 的 600 / 840vp 断点；
- 测试内未复制任何业务实现，避免出现“实现改了测试跟着改”的假阳性；
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 158 条设备侧用例为准；
- ComposeListItemV2、ComposeTitleBarV2 为 API 26 新增组件，低于 API 26 的设备上 V2 分区不可用，测试环境需使用 API 26 镜像；
- hilog tag 有 `ComposeListTitle`（LogUtil）与 `ComposeListAndTitle`（EntryAbility）两个，排查日志时使用 `grep ComposeList` 可同时覆盖。
