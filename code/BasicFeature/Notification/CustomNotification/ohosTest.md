|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|Pass|
|是否允许发送通知功能测试|	位于主页|	点击允许|	允许发送通知|Pass|
|基本类型通知功能测试|	位于主页|	点击基本类型通知按钮|	下拉状态栏，在通知栏可以看到基本类型的通知|Pass|
|长文本类型通知功能测试|	位于主页|	点击长文本类型通知按钮|	下拉状态栏，在通知栏可以看到长文本类型的通知|Pass|
|多行文本类型通知功能测试|	位于主页|	点击多行文本类型通知按钮|	下拉状态栏，在通知栏可以看到多行文本类型的通知|Pass|
|图片类型通知功能测试|	位于主页|	点击图片类型通知按钮|	下拉状态栏，在通知栏可以看到图片类型的通知|Pass|
|带按钮的通知功能测试|	位于主页|	点击带按钮的通知按钮|	下拉状态栏，在通知栏可以看到带按钮的通知|Pass|
|点击可跳转的通知功能测试|	位于主页|	点击可跳转的通知按钮|	下拉状态栏，在通知栏可以看到点击可跳转的通知|Pass|
|取消所有通知功能测试|	位于主页|	点击取消所有通知按钮|	可以取消本应用发布的所有通知|Pass|


## 自动化用例（ohosTest）

### 测试环境

| 项 | 值 |
|---|---|
| 工程 | `CustomNotification`，bundleName `ohos.samples.customnotification`，主 Ability `MainAbility` |
| 编译 SDK | 26.0.0（`DEVECO_SDK_HOME` 指向 DevEco Studio 26 内置 SDK） |
| 测试框架 | Hypium 1.0.6（`hypium.hypiumTest` 入口 `entry/src/ohosTest/ets/test/List.test.ets`） |
| 运行器 | `OpenHarmonyTestRunner`（`entry/src/ohosTest/module.json5` 已声明 `testRunner`） |
| 构建结果 | DevEco Studio 编译 `entry@ohosTest` 生成测试 HAP，构建成功 |
| 用例规模 | 注册 31 个测试套件、565 条用例，元数据编号与工程目录一致 |
| 真机执行 | 已完成，设备 `d6290343…2b00`，整体结果见下方「测试结果」 |

### 测试结果

同一构建产物单次全量执行的整体结果（按套件连续执行）：

| 项 | 结果 |
|---|---|
| 执行时间 | 2026-11-19 |
| 执行设备 | 真机 `d6290343…2b00` |
| 测试产物 | `entry-ohosTest.hap`（2,703,497 B），配套主 HAP `entry-default.hap`（313,553 B） |
| 执行方式 | 真机上先安装主 HAP 与测试 HAP，再按下方「运行方式」中的应用包名与运行器路径启动测试运行器，单次全量执行 |
| 测试套件 | 31 |
| 用例总数 | 565 |
| 通过 | 565 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过 |

结果依据：执行输出中 `OHOS_REPORT_RESULT: stream=Tests run: 565, Failure: 0, Error: 0, Pass: 565`；失败标记 `OHOS_REPORT_STATUS_CODE: -2` 出现 0 次；31 个套件各有一段 `OHOS_REPORT_SUM`，逐条通过计数之和为 565，与套件登记数一致。

### 套件与用例结果

| 套件 | 号段 | 用例数 | 通过 | 失败 |
|---|---|---|---|---|
| `ContentUtilCore` | `SUB_CustomNotification_CONTENT_0001~0030` | 30 | 30 | 0 |
| `RequestUtilCore` | `SUB_CustomNotification_REQUEST_0001~0024` | 24 | 24 | 0 |
| `ManagementCore` | `SUB_CustomNotification_MGMT_0001~0040` | 40 | 40 | 0 |
| `ManagementExtended` | `SUB_CustomNotification_MGMT_0041~0070` | 30 | 30 | 0 |
| `NotificationStateCore` | `SUB_CustomNotification_STATE_0001~0028` | 28 | 28 | 0 |
| `WantAgentCore` | `SUB_CustomNotification_WANTAGENT_0001~0024` | 24 | 24 | 0 |
| `MainDefectRegression` | `SUB_CustomNotification_DEFECT_0001~0021` | 21 | 21 | 0 |
| `OperationsCore` | `SUB_CustomNotification_OPERATIONS_0001~0028` | 28 | 28 | 0 |
| `OperationsVolume01` | `SUB_CustomNotification_VOPERATIONS_0001~0016` | 16 | 16 | 0 |
| `OperationsReal01` | `SUB_CustomNotification_VOPERATIONS_REAL_0001~0005` | 5 | 5 | 0 |
| `PublishChainCore` | `SUB_CustomNotification_PUBLISH_0001~0012` | 12 | 12 | 0 |
| `PublishVolume01` | `SUB_CustomNotification_VPUBLISH_0001~0016` | 16 | 16 | 0 |
| `PublishReal01` | `SUB_CustomNotification_VPUBLISH_REAL_0001~0005` | 5 | 5 | 0 |
| `ContentVolume01` | `SUB_CustomNotification_VCONTENT_0001~0049` | 49 | 49 | 0 |
| `ContentReal01` | `SUB_CustomNotification_VCONTENT_REAL_0001~0005` | 5 | 5 | 0 |
| `RequestVolume01` | `SUB_CustomNotification_VREQUEST_0001~0031` | 31 | 31 | 0 |
| `RequestReal01` | `SUB_CustomNotification_VREQUEST_REAL_0001~0005` | 5 | 5 | 0 |
| `MgmtVolume01` | `SUB_CustomNotification_VMGMT_0001~0048` | 48 | 48 | 0 |
| `MgmtReal01` | `SUB_CustomNotification_VMGMT_REAL_0001~0005` | 5 | 5 | 0 |
| `CancelIdVolume01` | `SUB_CustomNotification_VCANCEL_0001~0020` | 20 | 20 | 0 |
| `CancelIdReal01` | `SUB_CustomNotification_VCANCEL_REAL_0001~0005` | 5 | 5 | 0 |
| `ToggleSeqVolume01` | `SUB_CustomNotification_VTOGGLE_0001~0024` | 24 | 24 | 0 |
| `ToggleSeqReal01` | `SUB_CustomNotification_VTOGGLE_REAL_0001~0005` | 5 | 5 | 0 |
| `MgmtMixVolume01` | `SUB_CustomNotification_VMGTMIX_0001~0016` | 16 | 16 | 0 |
| `MgmtMixReal01` | `SUB_CustomNotification_VMGTMIX_REAL_0001~0005` | 5 | 5 | 0 |
| `PublishSeqVolume01` | `SUB_CustomNotification_VPUBSEQ_0001~0016` | 16 | 16 | 0 |
| `PublishSeqReal01` | `SUB_CustomNotification_VPUBSEQ_REAL_0001~0004` | 4 | 4 | 0 |
| `PubCancelBalVolume01` | `SUB_CustomNotification_VPUBBAL_0001~0016` | 16 | 16 | 0 |
| `PubCancelBalReal01` | `SUB_CustomNotification_VPUBBAL_REAL_0001~0004` | 4 | 4 | 0 |
| `NotificationUi` | `SUB_CustomNotification_UI_1001~1020` | 20 | 20 | 0 |
| `NotificationUiState` | `SUB_CustomNotification_UI_1021~1028` | 8 | 8 | 0 |
| **合计** | - | **565** | **565** | **0** |

合计：31 个测试套件，565 条用例，全部通过。套件覆盖内容装配、请求组装、管理工具、发布链路、发布入口、WantAgent、界面状态与缺陷回归八类行为。

### 运行方式

在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行，或在真机上按上表参数直接启动测试运行器；配置项与测试参数一一对应：

| 配置项 | 取值 | 对应选项 |
|---|---|---|
| 应用包名 | `ohos.samples.customnotification` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器路径 | `/ets/TestRunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单例超时（毫秒） | `120000` | `-s timeout` |

按套件或单例分批执行时，在上述运行配置中追加过滤项：套件过滤用 `-s class <套件名>`，单例过滤用 `-s class <套件名>#<用例名>`。

`OpenHarmonyTestRunner` 已透传 `-s class / -s notClass / -s suite / -s it / -s level / -s testType / -s size / -s timeout / -s dryRun`，可直接按套件或单例分批执行。
