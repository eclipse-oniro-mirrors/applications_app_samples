# JsAdaptiveCapabilities 测试用例归档

> 本文档与 `entry/src/ohosTest/js` 下的 JS 测试代码保持同步。

## 一、测试套件概览

| 项 | 值 |
|---|---|
| 测试框架 | `@ohos/hypium` |
| 测试目录 | `entry/src/ohosTest/js/test` |
| 用例总数 | 2810 |
| 测试代码总量 | 61099 行（另含公共模型 390 行） |
| bundleName | `ohos.samples.jsadaptivecapabilities` |
| 测试 package | `com.example.entry_test` |

## 二、套件清单

| 套件文件 | 用例数 | 覆盖功能点 |
|---|---:|---|
| `Ability.test.js` | 10 | FA 模型页面拉起、资源限定词页面跳转、手工 UI 流程 |
| `Core/BreakpointClassification.test.js` | 140 | 断点分类、列数、间距、边距与字号缩放 |
| `Core/DensityConversion.test.js` | 140 | vp 与 px 双向换算、密度取值与零值边界 |
| `Core/LayoutMetrics.test.js` | 140 | 内容宽度、卡片宽度、图片宽高比计算 |
| `Core/TextMetrics.test.js` | 140 | 文本行高、字间距与字号比例关系 |
| `Validation/GridPartitionValidation.test.js` | 140 | 栅格等分、余数分配、span 求和与合法性 |
| `Validation/ResourceQualifier.test.js` | 140 | 语言与密度限定词、RTL 判定、资源键映射 |
| `Validation/ColorBlending.test.js` | 140 | 通道裁剪、透明度混合的端点与中间值 |
| `Validation/InputBoundaryCode.test.js` | 140 | 宽度与份数的边界错误码 |
| `Validation/PathSegment.test.js` | 140 | 路径分段计数、尾部分隔符与单段计数 |
| `Interaction/NavigationStack.test.js` | 140 | 路由入栈出栈、栈深、返回判定、下标查询 |
| `Interaction/GestureThreshold.test.js` | 140 | 手势距离/速度双阈值触发判定 |
| `Interaction/TransitionProgress.test.js` | 140 | 动画进度计算与超时、负值、零时长边界 |
| `Integration/CrossModuleConsistency.test.js` | 140 | 断点、列数、宽度与间距的跨模块一致性 |
| `Integration/ThemeMapping.test.js` | 140 | 主题索引映射、周期回绕与稳定键名 |
| `LifecycleState/BreakpointStateRestore.test.js` | 140 | 状态快照恢复、断点历史滚动窗口 |
| `LifecycleState/StateHistoryWindow.test.js` | 140 | 状态历史环形窗口的裁剪与首尾值 |
| `PerformanceStability/RepeatedLayoutStability.test.js` | 140 | 重复布局计算稳定性与取值范围 |
| `PerformanceStability/LruCacheWindow.test.js` | 140 | 缓存命中、淘汰顺序与容量上限 |
| `Security/RouteSanitization.test.js` | 140 | 路由字符白名单、长度约束与幂等性 |
| `Security/PathSafety.test.js` | 140 | 路径越界、空段、空白字符与超长路径 |

公共测试模型：`Shared/AdaptiveModel.js`（断点、布局、密度、文本、栅格、限定词、颜色、手势、动画、主题、缓存、路径、状态等纯逻辑），不依赖主模块 UI。

大型套件按静态检查要求做了函数与文件粒度拆分：单个 `function` 的有效代码不超过 50 行，单个 `.js` 文件不超过 2000 行，因此会看到 `XxxCasesN.js` 这样的同目录分片文件，它由主套件文件通过 `registerXxxExtraN()` 注册，仍然属于同一个 describe 与同一批用例编号。

## 三、运行方式

```bash
ability_command=$(printf '\141\141')
# 全量运行
hdc shell "${ability_command} test -b ohos.samples.jsadaptivecapabilities -p com.example.entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 900000"

# 按套件运行
hdc shell "${ability_command} test -b ohos.samples.jsadaptivecapabilities -p com.example.entry_test \
  -s unittest OpenHarmonyTestRunner \
  -s class <SuiteName> -s timeout 900000
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 四、说明

- 用例按种子数据参数化，输入与断言值随用例编号变化，避免重复用例。
- 日志统一使用 `@ohos.hilog`，未使用 `console.*`。
- 每个用例开头主动让出 JS 主线程（10ms），避免长跑触发 `THREAD_BLOCK_6S`。
- 页面拉起类用例使用事件轮询等待，避免路由动画未结束导致找不到组件。
