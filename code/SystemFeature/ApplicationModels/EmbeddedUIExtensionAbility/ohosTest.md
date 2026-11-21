# EmbeddedUIExtensionAbility 测试说明

> 本说明面向 `EmbeddedUIExtensionAbility`（OpenHarmony 嵌入式 UI 扩展示例）工程，用于说明本工程 ohosTest 自动化测试的设计思路、覆盖维度与充分性依据。

## 1. 文档目标

本文档用于说明 `EmbeddedUIExtensionAbility` 自动化测试的设计思路、覆盖维度、充分性依据与后续扩展方向。文档聚焦"为什么这样设计测试"和"当前测试为何具备较强覆盖能力"，用于辅助代码评审、测试审计和后续扩展。

## 2. 测试设计原则

### 2.1 分层设计

测试基于 Hypium 框架（入口 `List.test.ets`，运行器 `OpenHarmonyTestRunner`，测试承载页 `TestAbility`），按以下层次拆分，避免所有用例堆叠在单一场景层：

- 共享驱动与模型层：`Shared/EmbeddedDriver.ets` 提供常量、串行化 UI 队列、按键/延时/焦点/文本等驱动能力；`Shared/EmbeddedModels.ets` 提供 `LifecycleStateMachine`、`SessionRegistry`、`ConfigProfile`、`TimingMeter`、`EventJournal`、`PayloadCodec`、`HealthProbe`、`ValueValidator`、`FocusPathModel`、`RetryPolicy`、`BoundedQueue`、`KeySequence`、`UiSnapshotModel`、`ResourceLedger`、`ExtensionDescriptorRegistry`、`ExtensionSummaryBuilder` 等可复用模型。
- 领域层：围绕扩展生命周期、会话、LocalStorage 共享、`page_show` 公共事件、Want 配置、EmbeddedComponent 等纯逻辑展开确定性校验，系统依赖通过模型对象隔离。
- 场景层：模拟宿主页面拉起、嵌入扩展页面渲染、会话创建/销毁、页面显示事件、焦点与按键交互等真实链路。
- 质量层：补充性能、长稳、并发、安全、无障碍、资源与边界等非功能维度。

这一分层设计确保测试既能覆盖基础行为正确性，也能覆盖复杂交互与质量属性。
