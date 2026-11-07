# 系统负载

## 介绍

本示例使用 [Basic Services Kit 的 systemLoad 接口](https://gitcode.com/shicheny_01/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-resourceschedule-systemload.md) 展示系统性能、功耗和热状态融合档位，覆盖 `getLevel()`、监听注册、指定回调注销以及注销全部回调。

示例采用 ArkTS 和 Stage 模型，普通应用无需特殊权限即可运行。本机接口数据与八档模拟数据明确区分，页面同时展示监听状态、回调次数、最近回调记录和操作结果。

## 效果预览

应用首页展示档位名称、数值、含义及应用调度建议，档位卡片下方提供监听控制和回调记录。真机效果图需在设备上运行后获取。

## 使用说明

1. 启动应用后，默认查询本机系统负载并注册主监听器。
2. 在模拟数据模式下点击“上一档位”或“下一档位”，循环查看 `LOW`、`NORMAL`、`MEDIUM`、`HIGH`、`OVERHEATED`、`WARNING`、`EMERGENCY` 和 `ESCAPE`。
3. 在本机数据模式下注册副监听器，可观察两个回调各自的独立初始回调。通过指定注销按钮或“注销全部”管理监听生命周期。
4. 点击“本机信息”重新查询。查询失败时，页面明确提示失败并展示模拟回退（fallback）数据。
5. 离开页面或退到后台时注销页面监听，回到前台后重新查询并注册主监听器。

## 工程目录

```text
SystemLoad
├── AppScope
│   └── app.json5
├── entry
│   └── src
│       ├── main
│       │   ├── ets
│       │   │   ├── entryability/EntryAbility.ets
│       │   │   ├── pages/Index.ets
│       │   │   └── systemload/SystemLoadPage.ets
│       │   └── module.json5
│       └── ohosTest/ets/test
│           ├── Ability.test.ets
│           ├── AccessibilityPerformance.test.ets
│           ├── CallbackDataValidation.test.ets
│           ├── Comprehensive.test.ets
│           ├── ConcurrencySafety.test.ets
│           ├── Extended.test.ets
│           ├── I18nTheme.test.ets
│           ├── Level2Extended.test.ets
│           ├── Level3Extended.test.ets
│           ├── ListenerStateManagement.test.ets
│           ├── List.test.ets
│           ├── PerformanceSecurity.test.ets
│           ├── SkillCompletion.test.ets
│           ├── SystemLoadSdk.test.ets
│           ├── UIComponentState.test.ets
│           ├── UIInteraction.test.ets
│           └── Utils.test.ets
└── library
    ├── Index.ets
    └── src/main/ets/systemload
        ├── feature/SystemLoadService.ets
        └── utils/Logger.ts
```

## 具体实现

1. [SystemLoadService.ets](library/src/main/ets/systemload/feature/SystemLoadService.ets) 直接封装 `getLevel()`、`on('systemLoadChange')`、指定回调的 `off()` 和无参的 `off()`，保留原始 SDK 异常，便于调用方和 XTS 验证接口契约。
2. [SystemLoadPage.ets](entry/src/main/ets/systemload/SystemLoadPage.ets) 将 8 种档位映射为中英文说明和应用调度建议，提供防止重复操作、双回调记录、数据来源切换和生命周期清理。
3. 通过请求 ID（Request ID）避免较早的异步查询结果覆盖用户后续选择。
4. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) 提供 21 条可复现的 UI/Mock 用例；[SystemLoadSdk.test.ets](entry/src/ohosTest/ets/test/SystemLoadSdk.test.ets) 提供 20 条真实 SDK 用例，断言合法档位和精确错误码；[Utils.test.ets](entry/src/ohosTest/ets/test/Utils.test.ets) 提供 38 条工具函数测试用例；[Extended.test.ets](entry/src/ohosTest/ets/test/Extended.test.ets) 提供 10 条高级测试用例，覆盖并发和边界场景；[SkillCompletion.test.ets](entry/src/ohosTest/ets/test/SkillCompletion.test.ets) 提供 12 条基于 Skill 规范的测试用例，覆盖生命周期、错误恢复、数据一致性和监听器状态管理；[Level3Extended.test.ets](entry/src/ohosTest/ets/test/Level3Extended.test.ets) 提供 21 条 Level 3 测试用例，覆盖并发、性能、压力测试、边界值、页面状态和 UI 状态；[Level2Extended.test.ets](entry/src/ohosTest/ets/test/Level2Extended.test.ets) 提供 8 条 Level 2 测试用例，覆盖错误处理和资源清理；[UIInteraction.test.ets](entry/src/ohosTest/ets/test/UIInteraction.test.ets) 提供 9 条 Level 3 测试用例，覆盖 UI 交互和数据源管理；[Comprehensive.test.ets](entry/src/ohosTest/ets/test/Comprehensive.test.ets) 提供 52 条综合测试用例，覆盖状态机、边界值、空数据、重复操作、生命周期和数据源切换；[PerformanceSecurity.test.ets](entry/src/ohosTest/ets/test/PerformanceSecurity.test.ets) 提供 18 条测试用例，覆盖性能、稳定性、安全性、权限、兼容性和本地化；[CallbackDataValidation.test.ets](entry/src/ohosTest/ets/test/CallbackDataValidation.test.ets) 提供 7 条测试用例，覆盖回调数据验证、页面状态同步和请求 ID 防重；[ListenerStateManagement.test.ets](entry/src/ohosTest/ets/test/ListenerStateManagement.test.ets) 提供 8 条测试用例，覆盖监听器订阅状态、回调记录管理和等级映射；[UIComponentState.test.ets](entry/src/ohosTest/ets/test/UIComponentState.test.ets) 提供 9 条测试用例，覆盖 UI 组件状态、模拟数据循环和数据源切换；[ConcurrencySafety.test.ets](entry/src/ohosTest/ets/test/ConcurrencySafety.test.ets) 提供 4 条测试用例，覆盖并发安全和异常恢复；[I18nTheme.test.ets](entry/src/ohosTest/ets/test/I18nTheme.test.ets) 提供 4 条测试用例，覆盖国际化和主题适配；[AccessibilityPerformance.test.ets](entry/src/ohosTest/ets/test/AccessibilityPerformance.test.ets) 提供 5 条测试用例，覆盖 a11y（无障碍）和性能基准。

## 测试

默认 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册 248 条测试用例，分布在 16 个测试套件中：

- **真实 SDK 套件**（20 条）：测试真实系统接口调用，断言合法档位和精确错误码
- **UI/模拟套件**（25 条）：测试 UI 交互和模拟数据功能
- **工具类套件**（38 条）：测试字符串、日期、验证、随机数和设备操作等工具函数
- **扩展套件**（10 条）：测试并发和高频操作等高级场景
- **Skill 补全套件**（12 条）：测试生命周期管理、错误恢复、数据一致性和监听器状态
- **Level 3 扩展套件**（21 条）：测试并发、性能、压力测试、边界值、页面状态和 UI 状态
- **Level 2 扩展套件**（8 条）：测试错误处理和资源清理
- **UI 交互套件**（9 条）：测试 UI 交互和数据源管理
- **综合测试套件**（52 条）：测试状态机、边界值、空数据、重复操作、生命周期和数据源切换
- **性能与安全性套件**（18 条）：测试性能、稳定性、安全性、权限、兼容性和本地化
- **回调数据验证套件**（7 条）：测试回调数据验证、页面状态同步和请求 ID 防重
- **监听器状态管理套件**（8 条）：测试监听器订阅状态、回调记录管理和等级映射
- **UI 组件状态套件**（9 条）：测试 UI 组件状态、模拟数据循环和数据源切换
- **并发安全套件**（4 条）：测试并发安全和异常恢复
- **国际化与主题套件**（4 条）：测试国际化和主题适配
- **a11y 与性能套件**（5 条）：测试 a11y（无障碍）和性能基准

先执行真实 SDK 套件，避免页面监听器干扰注销全部用例。不支持 `SystemCapability.ResourceSchedule.SystemLoad` 的系统镜像不要运行真实套件。

真实用例直接调用系统接口，不假定固定设备档位，也不要求多次查询结果相等。监听用例验证真实注册和注销；由于自然发生的档位变化不可控，不强制等待初始回调，但会校验测试期间实际收到的回调档位。注销全部用例在无参 `off()` 返回 401 时，逐个注销已记录回调，再验证两个回调均能重新注册和正常注销。用例清单、执行结果和人工档位变化场景见 [ohosTest.md](ohosTest.md)。

## 相关权限

systemLoad 接口不需要申请权限。

## 依赖

无额外 Sample 或第三方运行时依赖。

## 约束与限制

1. 本示例仅支持 Stage 模型，支持标准系统的模拟器和设备。
2. systemLoad 从 API 12 开始支持。本示例的 compileSdkVersion 为 26.1.0，compatibleSdkVersion 为 26.0.0。
3. 需要使用支持 API 26.1.0 SDK 的 DevEco Studio。
4. 本机档位和变化通知由设备系统提供。模拟档位和调度建议仅用于演示，不代表设备真实负载。
5. 自然发生的档位变化需要可控设备或实验室环境，不得通过加压或使设备过热来触发 `WARNING`、`EMERGENCY` 或 `ESCAPE`。

## 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/BackgroundTasks/SystemLoad/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/shicheny_01/applications_app_samples.git
git pull origin master
```
