# Mouse 鼠标指针设置 — ohosTest 测试说明

## 一、概述

本文档描述 `code/SystemFeature/DeviceManagement/Mouse` 样例的 `ohosTest` 测试套件。
测试目标为「鼠标指针设置」业务（`@ohos.multimodalInput.pointer`），覆盖：

- 主按键（向左键 / 向右键）
- 悬停滚动开关（ON / OFF）
- 指针大小（1–7）
- 指针颜色（黑色 `0x171717` / 白色 `0xFFFFFF`）
- 指针样式（默认 / 加载）

测试框架为 `@ohos/hypium`（describe / it / expect），日志统一使用 `@ohos.hilog`，
不使用 `console.*`，日志文本为英文。

## 二、目录结构

```
entry/src/ohosTest/
├── module.json5                       # 测试模块配置（deviceTypes: default/tablet）
├── ets/
│   ├── test/
│   │   ├── Ability.test.ets           # 框架基础断言
│   │   ├── List.test.ets              # 注册全部 78 个测试套件
│   │   ├── Shared/
│   │   │   └── SharedDriver.ets       # UI 驱动与指针设置辅助工具
│   │   ├── MouseSettings/             # 指针设置模型、UI、流程、生命周期
│   │   ├── MouseValidation/           # 版本/会话/数据源/事件/通知等校验
│   │   ├── Validation/                # 指针工具、键码、日志、边界、配置等校验
│   │   ├── Interaction/               # 焦点、按键、触摸、手势、无障碍等交互
│   │   ├── LifecycleState/            # 状态管理、持久化、恢复、异常处理
│   │   ├── PerformanceStability/      # 并发、压力、内存、性能、资源消耗
│   │   ├── Integration/               # 场景、回归、兼容、本地化、系统集成
│   │   └── Security/                  # 安全校验与安全无障碍
│   ├── testability/
│   │   ├── TestAbility.ets            # 启动 EntryAbility 后运行 Hypium
│   │   └── pages/Index.ets
│   └── testrunner/
│       └── OpenHarmonyTestRunner.ts
└── resources/                         # 测试模块资源
```

## 三、测试套件与覆盖点

| 目录 | 测试文件（节选） | 覆盖功能点 |
|------|------------------|------------|
| MouseSettings | PointerSettingConcurrency、PointerSettingConsistency、PointerSettingEndToEnd、PointerSettingErrorRecovery、PointerSettingLifecycle、PointerSettingStateManagement、PointerSettingStress、MouseSettingsUI、PointerInputInteraction、PointerItemInfoModel、PointerMenuConfiguration、PointerModelDeep、PointerSettingCatalog、PointerSettingFlow、PointerOperations、PointerSettingWorkflow | 主按键、悬停滚动、指针大小、颜色、样式模型；设置流程、并发、一致性、状态与生命周期 |
| MouseValidation | MouseAppVersion、MouseAuthSession、MouseDataSourceValidation、MouseEventToolValidation、MouseInterruptionRecovery、MouseNotification、MouseOfflineNetwork、MouseSessionValidation | 版本、会话、数据源校验、事件工具、中断恢复、通知、离线与会话校验 |
| Validation | PointerScaleAnimationValidation、BoundaryErrorTesting、MouseEventChannelValidation、MouseConfigManagerValidation、MouseStateManagerValidation、FocusManagerValidation、InputValidation、KeyCodeValidation、LoggerValidation、PointerUtilValidation、ResourceLoaderValidation | 尺寸动画、边界错误、事件通道、配置、状态、焦点、输入、键码、日志、指针工具、资源加载 |
| Interaction | AccessibilityNavigation、ButtonInteraction、ContentScaling、DataBinding、PanelPositioning、EventHandling、EventPropagation、FocusNavigation、FocusRingBehavior、GestureRecognition、ThemeVariation、TouchInteraction、UIComponentRendering、VisualEffects | 焦点导航、按键/触摸/手势、事件分发、面板定位、内容缩放、主题与视觉效果 |
| LifecycleState | ConfigurationChanges、PanelLifecycle、SettingStateManagement、ErrorRecovery、ExceptionHandling、AbilityLifecycle、ResourceManagement、SessionManagement、StatePersistence、StateRecovery | 配置变更、面板/Ability 生命周期、状态管理/持久化/恢复、异常处理 |
| PerformanceStability | AnimationPerformance、ConcurrencyControl、LongTermStability、MemoryLeakDetection、PerformanceStress、ResourceConsumption、PointerPerformance | 动画性能、并发、长期稳定、内存泄漏、压力、资源与指针性能 |
| Integration | AdvancedScenarios、ComprehensiveRegression、DeviceCompatibility、IntegrationTesting、LocalizationTesting、DeviceConnectivity、PointerCompatibility、SystemIntegration、UserScenarios | 高级场景、回归、设备兼容、集成、本地化、连通性、系统集成 |
| Security | MouseSecurity、SecurityAccessibility、SecurityValidation | 安全访问、无障碍、安全校验 |

## 四、构建与运行

构建（DevEco Studio 26 / hvigor 6）：

```bash
hvigorw.bat --mode module -p product=default -p module=entry@default,entry@ohosTest assembleHap
```

安装测试包并运行：

```bash
hdc install entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap
hdc shell aa test -b ohos.samples.multimodalinput -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

## 五、验证结果

```
Tests run: 78, Failure: 0, Error: 0, Pass: 78, Ignore: 0
TestFinished-ResultCode: 0
```

## 六、约束

- 每个测试文件行数不少于对应参考文件原始行数（只增不减）。
- `*.test.ets` 合计约 56,000 行。
- 禁止 `console.log`，统一使用 `@ohos.hilog`。
- 所有 `.json5` 配置文件首部包含版权头。
