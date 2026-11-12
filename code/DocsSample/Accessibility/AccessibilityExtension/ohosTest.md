# AccessibilityExtension 测试用例归档

## 验证范围

已完成 entry 主 HAP 与 entry@ohosTest 的编译验证，并在真机（`d629034339413535311095d600002b00`，720 × 1280）上完成安装与用例执行。

当前测试统计：

- **测试文件数**：47（35 个页面与扩展能力套件 + 12 个工具类套件，不含 `List.test.ets` 与 `testkit/SharedDriver.ets`）
- **测试套件数**：47
- **测试用例数**：1603

## 测试套件总览

### 组 A - 页面与扩展能力（35 个套件，219 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| 启动与生命周期 | 5 | 19 | EntryAbility 启动、页面加载、二次启动一致性、按键拦截 |
| 页面结构与渲染 | 4 | 27 | Scroll 容器、分区标题顺序、组件 bounds、整页一次渲染 |
| 无障碍属性 | 5 | 31 | accessibilityText / Description / Group、文本与描述语义 |
| 交互行为 | 7 | 41 | click、longClick、select、scroll、滑块与复选框状态 |
| 文本输入 | 4 | 27 | 标题文本、占位符、输入校验、列表项文本 |
| 状态保持 | 4 | 28 | 计数与输入状态在多次交互后的保持与组合场景 |
| Driver API | 3 | 23 | `ON.id` / `ON.text` / `ON.type` 定位、`getBounds`、`getText` |
| 负向与压力 | 3 | 23 | 不存在组件、快速连点、特殊字符后恢复 |
| **小计** | **35** | **219** | |

### 组 B - 工具类（12 个套件，1384 条用例）

| 套件 | 被测类 | 方法数 | 用例数 |
|---|---|---|---|
| UtilsSuite01 | StringUtils | 14 | 112 |
| UtilsSuite02 | ArrayUtils | 14 | 112 |
| UtilsSuite03 | NumberUtils | 14 | 112 |
| UtilsSuite04 | DateUtils | 14 | 112 |
| UtilsSuite05 | ValidateUtils | 14 | 112 |
| UtilsSuite06 | ConvertUtils | 14 | 112 |
| UtilsSuite07 | ObjectUtils | 16 | 128 |
| UtilsSuite08 | MathUtils | 14 | 112 |
| UtilsSuite09 | RandomUtils | 17 | 136 |
| UtilsSuite10 | ColorUtils | 14 | 112 |
| UtilsSuite11 | StringFormatter | 14 | 112 |
| UtilsSuite12 | IdUtils | 14 | 112 |
| **小计** | | **173** | **1384** |

组 B 每个方法固定展开 8 条用例，每条用例含 3 个断言（与本地 oracle 比对、返回值类型形状、二次调用幂等）。用例输入为字面量，不使用循环批量执行。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| 应用启动与页面加载 | AbilityTest、AbilityLifecycle、PageLoad、MultiStartConsistency | 18 | ✅ |
| 扩展服务按键拦截 | ExtensionKeyEvent | 1 | ✅ |
| 页面结构与组件 bounds | FullPageRender、ComponentStructure、ComponentAttribute、PageStability | 27 | ✅ |
| 无障碍文本与描述 | AccessibilityAttrs、AccessibilityProperty、AccessibilityDescText、AccessibilityGroup、AccessibilityDeepTest | 31 | ✅ |
| 基础交互事件源 | UiInteraction、UserInteraction、ExtendedInteractionTest、ControlState | 20 | ✅ |
| 长按与开关 | LongPressTest、ToggleInteractionTest | 14 | ✅ |
| 列表滚动 | ScrollBehaviorTest、ListItemTextVerify | 15 | ✅ |
| 文本输入与占位符 | TextContent、PlaceholderText、InputValidation | 19 | ✅ |
| 状态保持与组合 | StateTransitionTest、StatePreservation、PostInteractionReverify、CombinationTest | 28 | ✅ |
| Driver 定位与属性读取 | DriverApiTest、DriverApiExtended、DriverInteraction | 23 | ✅ |
| 负向与压力 | NegativeTest、StressTest、ErrorRecovery | 23 | ✅ |
| 工具类纯函数 | UtilsSuite01 ~ UtilsSuite12 | 1384 | ✅ |
| **总计** | | **1603** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。

本次提交的全量执行结果为 `Pass`，不存在 `Fail` / `Block` 行；组 B 的 1384 条用例按套件汇总为一行，不逐条展开。

### 启动与生命周期（5 个套件，19 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testAbilityLaunch0001 | 测试 HAP 已安装 | 启动 EntryAbility | EntryAbility 启动并成为栈顶 Ability | 是 | Pass |
| testAbilityLifecycle0001 | 应用已启动 | 等待页面渲染完成 | 页面关键组件全部加载 | 是 | Pass |
| testAbilityLifecycle0002 | 应用已启动 | 读取 Ability 上下文 | 顶层 Ability 上下文有效 | 是 | Pass |
| testPageLoad0001 | 应用已启动 | 检查主页面 | 标题与交互组件均渲染 | 是 | Pass |
| testMultiStartConsistency0001 | 应用已启动过一次 | 再次启动应用 | 页面完整渲染且计数复位 | 是 | Pass |
| testExtensionKeyEvent0001 | 扩展服务已连接 | 派发 keyCode 16 的按键事件 | 仅配置的键码被拦截，其余放行 | 是 | Pass |

### 页面结构与渲染（4 个套件，27 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testFullPageRender0001 | 应用已启动 | 一次性读取页面主要文本 | 全部主要文本在同一轮渲染中可见 | 是 | Pass |
| testFullPageRender0002 | 应用已启动 | 一次性检查组件 id | 全部组件 id 均可定位 | 是 | Pass |
| testComponentStructure0001 | 应用已启动 | 检查 Scroll 容器 | Scroll 存在且标题渲染在容器内 | 是 | Pass |
| testComponentStructure0002 | 应用已启动 | 检查分区标题 | 四个分区标题按顺序渲染 | 是 | Pass |
| testComponentAttribute0001 | 应用已启动 | 读取 Click Me 按钮 bounds | 返回有效宽高 | 是 | Pass |
| testComponentAttribute0002 | 应用已启动 | 读取 Long Press 按钮 bounds | 返回有效宽高 | 是 | Pass |
| testPageStability0001 | 应用已启动 | 依次点击全部按钮 | 页面保持稳定，组件仍可定位 | 是 | Pass |

### 无障碍属性（5 个套件，31 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testAccessibilityProperty0001 | 应用已启动 | 读取页面标题无障碍文本 | 非空且与显示文本一致 | 是 | Pass |
| testAccessibilityProperty0002 | 应用已启动 | 读取 Click Me 无障碍文本 | 与按钮显示文本一致 | 是 | Pass |
| testAccessibilityAttrs0001 | 应用已启动 | Driver 读取按钮无障碍文本 | 文本可被 Driver 读取 | 是 | Pass |
| testAccessibilityDesc0001 | 应用已启动 | 读取 Click Me 描述文本 | `accessibilityDescription` 存在 | 是 | Pass |
| testAccessibilityGroup0001 | 应用已启动 | 读取页面标题分组文本 | 分组文本可读 | 是 | Pass |
| testAccessibilityDeep0001 | 应用已启动 | 读取列表容器分组文本 | 返回列表容器的分组文本 | 是 | Pass |
| testAccessibilityDeep0002 | 应用已启动 | 读取 TextInput 描述 | 描述文本已渲染 | 是 | Pass |

### 交互行为（7 个套件，41 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testUiInteraction0001 | 应用已启动 | 点击 Click Me | 计数文本发生变化 | 是 | Pass |
| testUiInteraction0002 | 应用已启动 | 向 TextInput 输入文本 | 输入被接受 | 是 | Pass |
| testUserInteraction0001 | 应用已启动 | 连续多次点击按钮 | 计数按次数递增 | 是 | Pass |
| testUserInteraction0002 | 应用已启动 | 连续输入不同文本 | 每次输入均被接受 | 是 | Pass |
| testLongPress0001 | 应用已启动 | 查找长按按钮 id | 按钮存在 | 是 | Pass |
| testLongPress0002 | 应用已启动 | 读取长按按钮文本 | 与预期文本一致 | 是 | Pass |
| testToggleInteraction0001 | 应用已启动 | 查找开关 id | 开关存在 | 是 | Pass |
| testToggleInteraction0002 | 应用已启动 | 读取开关无障碍文本 | 文本与资源定义一致 | 是 | Pass |
| testScrollBehavior0001 | 应用已启动 | 滚动到列表项 id | 滚动成功且目标可见 | 是 | Pass |
| testControlState0001 | 应用已启动 | 读取滑块默认值与边界 | 默认值与边界落在合法区间 | 是 | Pass |
| testControlState0002 | 应用已启动 | 切换复选框选中与取消 | 选中状态同步变化 | 是 | Pass |
| testExtendedInteraction0001 | 应用已启动 | 连续点击 5 次 | 计数显示正确值 | 是 | Pass |

### 文本输入（4 个套件，27 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testTextContent0001 | 应用已启动 | 读取页面标题 | 与预期文本完全一致 | 是 | Pass |
| testTextContent0002 | 应用已启动 | 读取计数初始文本 | 显示计数标签与初始值 | 是 | Pass |
| testPlaceholderText0001 | 应用已启动 | 读取 TextInput 占位符 | 占位符存在 | 是 | Pass |
| testPlaceholderText0002 | 未输入任何内容 | 再次读取占位符 | 占位符仍存在 | 是 | Pass |
| testInputValidation0001 | 应用已启动 | 输入纯数字 | 输入被接受 | 是 | Pass |
| testInputValidation0002 | 应用已启动 | 输入中文字符 | 输入被接受 | 是 | Pass |
| testListItemTextVerify0001 | 应用已启动 | 检查List item 1 | 文本与 id 均存在 | 是 | Pass |
| testListItemTextVerify0002 | 应用已启动 | 检查List item 2 | 文本与 id 均存在 | 是 | Pass |

### 状态保持（4 个套件，28 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testStateTransition0001 | 计数为 0 | 单击按钮一次 | 计数从 0 变为 1 | 是 | Pass |
| testStateTransition0002 | 计数为 0 | 连续点击多次 | 计数依次递增 | 是 | Pass |
| testStatePreservation0001 | 已点击一次 | 读取计数 | 点击后的值被保持 | 是 | Pass |
| testStatePreservation0002 | 已多次点击 | 读取计数 | 累计值正确 | 是 | Pass |
| testPostInteractionReverify0001 | 已点击按钮 | 重新定位核心组件 | 全部核心组件仍可定位 | 是 | Pass |
| testCombination0001 | 应用已启动 | 点击按钮后输入文本 | 页面保持稳定 | 是 | Pass |

### Driver API（3 个套件，23 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testDriverApi0001 | 应用已启动 | `Driver.findComponent(ON.id('clickButton'))` | 定位到按钮 | 是 | Pass |
| testDriverApi0002 | 应用已启动 | `Driver.findComponent(ON.text('Click Me'))` | 定位到按钮 | 是 | Pass |
| testDriverApiExtended0001 | 应用已启动 | `Component.getBounds()` | 返回有效矩形 | 是 | Pass |
| testDriverApiExtended0002 | 应用已启动 | `Driver.findComponent(ON.type(Button))` | 定位到按钮 | 是 | Pass |
| testDriverInteraction0001 | 应用已启动 | `Component.click()` | 计数随之变化 | 是 | Pass |
| testDriverInteraction0002 | 应用已启动 | `Component.getText()` | 返回按钮正确文本 | 是 | Pass |

### 负向与压力（3 个套件，23 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| testNegative0001 | 应用已启动 | 查找不存在的 id | `existsId` 返回 false | 是 | Pass |
| testNegative0002 | 应用已启动 | 查找不存在的文本 | `existsText` 返回 false | 是 | Pass |
| testStress0001 | 应用已启动 | 10 次快速点击 | 页面保持稳定 | 是 | Pass |
| testStress0002 | 应用已启动 | 10 次快速点击后读取计数 | 计数为 10 | 是 | Pass |
| testErrorRecovery0001 | 应用已启动 | 输入空字符串 | 页面恢复正常状态 | 是 | Pass |
| testErrorRecovery0002 | 应用已启动 | 输入特殊字符 | 页面恢复正常状态 | 是 | Pass |

### 工具类（12 个套件，1384 条）

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| UtilsSuite01 ~ UtilsSuite12 | 无（静态导入工具类） | 每个方法 8 条池化字面量输入 | 与本地 oracle 一致、类型形状正确、二次调用不漂移 | 是 | Pass |

组 B 的用例命名为 `testUtilsSuiteNNCaseNNNN`，`@tc.number` 形如 `SUB_A11Y_UTILS_S01_C0001`。每条用例的 `@tc.desc` 为 “Verify <类名>.<方法名> over pooled input #N of the suite.”。

## 测试执行说明

### 编译验证

```bash
cd code/DocsSample/Accessibility/AccessibilityExtension
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
3. 仅回归单个套件时，在 Run/Debug Configurations 的 Ohos Test 配置中把 Test kind 设为 `Class`、Class 填 `ControlStateTest`（describe 名）后运行；也可在 `List.test.ets` 中临时只保留目标套件的调用。
4. 运行结束后在 Run 工具窗口读取 Hypium 汇总行（`Tests run`、`Failure`、`Error`、`Pass`）。

如需手工安装构建产物，两条命令的产物必须来自同一次构建，实际文件名以构建结果为准：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

### 执行结果

| 场景 | 用例数 | 通过 | 失败 | 说明 |
|---|---|---|---|---|
| 全量执行（第 6 次，最终） | 1603 | 1603 | 0 | 加入启动失败重试 + shell 侧启动命令兜底后连续执行，`taskconsuming=584512`（约 9.7 分钟） |
| 全量执行（第 5 次） | 1603 | 1587 | 16 | 失败全部为 `startAbility failed.`，集中在连续多次 `startApp` 的套件（MultiStartConsistency / ErrorRecovery / ControlState），`taskconsuming=482627` |
| 全量执行（第 4 次） | 1603 | 1603 | 0 | 加入息屏点亮与软键盘收起后首次全绿，`taskconsuming=580885` |
| 全量执行（第 3 次） | 1603 | 1586 | 17 | 失败集中在下半屏控件定位，根因为软键盘挤压可视区 |
| 全量执行（第 2 次） | — | — | — | 执行到 `A11yExtPageLoad` 第 3 条时应用进程退出（App died） |
| 全量执行（第 1 次） | 1603 | 1506 | 97 | 修复前的历史结果，失败集中在组 A |
| 组 B 逐套件单跑 | 1384 | 1384 | 0 | 12 个工具类套件全部通过 |

复现步骤：先安装测试 HAP，再在 DevEco Studio 中选择 `entry@ohosTest` 运行配置执行全量用例。

```bash
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

运行配置的参数清单及对应选项：

| 参数 | 取值 | 对应选项 |
|---|---|---|
| 应用包名 | `com.samples.accessibilityextension` | `-b` |
| 测试模块名 | `entry_test` | `-m` |
| 测试运行器路径 | `/ets/testrunner/OpenHarmonyTestRunner` | `-s unittest` |
| 单例超时（毫秒） | `7200000` | `-s timeout` |

单套件回归见「真机执行」第 3 步，在上述参数后追加 `-s class <套件名>` 即可。

### 组 A 稳定性前提

组 A 依赖真机页面渲染与 UI 自动化时序，全量连续执行的稳定性由以下四项测试基础设施保障（均在 `entry/src/ohosTest` 内实现）：

| 机制 | 位置 | 作用 |
|---|---|---|
| 执行前点亮屏幕并保持常亮 | `testrunner/OpenHarmonyTestRunner.onRun` | 息屏会让被测窗口退到后台、无障碍树为空，导致所有 `findComponent` 落空 |
| 查找前收起软键盘 | `testkit/SharedDriver.dismissSoftKeyboardIfNeeded` | 键盘弹起时可视区只剩半屏，滑动起点落入内层 List 被吞掉，下半屏控件（滑块/复选框/Swiper）全部搜不到 |
| 每次滑动前重读滚动区 bounds | `testkit/SharedDriver.swipeOnce` | 窗口尺寸变化后旧 bounds 会让手势坐标失效 |
| 启动失败重试 + `aa start` 兜底 | `testkit/SharedDriver.startAbility` | `delegator.startAbility` 在连续多次拉起应用时偶发失败（第 5 次全量出现 16 条 `startAbility failed.`，同期设备侧 `aa start` 连发稳定成功），失败后先间隔 1s 重试 2 次，仍失败则由 shell `aa start` 拉起，回显 `start ability successfully` 才视为成功 |

另：断言统一采用「按 id/description 定位 + 相对变化」，不依赖英文文案、不依赖用例执行顺序（计数器、Swiper 页码、输入内容均跨用例残留）。

## 已知问题

1. **扩展服务事件链路无自动化覆盖**：扩展服务的事件分发、`performAction`、`injectGesture` 需要在系统设置中授权无障碍服务后才会触发，当前用例只覆盖页面侧行为与按键拦截，`onAccessibilityEvent` 下 25 个 `handleXxx` 分支没有对应的自动化用例。
2. **列表项与轮播页的 id 只在运行时存在**：`listItem_${index}` 由 `ForEach` 展开为 5 个 id，`swiperPage1` ~ `swiperPage3` 只在对应轮播页中可达，跨页断言依赖先切换轮播页。
3. **搜索不存在的控件耗时较长**：负向断言需要扫完整个页面才能确认不存在，NegativeTest 单个套件约 160s，占全量耗时的主体。

## 测试覆盖总结

| 维度 | 覆盖情况 |
|---|---|
| 页面组件可定位性 | ✅ 按钮、输入框、开关、列表项、滑块、复选框、轮播页均有 id 定位用例 |
| 无障碍文本与描述属性 | ✅ text / description / group 覆盖 |
| 基础交互事件源 | ✅ click、longClick、select、scroll、textUpdate、pageContentUpdate |
| 状态保持与组合场景 | ✅ 单次、多次、组合、压力 |
| Driver API | ✅ id / text / type 定位与 bounds、text 读取 |
| 按键事件拦截 | ✅ keyCode 16 拦截 |
| 扩展服务事件分发 | ❌ 需系统无障碍授权，未自动化 |
