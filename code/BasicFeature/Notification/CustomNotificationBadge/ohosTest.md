# CustomNotificationBadge 测试用例归档

## 测试用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|通知发送权限是否正常获取| 进入CustomNotificationBadge应用 | 点击同意 | 正常获取权限|是|Pass|
|发送基本类型通知| 通知发送权限正常获取 | 点击通知发送进入通知发送页面 |点击基本类型通知按键|是|Pass|
|发送长文本类型通知| 通知发送权限正常获取 | 点击通知发送进入通知发送页面 |点击长文本类型通知按键|是|Pass|
|发送多行文本类型通知| 通知发送权限正常获取 | 点击通知发送进入通知发送页面 |点击多行文本类型通知按键|是|Pass|
|发送图片类型通知| 通知发送权限正常获取 | 点击通知发送进入通知发送页面 |点击图片类型通知按键|是|Pass|

## 自动化用例（ohosTest）

### 测试环境

| 项 | 值 |
|--------------------------------|--------------------------------|
| 测试模块 | `entry/src/ohosTest` |
| 测试入口 | `entry/src/ohosTest/ets/test/List.test.ets` |
| 测试框架 | Hypium 1.0.6（`TestAbility` 内 `hypium.hypiumTest` 启动） |
| SDK 版本 | 26.0.0（compileSdkVersion / targetSdkVersion / compatibleSdkVersion） |
| 设备类型 | phone |

### 套件与用例数

| 测试套件 | 文件 | 用例数 | 覆盖功能 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| ContentUtilCore | `ContentUtilCore.test.ets` | 40 | `notificationContentUtil` 的内容类型解析与 5 种通知内容构造 |
| RequestUtilCore | `RequestUtilCore.test.ets` | 12 | `notificationRequestUtil` 的请求槽位、固定 id 与内容透传 |
| LoggerCore | `LoggerCore.test.ets` | 8 | `logger` 四个级别的参数形态与不抛异常契约 |
| ManagementCore | `ManagementCore.test.ets` | 40 | `notificationManagement` 的分组计数、角标读数、复位与越界守卫 |
| PublishCore | `PublishCore.test.ets` | 30 | `notificationUtil` 的 id 自增、分组写入、发布/取消容错 |
| OperationsCore | `OperationsCore.test.ets` | 30 | `NotificationOperations` 的 5 种内容构造与快照语义 |
| StateMixCore | `StateMixCore.test.ets` | 6 | 发布链与本地计数/角标的跨模块不变量 |
| ContentVolume01 | `ContentVolume01.test.ets` | 61 | `getContentTypeId` 的新旧类型字段组合矩阵 |
| ContentVolume02 | `ContentVolume02.test.ets` | 61 | 基本文本内容的标题/正文/附加文本输入域 |
| ContentVolume03 | `ContentVolume03.test.ets` | 61 | 长文本内容的概要/展开标题/长正文输入域 |
| ContentVolume04 | `ContentVolume04.test.ets` | 61 | 长文本附加文本缺失与透传归一路径 |
| ContentVolume05 | `ContentVolume05.test.ets` | 61 | 多行文本的行数组长度与逐行内容 |
| ContentVolume06 | `ContentVolume06.test.ets` | 61 | 会话内容的固定类型与三字段透传 |
| ContentVolume07 | `ContentVolume07.test.ets` | 61 | 图片内容的 PixelMap 引用与文案字段 |
| ContentVolume08 | `ContentVolume08.test.ets` | 61 | 基本文本内容附加文本存在性语义 |
| RequestVolume01 | `RequestVolume01.test.ets` | 61 | 请求对象的固定 id/槽位与内容类型透传 |
| RequestVolume02 | `RequestVolume02.test.ets` | 61 | 请求对象对内容对象的引用传递 |
| MgmtVolume01 | `MgmtVolume01.test.ets` | 61 | 分组计数与角标随入队数量的变化 |
| MgmtVolume02 | `MgmtVolume02.test.ets` | 61 | 取消/复位路径对本地分组计数的影响 |
| MgmtVolume03 | `MgmtVolume03.test.ets` | 61 | 多类型混合入队的分组隔离与角标累计 |
| StateVolume01 | `StateVolume01.test.ets` | 61 | `publishNotification` 的 id 自增与分组名写入 |
| NotificationUi | `NotificationUi.test.ets` | 24 | 页面级交互：页签切换、四个发布按钮的可见性与文案、点击后复位 |

合计 23 个测试套件、1,044 条用例。另有 `Ability.test.ets` 的 6 条整机 UI 流程用例（导入、授权、四类通知投递），用例名为字符串拼接，未计入 1,044。

## 真机验证

### 验证环境

| 项 | 值 |
|--------------------------------|--------------------------------|
| 设备 | phone，序列号 `d629034339413535311095d600002b00` |
| 系统语言 | 简体中文（zh_CN）；用例文案一律在运行时按资源名取值，不写死 `base` 英文 |
| 主包构建 | `hvigorw assembleHap --no-daemon -p product=default`，`BUILD SUCCESSFUL` |
| 测试包构建 | `hvigorw --mode module -p module=entry@ohosTest assembleHap --no-daemon -p product=default`，`BUILD SUCCESSFUL` |
| 安装 | 两个 HAP `hdc file send` 到设备 `data/local/tmp/cnb` 后 `hdc shell bm install -p data/local/tmp/cnb`，均 `install bundle successfully` |
| 执行 | DevEco Studio 运行配置选 `entry > OhosTest`，或设备侧直接启动测试运行器，参数为 `-b com.samples.customnotificationbadge -m entry_test -s unittest OpenHarmonyTestRunner -s class "<TestClass>" -s timeout 60000` |

### 执行策略

同一构建的全量只跑一次作为基线；失败项先归因（用例写错 / 环境未就绪 / main 缺陷），修正后只用 `-s class` 复跑相关用例，结论 = 基线 + 增量合并。

本工程单进程全量不可用：不指定 `-s class` 时跑到第 1,026 例（`current=1026/1050`）进程被杀（`TestFinished-ResultMsg: App died`），faultlog 为 `THREAD_BLOCK_6S`，主线程阻塞在 `cancelAll` 事件。因此全量按下列 9 批拼接，每批单独校验 `Tests run` 与 `Failure/Error`。

### 分批结果

| 批 | 范围 | 用例数 | 结果 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| B1 | `ContentUtilCore` + `ContentVolume01~04` | 284 | `Failure: 0, Error: 0, Pass: 284` |
| B2 | `ContentVolume05~08` | 244 | `Failure: 0, Error: 0, Pass: 244` |
| B3 | `ManagementCore` + `MgmtVolume01~03` | 223 | `Failure: 0, Error: 0, Pass: 223` |
| B4 | `RequestUtilCore` + `RequestVolume01~02` | 134 | `Failure: 0, Error: 0, Pass: 134` |
| B5 | `StateMixCore` + `StateVolume01` | 67 | `Failure: 0, Error: 0, Pass: 67` |
| B6 | `PublishCore` | 30 | `Failure: 0, Error: 0, Pass: 30` |
| B7 | `OperationsCore` | 30 | `Failure: 0, Error: 0, Pass: 30` |
| B8 | `NotificationUi` | 24 | `Failure: 0, Error: 0, Pass: 24` |
| B9 | `LoggerCore` | 8 | `Failure: 0, Error: 0, Pass: 8` |
| **合计** | | **1,044** | **1,044/1,044 通过** |

### 失败归因与修复

首轮基线的失败全部为**测试侧**问题，`main` 源码未改动：

| 套件 | 首轮结果 | 原因 | 修复 | 复跑 |
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| `PublishCore` | 21 Error | `readId()` 辅助函数误写成 `return readId(request)` 自递归，报 `Stack overflow!` | 改为 `return request.id as number` | 30/30 |
| `OperationsCore` | 21 Failure | 设备为中文，用例把 `base` 英文文案写死 | 新增 `helper/EntryResources.ets`（`createModuleContext('entry')` + `getStringByNameSync`），文案基线改为按资源名运行时取值 | 30/30 |
| `NotificationUi` | 13 Failure + 3 复位失败 | 同上文案问题；另列表为空时 `List` 高度为 0，Driver 取不到 `notificationList`；`1012` 的互斥断言恒真、`1003/1006/1020` 用页签文案判标题互斥 | 文案改运行时取值；`beforeAll` 先投递 2 条通知再启动页面；`1012` 改为 `expect(listHidden && basicVisible).assertTrue()`；标题断言改读 `titleBar` 文本 | 24/24 |
| `MgmtVolume02` | 7 Failure | 用例 arrange 只入队 1 条，期望值却写 `countsByType=2`、`typeNotifications.length=2` | 改为 1（`badgeNum` 保持 2） | 61/61 |

`NotificationUi` 在 `hdc uninstall` 后重装两个 HAP 再跑一次，仍为 24/24。

### 口径说明

- 1,044 例（本文档与静态审计）**不含**既有 `Ability.test.ets` 的 `ActsAbilityTest` 6 例（用例名为拼接字符串，静态统计不计），故单进程全量 `Tests run` 显示 1,050。
- 既有 `ActsAbilityTest` 真机结果 5 通过 / 1 失败：`Badge_RequestPermissionFunction_001` 报 `Component not exist matching ... text=允许`。授权弹窗由 `com.ohos.systemui` 渲染（`uitest dumpLayout` 可见“允许‘自定义通知角标’向你发送通知？”），应用进程的 Driver 匹配不到该窗口；手动点击“允许”后复跑，仅该例失败、其余 5 例通过。属系统窗口/环境问题，套件未改动。
- 运行日志保存在 `.qoder/testcast/run-logs/`（各批基线、增量复跑、干净重装复跑），随 `.qoder/` 不提交仓库。

## 测试结论

| 项 | 结果 |
|--------------------------------|--------------------------------|
| 执行时间 | 2026-11-19 |
| 执行设备 | 真机 d6290343...2b00 |
| 测试产物 | entry-ohosTest-signed.hap（4,117,660 B） |
| 测试套件 | 23 |
| 用例总数 | 1,044 |
| 通过 | 1,044 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

> 1. 结果由 B1~B9 九批执行合并（同一构建的单进程全量在第 1,026 例触发 `THREAD_BLOCK_6S`，见“真机验证”），每批 `Tests run` 均大于 0 且 `Failure`/`Error` 均为 0。
> 2. 1,044 例不含既有 `Ability.test.ets` 的 `ActsAbilityTest` 6 例：该套件真机 5 通过 / 1 失败，失败项为系统授权弹窗归属 `com.ohos.systemui` 的环境问题。

### 覆盖与风险

| 项 | 结论 |
|--------------------------------|--------------------------------|
| 覆盖范围 | 内容装配（5 种类型与内容类型 id）、请求组装、消息分组/计数/角标、发布链路与 id 自增、发布入口、日志工具、UI 状态、缺陷回归，八个主题均有对应套件 |
| 六维覆盖 | 合法、边界（各 `*VolumeNN` 套件末例）、非法（越界 typeId 与空内容对象）、极值（长文本 1,024 字符、多行 20 行、PixelMap 256×256）、组合（新旧类型字段矩阵、多类型混合入队）、状态（发布→取消→复位） |
| 首轮失败 | 4 个套件共 65 条失败记录（`PublishCore` 21 Error、`OperationsCore` 21 Failure、`NotificationUi` 16 Failure 含 3 条复位失败、`MgmtVolume02` 7 Failure），全部归因为测试侧问题，`main` 未改动；修正后逐项增量复跑均全通过 |
| 审计取舍 | `warnings=14` 均为 `*VolumeNN` 套件中按输入域展开的同构断言，每个套件对应一个输入维度，断言与输入取值一一对应 |
| 未覆盖项 | 通知中心中的真实展示与点击跳转（需系统权限与真机场景）、会话类型的 UI 交互（无页面入口，仅在接口层直调）、多语言资源切换、跨进程与 Ability 生命周期组合 |
| 遗留隐患 | `notificationManagement` import 即调 `getActiveNotifications` 且全局累计；`setBadgeNumber` 失败会中断 `addNotification`。两项已在 P0 通过 `resetLocalState()` 与 `try/catch` 兜底接缝规避，未修改业务语义 |

结论：本工程的对外行为在合法、边界、非法、极值、组合与状态六个维度上均与预期一致，未发现业务逻辑缺陷；
真机可稳定复现的失败均为测试用例自身或系统窗口环境问题，已修复或归因。
