# 注解

### 介绍

本示例使用 [Basic Services Kit 的 annotation 接口](https://gitcode.com/shicheny_01/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-annotation.md) 演示 `@Available` 版本检查和 `@SuppressWarnings` 告警抑制。

示例采用 ArkTS 和 Stage 模型，普通应用可在模拟器或本机直接运行，无需特殊硬件。本机模式读取系统 API 版本，模拟模式固定使用 API 21，以便稳定演示兼容性回退。

### 效果预览

应用首页展示运行环境 API 版本、注解起始版本、示例函数 API 版本、告警规则及示例结果。真机效果图需在设备上运行后获取。

### 使用说明

1. 启动应用后读取本机 API 版本。
2. 点击 `@Available` 卡片的“运行示例”，仅在系统支持 OpenHarmony 22 或更高版本时执行注解函数。
3. 点击 `@SuppressWarnings` 卡片的“运行示例”，示例抑制标记为 API 27 的函数产生的编译期兼容性告警，同时保留运行时版本判断。卡片分别展示注解起始版本（API 23）和示例函数 API 版本（27）。
4. 点击“模拟数据”切换至 API 21，验证两个示例均安全回退。
5. 点击“刷新”重新加载当前环境并重置示例结果。

### 工程目录

```text
Annotation
├── AppScope
│   └── app.json5
├── entry
│   └── src
│       ├── main
│       │   ├── ets
│       │   │   ├── entryability/EntryAbility.ets
│       │   │   ├── pages/Index.ets
│       │   │   └── annotation/AnnotationPage.ets
│       │   └── module.json5
│       └── ohosTest
│           └── ets
│               ├── test
│               │   ├── Ability.test.ets
│               │   ├── AnnotationApi.test.ets
│               │   ├── ConstantValidation.test.ets
│               │   ├── ApiVersionBoundary.test.ets
│               │   ├── AnnotationState.test.ets
│               │   ├── MockEnvironment.test.ets
│               │   ├── Robustness.test.ets
│               │   └── List.test.ets
│               ├── testability
│               └── TestRunner
└── library
    ├── Index.ets
    └── src/main/ets/annotation
        ├── feature/AnnotationService.ets
        └── utils/Logger.ts
```

### 具体实现

1. [AnnotationService.ets](library/src/main/ets/annotation/feature/AnnotationService.ets) 使用 `@Available` 标记函数，通过 `@SuppressWarnings` 抑制兼容性告警，并为每次调用保留运行时版本守卫。
2. 服务通过 `SuppressWarningsType` 返回 `compatibility`，`syscap` 和 `permission` 三种规则。
3. [AnnotationPage.ets](entry/src/main/ets/annotation/AnnotationPage.ets) 展示本机或模拟 API 版本，并呈现执行或回退结果。
4. [AnnotationApi.test.ets](entry/src/ohosTest/ets/test/AnnotationApi.test.ets) 提供接口级 XTS 用例，验证版本守卫、模拟回退、规则枚举和重复调用稳定性。
5. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) 提供 UI 自动化 XTS 用例，覆盖应用启动、环境展示、模拟数据、安全回退、重复执行、环境切换和刷新。
6. [ConstantValidation.test.ets](entry/src/ohosTest/ets/test/ConstantValidation.test.ets) 验证常量值、顺序关系和数组不可变性。
7. [ApiVersionBoundary.test.ets](entry/src/ohosTest/ets/test/ApiVersionBoundary.test.ets) 对 API 版本阈值进行边界矩阵测试。
8. [AnnotationState.test.ets](entry/src/ohosTest/ets/test/AnnotationState.test.ets) 验证环境切换时的状态机转换。
9. [MockEnvironment.test.ets](entry/src/ohosTest/ets/test/MockEnvironment.test.ets) 专项测试模拟环境行为。
10. [Robustness.test.ets](entry/src/ohosTest/ets/test/Robustness.test.ets) 验证容错能力和高频调用稳定性。
11. [AnnotationPerformanceDeep.test.ets](entry/src/ohosTest/ets/test/AnnotationPerformanceDeep.test.ets) 提供深度性能测试，包括内存泄漏检测、CPU/内存压力测试、响应时间百分位数、GC 影响、持续负载、并发访问、资源清理、峰值负载处理和长时间性能稳定性测试。
12. [ohosTest.md](ohosTest.md) 归档运行时测试场景，并列出需通过独立编译 fixture 验证的告警诊断场景。

### 相关权限

本示例不需要申请权限。抑制权限告警不会使应用获得相应权限。

### 依赖

不涉及其他 Sample 或第三方运行时依赖。

### 约束与限制

1. 本示例仅支持 Stage 模型，支持标准系统的模拟器和设备。
2. `@Available` 从 API 22 开始支持。`@SuppressWarnings` 和 `SuppressWarningsType` 从 API 23 开始支持，`PERMISSION` 规则从 API 26.0.0 开始支持。
3. 本示例的 compileSdkVersion 为 26.1.0，compatibleSdkVersion 为 26.0.0，需要使用支持 API 26.1.0 SDK 的 DevEco Studio。
4. 告警抑制仅影响编译诊断，不会增加运行时 API 支持，系统能力或权限。
5. 卡片中的两个版本含义不同：API 23 是 `@SuppressWarnings` 的起始版本，API 27 是用户自定义示例函数的 `minApiVersion`。27 大于 compatibleSdkVersion 26.0.0，用于特意触发可被抑制的兼容性告警，并非调用未来系统接口，在低于 API 27 的系统上不会执行。
6. 模拟模式固定使用 API 21，不代表设备的真实版本。

### 测试

本工程包含 134 个自动化测试用例，分布在 8 个测试套件中：

- **AnnotationApi.test.ets**：15 个 API 功能测试
- **Ability.test.ets**：8 个 UI 交互测试
- **ConstantValidation.test.ets**：17 个常量验证测试
- **ApiVersionBoundary.test.ets**：20 个边界值测试
- **AnnotationState.test.ets**：22 个状态机测试
- **MockEnvironment.test.ets**：22 个 Mock 环境测试
- **Robustness.test.ets**：20 个容错稳定性测试
- **AnnotationPerformanceDeep.test.ets**：10 个深度性能测试

#### AppFreeze 预防

所有性能测试用例都已优化，防止 THREAD_BLOCK_6S 错误：

- **总操作数降低**：83,500 → 3,100（⬇️ 96.3%）
- **主线程阻塞时间**：>6秒 → <1秒
- **迭代次数**：全部降低到安全范围（≤200）
- **延迟时间**：UI 测试从 500ms 降低到 100ms

详见 [ohosTest.md](ohosTest.md) 获取测试用例文档和 AppFreeze 修复记录。

### 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/DeviceManagement/Annotation/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/shicheny_01/applications_app_samples.git
git pull origin master
```
