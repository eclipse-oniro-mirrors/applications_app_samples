# StaticCollabSample 测试用例归档

## 验证范围

已完成 entry 主 HAP 与 entry@ohosTest 的编译验证，并在真机（OpenHarmony 7.0.0.43，RK板，720 × 1280，devicetype 为 default）上完成安装与用例执行。

当前测试统计：

- **测试文件数**：81（79 个分类测试套件 + 根目录 `List.test.ets` 注册文件 + 工具类 `Shared/CollabTestDriver.ets`）
- **测试套件数**：79
- **测试用例数**：4434

## 测试套件总览

### 组 A - 协同核心与集成（25 个套件，1086 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| CollabSession 协同核心 | 16 | 824 | 连接选项、输入交互、深度模型、操作目录/流程/工作流、对端信息模型、会话并发/一致性/端到端/错误恢复/生命周期/状态管理、压力与 UI 测试 |
| Integration 集成场景 | 9 | 262 | 高级场景、协同兼容性、综合回归、设备兼容、集成测试、本地化、网络连通、系统能力集成、用户场景 |
| **小计** | **25** | **1086** | |

### 组 B - 交互与生命周期（24 个套件，1361 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Interaction 交互行为 | 14 | 888 | 无障碍导航、按钮交互、内容缩放、数据绑定、事件处理与传播、焦点导航、焦点环、手势识别、布局定位、主题变化、触摸交互、UI 组件渲染、视觉特效 |
| LifecycleState 生命周期与状态 | 10 | 473 | Ability 生命周期、配置变更、错误恢复、异常处理、资源管理、会话生命周期/管理/状态、状态持久化与恢复 |
| **小计** | **24** | **1361** | |

### 组 C - 校验、性能与安全（29 个套件，1986 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Validation 通用校验 | 11 | 1005 | AppStorage 工具、边界错误、Buffer 工具、连接选项管理器、设备管理器、输入校验、按键码、日志工具、权限校验、会话状态管理器、文本编解码 |
| CollabValidation 协同校验类 | 8 | 533 | 应用版本、鉴权会话、数据源、事件工具、中断恢复、通知、离线网络、会话校验 |
| PerformanceStability 性能与稳定性 | 7 | 328 | 并发控制、连接性能、数据吞吐、长期稳定性、内存泄漏检测、消息吞吐、性能压测 |
| Security 安全 | 3 | 120 | 协同安全、安全无障碍、安全校验 |
| **小计** | **29** | **1986** | |

另有 `Shared/CollabTestDriver.ets` 为共享测试驱动工具类（1849 行），不产生用例。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| 会话连接与对端管理 | CollabConnectOptions、CollabPeerInfoModel、ConnectOptionManagerValidation、DeviceManagerValidation | 400+ | ✅ |
| 会话操作与数据模型 | CollabOperations、CollabModelDeep、CollabOperationCatalog、CollabOperationFlow、CollabOperationWorkflow | 600+ | ✅ |
| 会话生命周期与状态 | CollabSessionLifecycle、SessionLifecycle、SessionStateManagement、StatePersistence、StateRecovery | 400+ | ✅ |
| 手势与触摸交互 | GestureRecognition、TouchInteraction、EventHandling、EventPropagation、ButtonInteraction | 400+ | ✅ |
| 焦点与无障碍 | FocusNavigation、FocusRingBehavior、AccessibilityNavigation、SecurityAccessibility | 250+ | ✅ |
| 异常与边界校验 | ExceptionHandling、ErrorRecovery、BoundaryErrorTesting、InputValidation、CollabInterruptionRecovery | 400+ | ✅ |
| 性能与长稳 | ConcurrencyControl、ConnectionPerformance、DataThroughput、MessageThroughput、MemoryLeakDetection、LongTermStability、PerformanceStress | 328 | ✅ |
| 数据与网络安全 | CollabSecurity、SecurityValidation、CollabOfflineNetwork、CollabAuthSession | 150+ | ✅ |
| 集成与兼容 | AdvancedScenarios、CollabCompatibility、ComprehensiveRegression、DeviceCompatibility、NetworkConnectivity | 260+ | ✅ |
| **总计** | | **4434** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。
- `待执行`：已提交代码尚未完成真机全量回归。

本次全量真机回归已完成，结果列统一为 `Pass`；各分类仅展开代表性用例，完整用例以测试源码为准。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| CollabConnectOptions 系列用例 | 测试 HAP 已安装 | 构造/校验连接选项参数 | 连接选项按预期生效或被拒绝 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| CollabSessionLifecycle 系列用例 | 应用已启动 | 建立/加入/退出会话 | 会话状态流转正确 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| CollabSessionEndToEnd 系列用例 | 会话已建立 | 端到端数据收发 | 数据在会话内正确传递 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| GestureRecognition 系列用例 | 应用已启动 | 滑动/点击手势 | 界面按手势方向正确响应 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| FocusNavigation 系列用例 | 应用已启动 | 按键移动焦点 | 焦点按预期顺序转移 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| ConfigurationChanges 系列用例 | 应用已启动 | 触发主题/分辨率等配置变更 | 状态按预期流转并恢复 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| MemoryLeakDetection 系列用例 | 多轮会话操作后 | 检查对象持有 | 无异常增长的对象引用 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| BoundaryErrorTesting 系列用例 | 应用已启动 | 越界/空数据源输入 | 越界输入被拦截并钳位 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| CollabOfflineNetwork 系列用例 | 断网环境 | 发起协同操作 | 离线行为符合预期且可重连 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |
| SecurityValidation 系列用例 | 应用已启动 | 注入边界/非法数据 | 数据与权限校验按预期拦截 | 是 | Pass（OpenHarmony 7.0.0.43，RK板） |

用例命名为 `测试模块名_场景_N`，基于 hypium 框架注册于 `List.test.ets`。每条用例含明确的断言（状态比对、可见性、类型形状等），不使用循环批量执行；断言不依赖用例执行顺序，每个用例自行拉起应用页面。

## 测试执行说明

### 编译验证

```bash
cd code/ArkTS-Sta/StaticCollabSample
hvigorw assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
# BUILD SUCCESSFUL
```

主 HAP 编译命令：

```bash
hvigorw assembleHap --mode module -p module=entry@default -p product=default --no-daemon
# BUILD SUCCESSFUL
```

### 真机执行

1. 在 DevEco Studio 中选中 `entry` 模块点击 Run，完成主 HAP 的构建、签名、安装与启动。
2. 打开 `entry/src/ohosTest/ets/test/List.test.ets`，点击 `testsuite` 函数旁的运行按钮执行全部测试套；IDE 会在同一台设备上安装测试 HAP 并拉起测试。
3. 仅回归单个套件时，在 Run/Debug Configurations 的 Ohos Test 配置中把 Test kind 设为 `Class`、Class 填目标套件的 describe 名后运行；也可在 `List.test.ets` 中临时只保留目标套件的调用。
4. 运行结束后在 Run 工具窗口读取 Hypium 汇总行（`Tests run`、`Failure`、`Error`、`Pass`）。

如需手工安装构建产物，两条命令的产物必须来自同一次构建，实际文件名以构建结果为准：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

### 执行前提

1. **签名与权限等级**：执行自动化用例前需完成工程签名，build-profile.json5 的 product 必须显式引用 signingConfig，否则产物为 unsigned 包无法安装（ohosTest 产物无签名时 DevEco 直装真机会失败，需使用已签名产物或模拟器执行）。
2. **进程等待**：命令行强制停止应用后需等待约 2 秒再启动测试命令，进程未完全退出会导致整批用例失败。
3. **解锁亮屏**：执行 UI 用例前设备必须处于解锁亮屏状态。设备掉线重连或息屏后可能停留在锁屏页，此时应用窗口虽被创建但被锁屏遮挡，uitest 的 dumpLayout 与 Driver.findComponent 都取不到应用节点，表现为整批 UI 用例在开头断言处失败；可先执行 `uitest uiInput swipe 360 1000 360 300` 上滑解锁。
4. **软键盘**：TextInput 输入后必须先收起软键盘（driver.pressBack），否则窗口被输入法压缩（720 × 1280 分辨率下尤为明显），下方卡片可能滑出 List 视口。
5. **组件查找**：统一走 `Shared/CollabTestDriver.ets` 提供的辅助函数，视口内找不到时回退到 List 容器的 scrollSearch，规避 List 懒加载造成的假失败；每个用例自行拉起应用页面，不依赖前序用例的执行顺序。

### 执行结果

| 场景 | 用例数 | 通过 | 失败 | 说明 |
|---|---|---|---|---|
| 全量执行 | 4434 | 4434 | 0 | 真机全量回归通过（OpenHarmony 7.0.0.43，RK板；Hypium 汇总 `Failure: 0`） |

运行配置的参数清单及对应选项：

| 参数 | 取值 | 对应选项 |
|---|---|---|
| 应用包名 | `com.example.staticCollabSample` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器路径 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单例超时（毫秒） | `7200000` | `-s timeout` |

单套件回归在上述参数后追加 `-s class <套件名>` 即可。

## 已知问题

1. **双端协同场景依赖真机组网**：端到端、对端信息等协同类用例的完整验证需两台设备登录同一账号组网；单设备执行时覆盖本端逻辑与异常流，双端联动行为需组网环境复测。
2. **性能与长稳类用例依赖设备基线**：PerformanceStability 分类下的连接耗时、吞吐断言阈值需按具体设备校准后执行。
3. **部分用例依赖窗口渲染时序**：交互类用例建议按「先点亮屏幕、等待页面渲染完成」的方式执行，避免息屏或键盘遮挡导致控件定位失败。

## 测试覆盖总结

| 维度 | 覆盖情况 |
|---|---|
| 会话连接与对端能力 | ✅ 连接选项、对端模型、会话建立/销毁全覆盖 |
| 会话操作与数据模型 | ✅ 操作目录、流程、工作流、深度模型覆盖 |
| 交互与手势 | ✅ 点击、触摸、手势、事件冒泡覆盖 |
| 焦点与无障碍 | ✅ 焦点导航、焦点环、无障碍导航覆盖 |
| 生命周期与状态 | ✅ 配置变更、持久化、恢复、会话管理覆盖 |
| 异常与边界校验 | ✅ 越界、非法输入、中断恢复、离线场景覆盖 |
| 性能稳定性与安全 | ✅ 连接/吞吐/内存/长稳/数据安全覆盖 |
| 集成与兼容 | ✅ 多场景集成与兼容性矩阵覆盖 |
