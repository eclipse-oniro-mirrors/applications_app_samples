# TabsSample 测试用例归档

## 验证范围

已完成 entry 主 HAP 与 entry@ohosTest 的编译验证，并在真机（OpenHarmony 7.0.0.43，RK板，720 × 1280，devicetype 为 default）上完成安装与用例执行。

当前测试统计：

- **测试文件数**：80（根目录 2 个套件 + 8 个分类目录 78 个套件，不含 `List.test.ets` 与 `Shared/SharedDriver.ets`）
- **测试套件数**：78
- **测试用例数**：3621

## 测试套件总览

### 组 A - 核心套件（根目录，2 个套件，4 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| 能力启动 | 1 | 3 | 测试宿主 Ability 启动与页面加载 |
| 用例注册 | 1 | 1 | List.test.ets 全局套件注册清单 |
| **小计** | **2** | **4** | |

### 组 B - 分类目录套件（78 个套件，3617 条用例）

| 目录 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| TabsCore | 16 | 776 | TabBar 交互、Tab 数据模型、页签菜单配置、页签增删与切换、并发/一致性/端到端/错误恢复/状态管理 |
| Interaction | 14 | 687 | 无障碍导航、按钮交互、内容缩放、数据绑定、事件处理与冒泡、焦点导航、焦点环、手势识别、TabBar 定位、主题变化、触摸交互、UI 渲染、视觉特效 |
| Validation | 11 | 752 | 边界错误、焦点管理、输入校验、按键码、日志、指针工具、资源加载、Tab 配置管理、事件总线、状态管理器、切页动画 |
| TabsValidation | 8 | 405 | 应用版本、鉴权会话、数据源、事件工具、中断恢复、通知、离线网络、会话校验 |
| LifecycleState | 10 | 379 | 配置变更、错误恢复、异常处理、扩展生命周期、资源管理、会话管理、状态持久化与恢复、Tabs 生命周期与状态管理 |
| Integration | 9 | 279 | 高级场景、兼容性矩阵、综合回归、设备兼容、本地化、系统集成、网络连通、用户场景 |
| PerformanceStability | 7 | 240 | 动画性能、并发控制、长期稳定、内存泄漏检测、性能压测、功耗、渲染性能 |
| Security | 3 | 99 | 数据安全、安全无障碍、安全校验 |
| **小计** | **78** | **3617** | |

组 B 用例输入为字面量，不使用循环批量执行；断言不依赖用例执行顺序。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| TabBar 显示、定位与页签切换 | TabBarInteraction、TabBarPositioning、UIComponentRendering 等 | 400+ | ✅ |
| 页签增删与数据模型 | TabDataModel、TabModelDeep、TabOperationCatalog、TabOperationFlow、TabOperations、TabOperationWorkflow | 600+ | ✅ |
| 状态管理与恢复 | TabsCoreStateManagement、TabsStateManagement、StatePersistence、StateRecovery、TabStateManagerValidation | 300+ | ✅ |
| 生命周期与配置变更 | TabsLifecycle、ConfigurationChanges、ExtensionLifecycle、SessionManagement、TabsCoreLifecycle | 200+ | ✅ |
| 手势、触摸与事件 | GestureRecognition、TouchInteraction、EventHandling、EventPropagation | 300+ | ✅ |
| 焦点与无障碍 | FocusNavigation、FocusRingBehavior、AccessibilityNavigation、SecurityAccessibility | 250+ | ✅ |
| 异常与边界校验 | ExceptionHandling、ErrorRecovery、BoundaryErrorTesting、InputValidation | 250+ | ✅ |
| 性能、功耗与稳定性 | AnimationPerformance、RenderPerformance、PerformanceStress、PowerConsumption、MemoryLeakDetection、LongTermStability | 240 | ✅ |
| 数据与网络安全 | DataSecurity、SecurityValidation、TabOfflineNetwork、TabAuthSession | 150+ | ✅ |
| 集成与兼容性 | Integration/ 目录 | 279 | ✅ |
| **总计** | | **3621** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。

本次全量执行结果为 `Pass`，不存在 `Fail` / `Block` 行；下表按分类展开代表性用例，完整用例以测试源码为准。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| TabBar 页签渲染 | 设备正常运行，应用已安装 | 启动测试页 | TabBar 各页签完整渲染可见 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 页签切换导航 | 位于测试页 | 点击/滑动切换页签 | 内容区切换到对应 Tab，状态一致 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 页签增删与数据模型 | 位于测试页 | 连续执行页签增删改查操作 | 数据模型状态与预期一致且不漂移 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| TabBar 自定义构造 | 位于测试页 | 配置 BarPosition、TabMode、BarWidth/BarHeight | 布局按配置正确生效 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 手势与触摸交互 | 位于测试页 | 滑动切页、点击、连续快速操作 | 事件被目标组件正确消费，页面稳定 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 焦点与无障碍导航 | 位于测试页 | 按键移动焦点、遍历无障碍节点 | 焦点按预期顺序转移，无障碍文本可读 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 生命周期与状态恢复 | 应用已启动过一次 | 触发配置变更后恢复页面 | 状态正确持久化并恢复 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 异常与边界校验 | 位于测试页 | 注入越界 index、非法输入 | 越界输入被拦截并钳位，页面不崩溃 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 性能与功耗 | 位于测试页 | 连续切页动画、持续交互采样 | 动画帧耗在预算内，功耗表现正常 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 数据与网络安全校验 | 位于测试页 | 注入边界数据、离线场景 | 数据校验按预期拦截，状态一致 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |

## 测试执行说明

### 编译验证

```bash
cd code/ArkTS-Sta/TabsSample
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

1. **签名**：执行自动化用例前需完成工程签名，build-profile.json5 的 product 必须显式引用 signingConfig，否则产物为 unsigned 包无法安装。
2. **进程等待**：命令行强制停止应用后需等待约 2 秒再启动测试命令，进程未完全退出会导致整批用例失败。
3. **解锁亮屏**：执行 UI 用例前设备必须处于解锁亮屏状态。息屏会导致被测窗口退到后台、无障碍树为空，Driver.findComponent 全部落空。
4. **软键盘**：TextInput 输入后必须先收起软键盘（driver.pressBack），否则窗口被输入法压缩，下半屏组件可能滑出可视区。
5. **用例独立性**：每个用例自行拉起测试页，断言采用按 id 定位 + 相对变化，不依赖英文文案，不依赖用例执行顺序（计数器、页码、输入内容跨用例残留）。

## 已知问题

1. **性能类断言阈值依赖设备基线**：PerformanceStability 分类下的帧耗、功耗断言阈值按 RK板（720x1280）校准，在性能差异较大的设备上可能需要重新调整阈值。
2. **长稳类用例执行耗时较长**：LongTermStability、PerformanceStress 等套件单套执行时间较长，占全量耗时主体，按需单独回归即可。

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
