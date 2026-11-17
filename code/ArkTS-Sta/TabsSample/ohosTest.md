# TabsSample 测试用例归档

## 验证范围

对 Tabs 示例工程（主页 Tabs 嵌套场景）的 `entry@ohosTest` 测试模块进行分层测试覆盖，采用 hypium 测试框架编写，源码位于 `entry/src/ohosTest/ets/test/`。

当前测试统计：

- **测试文件数**：80（78 个分类测试套件 + 根目录 `Ability.test.ets` 与 `List.test.ets`，不含工具类 `Shared/SharedDriver.ets`）
- **测试套件数**：78
- **测试用例数**：3621

## 测试套件总览

### 组 A - Tabs 核心与集成（25 个套件，1055 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| TabsCore 核心功能 | 16 | 776 | TabBar 交互、Tab 数据模型、页签菜单配置、页签增删与切换、并发/一致性/端到端/错误恢复/状态管理 |
| Integration 集成场景 | 9 | 279 | 高级场景、兼容性矩阵、综合回归、设备兼容、本地化、系统集成、网络连通、用户场景 |
| **小计** | **25** | **1055** | |

### 组 B - 交互与生命周期（24 个套件，1066 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Interaction 交互行为 | 14 | 687 | 无障碍导航、按钮交互、内容缩放、数据绑定、事件处理与冒泡、焦点导航、焦点环、手势识别、TabBar 定位、主题变化、触摸交互、UI 渲染、视觉特效 |
| LifecycleState 生命周期与状态 | 10 | 379 | 配置变更、错误恢复、异常处理、扩展生命周期、资源管理、会话管理、状态持久化与恢复、Tabs 生命周期与状态管理 |
| **小计** | **24** | **1066** | |

### 组 C - 校验、性能与安全（31 个套件，1496 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Validation 通用校验 | 11 | 752 | 边界错误、焦点管理、输入校验、按键码、日志、指针工具、资源加载、Tab 配置管理、事件总线、状态管理器、切页动画 |
| TabsValidation 校验类 | 8 | 405 | 应用版本、鉴权会话、数据源、事件工具、中断恢复、通知、离线网络、会话校验 |
| PerformanceStability 性能与稳定性 | 7 | 240 | 动画性能、并发控制、长期稳定、内存泄漏检测、性能压测、功耗、渲染性能 |
| Security 安全 | 3 | 99 | 数据安全、安全无障碍、安全校验 |
| **小计** | **31** | **1496** | |

另有根目录 `Ability.test.ets`（4 条用例）验证测试宿主 Ability 启动；`Shared/SharedDriver.ets` 为共享测试工具类，不产生用例。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| TabBar 显示与定位 | TabBarInteraction、TabBarPositioning、UIComponentRendering | 220+ | ✅ |
| 页签切换与导航 | TabNavigation 系列套件（各目录 `*_tab_navigation_*`） | 400+ | ✅ |
| 页签增删与数据模型 | TabDataModel、TabModelDeep、TabOperationCatalog、TabOperationFlow、TabOperations、TabOperationWorkflow | 600+ | ✅ |
| 状态管理与恢复 | TabsCoreStateManagement、TabsStateManagement、StatePersistence、StateRecovery、TabStateManagerValidation | 300+ | ✅ |
| 生命周期与配置变更 | TabsLifecycle、ConfigurationChanges、ExtensionLifecycle、SessionManagement、TabsCoreLifecycle | 200+ | ✅ |
| 手势与触摸交互 | GestureRecognition、TouchInteraction、EventHandling、EventPropagation | 300+ | ✅ |
| 焦点与无障碍 | FocusNavigation、FocusRingBehavior、AccessibilityNavigation、SecurityAccessibility | 250+ | ✅ |
| 异常与边界校验 | ExceptionHandling、ErrorRecovery、BoundaryErrorTesting、InputValidation | 250+ | ✅ |
| 性能与功耗 | AnimationPerformance、RenderPerformance、PerformanceStress、PowerConsumption、MemoryLeakDetection、LongTermStability | 240 | ✅ |
| 数据与网络安全 | DataSecurity、SecurityValidation、TabOfflineNetwork、TabAuthSession | 150+ | ✅ |
| **总计** | | **3621** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。
- `待执行`：已提交代码尚未完成真机全量回归。

本次提交时全量真机回归尚未完成，下表结果列统一为 `待执行`；各分类仅展开代表性用例，完整用例以测试源码为准。

### Tabs 核心功能（TabsCore/，16 个套件，776 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| tabbarinteraction_tabs_visible_1 | 测试 HAP 已安装 | 启动测试页 | TabBar 各页签完整渲染可见 | 是 | 待执行 |
| tabbarinteraction_tab_navigation_1 | 应用已启动 | 点击/切换页签 | 内容区切换到对应 Tab | 是 | 待执行 |
| tabDataModel 系列用例 | 应用已启动 | 增删改查 Tab 数据 | 数据模型状态与预期一致 | 是 | 待执行 |
| tabOperation 系列用例 | 应用已启动 | 连续页签操作后回读 | 操作结果正确且状态不漂移 | 是 | 待执行 |

### 交互行为（Interaction/，14 个套件，687 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| accessibilitynavigation_tabs_visible_1 | 应用已启动 | 检查无障碍焦点 | 页面元素可被无障碍遍历 | 是 | 待执行 |
| gestureRecognition 系列用例 | 应用已启动 | 滑动/点击手势 | 页签按手势方向切换 | 是 | 待执行 |
| eventHandling 系列用例 | 应用已启动 | 派发点击/触摸事件 | 事件被目标组件正确消费 | 是 | 待执行 |
| focusNavigation 系列用例 | 应用已启动 | 按键移动焦点 | 焦点按预期顺序转移 | 是 | 待执行 |

### 生命周期与状态（LifecycleState/，10 个套件，379 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| configurationChangesTest_valid_transition_0 | 应用已启动 | 触发合法配置变更 | 状态按预期流转 | 是 | 待执行 |
| configurationChangesTest_invalid_transition_0 | 应用已启动 | 触发非法状态迁移 | 迁移被拒绝且状态不破坏 | 是 | 待执行 |
| stateRecovery 系列用例 | 已持久化状态 | 重建页面 | 状态正确恢复 | 是 | 待执行 |

### 性能与稳定性（PerformanceStability/，7 个套件，240 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| animationPerformanceTest_budget_0 | 应用已启动 | 连续切页动画 | 动画帧耗在预算内 | 是 | 待执行 |
| memoryLeakDetection 系列用例 | 多轮页签操作后 | 检查对象持有 | 无异常增长的对象引用 | 是 | 待执行 |
| powerConsumption 系列用例 | 应用已启动 | 持续交互采样 | 功耗表现符合预期区间 | 是 | 待执行 |

### 校验类（Validation/ 与 TabsValidation/，19 个套件，1157 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| boundaryErrorTestingTest_range_checks_0 | 应用已启动 | 越界 index 输入 | 越界输入被拦截并钳位 | 是 | 待执行 |
| tabEventBusValidation 系列用例 | 应用已启动 | 注册/触发事件 | 事件按订阅关系正确分发 | 是 | 待执行 |
| tabAppVersionTest_add_contains_0 | 应用已启动 | 新增后查询 | 数据包含新增项 | 是 | 待执行 |
| tabInterruptionRecovery 系列用例 | 操作中断 | 恢复执行 | 中断后可恢复到一致状态 | 是 | 待执行 |

### 集成与其他（Integration/、Security/ 等，12 个套件，378 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| advancedscenarios_tab_navigation_1 | 应用已启动 | 组合切换操作 | 页面与页签状态一致 | 是 | 待执行 |
| compatibilityMatrix 系列用例 | 多种设备形态 | 遍历配置组合 | 各组合下行为一致 | 是 | 待执行 |
| dataSecurityTest_range_checks_0 | 应用已启动 | 注入边界数据 | 数据校验按预期拦截 | 是 | 待执行 |

用例命名为 `测试模块名_场景_N`，基于 hypium 框架注册于 `List.test.ets`。每条用例含明确的断言（状态比对、可见性、类型形状等），不使用循环批量执行。

## 测试执行说明

### 编译验证

```bash
cd code/ArkTS-Sta/TabsSample
hvigorw assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
```

### 真机执行

1. 在 DevEco Studio 中选中 `entry` 模块点击 Run，完成主 HAP 的构建、签名、安装与启动。
2. 打开 `entry/src/ohosTest/ets/test/List.test.ets`，点击 `testsuite` 函数旁的运行按钮执行全部测试套；IDE 会在同一台设备上安装测试 HAP 并拉起测试。
3. 仅回归单个套件时，在 Run/Debug Configurations 的 Ohos Test 配置中把 Test kind 设为 `Class`、Class 填目标 describe 名后运行；也可在 `List.test.ets` 中临时只保留目标套件的调用。
4. 运行结束后在 Run 工具窗口读取 Hypium 汇总行（`Tests run`、`Failure`、`Error`、`Pass`）。

如需手工安装构建产物，两条命令的产物必须来自同一次构建，实际文件名以构建结果为准：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

### 执行结果

| 场景 | 用例数 | 通过 | 失败 | 说明 |
|---|---|---|---|---|
| 全量执行 | 3621 | — | — | 待真机回归后补充 |

运行配置的参数清单及对应选项：

| 参数 | 取值 | 对应选项 |
|---|---|---|
| 应用包名 | `com.samples.TabsSample` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器路径 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单例超时（毫秒） | `7200000` | `-s timeout` |

单套件回归在上述参数后追加 `-s class <套件名>` 即可。

## 已知问题

1. **全量真机回归待完成**：3621 条用例的代码已就绪，真机全量执行结果将在回归完成后补充至「执行结果」表。
2. **性能与功耗类用例依赖设备基线**：PerformanceStability 分类下的帧耗、功耗断言阈值需按具体设备校准后执行。
3. **部分用例依赖窗口渲染时序**：交互类用例建议按「先点亮屏幕、等待页面渲染完成」的方式执行，避免息屏或键盘遮挡导致控件定位失败。

## 测试覆盖总结

| 维度 | 覆盖情况 |
|---|---|
| TabBar 与页签核心能力 | ✅ 显示、切换、增删、数据模型全覆盖 |
| 交互与手势 | ✅ 点击、触摸、手势、事件冒泡覆盖 |
| 焦点与无障碍 | ✅ 焦点导航、焦点环、无障碍导航覆盖 |
| 生命周期与状态 | ✅ 配置变更、持久化、恢复、会话管理覆盖 |
| 异常与边界校验 | ✅ 越界、非法输入、中断恢复覆盖 |
| 性能稳定性与安全 | ✅ 动画/渲染/功耗/内存/数据安全覆盖 |
| 集成与兼容 | ✅ 多场景集成与兼容性矩阵覆盖 |
