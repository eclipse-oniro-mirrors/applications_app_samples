# 系统负载

### 介绍

本示例使用 [Basic Services Kit 的 systemLoad 接口](https://gitcode.com/shicheny_01/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-resourceschedule-systemload.md) 展示系统性能功耗热融合档位，覆盖 `getLevel()`、监听注册、指定回调注销以及注销全部回调。

示例采用 ArkTS 和 Stage 模型，普通应用无需特殊权限即可运行。本机接口数据与八档模拟数据明确区分，页面同时展示监听状态、回调次数、最近回调记录和操作结果。

### 效果预览

应用首页展示档位名称、数值、含义及应用调度建议，档位卡片下方提供监听控制和回调记录。真机效果图需在设备上运行后获取。

### 使用说明

1. 启动应用后，默认查询本机系统负载并注册主监听器。
2. 在模拟数据模式下点击“上一档位”或“下一档位”，循环查看 `LOW`、`NORMAL`、`MEDIUM`、`HIGH`、`OVERHEATED`、`WARNING`、`EMERGENCY` 和 `ESCAPE`。
3. 在本机模式下注册副监听器，可观察两个回调各自的首次回调。通过指定注销按钮或“注销全部监听”管理监听生命周期。
4. 点击“本机信息”重新查询。查询失败时，页面明确提示失败并展示模拟回退数据。
5. 离开页面或退到后台时注销页面监听，回到前台后重新查询并注册主监听器。

### 工程目录

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
│           ├── List.test.ets
│           └── SystemLoadSdkTest.test.ets
└── library
    ├── Index.ets
    └── src/main/ets/systemload
        ├── feature/SystemLoadService.ets
        └── utils/Logger.ts
```

### 具体实现

1. [SystemLoadService.ets](library/src/main/ets/systemload/feature/SystemLoadService.ets) 直接封装 `getLevel()`、`on('systemLoadChange')`、指定回调的 `off()` 和不传回调的 `off()`，保留原始 SDK 异常，便于调用方和 XTS 验证接口契约。
2. [SystemLoadPage.ets](entry/src/main/ets/systemload/SystemLoadPage.ets) 将 8 种档位映射为中英文说明和应用调度建议，提供页面防重复操作、双回调记录、数据来源切换和生命周期清理。
3. 通过请求序号避免较早的异步查询结果覆盖用户后续选择。
4. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) 提供 8 条可重复的 UI/Mock 用例；[SystemLoadSdkTest.test.ets](entry/src/ohosTest/ets/test/SystemLoadSdk.test.ets) 提供 12 条真实 SDK 用例，断言合法档位和精确错误码。

### 测试

默认 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册 12 条真实 SDK 用例和 8 条 UI/Mock 用例，先执行真实 SDK 套件，避免页面监听器干扰注销全部用例。不支持 `SystemCapability.ResourceSchedule.SystemLoad` 的系统镜像不要运行真实套件。

真实用例直接调用系统接口，不假定固定设备档位，也不要求多次查询结果相等。监听用例验证真实注册和注销；由于自然档位变化不可控，不强制等待首次回调，但会校验测试期间实际收到的回调档位。注销全部用例在无参注销返回 401 时逐个注销已记录回调，再验证两个回调均能重新注册和正常注销。用例清单、执行结果和人工档位变化场景见 [ohosTest.md](ohosTest.md)。

### 相关权限

systemLoad 接口不需要申请权限。

### 依赖

不涉及其他 Sample 或第三方运行时依赖。

### 约束与限制

1. 本示例仅支持 Stage 模型，支持标准系统的模拟器和设备。
2. systemLoad 从 API 12 开始支持。本示例的 compileSdkVersion 为 26.1.0，compatibleSdkVersion 为 26.0.0。
3. 需要使用支持 API 26.1.0 SDK 的 DevEco Studio。
4. 本机档位和变化通知由设备系统提供。模拟档位和调度建议仅用于演示，不代表设备真实负载。
5. 自然档位变化需要可控设备或实验室环境，不得通过加压或使设备过热来制造 `WARNING`、`EMERGENCY` 或 `ESCAPE`。

### 下载

如需单独下载本工程，执行如下命令：

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/BackgroundTasks/SystemLoad/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/shicheny_01/applications_app_samples.git
git pull origin master
```
