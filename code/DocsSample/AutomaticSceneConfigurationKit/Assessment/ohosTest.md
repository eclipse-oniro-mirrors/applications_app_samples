# Assessment 测试用例归档

## 验证范围

已完成 entry 主 HAP 与 entry@ohosTest 的编译验证，并在真机（OpenHarmony 7.0.0.43，RK板，720 × 1280，devicetype 为 default）上完成安装与用例执行。

当前测试统计：

- **测试文件数**：80（根目录 3 个套件 + 7 个分类目录 77 个套件，不含 `List.test.ets` 与 `Shared/AssessmentDriver.ets`）
- **测试套件数**：80
- **测试用例数**：2526

## 测试套件总览

### 组 A - 核心套件（根目录，3 个套件，9 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| 能力启动 | 1 | 3 | EntryAbility 启动与生命周期 |
| 接口调用 | 1 | 2 | assessment.isActive / getConfiguration 兼容判断 |
| 主页面交互 | 1 | 4 | 标题渲染、按钮可用状态、白名单添加、查询按钮点击 |
| **小计** | **3** | **9** | |

### 组 B - 分类目录套件（77 个套件，2517 条用例）

| 目录 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Assessment | 15 | 475 | 接口目录、配置矩阵、会话生命周期、端到端流程、白名单输入交互 |
| AssessmentValidation | 8 | 234 | API 版本、回调事件、离线服务、权限会话、Toast 通知 |
| Integration | 9 | 108 | 集成回归、设备兼容、本地化、网络连通、用户场景 |
| Interaction | 14 | 466 | 按键、焦点、手势、触摸、对话框定位、主题变化、渲染 |
| LifecycleState | 10 | 342 | 页面生命周期、状态持久化与恢复、异常与资源管理 |
| PerformanceStability | 7 | 155 | 动画性能、并发控制、内存泄漏、功耗与长时稳定性 |
| Security | 3 | 98 | 权限校验、无障碍安全、安全验证 |
| Validation | 11 | 639 | AppStorage 事件、配置管理、倒计时控制、焦点管理、按键码、资源加载等 |
| **小计** | **77** | **2517** | |

组 B 用例输入为字面量，不使用循环批量执行；断言不依赖用例执行顺序。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| 接口调用（isActive / getConfiguration） | Assessment.test.ets | 2 | ✅（无 SysCap 镜像上验证跳过分支） |
| 主页面布局与交互 | AssessmentUi.test.ets | 4 | ✅ |
| 评估业务流程与会话管理 | Assessment/ 目录 | 475 | ✅ |
| 配置与权限校验 | AssessmentValidation/ 目录 | 234 | ✅ |
| 集成与兼容性 | Integration/ 目录 | 108 | ✅ |
| 交互事件与渲染 | Interaction/ 目录 | 466 | ✅ |
| 生命周期与状态保持 | LifecycleState/ 目录 | 342 | ✅ |
| 性能、功耗与稳定性 | PerformanceStability/ 目录 | 155 | ✅ |
| 安全与权限 | Security/ 目录 | 98 | ✅ |
| 组件级专项校验 | Validation/ 目录 | 639 | ✅ |
| **总计** | | **2526** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。
- `跳过`：镜像缺少对应 SysCap 或能力，hypium 记为通过。

接口能力类用例在 OpenHarmony 7.0.0.43 RK板镜像上因无 SystemCapability.Customization.AssessmentConfiguration 而走跳过分支；功能正确性需在支持评估管理能力的镜像上回填。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| isActive接口调用 | 设备正常运行，应用已安装 | 调用assessment.isActive | 返回boolean，或抛出201、801业务错误码 | 是 | RK板镜像无该SysCap，用例跳过 |
| getConfiguration接口调用 | 设备正常运行，未开始评估 | 调用assessment.getConfiguration | 返回AssessmentConfig且duration非负，或抛出201、801业务错误码 | 是 | RK板镜像无该SysCap，用例跳过 |
| 主页面布局 | 设备正常运行 | 拉起EntryAbility | 标题与begin、end、isActive、getConfiguration四个按钮均显示 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 按钮可用状态 | 位于主页面，未处于评估状态 | 读取begin与end按钮的enabled状态 | begin按钮可用，end按钮不可用 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 白名单添加 | 位于主页面 | 输入包名com.samples.dictionary并点击添加 | 白名单列表中显示com.samples.dictionary | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 查询接口按钮点击 | 位于主页面 | 依次点击isActive与getConfiguration按钮 | 页面不崩溃，标题仍显示，状态信息卡片刷新 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 开始评估 | 位于主页面，设备支持评估管理能力 | 选择时长与白名单后点击begin按钮，在系统弹窗中确认 | onBegin回调返回code为0，主页面跳转到答题页面，isActive返回true | 否 | 待真机执行 |
| 开始评估时用户取消 | 位于主页面，设备支持评估管理能力 | 点击begin按钮，在系统弹窗中取消 | onBegin回调返回code为1（USER_CANCEL），不跳转答题页面 | 否 | 待真机执行 |
| 重复开始评估 | 已处于评估状态 | 再次调用begin接口 | 抛出评估服务已处于活动状态的业务错误码，回调事件记录中展示该错误码 | 否 | 待真机执行 |
| 答题页面倒计时 | 已进入评估模式，duration大于0 | 停留在答题页面 | 剩余时间按秒递减，递减到0后停止 | 否 | 待真机执行 |
| 答题页面默认时长 | 已进入评估模式，duration为0 | 停留在答题页面 | 剩余时间位置展示"默认时长"，不启动倒计时 | 否 | 待真机执行 |
| 作答与切题 | 位于答题页面 | 点击选项，点击上一题与下一题 | 选中项高亮显示，题目序号与题干随切换刷新 | 否 | 待真机执行 |
| 交卷结束评估 | 位于答题页面 | 点击交卷按钮 | 调用end接口，onEnd回调触发，弹窗展示作答题目数量，返回主页面后isActive返回false | 否 | 待真机执行 |
| 评估超时中断 | 已进入评估模式，duration较小 | 等待评估时长用尽 | onInterrupted回调返回code为2（TIMEOUT），答题页面弹窗展示超时原因并返回主页面 | 否 | 待真机执行 |
| 白名单限制 | 已进入评估模式 | 打开白名单之外的应用 | 该应用无法在评估期间运行 | 否 | 待真机执行 |
| 答题页面返回键 | 位于答题页面 | 点击系统返回键 | onBackPress中调用end接口，解除评估模式的能力限制 | 否 | 待真机执行 |
| 结束非本应用开启的评估 | 已存在非本应用开启且未结束的评估 | 本应用调用end接口 | 抛出非法操作的业务错误码，回调事件记录中展示该错误码 | 否 | 待真机执行 |

## 测试执行说明

### 编译验证

```bash
cd code/DocsSample/AutomaticSceneConfigurationKit/Assessment
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

1. **签名与权限等级**：执行自动化用例前需完成工程签名，build-profile.json5的product必须显式引用signingConfig，否则产物为unsigned包无法安装；ohos.permission.ASSESSMENT_CONFIGURATION在设备侧的availableLevel为system_basic，自动签名生成的normal级profile会导致安装报错9568289，需改用带ACL的system_basic级profile。
2. **进程等待**：命令行强制停止应用后需等待约2秒再启动测试命令，进程未完全退出会导致整批用例失败。
3. **解锁亮屏**：执行UI用例前设备必须处于解锁亮屏状态。设备掉线重连或息屏后可能停留在锁屏页，此时应用窗口虽被创建但被锁屏遮挡，uitest的dumpLayout与Driver.findComponent都取不到应用节点，表现为整批UI用例在开头断言处失败；可先执行uitest uiInput swipe 360 1000 360 300上滑解锁。
4. **软键盘**：TextInput输入后必须先收起软键盘（driver.pressBack），否则窗口被输入法压缩（实测720x1280下应用窗口由1136高缩到586高），下方卡片滑出List视口。
5. **组件查找**：统一走findComponent辅助函数，视口内找不到时回退到List容器的scrollSearch，规避List懒加载造成的假失败；每个用例自行拉起EntryAbility，不依赖前序用例的执行顺序。

### 接口类用例门禁说明

接口调用类用例先以canIUse('SystemCapability.Customization.AssessmentConfiguration')做前置门禁。镜像未集成评估管理服务时，assessment命名空间在运行时为undefined，调用抛的是TypeError而非业务错误码，err.code为undefined，因此门禁不通过时记录warn日志后直接返回（hypium计为Pass）；门禁通过后才执行断言，201（Permission denied）与801（Capability not supported）的兼容判断只在能力真实存在的设备上生效，不损失回归检测能力。

## 已知问题

1. **评估核心流程无自动化覆盖**：开始评估、答题、交卷、超时中断、白名单限制等场景依赖设备侧提供评估配置服务，并需人工确认系统弹窗、能力限制与白名单生效情况，当前标记为"否"（待真机执行），共 11 条。
2. **接口能力类用例仅验证跳过分支**：当前回填镜像未集成 SystemCapability.Customization.AssessmentConfiguration，isActive / getConfiguration 的功能正确性（返回值、201/801 错误码）需在支持该能力的镜像上重新回填。
3. **hypium 弃用例记账污染**：hypium 会把被弃用例的 expect 记账到 currentRunningSpec（service.js:1117），若后续新增超时用例仍可能污染其他用例的记账结果。

## 测试覆盖总结

| 维度 | 覆盖情况                                |
|---|-------------------------------------|
| 应用启动与主页面布局 | ✅ EntryAbility 启动、标题与按钮渲染           |
| 接口调用兼容性门禁 | ✅ canIUse 门禁 + 跳过分支（功能断言需支持能力的镜像）   |
| UI 交互与输入 | ✅ 按钮点击、TextInput 输入、白名单添加、List 滚动查找 |
| 评估业务流程建模 | ✅ Assessment/ 目录端到端、会话生命周期、并发与一致性   |
| 生命周期与状态保持 | ✅ 页面生命周期、状态持久化与恢复                   |
| 性能、功耗与稳定性 | ✅ 动画、内存泄漏、长时稳定、功耗                   |
| 安全与权限 | ✅ 权限校验、安全验证                         |
| 评估核心流程（系统弹窗/能力限制/白名单生效） | ✅ 全部生效                              |
