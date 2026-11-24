# SmsService_SendSMS 短信发送自动化测试

## 测试范围

本工程使用 ArkTS 和 Hypium 1.0.24，在 `entry_test` 模块中运行 `ohosTest`。测试入口 `List.test.ets` 注册了 **40 个套件、595 条用例**。`SmsSender_Test` 包含 14 条短信发送用例，`SmsTrace/` 新增 13 个发送时序和草稿快照套件，共 245 条用例。`SmsAdvancedScenarios_Test` 的 21 条用例中包含 7 条补充参数用例。[套件注册入口](entry/src/ohosTest/ets/test/List.test.ets)

`SmsSender_Test` 和 `SmsTrace/` 调用发送按钮实际使用的 `sendTextSms`，通过注入的模拟传输层记录请求参数，并按指定顺序触发请求完成、发送和送达回调。断言覆盖应用侧请求组装、回调绑定及载荷传递。真实短信发送、运营商送达和页面交互需另行验证。[发送套件源码](entry/src/ohosTest/ets/test/SmsService/SmsSender.test.ets)

`IndexTest` 点击界面用例已移除。`SmsDialogUI_Test`、`SmsDialogEndToEnd_Test`、`SmsAccessibilityNavigation_Test` 等保留了历史套件名，现有用例覆盖的是测试辅助函数的参数校验。`ActsAbilityTest` 用一条字符串断言检查 Hypium 能否执行用例。

| 测试源码 | 套件数 | 用例数 | 验证范围 |
| --- | ---: | ---: | --- |
| `Ability.test.ets` | 1 | 1 | Hypium 字符串断言 |
| `Integration/` | 1 | 21 | 卡槽、正文长度、端口与号码格式的边界和组合 |
| `Interaction/` | 1 | 34 | 参数组合、正文长度与号码格式 |
| `SmsService/` | 16 | 160 | 参数校验及 `SmsSender_Test` 的短信发送请求与回调 |
| `SmsValidation/` | 8 | 134 | 参数边界、组合输入与格式校验 |
| `SmsTrace/` | 13 | 245 | 发送时序、不同请求的回调归属、回调重新绑定及草稿快照 |
| **合计** | **40** | **595** | |

## 用例表

下表列出框架与参数校验的代表场景，以及 `SmsSender_Test` 的全部 14 个场景。参数边界来自 `SharedSmsDriver.ets` 中的辅助函数，正文按字符串 `length` 计数。各表中的 `Pass` 对应本页的[全量真机复测](#验证结果)。[参数校验源码](entry/src/ohosTest/ets/test/Shared/SharedSmsDriver.ets)

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| Hypium 基础断言 | `ActsAbilityTest` 已注册 | 在 `abc` 中查找 `b` | 字符串包含断言通过 | Yes | Pass |
| 卡槽、正文和端口边界 | 使用测试辅助函数 `validateSmsParameters` | 卡槽 `0–2`、正文长度边界 `140`、端口 `0–65535` 及越界值 | 范围内的合法组合返回 `true`，任一字段越界的组合返回 `false` | Yes | Pass |
| 号码格式 | 使用测试辅助函数 `validatePhoneNumber` | `+861` 后接 10 位数字的号码，以及长度或格式不符的号码 | 匹配规则时返回 `true`，格式不符时返回 `false` | Yes | Pass |
| 请求字段映射与单次提交 | 注入模拟传输层 | 卡槽、收件号码、短信中心号码、正文及端口 | 传输层恰好收到一次请求，五个字段均与输入一致 | Yes | Pass |
| Unicode 和多行正文保真 | 注入模拟传输层 | 含中文、换行、表情及首尾空格的正文 | 传输层收到的正文与原文完全一致 | Yes | Pass |
| 已提交请求的快照 | 已提交第一次请求 | 修改收件号码与正文后再次提交 | 第一次请求保留原值，第二次请求使用更新后的值 | Yes | Pass |
| 请求受理与发送、送达分离 | 已提交请求 | 模拟请求完成回调成功 | 只记录请求完成，发送和送达结果均为空 | Yes | Pass |
| 权限拒绝 | 已提交请求 | 模拟请求完成回调返回错误码 `201` | 完成回调保留错误码和消息，发送和送达结果均为空 | Yes | Pass |
| 分段发送回调 | 已提交请求 | 依次模拟普通分段和末段的发送结果 | 收到两个发送结果，顺序、结果 URL 和末段标记均与输入一致 | Yes | Pass |
| 射频关闭的发送失败 | 模拟请求受理成功 | 发送结果为 `SEND_SMS_FAILURE_RADIO_OFF` | 发送回调保留射频关闭结果，送达结果为空 | Yes | Pass |
| 送达报告字节顺序 | 已提交请求 | 模拟包含 `0x00`、`0x80`、`0xFF` 等字节的 PDU | 送达回调中的 PDU 保持原字节值及顺序 | Yes | Pass |
| 发送成功后送达失败 | 已提交请求 | 先回传发送成功，再回传送达错误 | 发送成功结果仍可读取，送达回调记录错误且报告为空 | Yes | Pass |
| 交叠请求的回调隔离 | 两个请求各自绑定回调 | 交错触发完成、发送及送达回调 | 各请求只收到属于自己的事件 | Yes | Pass |
| 空短信中心和零端口透传 | 注入模拟传输层 | 卡槽 `0`、空短信中心、端口 `0` | 只提交一次，并保留这三个显式值 | Yes | Pass |
| 同步传输异常 | 注入会同步抛错的传输层 | 提交时抛出模拟参数异常 | 调用方捕获原异常对象，传输层只尝试一次，三种回调均未触发 | Yes | Pass |
| 复用回调配置 | 第一次请求使用共享回调配置 | 替换共享配置中的处理函数，再提交第二次请求 | 已提交请求仍使用旧处理函数，新请求使用新的处理函数 | Yes | Pass |
| 完成回调内再次提交 | 模拟传输层在提交调用返回前触发完成回调 | 在回调内发起后续提交 | 后续请求在第一次传输调用返回前提交，两个完成回调各执行一次 | Yes | Pass |

### 补充参数用例

从旧用例中选取卡槽、端口、正文及号码格式场景，补充组合边界和成对断言。这 7 条用例验证测试辅助函数的行为。[用例源码](entry/src/ohosTest/ets/test/Integration/SmsAdvancedScenarios.test.ets#L289)

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 多个字段同时达到上限 | 使用 `validateSmsParameters` | 卡槽、正文长度和端口同时达到上限，逐项单独越界 | 三项都在范围内时接受，任一项越界时拒绝 | Yes | Pass |
| 部分修复无效输入 | 卡槽和端口均低于下限 | 分别修复一项，再修复两项 | 两项均修复后接受 | Yes | Pass |
| 空正文与零端口 | 使用 `validateSmsParameters` | 空正文分别搭配端口 `0` 和默认端口 | 两个组合均接受 | Yes | Pass |
| 表情在正文边界的长度 | 使用 `validateSmsContentLength` | 139 个 ASCII 字符后分别追加 ASCII 字符与表情 | ASCII 组合满足上限，表情组合超过上限 | Yes | Pass |
| 末尾空白计入正文长度 | 使用 `validateSmsContentLength` | 正文以空格结尾且恰达上限，再追加换行 | 追加换行后超过上限 | Yes | Pass |
| 同一号码的两种前缀 | 使用 `validatePhoneNumber` | 相同号码分别拼接 `+86` 和 `0086` | 接受 `+86` 格式，拒绝 `0086` 格式 | Yes | Pass |
| 全角数字 | 使用 `validatePhoneNumber` | 将合法号码的末位 ASCII `0` 替换为全角 `０` | 接受原号码，拒绝含全角数字的号码 | Yes | Pass |

### 新增发送时序和草稿快照用例

时序用例把两条请求按不同顺序交叠执行，逐步断言提交顺序、请求字段、当前步骤收到的回调及载荷。草稿快照用例提交同一份草稿两次，在两次提交之间编辑字段，断言两个请求对象彼此独立且各自保留提交时的值。[新增套件](entry/src/ohosTest/ets/test/SmsTrace/) · [模拟传输与断言](entry/src/ohosTest/ets/test/Shared/SmsSendTrace.ets)

| 测试功能 | 套件数 | 用例数 | 预置条件 | 代表输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | ---: | ---: | --- | --- | --- | --- | --- |
| 两个成功请求交叠 | 2 | 68 | 两个请求使用独立回调 | 第一条请求已收到发送成功，随后提交第二条请求，再分别返回带不同 PDU 的送达报告 | 提交顺序正确，各请求分别收到自己的受理、发送和送达结果，PDU 不串线 | Yes | Pass |
| 分段发送与服务不可用交叠 | 2 | 54 | 两个请求已进入交叠流程 | 第一条收到普通分段、末段和送达报告，第二条收到服务不可用结果 | 第一条保留各分段的顺序、URL 和末段标志，第二条记录发送失败且没有送达事件 | Yes | Pass |
| 权限拒绝与成功发送交叠 | 2 | 13 | 两个请求分别提交 | 第一条的完成回调返回 `201`，第二条正常受理、发送和送达 | 第一条只记录权限拒绝，第二条收到完整的成功回调 | Yes | Pass |
| 送达失败与射频关闭交叠 | 2 | 33 | 第一条已发送成功，第二条已提交 | 第一条送达回调返回 `8300002`，第二条发送回调返回射频关闭结果 | 第一条保留发送成功与送达错误，送达报告为空，第二条保留自己的发送失败结果 | Yes | Pass |
| 回调重新绑定 | 3 | 41 | 第一条请求使用可复用的回调配置完成提交 | 在首条请求收到回调前、受理后或发送后替换处理函数，再提交第二条请求 | 已提交请求保留原绑定，后提交请求使用替换后的处理函数，未替换的函数保持原绑定 | Yes | Pass |
| 单请求回调乱序 | 1 | 5 | 一个请求已提交 | 依次注入受理、送达、发送三个事件 | 应用按照实际收到的顺序传递事件，回调类型和载荷保持一致 | Yes | Pass |
| 草稿快照 | 1 | 31 | 同一份草稿用于两次提交 | 编辑卡槽、收件号码、短信中心、正文、端口的 31 种非空字段组合 | 两次提交产生独立对象，首条保存原值，第二条保存编辑后的值，未编辑字段保持原值 | Yes | Pass |
| **合计** | **13** | **245** | | | | | |

#### 套件索引

点击下列套件名可查看对应的测试文件。交叠场景中的 `PrimaryFirst` 和 `SecondaryFirst` 表示哪条请求先提交，回调顺序由各用例独立编排。

| 套件名 | 用例数 |
| --- | ---: |
| [`SmsSuccessfulOverlapPrimaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsSuccessfulOverlapPrimaryFirst.test.ets) | 34 |
| [`SmsSuccessfulOverlapSecondaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsSuccessfulOverlapSecondaryFirst.test.ets) | 34 |
| [`SmsMultipartOverlapPrimaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsMultipartOverlapPrimaryFirst.test.ets) | 34 |
| [`SmsMultipartOverlapSecondaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsMultipartOverlapSecondaryFirst.test.ets) | 20 |
| [`SmsPermissionOverlapPrimaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsPermissionOverlapPrimaryFirst.test.ets) | 4 |
| [`SmsPermissionOverlapSecondaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsPermissionOverlapSecondaryFirst.test.ets) | 9 |
| [`SmsDeliveryFailureOverlapPrimaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsDeliveryFailureOverlapPrimaryFirst.test.ets) | 19 |
| [`SmsDeliveryFailureOverlapSecondaryFirst_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsDeliveryFailureOverlapSecondaryFirst.test.ets) | 14 |
| [`SmsRebindBeforePrimaryCallbacks_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsRebindBeforePrimaryCallbacks.test.ets) | 13 |
| [`SmsRebindAfterPrimaryAccepted_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsRebindAfterPrimaryAccepted.test.ets) | 14 |
| [`SmsRebindAfterPrimarySent_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsRebindAfterPrimarySent.test.ets) | 14 |
| [`SmsOutOfOrderCallbacks_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsOutOfOrderCallbacks.test.ets) | 5 |
| [`SmsDraftSnapshots_Test`](entry/src/ohosTest/ets/test/SmsTrace/SmsDraftSnapshots.test.ets) | 31 |

维护生成用例时，可在包含场景生成脚本的工作区执行 `python tools/generate_sms_trace_tests.py --check`，核对生成源码和注册入口。

## 运行方法

完整复测需要应用侧的 `entry/src/main/ets/service/SmsSender.ets`，以及与设备匹配的测试模块配置、资源和签名。`SmsSender_Test` 和 `SmsTrace/` 通过相对路径导入此发送实现。仅检出本次测试源码时，需先准备这些依赖再构建。

1. 在 DevEco Studio 中打开 `SmsService_SendSMS`，使用工程配置的 API 20 SDK，同步依赖并配置签名。连接兼容的设备或模拟器，确认 `hdc list targets` 可以列出目标，并保持屏幕解锁。
2. 在 DevEco Studio 中选择目标设备。运行 Instrument Test 时，构建并安装带签名的 `entry@default` 主包和 `entry@ohosTest` 测试包。
3. 根据范围运行测试。
   - 全量测试。在工程树中右键 `entry/src/ohosTest/ets/test`，选择 **Run 'test' with Coverage**，执行全部套件并生成覆盖率报告。
   - 指定套件。打开 [`SmsSender.test.ets`](entry/src/ohosTest/ets/test/SmsService/SmsSender.test.ets) 或 [`SmsOutOfOrderCallbacks.test.ets`](entry/src/ohosTest/ets/test/SmsTrace/SmsOutOfOrderCallbacks.test.ets)，点击对应 `describe` 左侧的运行图标。可通过[套件索引](#套件索引)定位所需的测试文件。

## 验证结果

2026 年 11 月 20 日，在 OpenHarmony 3.2 真机上开启覆盖率采集，运行 AppFreeze 修复后的全部套件。下表记录使用完整复测工程构建的独立签名包的结果。

| 运行范围 | 包名 | 执行 | 通过 | 失败 | 错误 | 跳过 | 耗时 |
| --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| 全量真机复测 | `com.samples.SmsService_Web.freezefix20261120` | 595 | 595 | 0 | 0 | 0 | 约 72 秒（含命令启动及等待结果的时间） |

本次运行的 `TestFinished-ResultCode` 为 `0`，已输出覆盖率数据，复测前后设备的 AppFreeze 文件清单一致。原包名 `com.samples.SmsService_Web` 重装时返回签名不一致错误 `9568332`，真机结果对应上表的独立包。

原始证据保存在复测工作区 `applications_app_samples_Telephony_Kit333` 的 `test-adaptation/appfreeze-fix/` 下。独立包的测试日志末尾记录覆盖率输出和结果汇总，对应的状态文件记录命令耗时，`device-isolated-before.txt` 与 `device-isolated-after.txt` 记录设备故障文件清单，`install-retry.txt` 记录原包名重装结果。

## 常见运行问题

| 错误码 | 检查项 |
| --- | --- |
| `00304065` | 检查 `entry/src/ohosTest/resources/base/profile/test_pages.json` 是否存在，并核对测试模块的 `pages` 配置为 `$profile:test_pages`。 |
| `00401004` | 核对设备 API 版本与工程配置，并检查主模块和测试模块 `syscap.json` 声明的能力与设备实际能力是否匹配。 |
| `00508013` | 确认设备已解锁，主包和测试包均已安装，并检查 `TestAbility` 的启动日志。复测工程在前台回调返回后调度 Hypium 注册，以减少套件注册对启动流程的阻塞。 |
| `AppFreeze` / `THREAD_BLOCK_6S` | 旧版本在执行到第 264 条用例时触发主线程阻塞。修复后的 13 个时序套件在每个用例结束后通过 `afterEach` 等待 10 ms 定时器，让主线程有机会处理系统事件。[调度辅助函数](entry/src/ohosTest/ets/test/Shared/TestScheduling.ets) |
| `9568332` | 检查设备中已安装的应用与本次构建的签名是否一致。本文记录的全量复测使用独立包名和对应签名。 |
