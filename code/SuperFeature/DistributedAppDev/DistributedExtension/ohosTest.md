# DistributedExtension 测试说明

本工程 ohosTest 覆盖 `entry/src/main/ets` 的全部导出能力：三个分布式接口的真机调用、纯函数层（编解码 / 格式化 / 日志 / 两条状态机）、文案与错误码映射，以及四个页面的 UI 冒烟。

## 一、测试环境

| 项 | 值 |
| --- | --- |
| 主设备 | dayu200，OpenHarmony 7.1.0.22 / API 26，`const.product.devicetype = default` |
| 交叉验证设备 | 同型设备，OpenHarmony 7.0.0.38 |
| SDK | `compileSdkVersion` / `targetSdkVersion` / `compatibleSdkVersion` 均为 `26.0.0` |
| runtimeOS | `OpenHarmony`（非静态工程，`products[0]` 显式写了 `compileSdkVersion`） |
| deviceTypes | `default` / `tablet` / `2in1`（OpenHarmony SDK 的 `ets/api/device-define` 没有 `phone`） |
| 被测应用 | `com.example.distributedextension` |
| 测试模块 | `entry_test`（`entry/src/ohosTest`） |
| 用例入口 | `entry/src/ohosTest/ets/test/List.test.ets` |
| 用例规模 | 66 个测试文件 + `List.test.ets`，共 3016 条 |

## 二、用例组织

按「分 - 总 + 质量轴」分六层，每层各钉一类对象：

| 层 | 文件数 | 条数 | 内容 |
| --- | ---: | ---: | --- |
| 第一层 纯逻辑与本地守卫 | 18 | 305 | 目录元数据、状态与错误码映射、链路 / 通道状态机、编解码、格式化、日志查询 |
| 第二层 分层细粒度矩阵 | 8 | 199 | 错误码九出口交叉、两条转移表逐格、编解码边界、日志网格、协同与目录交叉 |
| 第三层 组合大场景 | 2 | 34 | 跨模块流水线、20 个登记码串日志与统计、两条状态机脚本化多步、设备真调用组合 |
| 第四层 质量轴 | 6 | 180 | 性能上界、稳定性循环、非法输入、兼容常量、文案契约、失败恢复 |
| 第五层 设备真调用 | 2 | 46 | `bundleManager` 读回、syscap、枚举快照、`LinkRunner` / `ChannelRunner`、权限查询 |
| 第六层 页面 UI 冒烟 | 1 | 30 | 首页 6、扩展页 6、链路页 7、代理通道页 11 |

与执行相关的两条约定：

- **`List.test.ets` 只允许一种写法**：默认导入 `*.test` 模块 + 直接调用 `xxxTest();`。再多一个别的导入（连 `@ohos/hypium`、辅助模块都不行），IDE 静态扫描会清零并报 `00502002`。
- **每个 `describe` 注册 `beforeEachIt`**：调用 `util/TestTick.ets` 的 `tick()`，每 10 条用例 `await setTimeout(resolve, 1)` 让出主线程一次。延迟必须大于 0（`0 ms` 会被并进同一任务），否则 3000 条按每条约 10 ms 累计会触发 `THREAD_BLOCK_6S`，进程被杀（报告里表现为 `TestFinished-ResultMsg: App died`）。

## 三、执行步骤

### 1. 构建

```powershell
# 主模块
& "<DevEco>\tools\hvigor\bin\hvigorw.bat" --mode module `
  -p module=entry@default -p product=default assembleHap --no-daemon

# ohosTest 包
& "<DevEco>\tools\hvigor\bin\hvigorw.bat" --mode module `
  -p module=entry@ohosTest -p isOhosTest=true -p product=default -p buildMode=test assembleHap --no-daemon
```

`runtimeOS` 为 `OpenHarmony` 时命令行需要指向 OpenHarmony SDK：设置 `OHOS_BASE_SDK_HOME=%LOCALAPPDATA%\OpenHarmony\Sdk`，或在工程根写 `local.properties` 的 `sdk.dir`。

两个包必须出自同一次签名。若设备上已有另一套证书签的同名包，先 `hdc uninstall` 再装，否则报 `9568332 install sign info inconsistent`。

### 2. 安装

```powershell
hdc uninstall com.example.distributedextension
hdc install -r entry\build\default\outputs\default\entry-default-signed.hap
hdc install -r entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap
```

### 3. 命令行跑测

```powershell
hdc shell <test-subcommand> -b com.example.distributedextension -m entry_test `
  -s unittest OpenHarmonyTestRunner -s timeout 1800000 -w 1800000
```

> `<test-subcommand>` 换成设备镜像自带的应用自动化测试子命令，可在 `hdc shell` 里执行 `help` 查看。

结果看 `OHOS_REPORT_RESULT: stream=Tests run: ...`。

### 4. DevEco Studio

打开 `List.test.ets`，点 `testsuite` 左侧的运行按钮即可一次跑完；只跑单个套件时点对应 `describe` 左侧的按钮。

> IDE 一键跑全部套件靠 `testrunner/DistributedTestRunner.ets` 拉起 `TestAbility`，由 `testability/TestAbility.ets` 在前台生命周期结束之后再注册用例（见其中的 `REGISTER_DELAY_MS`）。3016 条用例注册要 7.7 ~ 8.0 秒，同步做会撞上 AAFWK 的 5 秒前台时限，报 `LIFECYCLE_TIMEOUT` 并带出 `00502002`「在包中未找到任何测试用例」；现在的顺序是先回前台回执、再注册，整包跑完约 150 秒。
>
> 框架按 `-s unittest OpenHarmonyTestRunner` 拼出 `ets/testrunner/OpenHarmonyTestRunner.abc`，所以这个文件名不能改，它只做转发，实现都在 `DistributedTestRunner.ets`。

### 5. 测试模块的 TestAbility 声明

`module.json5` 必须显式声明 `TestAbility`，不能指望 hvigor 注入。
hvigor 的 `isTemplatesAfterSourceCodeMigration()`（`hvigor-ohos-plugin/src/utils/ohos-test-util.js`）判定规则是：

- `module.json5` 的 `abilities` 非空且首项有 `srcEntry` → 认定为已手写，**不再注入**；
- 没有 `abilities`，但存在 `ets/testrunner/OpenHarmonyTestRunner.ets` → 认定为旧模板残留，**同样不再注入**。

本工程有 `testrunner/OpenHarmonyTestRunner.ets`，只能走第一种情况自己写全。漏写的表现是产物 `module.json` 里 `abilities` 为空，`aa test` 拉起 `entry_test/TestAbility` 时
BMS 报 `EQA no match com.example.distributedextension/entry_test/TestAbility`，用例一条都不执行，`aa test` 一直等待到 `-w` 超时。

```json5
"description": "$string:module_test_desc",
"mainElement": "TestAbility",
"abilities": [
  {
    "name": "TestAbility",
    "srcEntry": "./ets/testability/TestAbility.ets",
    "description": "$string:TestAbility_desc",
    "label": "$string:TestAbility_label",
    "exported": true,
    "startWindowIcon": "$media:startIcon",
    "startWindowBackground": "$color:start_window_background"
  }
]
```

`startWindowIcon` / `startWindowBackground` 在 schema 里是必填项（hvigor 注入时绕过了校验，手写绕不过），对应资源放在
`entry/src/ohosTest/resources/base/media/startIcon.svg` 与 `.../base/element/color.json`。因为 TestAbility 不加载页面，`pages` 字段不写。

验证产物（构建后应为 1 条）：

```powershell
node -e "const m=require('./entry/build/default/intermediates/package/ohosTest/module.json').module; console.log(m.abilities)"
```

## 四、测试结果

| 轮次 | 结果 |
| --- | --- |
| 7.1.0.22 第 1 轮 | `Tests run: 3016, Failure: 1, Error: 0, Pass: 3015, Ignore: 0`——`testLogQuery0020` 仍按旧的 `Logger.count`（只比 tag、忽略 source）断言，与「source + tag 同时匹配」的现行语义冲突 |
| 7.1.0.22 第 2 轮（修正断言后重跑） | `OHOS_REPORT_RESULT: stream=Tests run: 3016, Failure: 0, Error: 0, Pass: 3016, Ignore: 0` |
| 7.1.0.22 第 3 轮（同一产物连跑） | 同上 |
| 7.0.0.38（同型设备交叉验证） | 同上 |
| 11 月 10 日（测试文件拆分 + runner 重构后真机回归） | `OHOS_REPORT_RESULT: stream=Tests run: 3016, Failure: 0, Error: 0, Pass: 3016, Ignore: 0`，`OHOS_REPORT_CODE: 0`；命令与 IDE 一致，带 `-s timeout 15000` |
| 11 月 10 日（补齐版权头、`module.json5` 补 TestAbility 声明后卸载重装） | `OHOS_REPORT_RESULT: stream=Tests run: 3016, Failure: 0, Error: 0, Pass: 3016, Ignore: 0`，`OHOS_REPORT_CODE: 0` |

## 五、已知测试限制

- **跨设备链路需要两台真机**：`connect → connectResult → sendData → dataReceived` 已在两台真机上跑通，但单机能验到的最后一步是「服务端已启动」。设备用例因此只做本地守卫与超时保护，不假设一定连得上。
- **代理通道在被测镜像上打不开**：`openProxyChannel` 三个前提里「镜像提供 `push_service` 权限校验」无法满足，恒返 `32390101`。对端地址可以从「已配对 / 附近发现」列表填入，但换地址不影响结果。
- **分布式扩展不会被系统拉起**：普通应用签名（`apl: normal`）没有拉起路径，`onCollaborate` 的 ACCEPT / REJECT 只在页面上模拟，需配置为系统应用并在 profile 声明 ACL。
- **UI 冒烟单条耗时 1.5 ~ 5 秒**：默认 5 秒/条的预算不够，命令必须带 `-s timeout`，IDE 下发的是 `-s timeout 15000`；漏掉这条会让 `DistributedUiSmokeTest` 大面积报 `execute timeout 5000ms`，不是功能回归。
- **UI 冒烟依赖应用在前台且停在首页**：连跑多轮时若上一轮把页面留在子页，`backToHome` 会失败并让这一层整片报红。跑前先 `<ability-subcommand> force-stop` 再 `<ability-subcommand> start -a EntryAbility` 即可恢复（`<ability-subcommand>` 是设备镜像自带的应用管理子命令，可在 `hdc shell` 里执行 `help` 查看）。
- **广播 / 扫描按钮不纳入 UI 用例**：未授权时点击会拉起蓝牙栈并把测试进程带崩（`App died`），这部分失败路径由 `DistributedDevice.test.ets` 的 runner 用例覆盖。
- **权限状态影响设备用例分支**：两个权限都是 `user_grant`，未授权时接口返回 201 或抛无错误码异常（记为 -2）。用例对成功 / 抛错 / 超时三个分支各有断言，换一台权限状态不同的机器也不会假失败。

## 六、用例静态审计

```powershell
node scripts\audit-cases.js
```

检查项：`@tc.number` / `@tc.name` / `@tc.desc` 是否齐全，`@tc.name` 与 `it()` 是否同名，`@tc.number` 与 `it()` 名是否全局唯一，每条用例是否至少 3 处 `expect(`，是否出现 `expect(true)` / `assertEqual(true)` / `expect(typeof x)` 这类恒真或弱断言，单行是否超过 120 字符，每个测试文件是否都在 `List.test.ets` 里注册。

当前输出：`文件 72 个，用例 3016 条，审计通过：0 违规`。
