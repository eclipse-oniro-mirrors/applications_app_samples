# NBody 测试用例归档

## 验证范围

1. 本工程采用 Stage 模型和 ArkTS，主模块为 `entry`，测试模块为 `entry_test`。
2. 测试覆盖 N-Body 五天体状态初始化、动量平衡、机械能计算、时间积分、零/正/负/大小步长，以及 TaskPool、Worker 和 AppStorage/UI 结果链路。
3. 数值回归用例通过独立 Worker 执行，避免生产模型的模块级可变状态在套件之间污染。
4. 平台用例同时验证真实 `CalculateWorker.ts`、真实 TaskPool、页面组件、重复计算提示和 `timeCost` 状态绑定。
5. 最新真机全量回归：**1,634 条执行，1,634 条通过，失败 0，错误 0**。
6. 测试设备为已连接的 OpenHarmony API 26 设备；主 HAP 和 `ohosTest` HAP 必须同时安装。
7. 测试窗口开启 `setWindowKeepScreenOn(true)`；UI 启动前唤醒屏幕，组件不可见时执行一次有限的恢复动作。设备仍处于密码锁定时，测试会失败，不会转化为通过。

## 测试套件总览

当前测试代码位于 `entry/src/ohosTest/ets/test`，数值回归文件位于 `Numerical` 子目录，平台集成文件位于 `Platform`。

| 测试类别 | 文件数 | 用例数 | 覆盖内容 |
|---|---:|---:|---|
| Balanced | 12 | 257 | 动量平衡后的正向轨迹、初始/中点/终点能量 |
| Raw | 12 | 231 | 未执行动量平衡的初始状态与轨迹 |
| Reverse | 11 | 233 | 负时间步积分 |
| Small | 11 | 211 | 小时间步积分和能量稳定性 |
| Large | 11 | 254 | 较大时间步及有限数值检查 |
| Zero | 11 | 223 | `dt=0` 状态不变和能量恒等 |
| Partitioned | 11 | 217 | 分段积分、中点/终点和重复读取一致性 |
| Platform | 1 | 8 | 常量、TaskPool、Worker、UI、AppStorage、重复操作提示 |
| **合计** | **80** | **1,634** | **全部通过** |

## 测试工程结构

```text
entry/src/ohosTest/ets/
|---test
|   |---List.test.ets                 // 测试套件入口
|   |---Platform
|   |   |---NBodyPlatform.test.ets    // 真实平台和 UI 集成测试
|   |---Numerical
|       |---NBodyBalancedRegression*.test.ets
|       |---NBodyRawRegression*.test.ets
|       |---NBodyReverseRegression*.test.ets
|       |---NBodySmallRegression*.test.ets
|       |---NBodyLargeRegression*.test.ets
|       |---NBodyZeroRegression*.test.ets
|       |---NBodyPartitionedRegression*.test.ets
|   |---Shared
|       |---NBodyHarness.ets           // Worker、UI、资源和状态辅助函数
|---testability
|   |---TestAbility.ets                // 测试 Ability，负责保亮和启动 Hypium
|   |---pages/Index.ets
|---testrunner
|   |---OpenHarmonyTestRunner.ts
|---workers
    |---NBodyProbe.ts                  // 数值回归 Worker
    |---ProductionWorker.ts            // 测试模块中的生产 Worker 入口
```

## 用例设计说明

### 1. 数值模型

每条数值用例创建独立 Worker，执行以下检查：

- 根据 `mode` 决定是否调用 `offsetMomentum()`。
- 记录初始机械能。
- 执行一半时间步并记录中点机械能。
- 执行剩余时间步并记录终点机械能。
- 重复读取终点能量，确认读取操作没有改变模型状态。
- 检查返回步数、时间步、Worker 请求次数、有限数值和误差阈值。

数值回归要求计算值与预期值之差的模小于 `2e-11`。预期值由独立向量积分基准生成，不从被测模块读取。

### 2. 平台与业务流程

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入/操作 | 预期输出 | 最近结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_PLATFORM_0100 | nbodyPlatform001 | 工作量常量 | 测试模块可导入 `Constants` | 读取 TaskPool 与 Worker 步数 | 分别为 5,000,000 和 50,000,000 | Pass |
| SUB_NBODY_PLATFORM_0200 | nbodyPlatform002 | TaskPool 执行 | 测试模块可创建 TaskPool | 执行 `computeTask(10)` | 返回有限、非负、整数毫秒数 | Pass |
| SUB_NBODY_PLATFORM_0300 | nbodyPlatform003 | 生产 Worker 协议 | 测试 HAP 已安装 | 发送 `timeSteps=10` | 返回有效计算耗时 | Pass |
| SUB_NBODY_PLATFORM_0400 | nbodyPlatform004 | TaskPool 状态发布 | AppStorage 可用 | 调用 `computeNBodyByTaskPool(10)` | `timeCost` 为 `Total time costed = N ms.` | Pass |
| SUB_NBODY_PLATFORM_0500 | nbodyPlatform005 | 首页和资源 | 主 HAP 已启动、测试窗口已解锁 | 等待首页稳定 | 图片、标题、消息、两个按钮均可见，资源文案正确 | Pass |
| SUB_NBODY_PLATFORM_0600 | nbodyPlatform006 | 状态绑定 | 首页就绪 | 写入 `timeCost` | 页面消息与 AppStorage 内容一致 | Pass |
| SUB_NBODY_PLATFORM_0700 | nbodyPlatform007 | 忙碌状态提示 | 首页就绪 | 设置计算中状态，重复点击两个按钮，执行短 TaskPool 任务 | 两次均弹出提示，关闭后显示计算结果 | Pass |
| SUB_NBODY_PLATFORM_0800 | nbodyPlatform008 | Worker 结果显示 | 首页就绪 | 设置计算中状态，执行生产 Worker 短任务并发布结果 | 页面显示耗时结果，且与 AppStorage 一致 | Pass |

### 3. 共享测试基础设施

`NBodyHarness.ets` 提供以下公共能力：

- `runIsolatedTrajectory()`：独立数值 Worker 和超时回收。
- `runProductionWorker()`：测试模块入口下的生产 Worker 验证。
- `runSerializedUiOperation()`：串行化 UiTest 操作，避免 UI API 并发进入。
- `waitForPageStable()`：等待五个核心组件，设备不可见时有限恢复一次。
- `waitForCalculationResult()`：等待并校验耗时文本格式。
- `waitForDialog()` / `dismissDialog()`：重复计算提示验证。
- `assertPageResources()`：验证页面标题和按钮资源文本。
- `assertResultMatchesStorage()`：验证页面与 `AppStorage` 状态一致。

## 运行方式

### 编译

使用 DevEco Studio 自带 Hvigor 工具链编译主模块和测试模块：

```text
entry@default
entry@ohosTest
```

两个模块均应输出 `BUILD SUCCESSFUL`。测试运行前必须安装：

```text
entry-default-signed.hap
entry-ohosTest-signed.hap
```

### 执行

在 DevEco Studio 中选择已连接的测试设备，打开 `entry/src/ohosTest/ets/test/List.test.ets`，通过测试运行入口执行全部套件。运行配置使用应用包名 `com.example.nbody`、测试模块 `entry_test` 和测试运行器 `OpenHarmonyTestRunner`。

测试结果以 `OHOS_REPORT_STATUS_CODE` 为准：`0` 为通过，负数为失败或错误。

## 最近一次真机结果

```text
Tests run: 1634, Failure: 0, Error: 0, Pass: 1634, Ignore: 0
```

结果文件：

- `docs/test-adaptation/device-runs/full-screen-lifecycle-fix.log`
- `docs/test-adaptation/device-runs/full-screen-lifecycle-fix.json`
- `docs/test-adaptation/device-runs/Fix_Report.md`

## 约束与边界

1. 数值回归验证的是 NBody 计算模型和数值稳定性，不等同于默认 5,000,000/50,000,000 步完整性能基准。
2. 平台 UI 用例使用短任务验证 UI 状态链路，避免长时间性能任务污染页面回归；工作量常量由平台001独立校验。
3. UI 用例依赖主 HAP 与测试 HAP 同时安装，单独安装测试 HAP 会导致首页组件查找失败。
4. 测试日志统一使用 `@ohos.hilog`，源码中禁止 `console.log`。
5. Worker 路径必须区分主模块 `entry` 和测试模块 `entry_test`；生产 Worker 通过 `ProductionWorker.ts` 测试入口复用。

## 完整数值用例表

以下按 `List.test.ets` 注册顺序列出 79 个数值套件的全部 1,626 条用例；平台 8 条见上文。
每例均校验初始/中点/终点能量、重复读取恒等、步数和时间步回传、有限值及单次 Worker 请求。
表中 Pass 来自上述最近一次全量真机记录，不代表未来每次执行的结果。

### NBodyBalancedRegression01Test

源码：[NBodyBalancedRegression01Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression01Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0100 | nBodyBalancedRegression01Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=2；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516379566512/-0.16907516376280382，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0200 | nBodyBalancedRegression01Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=3；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516379566512/-0.16907516372994089，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0300 | nBodyBalancedRegression01Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=4；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516376280382/-0.16907516369707612，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0400 | nBodyBalancedRegression01Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=5；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516376280382/-0.16907516366420963，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0500 | nBodyBalancedRegression01Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=6；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516372994089/-0.16907516363134123，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0600 | nBodyBalancedRegression01Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=7；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516372994089/-0.16907516359847125，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0700 | nBodyBalancedRegression01Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=8；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516369707612/-0.16907516356559932，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0800 | nBodyBalancedRegression01Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=9；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516369707612/-0.16907516353272575，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_0900 | nBodyBalancedRegression01Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=10；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516366420963/-0.1690751634998505，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1000 | nBodyBalancedRegression01Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=11；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516366420963/-0.16907516346697327，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1100 | nBodyBalancedRegression01Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=12；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516363134123/-0.16907516343409434，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1200 | nBodyBalancedRegression01Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=13；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516363134123/-0.16907516340121373，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1300 | nBodyBalancedRegression01Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=14；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516359847125/-0.1690751633683313，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1400 | nBodyBalancedRegression01Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=15；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516359847125/-0.16907516333544706，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1500 | nBodyBalancedRegression01Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=16；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516356559932/-0.16907516330256117，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1600 | nBodyBalancedRegression01Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=17；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516356559932/-0.16907516326967348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION01TEST_1700 | nBodyBalancedRegression01Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=18；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516353272575/-0.169075163236784，误差<2e-11 | Pass |

### NBodyRawRegression02Test

源码：[NBodyRawRegression02Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression02Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0100 | nBodyRawRegression02Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=19；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899030984768/-0.16928990278783562，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0200 | nBodyRawRegression02Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=20；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899030674204/-0.16928990275676184，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0300 | nBodyRawRegression02Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=21；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899030674204/-0.16928990272568664，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0400 | nBodyRawRegression02Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=22；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990303636224/-0.16928990269460956，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0500 | nBodyRawRegression02Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=23；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990303636224/-0.1692899026635306，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0600 | nBodyRawRegression02Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=24；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990300530242/-0.1692899026324501，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0700 | nBodyRawRegression02Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=25；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990300530242/-0.1692899026013678，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0800 | nBodyRawRegression02Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=26；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.169289902974241/-0.16928990257028392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_0900 | nBodyRawRegression02Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=27；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.169289902974241/-0.16928990253919815，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1000 | nBodyRawRegression02Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=28；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899029431777/-0.1692899025081107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1100 | nBodyRawRegression02Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=29；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899029431777/-0.1692899024770215，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1200 | nBodyRawRegression02Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=30；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990291211277/-0.16928990244593062，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1300 | nBodyRawRegression02Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=31；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990291211277/-0.16928990241483793，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1400 | nBodyRawRegression02Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=32；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990288104603/-0.1692899023837435，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1500 | nBodyRawRegression02Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=33；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990288104603/-0.1692899023526475，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1600 | nBodyRawRegression02Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=34；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990284997766/-0.1692899023215496，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION02TEST_1700 | nBodyRawRegression02Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=35；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990284997766/-0.16928990229045007，误差<2e-11 | Pass |

### NBodyZeroRegression03Test

源码：[NBodyZeroRegression03Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression03Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0100 | nBodyZeroRegression03Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=35；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0200 | nBodyZeroRegression03Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=36；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0300 | nBodyZeroRegression03Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=37；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0400 | nBodyZeroRegression03Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=38；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0500 | nBodyZeroRegression03Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=39；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0600 | nBodyZeroRegression03Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=40；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0700 | nBodyZeroRegression03Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=41；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0800 | nBodyZeroRegression03Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=42；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_0900 | nBodyZeroRegression03Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=43；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1000 | nBodyZeroRegression03Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=44；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1100 | nBodyZeroRegression03Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=45；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1200 | nBodyZeroRegression03Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=46；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1300 | nBodyZeroRegression03Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=47；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1400 | nBodyZeroRegression03Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=48；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1500 | nBodyZeroRegression03Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=49；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1600 | nBodyZeroRegression03Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=50；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION03TEST_1700 | nBodyZeroRegression03Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=51；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression04Test

源码：[NBodyReverseRegression04Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression04Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0100 | nBodyReverseRegression04Test001 | 负时间步积分 | 独立 Worker 初态 | steps=53；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751629746966/-0.16907516208929496，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0200 | nBodyReverseRegression04Test002 | 负时间步积分 | 独立 Worker 初态 | steps=54；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516294188088/-0.1690751620565272，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0300 | nBodyReverseRegression04Test003 | 负时间步积分 | 独立 Worker 初态 | steps=55；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516294188088/-0.16907516202376108，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0400 | nBodyReverseRegression04Test004 | 负时间步积分 | 独立 Worker 初态 | steps=56；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516290906707/-0.16907516199099676，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0500 | nBodyReverseRegression04Test005 | 负时间步积分 | 独立 Worker 初态 | steps=57；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516290906707/-0.16907516195823433，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0600 | nBodyReverseRegression04Test006 | 负时间步积分 | 独立 Worker 初态 | steps=58；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751628762549/-0.1690751619254735，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0700 | nBodyReverseRegression04Test007 | 负时间步积分 | 独立 Worker 初态 | steps=59；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751628762549/-0.1690751618927146，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0800 | nBodyReverseRegression04Test008 | 负时间步积分 | 独立 Worker 初态 | steps=60；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516284344445/-0.1690751618599575，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_0900 | nBodyReverseRegression04Test009 | 负时间步积分 | 独立 Worker 初态 | steps=61；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516284344445/-0.16907516182720195，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1000 | nBodyReverseRegression04Test010 | 负时间步积分 | 独立 Worker 初态 | steps=62；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751628106359/-0.16907516179444834，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1100 | nBodyReverseRegression04Test011 | 负时间步积分 | 独立 Worker 初态 | steps=63；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751628106359/-0.16907516176169646，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1200 | nBodyReverseRegression04Test012 | 负时间步积分 | 独立 Worker 初态 | steps=64；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516277782922/-0.1690751617289465，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1300 | nBodyReverseRegression04Test013 | 负时间步积分 | 独立 Worker 初态 | steps=65；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516277782922/-0.1690751616961981，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1400 | nBodyReverseRegression04Test014 | 负时间步积分 | 独立 Worker 初态 | steps=66；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516274502415/-0.1690751616634517，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1500 | nBodyReverseRegression04Test015 | 负时间步积分 | 独立 Worker 初态 | steps=67；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516274502415/-0.1690751616307068，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1600 | nBodyReverseRegression04Test016 | 负时间步积分 | 独立 Worker 初态 | steps=68；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516271222076/-0.16907516159796385，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION04TEST_1700 | nBodyReverseRegression04Test017 | 负时间步积分 | 独立 Worker 初态 | steps=69；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516271222076/-0.16907516156522262，误差<2e-11 | Pass |

### NBodySmallRegression05Test

源码：[NBodySmallRegression05Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression05Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0100 | nBodySmallRegression05Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=70；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852333/-0.1690751638285222，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0200 | nBodySmallRegression05Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=71；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852333/-0.16907516382852222，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0300 | nBodySmallRegression05Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=72；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285234/-0.16907516382852233，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0400 | nBodySmallRegression05Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=73；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285234/-0.16907516382852222，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0500 | nBodySmallRegression05Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=74；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852342/-0.1690751638285221，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0600 | nBodySmallRegression05Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=75；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852342/-0.16907516382852203，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0700 | nBodySmallRegression05Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=76；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852328/-0.16907516382852195，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0800 | nBodySmallRegression05Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=77；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852328/-0.169075163828522，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_0900 | nBodySmallRegression05Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=78；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852322/-0.16907516382852195，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1000 | nBodySmallRegression05Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=79；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852322/-0.16907516382852192，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1100 | nBodySmallRegression05Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=80；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852325/-0.16907516382852195，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1200 | nBodySmallRegression05Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=81；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852325/-0.1690751638285218，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1300 | nBodySmallRegression05Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=82；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852317/-0.1690751638285218，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1400 | nBodySmallRegression05Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=83；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852317/-0.16907516382852178，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1500 | nBodySmallRegression05Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=84；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852317/-0.16907516382852175，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1600 | nBodySmallRegression05Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=85；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852317/-0.1690751638285218，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION05TEST_1700 | nBodySmallRegression05Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=86；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852322/-0.1690751638285217，误差<2e-11 | Pass |

### NBodyLargeRegression06Test

源码：[NBodyLargeRegression06Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression06Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0100 | nBodyLargeRegression06Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=87；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907502098219002/-0.169074871550161，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0200 | nBodyLargeRegression06Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=88；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.169075017622025/-0.16907486811697536，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0300 | nBodyLargeRegression06Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=89；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.169075017622025/-0.16907486468217753，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0400 | nBodyLargeRegression06Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=90；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907501426015598/-0.16907486124576962，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0500 | nBodyLargeRegression06Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=91；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907501426015598/-0.1690748578077539，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0600 | nBodyLargeRegression06Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=92；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907501089658467/-0.1690748543681323，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0700 | nBodyLargeRegression06Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=93；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907501089658467/-0.16907485092690716，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0800 | nBodyLargeRegression06Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=94；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690750075313135/-0.1690748474840806，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_0900 | nBodyLargeRegression06Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=95；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690750075313135/-0.16907484403965467，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1000 | nBodyLargeRegression06Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=96；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907500416434412/-0.1690748405936315，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1100 | nBodyLargeRegression06Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=97；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907500416434412/-0.1690748371460135，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1200 | nBodyLargeRegression06Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=98；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690750007956789/-0.16907483369680257，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1300 | nBodyLargeRegression06Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=99；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690750007956789/-0.16907483024600106，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1400 | nBodyLargeRegression06Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=100；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690749974253195/-0.16907482679361102，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1500 | nBodyLargeRegression06Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=101；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690749974253195/-0.16907482333963436，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1600 | nBodyLargeRegression06Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=102；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690749940532687/-0.1690748198840736，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1700 | nBodyLargeRegression06Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=103；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690749940532687/-0.16907481642693098，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION06TEST_1800 | nBodyLargeRegression06Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=104；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690749906795277/-0.1690748129682084，误差<2e-11 | Pass |

### NBodyPartitionedRegression07Test

源码：[NBodyPartitionedRegression07Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression07Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0100 | nBodyPartitionedRegression07Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=105；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516211749238/-0.16907516036866183，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0200 | nBodyPartitionedRegression07Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=106；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516208454115/-0.1690751603356178，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0300 | nBodyPartitionedRegression07Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=107；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516208454115/-0.1690751603025718，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0400 | nBodyPartitionedRegression07Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=108；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516205158832/-0.16907516026952432，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0500 | nBodyPartitionedRegression07Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=109；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516205158832/-0.16907516023647493，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0600 | nBodyPartitionedRegression07Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=110；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516201863354/-0.16907516020342384，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0700 | nBodyPartitionedRegression07Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=111；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516201863354/-0.16907516017037091，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0800 | nBodyPartitionedRegression07Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=112；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516198567707/-0.1690751601373163，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_0900 | nBodyPartitionedRegression07Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=113；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516198567707/-0.16907516010426005，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1000 | nBodyPartitionedRegression07Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=114；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516195271893/-0.16907516007120202，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1100 | nBodyPartitionedRegression07Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=115；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516195271893/-0.169075160038142，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1200 | nBodyPartitionedRegression07Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=116；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516191975894/-0.16907516000508047，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1300 | nBodyPartitionedRegression07Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=117；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516191975894/-0.16907515997201714，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1400 | nBodyPartitionedRegression07Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=118；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516188679717/-0.169075159938952，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1500 | nBodyPartitionedRegression07Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=119；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516188679717/-0.1690751599058853，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1600 | nBodyPartitionedRegression07Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=120；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751618538337/-0.1690751598728167，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION07TEST_1700 | nBodyPartitionedRegression07Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=121；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751618538337/-0.16907515983974636，误差<2e-11 | Pass |

### NBodyBalancedRegression08Test

源码：[NBodyBalancedRegression08Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression08Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0100 | nBodyBalancedRegression08Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=122；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516182086849/-0.1690751598066743，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0200 | nBodyBalancedRegression08Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=123；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516182086849/-0.16907515977360063，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0300 | nBodyBalancedRegression08Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=124；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751617879016/-0.1690751597405251，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0400 | nBodyBalancedRegression08Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=125；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751617879016/-0.16907515970744783，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0500 | nBodyBalancedRegression08Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=126；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516175493273/-0.16907515967436873，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0600 | nBodyBalancedRegression08Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=127；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516175493273/-0.16907515964128803，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0700 | nBodyBalancedRegression08Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=128；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516172196219/-0.16907515960820552，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0800 | nBodyBalancedRegression08Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=129；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516172196219/-0.16907515957512118，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_0900 | nBodyBalancedRegression08Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=130；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516168899003/-0.16907515954203534，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1000 | nBodyBalancedRegression08Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=131；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516168899003/-0.16907515950894747，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1100 | nBodyBalancedRegression08Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=132；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516165601602/-0.16907515947585802，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1200 | nBodyBalancedRegression08Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=133；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516165601602/-0.1690751594427669，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1300 | nBodyBalancedRegression08Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=134；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751616230402/-0.16907515940967377，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1400 | nBodyBalancedRegression08Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=135；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751616230402/-0.16907515937657897，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1500 | nBodyBalancedRegression08Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=136；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516159006272/-0.16907515934348263，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1600 | nBodyBalancedRegression08Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=137；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516159006272/-0.16907515931038433，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION08TEST_1700 | nBodyBalancedRegression08Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=138；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516155708338/-0.16907515927728453，误差<2e-11 | Pass |

### NBodyRawRegression09Test

源码：[NBodyRawRegression09Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression09Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0100 | nBodyRawRegression09Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=139；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899012320398/-0.16928989904670627，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0200 | nBodyRawRegression09Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=140；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899012008798/-0.16928989901542651，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0300 | nBodyRawRegression09Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=141；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899012008798/-0.16928989898414487，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0400 | nBodyRawRegression09Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=142；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899011697183/-0.1692898989528617，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0500 | nBodyRawRegression09Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=143；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.1692899011697183/-0.1692898989215767，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0600 | nBodyRawRegression09Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=144；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990113855508/-0.1692898988902902，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0700 | nBodyRawRegression09Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=145；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990113855508/-0.16928989885900184，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0800 | nBodyRawRegression09Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=146；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990110739003/-0.16928989882771153，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_0900 | nBodyRawRegression09Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=147；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990110739003/-0.16928989879641984，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1000 | nBodyRawRegression09Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=148；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990107622338/-0.16928989876512646，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1100 | nBodyRawRegression09Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=149；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990107622338/-0.1692898987338313，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1200 | nBodyRawRegression09Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=150；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990104505479/-0.16928989870253447，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1300 | nBodyRawRegression09Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=151；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990104505479/-0.16928989867123592，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1400 | nBodyRawRegression09Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=152；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990101388472/-0.1692898986399356，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1500 | nBodyRawRegression09Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=153；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990101388472/-0.16928989860863364，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1600 | nBodyRawRegression09Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=154；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990098271282/-0.16928989857732982，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION09TEST_1700 | nBodyRawRegression09Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=155；dt=0.000125 | 初/中/末能量=-0.1692899033779057/-0.16928990098271282/-0.16928989854602447，误差<2e-11 | Pass |

### NBodyZeroRegression10Test

源码：[NBodyZeroRegression10Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression10Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0100 | nBodyZeroRegression10Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=155；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0200 | nBodyZeroRegression10Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=156；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0300 | nBodyZeroRegression10Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=157；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0400 | nBodyZeroRegression10Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=158；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0500 | nBodyZeroRegression10Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=159；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0600 | nBodyZeroRegression10Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=160；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0700 | nBodyZeroRegression10Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=161；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0800 | nBodyZeroRegression10Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=162；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_0900 | nBodyZeroRegression10Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=163；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1000 | nBodyZeroRegression10Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=164；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1100 | nBodyZeroRegression10Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=165；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1200 | nBodyZeroRegression10Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=166；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1300 | nBodyZeroRegression10Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=167；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1400 | nBodyZeroRegression10Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=168；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1500 | nBodyZeroRegression10Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=169；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1600 | nBodyZeroRegression10Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=170；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1700 | nBodyZeroRegression10Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=171；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1800 | nBodyZeroRegression10Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=172；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_1900 | nBodyZeroRegression10Test019 | 零时间步恒等 | 独立 Worker 初态 | steps=173；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION10TEST_2000 | nBodyZeroRegression10Test020 | 零时间步恒等 | 独立 Worker 初态 | steps=174；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression11Test

源码：[NBodyReverseRegression11Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression11Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0100 | nBodyReverseRegression11Test001 | 负时间步积分 | 独立 Worker 初态 | steps=176；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516094347783/-0.1690751580722232，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0200 | nBodyReverseRegression11Test002 | 负时间步积分 | 独立 Worker 初态 | steps=177；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516094347783/-0.16907515803967504，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0300 | nBodyReverseRegression11Test003 | 负时间步积分 | 独立 Worker 初态 | steps=178；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751609107722/-0.16907515800712863，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0400 | nBodyReverseRegression11Test004 | 负时间步积分 | 独立 Worker 初态 | steps=179；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751609107722/-0.16907515797458406，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0500 | nBodyReverseRegression11Test005 | 负时间步积分 | 独立 Worker 初态 | steps=180；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516087806845/-0.16907515794204148，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0600 | nBodyReverseRegression11Test006 | 负时间步积分 | 独立 Worker 初态 | steps=181；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516087806845/-0.1690751579095005，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0700 | nBodyReverseRegression11Test007 | 负时间步积分 | 独立 Worker 初态 | steps=182；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516084536642/-0.16907515787696129，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0800 | nBodyReverseRegression11Test008 | 负时间步积分 | 独立 Worker 初态 | steps=183；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516084536642/-0.16907515784442417，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_0900 | nBodyReverseRegression11Test009 | 负时间步积分 | 独立 Worker 初态 | steps=184；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516081266613/-0.16907515781188862，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1000 | nBodyReverseRegression11Test010 | 负时间步积分 | 独立 Worker 初态 | steps=185；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516081266613/-0.16907515777935467，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1100 | nBodyReverseRegression11Test011 | 负时间步积分 | 独立 Worker 初态 | steps=186；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516077996745/-0.16907515774682289，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1200 | nBodyReverseRegression11Test012 | 负时间步积分 | 独立 Worker 初态 | steps=187；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516077996745/-0.1690751577142927，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1300 | nBodyReverseRegression11Test013 | 负时间步积分 | 独立 Worker 初态 | steps=188；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516074727091/-0.16907515768176434，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1400 | nBodyReverseRegression11Test014 | 负时间步积分 | 独立 Worker 初态 | steps=189；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516074727091/-0.1690751576492378，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1500 | nBodyReverseRegression11Test015 | 负时间步积分 | 独立 Worker 初态 | steps=190；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516071457585/-0.16907515761671302，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1600 | nBodyReverseRegression11Test016 | 负时间步积分 | 独立 Worker 初态 | steps=191；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516071457585/-0.16907515758419012，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1700 | nBodyReverseRegression11Test017 | 负时间步积分 | 独立 Worker 初态 | steps=192；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516068188286/-0.16907515755166888，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1800 | nBodyReverseRegression11Test018 | 负时间步积分 | 独立 Worker 初态 | steps=193；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516068188286/-0.1690751575191497，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_1900 | nBodyReverseRegression11Test019 | 负时间步积分 | 独立 Worker 初态 | steps=194；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516064919145/-0.16907515748663204，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2000 | nBodyReverseRegression11Test020 | 负时间步积分 | 独立 Worker 初态 | steps=195；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516064919145/-0.1690751574541164，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2100 | nBodyReverseRegression11Test021 | 负时间步积分 | 独立 Worker 初态 | steps=196；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516061650193/-0.16907515742160248，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2200 | nBodyReverseRegression11Test022 | 负时间步积分 | 独立 Worker 初态 | steps=197；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516061650193/-0.16907515738909026，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2300 | nBodyReverseRegression11Test023 | 负时间步积分 | 独立 Worker 初态 | steps=198；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516058381414/-0.16907515735657994，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION11TEST_2400 | nBodyReverseRegression11Test024 | 负时间步积分 | 独立 Worker 初态 | steps=199；dt=-0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907516058381414/-0.1690751573240714，误差<2e-11 | Pass |

### NBodySmallRegression12Test

源码：[NBodySmallRegression12Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression12Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0100 | nBodySmallRegression12Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=200；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285212/-0.169075163828518，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0200 | nBodySmallRegression12Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=201；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285212/-0.16907516382851803，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0300 | nBodySmallRegression12Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=202；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852125/-0.16907516382851787，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0400 | nBodySmallRegression12Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=203；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852125/-0.1690751638285179，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0500 | nBodySmallRegression12Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=204；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285212/-0.16907516382851778，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0600 | nBodySmallRegression12Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=205；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285212/-0.16907516382851784，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0700 | nBodySmallRegression12Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=206；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852106/-0.1690751638285178，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0800 | nBodySmallRegression12Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=207；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852106/-0.16907516382851784，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_0900 | nBodySmallRegression12Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=208；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852109/-0.16907516382851773，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1000 | nBodySmallRegression12Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=209；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852109/-0.16907516382851762，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1100 | nBodySmallRegression12Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=210；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852097/-0.16907516382851767，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1200 | nBodySmallRegression12Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=211；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852097/-0.16907516382851764，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1300 | nBodySmallRegression12Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=212；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852106/-0.16907516382851773，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1400 | nBodySmallRegression12Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=213；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852106/-0.1690751638285176，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1500 | nBodySmallRegression12Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=214；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852109/-0.16907516382851756，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1600 | nBodySmallRegression12Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=215；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852109/-0.1690751638285173，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1700 | nBodySmallRegression12Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=216；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852097/-0.16907516382851745，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1800 | nBodySmallRegression12Test018 | 微小时间步积分 | 独立 Worker 初态 | steps=217；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852097/-0.16907516382851745，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_1900 | nBodySmallRegression12Test019 | 微小时间步积分 | 独立 Worker 初态 | steps=218；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852095/-0.16907516382851734，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_2000 | nBodySmallRegression12Test020 | 微小时间步积分 | 独立 Worker 初态 | steps=219；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852095/-0.16907516382851742，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_2100 | nBodySmallRegression12Test021 | 微小时间步积分 | 独立 Worker 初态 | steps=220；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285208/-0.16907516382851742，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_2200 | nBodySmallRegression12Test022 | 微小时间步积分 | 独立 Worker 初态 | steps=221；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285208/-0.16907516382851734，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION12TEST_2300 | nBodySmallRegression12Test023 | 微小时间步积分 | 独立 Worker 初态 | steps=222；dt=1.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852092/-0.16907516382851723，误差<2e-11 | Pass |

### NBodyLargeRegression13Test

源码：[NBodyLargeRegression13Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression13Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0100 | nBodyLargeRegression13Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=223；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907478871309686/-0.16907439074249403，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0200 | nBodyLargeRegression13Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=224；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907478524181374/-0.16907438711053077，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0300 | nBodyLargeRegression13Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=225；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907478524181374/-0.16907438347726483，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0400 | nBodyLargeRegression13Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=226；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747817689704/-0.1690743798426985，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0500 | nBodyLargeRegression13Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=227；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747817689704/-0.16907437620683438，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0600 | nBodyLargeRegression13Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=228；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747782945689/-0.16907437256967467，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0700 | nBodyLargeRegression13Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=229；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747782945689/-0.16907436893122196，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0800 | nBodyLargeRegression13Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=230；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907477481861158/-0.1690743652914785，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_0900 | nBodyLargeRegression13Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=231；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907477481861158/-0.1690743616504468，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1000 | nBodyLargeRegression13Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=232；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907477134110072/-0.16907435800812945，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1100 | nBodyLargeRegression13Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=233；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907477134110072/-0.16907435436452842，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1200 | nBodyLargeRegression13Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=234；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907476786203826/-0.16907435071964647，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1300 | nBodyLargeRegression13Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=235；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907476786203826/-0.16907434707348606，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1400 | nBodyLargeRegression13Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=236；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747643814264/-0.16907434342604938，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1500 | nBodyLargeRegression13Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=237；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.1690747643814264/-0.16907433977733893，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1600 | nBodyLargeRegression13Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=238；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907476089926757/-0.1690743361273573，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION13TEST_1700 | nBodyLargeRegression13Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=239；dt=0.00125 | 初/中/末能量=-0.16907516382852453/-0.16907476089926757/-0.16907433247610676，误差<2e-11 | Pass |

### NBodyPartitionedRegression14Test

源码：[NBodyPartitionedRegression14Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression14Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0100 | nBodyPartitionedRegression14Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=240；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751598728167/-0.1690751558919752，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0200 | nBodyPartitionedRegression14Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=241；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751598728167/-0.1690751558586969，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0300 | nBodyPartitionedRegression14Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=242；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515983974636/-0.16907515582541682，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0400 | nBodyPartitionedRegression14Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=243；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515983974636/-0.1690751557921351，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0500 | nBodyPartitionedRegression14Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=244；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751598066743/-0.1690751557588516，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0600 | nBodyPartitionedRegression14Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=245；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751598066743/-0.16907515572556633，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0700 | nBodyPartitionedRegression14Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=246；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515977360063/-0.16907515569227943，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0800 | nBodyPartitionedRegression14Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=247；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515977360063/-0.1690751556589908，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_0900 | nBodyPartitionedRegression14Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=248；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751597405251/-0.16907515562570047，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1000 | nBodyPartitionedRegression14Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=249；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.1690751597405251/-0.16907515559240832，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1100 | nBodyPartitionedRegression14Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=250；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515970744783/-0.16907515555911462，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1200 | nBodyPartitionedRegression14Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=251；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515970744783/-0.16907515552581912，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1300 | nBodyPartitionedRegression14Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=252；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515967436873/-0.16907515549252192，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1400 | nBodyPartitionedRegression14Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=253；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515967436873/-0.169075155459223，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1500 | nBodyPartitionedRegression14Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=254；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515964128803/-0.16907515542592222，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1600 | nBodyPartitionedRegression14Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=255；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515964128803/-0.16907515539261975，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION14TEST_1700 | nBodyPartitionedRegression14Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=256；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515960820552/-0.16907515535931578，误差<2e-11 | Pass |

### NBodyBalancedRegression15Test

源码：[NBodyBalancedRegression15Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression15Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0100 | nBodyBalancedRegression15Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=257；dt=0.000125 | 初/中/末能量=-0.16907516382852453/-0.16907515960820552/-0.16907515532601，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0200 | nBodyBalancedRegression15Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=1；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.169075163697091，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0300 | nBodyBalancedRegression15Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=2；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075163697091/-0.16907516356564345，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0400 | nBodyBalancedRegression15Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=3；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075163697091/-0.1690751634341816，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0500 | nBodyBalancedRegression15Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=4；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516356564345/-0.1690751633027056，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0600 | nBodyBalancedRegression15Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=5；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516356564345/-0.16907516317121557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0700 | nBodyBalancedRegression15Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=6；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751634341816/-0.1690751630397112，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0800 | nBodyBalancedRegression15Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=7；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751634341816/-0.1690751629081928，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_0900 | nBodyBalancedRegression15Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=8；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751633027056/-0.16907516277666015，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1000 | nBodyBalancedRegression15Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=9；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751633027056/-0.1690751626451134，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1100 | nBodyBalancedRegression15Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=10；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516317121557/-0.1690751625135523，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1200 | nBodyBalancedRegression15Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=11；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516317121557/-0.16907516238197737，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1300 | nBodyBalancedRegression15Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=12；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751630397112/-0.16907516225038835，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1400 | nBodyBalancedRegression15Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=13；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751630397112/-0.16907516211878504，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1500 | nBodyBalancedRegression15Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=14；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751629081928/-0.1690751619871675，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1600 | nBodyBalancedRegression15Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=15；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751629081928/-0.16907516185553587，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION15TEST_1700 | nBodyBalancedRegression15Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=16；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907516277666015/-0.16907516172389017，误差<2e-11 | Pass |

### NBodyRawRegression16Test

源码：[NBodyRawRegression16Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression16Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0100 | nBodyRawRegression16Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=17；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990238424818/-0.1692899012653233，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0200 | nBodyRawRegression16Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=18；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990225997861/-0.16928990114092904，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0300 | nBodyRawRegression16Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=19；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990225997861/-0.16928990101652125，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0400 | nBodyRawRegression16Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=20；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990213569514/-0.16928990089209922，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0500 | nBodyRawRegression16Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=21；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990213569514/-0.1692899007676637，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0600 | nBodyRawRegression16Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=22；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899020113979/-0.16928990064321417，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0700 | nBodyRawRegression16Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=23；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899020113979/-0.16928990051875098，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0800 | nBodyRawRegression16Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=24；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990188708684/-0.1692899003942738，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_0900 | nBodyRawRegression16Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=25；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990188708684/-0.16928990026978288，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1000 | nBodyRawRegression16Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=26；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990176276182/-0.1692899001452782，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1100 | nBodyRawRegression16Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=27；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990176276182/-0.16928990002075966，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1200 | nBodyRawRegression16Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=28；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899016384229/-0.16928989989622736，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1300 | nBodyRawRegression16Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=29；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899016384229/-0.16928989977168127，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1400 | nBodyRawRegression16Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=30；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990151407022/-0.16928989964712127，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1500 | nBodyRawRegression16Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=31；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990151407022/-0.16928989952254755，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1600 | nBodyRawRegression16Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=32；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990138970373/-0.16928989939796005，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1700 | nBodyRawRegression16Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=33；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990138970373/-0.16928989927335883，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1800 | nBodyRawRegression16Test018 | 未平衡初态积分 | 独立 Worker 初态 | steps=34；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899012653233/-0.16928989914874373，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_1900 | nBodyRawRegression16Test019 | 未平衡初态积分 | 独立 Worker 初态 | steps=35；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692899012653233/-0.16928989902411473，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_2000 | nBodyRawRegression16Test020 | 未平衡初态积分 | 独立 Worker 初态 | steps=36；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990114092904/-0.1692898988994721，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_2100 | nBodyRawRegression16Test021 | 未平衡初态积分 | 独立 Worker 初态 | steps=37；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990114092904/-0.16928989877481562，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_2200 | nBodyRawRegression16Test022 | 未平衡初态积分 | 独立 Worker 初态 | steps=38；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990101652125/-0.16928989865014546，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_2300 | nBodyRawRegression16Test023 | 未平衡初态积分 | 独立 Worker 初态 | steps=39；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990101652125/-0.16928989852546153，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION16TEST_2400 | nBodyRawRegression16Test024 | 未平衡初态积分 | 独立 Worker 初态 | steps=40；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928990089209922/-0.1692898984007637，误差<2e-11 | Pass |

### NBodyZeroRegression17Test

源码：[NBodyZeroRegression17Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression17Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0100 | nBodyZeroRegression17Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=297；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0200 | nBodyZeroRegression17Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=298；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0300 | nBodyZeroRegression17Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=299；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0400 | nBodyZeroRegression17Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=300；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0500 | nBodyZeroRegression17Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=301；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0600 | nBodyZeroRegression17Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=302；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0700 | nBodyZeroRegression17Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=303；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0800 | nBodyZeroRegression17Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=304；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_0900 | nBodyZeroRegression17Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=305；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1000 | nBodyZeroRegression17Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=306；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1100 | nBodyZeroRegression17Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=307；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1200 | nBodyZeroRegression17Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=308；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1300 | nBodyZeroRegression17Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=309；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1400 | nBodyZeroRegression17Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=310；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1500 | nBodyZeroRegression17Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=311；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1600 | nBodyZeroRegression17Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=312；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1700 | nBodyZeroRegression17Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=313；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1800 | nBodyZeroRegression17Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=314；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_1900 | nBodyZeroRegression17Test019 | 零时间步恒等 | 独立 Worker 初态 | steps=315；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_2000 | nBodyZeroRegression17Test020 | 零时间步恒等 | 独立 Worker 初态 | steps=316；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_2100 | nBodyZeroRegression17Test021 | 零时间步恒等 | 独立 Worker 初态 | steps=317；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION17TEST_2200 | nBodyZeroRegression17Test022 | 零时间步恒等 | 独立 Worker 初态 | steps=318；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression18Test

源码：[NBodyReverseRegression18Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression18Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0100 | nBodyReverseRegression18Test001 | 负时间步积分 | 独立 Worker 初态 | steps=63；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515976011903/-0.16907515557477687，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0200 | nBodyReverseRegression18Test002 | 负时间步积分 | 独立 Worker 初态 | steps=64；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515962910666/-0.1690751554442201，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0300 | nBodyReverseRegression18Test003 | 负时间步积分 | 独立 Worker 初态 | steps=65；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515962910666/-0.16907515531367767，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0400 | nBodyReverseRegression18Test004 | 负时间步积分 | 独立 Worker 初态 | steps=66；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515949810847/-0.1690751551831495，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0500 | nBodyReverseRegression18Test005 | 负时间步积分 | 独立 Worker 初态 | steps=67；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515949810847/-0.1690751550526356，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0600 | nBodyReverseRegression18Test006 | 负时间步积分 | 独立 Worker 初态 | steps=68；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515936712453/-0.16907515492213604，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0700 | nBodyReverseRegression18Test007 | 负时间步积分 | 独立 Worker 初态 | steps=69；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515936712453/-0.1690751547916508，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0800 | nBodyReverseRegression18Test008 | 负时间步积分 | 独立 Worker 初态 | steps=70；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515923615477/-0.16907515466117976，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_0900 | nBodyReverseRegression18Test009 | 负时间步积分 | 独立 Worker 初态 | steps=71；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515923615477/-0.1690751545307232，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1000 | nBodyReverseRegression18Test010 | 负时间步积分 | 独立 Worker 初态 | steps=72；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515910519916/-0.16907515440028098，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1100 | nBodyReverseRegression18Test011 | 负时间步积分 | 独立 Worker 初态 | steps=73；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515910519916/-0.1690751542698528，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1200 | nBodyReverseRegression18Test012 | 负时间步积分 | 独立 Worker 初态 | steps=74；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515897425765/-0.1690751541394392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1300 | nBodyReverseRegression18Test013 | 负时间步积分 | 独立 Worker 初态 | steps=75；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515897425765/-0.1690751540090396，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1400 | nBodyReverseRegression18Test014 | 负时间步积分 | 独立 Worker 初态 | steps=76；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515884333038/-0.1690751538786546，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1500 | nBodyReverseRegression18Test015 | 负时间步积分 | 独立 Worker 初态 | steps=77；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515884333038/-0.1690751537482839，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1600 | nBodyReverseRegression18Test016 | 负时间步积分 | 独立 Worker 初态 | steps=78；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515871241746/-0.16907515361792758，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1700 | nBodyReverseRegression18Test017 | 负时间步积分 | 独立 Worker 初态 | steps=79；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515871241746/-0.16907515348758545，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1800 | nBodyReverseRegression18Test018 | 负时间步积分 | 独立 Worker 初态 | steps=80；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515858151873/-0.16907515335725773，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_1900 | nBodyReverseRegression18Test019 | 负时间步积分 | 独立 Worker 初态 | steps=81；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515858151873/-0.16907515322694439，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2000 | nBodyReverseRegression18Test020 | 负时间步积分 | 独立 Worker 初态 | steps=82；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751584506342/-0.16907515309664525，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2100 | nBodyReverseRegression18Test021 | 负时间步积分 | 独立 Worker 初态 | steps=83；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751584506342/-0.1690751529663605，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2200 | nBodyReverseRegression18Test022 | 负时间步积分 | 独立 Worker 初态 | steps=84；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515831976383/-0.16907515283609012，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2300 | nBodyReverseRegression18Test023 | 负时间步积分 | 独立 Worker 初态 | steps=85；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515831976383/-0.16907515270583423，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2400 | nBodyReverseRegression18Test024 | 负时间步积分 | 独立 Worker 初态 | steps=86；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515818890773/-0.16907515257559252，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2500 | nBodyReverseRegression18Test025 | 负时间步积分 | 独立 Worker 初态 | steps=87；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515818890773/-0.16907515244536528，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2600 | nBodyReverseRegression18Test026 | 负时间步积分 | 独立 Worker 初态 | steps=88；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751580580658/-0.16907515231515235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2700 | nBodyReverseRegression18Test027 | 负时间步积分 | 独立 Worker 初态 | steps=89；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751580580658/-0.16907515218495384，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2800 | nBodyReverseRegression18Test028 | 负时间步积分 | 独立 Worker 初态 | steps=90；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751579272382/-0.1690751520547695，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_2900 | nBodyReverseRegression18Test029 | 负时间步积分 | 独立 Worker 初态 | steps=91；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751579272382/-0.16907515192459974，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_3000 | nBodyReverseRegression18Test030 | 负时间步积分 | 独立 Worker 初态 | steps=92；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515779642482/-0.16907515179444424，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION18TEST_3100 | nBodyReverseRegression18Test031 | 负时间步积分 | 独立 Worker 初态 | steps=93；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515779642482/-0.16907515166430312，误差<2e-11 | Pass |

### NBodySmallRegression19Test

源码：[NBodySmallRegression19Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression19Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0100 | nBodySmallRegression19Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=94；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851842/-0.16907516382851218，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0200 | nBodySmallRegression19Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=95；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851842/-0.16907516382851207，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0300 | nBodySmallRegression19Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=96；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851823/-0.16907516382851198，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0400 | nBodySmallRegression19Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=97；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851823/-0.16907516382851176，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0500 | nBodySmallRegression19Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=98；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851812/-0.16907516382851154，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0600 | nBodySmallRegression19Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=99；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851812/-0.16907516382851143，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0700 | nBodySmallRegression19Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=100；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851806/-0.16907516382851126，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0800 | nBodySmallRegression19Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=101；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851806/-0.16907516382851112，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_0900 | nBodySmallRegression19Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=102；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851787/-0.16907516382851107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1000 | nBodySmallRegression19Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=103；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851787/-0.16907516382851107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1100 | nBodySmallRegression19Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=104；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851756/-0.16907516382851084，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1200 | nBodySmallRegression19Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=105；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851756/-0.1690751638285108，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1300 | nBodySmallRegression19Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=106；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285175/-0.1690751638285107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1400 | nBodySmallRegression19Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=107；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285175/-0.16907516382851037，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1500 | nBodySmallRegression19Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=108；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851728/-0.16907516382851032，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1600 | nBodySmallRegression19Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=109；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851728/-0.16907516382851012，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1700 | nBodySmallRegression19Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=110；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851717/-0.16907516382850993，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION19TEST_1800 | nBodySmallRegression19Test018 | 微小时间步积分 | 独立 Worker 初态 | steps=111；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851717/-0.16907516382850984，误差<2e-11 | Pass |

### NBodyLargeRegression20Test

源码：[NBodyLargeRegression20Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression20Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0100 | nBodyLargeRegression20Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=112；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907440677227953/-0.169073609967235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0200 | nBodyLargeRegression20Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=113；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907440677227953/-0.16907359541579342，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0300 | nBodyLargeRegression20Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=114；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743928739424/-0.16907358085375393，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0400 | nBodyLargeRegression20Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=115；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743928739424/-0.16907356628115505，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0500 | nBodyLargeRegression20Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=116；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907437896294744/-0.16907355169803528，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0600 | nBodyLargeRegression20Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=117；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907437896294744/-0.16907353710443346，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0700 | nBodyLargeRegression20Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=118；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907436503932985/-0.1690735225003879，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0800 | nBodyLargeRegression20Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=119；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907436503932985/-0.16907350788593778，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_0900 | nBodyLargeRegression20Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=120；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907435110312477/-0.1690734932611216，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1000 | nBodyLargeRegression20Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=121；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907435110312477/-0.16907347862597852，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1100 | nBodyLargeRegression20Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=122；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743371543673/-0.16907346398054698，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1200 | nBodyLargeRegression20Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=123；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743371543673/-0.1690734493248666，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1300 | nBodyLargeRegression20Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=124；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907432319309243/-0.16907343465897579，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1400 | nBodyLargeRegression20Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=125；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907432319309243/-0.1690734199829141，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1500 | nBodyLargeRegression20Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=126；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743092193356/-0.16907340529672035，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1600 | nBodyLargeRegression20Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=127；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690743092193356/-0.16907339060043383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1700 | nBodyLargeRegression20Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=128；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690742952331323/-0.1690733758940939，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1800 | nBodyLargeRegression20Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=129；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690742952331323/-0.16907336117773974，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_1900 | nBodyLargeRegression20Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=130；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907428123451773/-0.16907334645141073，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_2000 | nBodyLargeRegression20Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=131；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907428123451773/-0.1690733317151464，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_2100 | nBodyLargeRegression20Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=132；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907426722352745/-0.16907331696898598，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_2200 | nBodyLargeRegression20Test022 | 较大时间步积分 | 独立 Worker 初态 | steps=133；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907426722352745/-0.1690733022129693，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION20TEST_2300 | nBodyLargeRegression20Test023 | 较大时间步积分 | 独立 Worker 初态 | steps=134；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907425320019712/-0.1690732874471356，误差<2e-11 | Pass |

### NBodyPartitionedRegression21Test

源码：[NBodyPartitionedRegression21Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression21Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0100 | nBodyPartitionedRegression21Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=135；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751549913032/-0.16907514595810613，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0200 | nBodyPartitionedRegression21Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=136；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751548589274/-0.16907514582478847，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0300 | nBodyPartitionedRegression21Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=137；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751548589274/-0.16907514569145696，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0400 | nBodyPartitionedRegression21Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=138；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751547265376/-0.16907514555811173，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0500 | nBodyPartitionedRegression21Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=139；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751547265376/-0.16907514542475272，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0600 | nBodyPartitionedRegression21Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=140；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515459413366/-0.16907514529137999，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0700 | nBodyPartitionedRegression21Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=141；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515459413366/-0.16907514515799357，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0800 | nBodyPartitionedRegression21Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=142；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075154461716/-0.1690751450245933，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_0900 | nBodyPartitionedRegression21Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=143；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075154461716/-0.16907514489117947，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1000 | nBodyPartitionedRegression21Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=144；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751543292844/-0.16907514475775187，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1100 | nBodyPartitionedRegression21Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=145；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751543292844/-0.16907514462431053，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1200 | nBodyPartitionedRegression21Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=146；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515419683866/-0.16907514449085542，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1300 | nBodyPartitionedRegression21Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=147；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515419683866/-0.16907514435738671，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1400 | nBodyPartitionedRegression21Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=148；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751540643792/-0.1690751442239043，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1500 | nBodyPartitionedRegression21Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=149；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751540643792/-0.169075144090408，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1600 | nBodyPartitionedRegression21Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=150；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515393190561/-0.16907514395689816，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION21TEST_1700 | nBodyPartitionedRegression21Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=151；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515393190561/-0.16907514382337457，误差<2e-11 | Pass |

### NBodyBalancedRegression22Test

源码：[NBodyBalancedRegression22Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression22Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0100 | nBodyBalancedRegression22Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=152；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751537994182/-0.16907514368983742，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0200 | nBodyBalancedRegression22Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=153；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751537994182/-0.16907514355628653，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0300 | nBodyBalancedRegression22Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=154；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751536669168/-0.16907514342272187，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0400 | nBodyBalancedRegression22Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=155；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751536669168/-0.1690751432891435，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0500 | nBodyBalancedRegression22Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=156；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515353440158/-0.1690751431555516，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0600 | nBodyBalancedRegression22Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=157；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515353440158/-0.16907514302194587，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0700 | nBodyBalancedRegression22Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=158；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515340187232/-0.16907514288832654，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0800 | nBodyBalancedRegression22Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=159；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515340187232/-0.1690751427546935，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_0900 | nBodyBalancedRegression22Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=160；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515326932926/-0.16907514262104698，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1000 | nBodyBalancedRegression22Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=161；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515326932926/-0.1690751424873865，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1100 | nBodyBalancedRegression22Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=162；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515313677213/-0.16907514235371254，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1200 | nBodyBalancedRegression22Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=163；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515313677213/-0.16907514222002498，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1300 | nBodyBalancedRegression22Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=164；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515300420117/-0.16907514208632365，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1400 | nBodyBalancedRegression22Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=165；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515300420117/-0.1690751419526087，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1500 | nBodyBalancedRegression22Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=166；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515287161626/-0.16907514181888003，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1600 | nBodyBalancedRegression22Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=167；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515287161626/-0.16907514168513776，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1700 | nBodyBalancedRegression22Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=168；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515273901724/-0.16907514155138187，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1800 | nBodyBalancedRegression22Test018 | 动量平衡正向积分 | 独立 Worker 初态 | steps=169；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515273901724/-0.16907514141761226，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_1900 | nBodyBalancedRegression22Test019 | 动量平衡正向积分 | 独立 Worker 初态 | steps=170；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515260640463/-0.16907514128382914，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2000 | nBodyBalancedRegression22Test020 | 动量平衡正向积分 | 独立 Worker 初态 | steps=171；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515260640463/-0.1690751411500323，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2100 | nBodyBalancedRegression22Test021 | 动量平衡正向积分 | 独立 Worker 初态 | steps=172；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751524737779/-0.16907514101622204，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2200 | nBodyBalancedRegression22Test022 | 动量平衡正向积分 | 独立 Worker 初态 | steps=173；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751524737779/-0.1690751408823978，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2300 | nBodyBalancedRegression22Test023 | 动量平衡正向积分 | 独立 Worker 初态 | steps=174；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751523411374/-0.16907514074856028，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2400 | nBodyBalancedRegression22Test024 | 动量平衡正向积分 | 独立 Worker 初态 | steps=175；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751523411374/-0.169075140614709，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION22TEST_2500 | nBodyBalancedRegression22Test025 | 动量平衡正向积分 | 独立 Worker 初态 | steps=176；dt=0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907515220848296/-0.16907514048084402，误差<2e-11 | Pass |

### NBodyRawRegression23Test

源码：[NBodyRawRegression23Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression23Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0100 | nBodyRawRegression23Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=177；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692898923991373/-0.16928988118830338，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0200 | nBodyRawRegression23Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=178；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692898922737684/-0.16928988106173368，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0300 | nBodyRawRegression23Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=179；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692898922737684/-0.1692898809351508，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0400 | nBodyRawRegression23Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=180；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989214838613/-0.16928988080855448，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0500 | nBodyRawRegression23Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=181；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989214838613/-0.16928988068194475，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0600 | nBodyRawRegression23Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=182；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989202298989/-0.16928988055532176，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0700 | nBodyRawRegression23Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=183；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989202298989/-0.16928988042868537，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0800 | nBodyRawRegression23Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=184；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989189758026/-0.1692898803020357，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_0900 | nBodyRawRegression23Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=185；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989189758026/-0.16928988017537253，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1000 | nBodyRawRegression23Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=186；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.169289891772157/-0.16928988004869625，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1100 | nBodyRawRegression23Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=187；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.169289891772157/-0.16928987992200653，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1200 | nBodyRawRegression23Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=188；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989164671998/-0.16928987979530355，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1300 | nBodyRawRegression23Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=189；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989164671998/-0.1692898796685872，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1400 | nBodyRawRegression23Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=190；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989152126958/-0.1692898795418575，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1500 | nBodyRawRegression23Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=191；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989152126958/-0.16928987941511428，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1600 | nBodyRawRegression23Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=192；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692898913958055/-0.1692898792883579，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1700 | nBodyRawRegression23Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=193；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.1692898913958055/-0.16928987916158825，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1800 | nBodyRawRegression23Test018 | 未平衡初态积分 | 独立 Worker 初态 | steps=194；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989127032773/-0.16928987903480547，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_1900 | nBodyRawRegression23Test019 | 未平衡初态积分 | 独立 Worker 初态 | steps=195；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989127032773/-0.16928987890800917，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION23TEST_2000 | nBodyRawRegression23Test020 | 未平衡初态积分 | 独立 Worker 初态 | steps=196；dt=0.00025 | 初/中/末能量=-0.1692899033779057/-0.16928989114483636/-0.16928987878119958，误差<2e-11 | Pass |

### NBodyZeroRegression24Test

源码：[NBodyZeroRegression24Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression24Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0100 | nBodyZeroRegression24Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=453；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0200 | nBodyZeroRegression24Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=454；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0300 | nBodyZeroRegression24Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=455；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0400 | nBodyZeroRegression24Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=456；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0500 | nBodyZeroRegression24Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=457；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0600 | nBodyZeroRegression24Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=458；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0700 | nBodyZeroRegression24Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=459；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0800 | nBodyZeroRegression24Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=460；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_0900 | nBodyZeroRegression24Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=461；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1000 | nBodyZeroRegression24Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=462；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1100 | nBodyZeroRegression24Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=463；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1200 | nBodyZeroRegression24Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=464；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1300 | nBodyZeroRegression24Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=465；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1400 | nBodyZeroRegression24Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=466；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1500 | nBodyZeroRegression24Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=467；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1600 | nBodyZeroRegression24Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=468；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1700 | nBodyZeroRegression24Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=469；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION24TEST_1800 | nBodyZeroRegression24Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=470；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression25Test

源码：[NBodyReverseRegression25Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression25Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0100 | nBodyReverseRegression25Test001 | 负时间步积分 | 独立 Worker 初态 | steps=215；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514984383906/-0.16907513589589185，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0200 | nBodyReverseRegression25Test002 | 负时间步积分 | 独立 Worker 初态 | steps=216；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075149713914/-0.1690751357675421，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0300 | nBodyReverseRegression25Test003 | 负时间步积分 | 独立 Worker 初态 | steps=217；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.169075149713914/-0.169075135639207，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0400 | nBodyReverseRegression25Test004 | 负时间步积分 | 独立 Worker 初态 | steps=218；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751495840032/-0.16907513551088674，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0500 | nBodyReverseRegression25Test005 | 负时间步积分 | 独立 Worker 初态 | steps=219；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751495840032/-0.1690751353825812，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0600 | nBodyReverseRegression25Test006 | 负时间步积分 | 独立 Worker 初态 | steps=220；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514945410693/-0.16907513525429035，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0700 | nBodyReverseRegression25Test007 | 负时间步积分 | 独立 Worker 初态 | steps=221；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514945410693/-0.1690751351260144，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0800 | nBodyReverseRegression25Test008 | 负时间步积分 | 独立 Worker 初态 | steps=222；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514932422518/-0.16907513499775306，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_0900 | nBodyReverseRegression25Test009 | 负时间步积分 | 独立 Worker 初态 | steps=223；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514932422518/-0.16907513486950662，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1000 | nBodyReverseRegression25Test010 | 负时间步积分 | 独立 Worker 初态 | steps=224；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514919435773/-0.1690751347412749，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1100 | nBodyReverseRegression25Test011 | 负时间步积分 | 独立 Worker 初态 | steps=225；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514919435773/-0.16907513461305793，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1200 | nBodyReverseRegression25Test012 | 负时间步积分 | 独立 Worker 初态 | steps=226；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751490645048/-0.1690751344848557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1300 | nBodyReverseRegression25Test013 | 负时间步积分 | 独立 Worker 初态 | steps=227；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.1690751490645048/-0.16907513435666835，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1400 | nBodyReverseRegression25Test014 | 负时间步积分 | 独立 Worker 初态 | steps=228；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514893466638/-0.16907513422849585，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1500 | nBodyReverseRegression25Test015 | 负时间步积分 | 独立 Worker 初态 | steps=229；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514893466638/-0.16907513410033795，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1600 | nBodyReverseRegression25Test016 | 负时间步积分 | 独立 Worker 初态 | steps=230；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514880484242/-0.16907513397219498，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION25TEST_1700 | nBodyReverseRegression25Test017 | 负时间步积分 | 独立 Worker 初态 | steps=231；dt=-0.00025 | 初/中/末能量=-0.16907516382852453/-0.16907514880484242/-0.16907513384406672，误差<2e-11 | Pass |

### NBodySmallRegression26Test

源码：[NBodySmallRegression26Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression26Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0100 | nBodySmallRegression26Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=232；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285093/-0.1690751638284939，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0200 | nBodySmallRegression26Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=233；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285093/-0.16907516382849383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0300 | nBodySmallRegression26Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=234；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285092/-0.16907516382849375，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0400 | nBodySmallRegression26Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=235；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285092/-0.16907516382849347，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0500 | nBodySmallRegression26Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=236；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850898/-0.16907516382849339，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0600 | nBodySmallRegression26Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=237；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850898/-0.1690751638284933，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0700 | nBodySmallRegression26Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=238；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850887/-0.1690751638284932，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0800 | nBodySmallRegression26Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=239；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850887/-0.169075163828493，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_0900 | nBodySmallRegression26Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=240；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285087/-0.16907516382849275，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1000 | nBodySmallRegression26Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=241；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285087/-0.16907516382849266，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1100 | nBodySmallRegression26Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=242；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285085/-0.1690751638284926，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1200 | nBodySmallRegression26Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=243；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285085/-0.1690751638284925，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1300 | nBodySmallRegression26Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=244；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850837/-0.1690751638284925，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1400 | nBodySmallRegression26Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=245；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850837/-0.1690751638284922，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1500 | nBodySmallRegression26Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=246；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850835/-0.16907516382849208，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1600 | nBodySmallRegression26Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=247；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850835/-0.16907516382849203，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION26TEST_1700 | nBodySmallRegression26Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=248；dt=2.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850823/-0.16907516382849186，误差<2e-11 | Pass |

### NBodyLargeRegression27Test

源码：[NBodyLargeRegression27Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression27Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0100 | nBodyLargeRegression27Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=249；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907343465897579/-0.1690715345665443，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0200 | nBodyLargeRegression27Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=250；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690734199829141/-0.1690715189431643，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0300 | nBodyLargeRegression27Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=251；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690734199829141/-0.16907150331490933，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0400 | nBodyLargeRegression27Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=252；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907340529672035/-0.16907148768182392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0500 | nBodyLargeRegression27Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=253；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907340529672035/-0.16907147204395234，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0600 | nBodyLargeRegression27Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=254；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907339060043383/-0.1690714564013388，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0700 | nBodyLargeRegression27Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=255；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.16907339060043383/-0.1690714407540279，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0800 | nBodyLargeRegression27Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=256；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690733758940939/-0.16907142510206427，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_0900 | nBodyLargeRegression27Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=257；dt=0.0025 | 初/中/末能量=-0.16907516382852453/-0.1690733758940939/-0.16907140944549232，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1000 | nBodyLargeRegression27Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=1；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907513428222565，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1100 | nBodyLargeRegression27Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=2；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907513428222565/-0.1690751046863337，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1200 | nBodyLargeRegression27Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=3；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907513428222565/-0.1690750750410052，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1300 | nBodyLargeRegression27Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=4；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690751046863337/-0.16907504534639692，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1400 | nBodyLargeRegression27Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=5；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690751046863337/-0.16907501560266658，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1500 | nBodyLargeRegression27Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=6；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690750750410052/-0.1690749858099725，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1600 | nBodyLargeRegression27Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=7；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690750750410052/-0.16907495596847325，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1700 | nBodyLargeRegression27Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=8；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907504534639692/-0.16907492607832827，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1800 | nBodyLargeRegression27Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=9；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907504534639692/-0.1690748961396974，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_1900 | nBodyLargeRegression27Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=10；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907501560266658/-0.16907486615274112，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2000 | nBodyLargeRegression27Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=11；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907501560266658/-0.16907483611762048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2100 | nBodyLargeRegression27Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=12；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690749858099725/-0.16907480603449695，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2200 | nBodyLargeRegression27Test022 | 较大时间步积分 | 独立 Worker 初态 | steps=13；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690749858099725/-0.16907477590353298，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2300 | nBodyLargeRegression27Test023 | 较大时间步积分 | 独立 Worker 初态 | steps=14；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907495596847325/-0.16907474572489095，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2400 | nBodyLargeRegression27Test024 | 较大时间步积分 | 独立 Worker 初态 | steps=15；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907495596847325/-0.16907471549873437，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2500 | nBodyLargeRegression27Test025 | 较大时间步积分 | 独立 Worker 初态 | steps=16；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907492607832827/-0.16907468522522703，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2600 | nBodyLargeRegression27Test026 | 较大时间步积分 | 独立 Worker 初态 | steps=17；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907492607832827/-0.1690746549045334，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION27TEST_2700 | nBodyLargeRegression27Test027 | 较大时间步积分 | 独立 Worker 初态 | steps=18；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.1690748961396974/-0.16907462453681826，误差<2e-11 | Pass |

### NBodyPartitionedRegression28Test

源码：[NBodyPartitionedRegression28Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression28Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0100 | nBodyPartitionedRegression28Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=19；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516116536087/-0.16907515820175373，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0200 | nBodyPartitionedRegression28Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=20；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516086921473/-0.1690751579051311，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0300 | nBodyPartitionedRegression28Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=21；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516086921473/-0.16907515760846065，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0400 | nBodyPartitionedRegression28Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=22；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516057302102/-0.16907515731174277，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0500 | nBodyPartitionedRegression28Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=23；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516057302102/-0.1690751570149773，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0600 | nBodyPartitionedRegression28Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=24；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516027677943/-0.16907515671816423，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0700 | nBodyPartitionedRegression28Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=25；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907516027677943/-0.1690751564213038，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0800 | nBodyPartitionedRegression28Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=26；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515998049027/-0.16907515612439572，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_0900 | nBodyPartitionedRegression28Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=27；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515998049027/-0.16907515582744034，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1000 | nBodyPartitionedRegression28Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=28；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515968415335/-0.16907515553043737，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1100 | nBodyPartitionedRegression28Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=29；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515968415335/-0.16907515523338676，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1200 | nBodyPartitionedRegression28Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=30；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515938776868/-0.1690751549362889，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1300 | nBodyPartitionedRegression28Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=31；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515938776868/-0.16907515463914355，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1400 | nBodyPartitionedRegression28Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=32；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751590913364/-0.16907515434195075，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1500 | nBodyPartitionedRegression28Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=33；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751590913364/-0.1690751540447107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1600 | nBodyPartitionedRegression28Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=34；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515879485668/-0.16907515374742338，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1700 | nBodyPartitionedRegression28Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=35；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515879485668/-0.16907515345008847，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1800 | nBodyPartitionedRegression28Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=36；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515849832896/-0.1690751531527062，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_1900 | nBodyPartitionedRegression28Test019 | 分段轨迹检查点 | 独立 Worker 初态 | steps=37；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515849832896/-0.16907515285527666，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2000 | nBodyPartitionedRegression28Test020 | 分段轨迹检查点 | 独立 Worker 初态 | steps=38；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515820175373/-0.1690751525577999，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2100 | nBodyPartitionedRegression28Test021 | 分段轨迹检查点 | 独立 Worker 初态 | steps=39；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515820175373/-0.1690751522602758，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2200 | nBodyPartitionedRegression28Test022 | 分段轨迹检查点 | 独立 Worker 初态 | steps=40；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751579051311/-0.16907515196270445，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2300 | nBodyPartitionedRegression28Test023 | 分段轨迹检查点 | 独立 Worker 初态 | steps=41；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751579051311/-0.1690751516650857，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2400 | nBodyPartitionedRegression28Test024 | 分段轨迹检查点 | 独立 Worker 初态 | steps=42；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515760846065/-0.16907515136741985，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2500 | nBodyPartitionedRegression28Test025 | 分段轨迹检查点 | 独立 Worker 初态 | steps=43；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515760846065/-0.16907515106970655，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2600 | nBodyPartitionedRegression28Test026 | 分段轨迹检查点 | 独立 Worker 初态 | steps=44；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515731174277/-0.16907515077194624，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION28TEST_2700 | nBodyPartitionedRegression28Test027 | 分段轨迹检查点 | 独立 Worker 初态 | steps=45；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515731174277/-0.16907515047413868，误差<2e-11 | Pass |

### NBodyBalancedRegression29Test

源码：[NBodyBalancedRegression29Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression29Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0100 | nBodyBalancedRegression29Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=46；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751570149773/-0.16907515017628405，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0200 | nBodyBalancedRegression29Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=47；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751570149773/-0.16907514987838207，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0300 | nBodyBalancedRegression29Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=48；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515671816423/-0.16907514958043296，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0400 | nBodyBalancedRegression29Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=49；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515671816423/-0.16907514928243672，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0500 | nBodyBalancedRegression29Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=50；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751564213038/-0.16907514898439355，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0600 | nBodyBalancedRegression29Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=51；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751564213038/-0.1690751486863032，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0700 | nBodyBalancedRegression29Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=52；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515612439572/-0.16907514838816567，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0800 | nBodyBalancedRegression29Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=53；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515612439572/-0.1690751480899811，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_0900 | nBodyBalancedRegression29Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=54；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515582744034/-0.1690751477917494，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1000 | nBodyBalancedRegression29Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=55；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515582744034/-0.1690751474934708，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1100 | nBodyBalancedRegression29Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=56；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515553043737/-0.16907514719514496，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1200 | nBodyBalancedRegression29Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=57；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515553043737/-0.16907514689677242，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1300 | nBodyBalancedRegression29Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=58；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515523338676/-0.1690751465983528，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1400 | nBodyBalancedRegression29Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=59；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515523338676/-0.1690751462998861，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1500 | nBodyBalancedRegression29Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=60；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751549362889/-0.16907514600137247，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1600 | nBodyBalancedRegression29Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=61；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751549362889/-0.16907514570281174，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1700 | nBodyBalancedRegression29Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=62；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515463914355/-0.1690751454042043，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1800 | nBodyBalancedRegression29Test018 | 动量平衡正向积分 | 独立 Worker 初态 | steps=63；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515463914355/-0.16907514510554988，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_1900 | nBodyBalancedRegression29Test019 | 动量平衡正向积分 | 独立 Worker 初态 | steps=64；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515434195075/-0.16907514480684868，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2000 | nBodyBalancedRegression29Test020 | 动量平衡正向积分 | 独立 Worker 初态 | steps=65；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515434195075/-0.16907514450810046，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2100 | nBodyBalancedRegression29Test021 | 动量平衡正向积分 | 独立 Worker 初态 | steps=66；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751540447107/-0.16907514420930533，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2200 | nBodyBalancedRegression29Test022 | 动量平衡正向积分 | 独立 Worker 初态 | steps=67；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751540447107/-0.16907514391046358，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2300 | nBodyBalancedRegression29Test023 | 动量平衡正向积分 | 独立 Worker 初态 | steps=68；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515374742338/-0.16907514361157494，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2400 | nBodyBalancedRegression29Test024 | 动量平衡正向积分 | 独立 Worker 初态 | steps=69；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515374742338/-0.1690751433126393，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2500 | nBodyBalancedRegression29Test025 | 动量平衡正向积分 | 独立 Worker 初态 | steps=70；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515345008847/-0.16907514301365706，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2600 | nBodyBalancedRegression29Test026 | 动量平衡正向积分 | 独立 Worker 初态 | steps=71；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907515345008847/-0.1690751427146278，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION29TEST_2700 | nBodyBalancedRegression29Test027 | 动量平衡正向积分 | 独立 Worker 初态 | steps=72；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751531527062/-0.16907514241555194，误差<2e-11 | Pass |

### NBodyRawRegression30Test

源码：[NBodyRawRegression30Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression30Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0100 | nBodyRawRegression30Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=73；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989329196095/-0.16928988286321087，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0200 | nBodyRawRegression30Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=74；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989301093456/-0.16928988258047842，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0300 | nBodyRawRegression30Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=75；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989301093456/-0.1692898822977001，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0400 | nBodyRawRegression30Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=76；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989272986145/-0.169289882014876，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0500 | nBodyRawRegression30Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=77；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989272986145/-0.16928988173200604，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0600 | nBodyRawRegression30Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=78；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989244874243/-0.16928988144909052，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0700 | nBodyRawRegression30Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=79；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989244874243/-0.16928988116612903，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0800 | nBodyRawRegression30Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=80；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898921675768/-0.16928988088312186，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_0900 | nBodyRawRegression30Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=81；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898921675768/-0.16928988060006894，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1000 | nBodyRawRegression30Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=82；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898918863648/-0.16928988031697043，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1100 | nBodyRawRegression30Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=83；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898918863648/-0.16928988003382606，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1200 | nBodyRawRegression30Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=84；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898916051067/-0.16928987975063609，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1300 | nBodyRawRegression30Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=85；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898916051067/-0.16928987946740037，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1400 | nBodyRawRegression30Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=86；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989132380212/-0.1692898791841191，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1500 | nBodyRawRegression30Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=87；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989132380212/-0.1692898789007921，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1600 | nBodyRawRegression30Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=88；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898910424514/-0.1692898786174194，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1700 | nBodyRawRegression30Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=89；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898910424514/-0.16928987833400116，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1800 | nBodyRawRegression30Test018 | 未平衡初态积分 | 独立 Worker 初态 | steps=90；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989076105422/-0.16928987805053733，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION30TEST_1900 | nBodyRawRegression30Test019 | 未平衡初态积分 | 独立 Worker 初态 | steps=91；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928989076105422/-0.16928987776702803，误差<2e-11 | Pass |

### NBodyZeroRegression31Test

源码：[NBodyZeroRegression31Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression31Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0100 | nBodyZeroRegression31Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=605；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0200 | nBodyZeroRegression31Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=606；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0300 | nBodyZeroRegression31Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=607；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0400 | nBodyZeroRegression31Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=608；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0500 | nBodyZeroRegression31Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=609；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0600 | nBodyZeroRegression31Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=610；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0700 | nBodyZeroRegression31Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=611；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0800 | nBodyZeroRegression31Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=612；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_0900 | nBodyZeroRegression31Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=613；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1000 | nBodyZeroRegression31Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=614；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1100 | nBodyZeroRegression31Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=615；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1200 | nBodyZeroRegression31Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=616；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1300 | nBodyZeroRegression31Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=617；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1400 | nBodyZeroRegression31Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=618；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1500 | nBodyZeroRegression31Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=619；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1600 | nBodyZeroRegression31Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=620；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION31TEST_1700 | nBodyZeroRegression31Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=621；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression32Test

源码：[NBodyReverseRegression32Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression32Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0100 | nBodyReverseRegression32Test001 | 负时间步积分 | 独立 Worker 初态 | steps=109；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514792510162/-0.16907513187206918，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0200 | nBodyReverseRegression32Test002 | 负时间步积分 | 独立 Worker 初态 | steps=110；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514763191536/-0.16907513158156517，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0300 | nBodyReverseRegression32Test003 | 负时间步积分 | 独立 Worker 初态 | steps=111；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514763191536/-0.16907513129111046，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0400 | nBodyReverseRegression32Test004 | 负时间步积分 | 独立 Worker 初态 | steps=112；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514733877752/-0.1690751310007049，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0500 | nBodyReverseRegression32Test005 | 负时间步积分 | 独立 Worker 初态 | steps=113；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514733877752/-0.16907513071034855，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0600 | nBodyReverseRegression32Test006 | 负时间步积分 | 独立 Worker 初态 | steps=114；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514704568816/-0.16907513042004163，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0700 | nBodyReverseRegression32Test007 | 负时间步积分 | 独立 Worker 初态 | steps=115；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514704568816/-0.1690751301297837，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0800 | nBodyReverseRegression32Test008 | 负时间步积分 | 独立 Worker 初态 | steps=116；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514675264695/-0.16907512983957518，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_0900 | nBodyReverseRegression32Test009 | 负时间步积分 | 独立 Worker 初态 | steps=117；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514675264695/-0.16907512954941603，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1000 | nBodyReverseRegression32Test010 | 负时间步积分 | 独立 Worker 初态 | steps=118；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514645965452/-0.16907512925930596，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1100 | nBodyReverseRegression32Test011 | 负时间步积分 | 独立 Worker 初态 | steps=119；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514645965452/-0.16907512896924556，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1200 | nBodyReverseRegression32Test012 | 负时间步积分 | 独立 Worker 初态 | steps=120；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514616671002/-0.1690751286792341，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1300 | nBodyReverseRegression32Test013 | 负时间步积分 | 独立 Worker 初态 | steps=121；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514616671002/-0.16907512838927216，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1400 | nBodyReverseRegression32Test014 | 负时间步积分 | 独立 Worker 初态 | steps=122；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751458738143/-0.16907512809935962，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1500 | nBodyReverseRegression32Test015 | 负时间步积分 | 独立 Worker 初态 | steps=123；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751458738143/-0.1690751278094964，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1600 | nBodyReverseRegression32Test016 | 负时间步积分 | 独立 Worker 初态 | steps=124；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514558096687/-0.1690751275196827，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION32TEST_1700 | nBodyReverseRegression32Test017 | 负时间步积分 | 独立 Worker 初态 | steps=125；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514558096687/-0.16907512722991822，误差<2e-11 | Pass |

### NBodySmallRegression33Test

源码：[NBodySmallRegression33Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression33Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0100 | nBodySmallRegression33Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=126；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850576/-0.16907516382848714，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0200 | nBodySmallRegression33Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=127；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850576/-0.16907516382848684，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0300 | nBodySmallRegression33Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=128；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850554/-0.16907516382848656，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0400 | nBodySmallRegression33Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=129；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850554/-0.1690751638284863，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0500 | nBodySmallRegression33Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=130；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285052/-0.16907516382848592，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0600 | nBodySmallRegression33Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=131；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285052/-0.16907516382848564，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0700 | nBodySmallRegression33Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=132；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850507/-0.1690751638284853，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0800 | nBodySmallRegression33Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=133；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850507/-0.16907516382848498，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_0900 | nBodySmallRegression33Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=134；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850465/-0.16907516382848478，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1000 | nBodySmallRegression33Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=135；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850465/-0.16907516382848445，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1100 | nBodySmallRegression33Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=136；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285043/-0.16907516382848425，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1200 | nBodySmallRegression33Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=137；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285043/-0.16907516382848392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1300 | nBodySmallRegression33Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=138；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850415/-0.1690751638284835，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1400 | nBodySmallRegression33Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=139；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850415/-0.1690751638284833，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1500 | nBodySmallRegression33Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=140；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850388/-0.16907516382848303，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1600 | nBodySmallRegression33Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=141；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850388/-0.16907516382848278，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION33TEST_1700 | nBodySmallRegression33Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=142；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850346/-0.16907516382848242，误差<2e-11 | Pass |

### NBodyLargeRegression34Test

源码：[NBodyLargeRegression34Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression34Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0100 | nBodyLargeRegression34Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=143；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907295228581143/-0.169070518731076，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0200 | nBodyLargeRegression34Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=144；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907291963869742/-0.16907048392878704，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0300 | nBodyLargeRegression34Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=145；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907291963869742/-0.1690704491042984，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0400 | nBodyLargeRegression34Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=146；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907288695444359/-0.1690704142578297，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0500 | nBodyLargeRegression34Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=147；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907288695444359/-0.16907037938960143，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0600 | nBodyLargeRegression34Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=148；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907285423324325/-0.16907034449983363，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0700 | nBodyLargeRegression34Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=149；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907285423324325/-0.1690703095887468，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0800 | nBodyLargeRegression34Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=150；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907282147529032/-0.16907027465656235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_0900 | nBodyLargeRegression34Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=151；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907282147529032/-0.16907023970350105，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1000 | nBodyLargeRegression34Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=152；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907278868077907/-0.16907020472978446，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1100 | nBodyLargeRegression34Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=153；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907278868077907/-0.1690701697356342，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1200 | nBodyLargeRegression34Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=154；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907275584990422/-0.16907013472127236，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1300 | nBodyLargeRegression34Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=155；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907275584990422/-0.16907009968692094，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1400 | nBodyLargeRegression34Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=156；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907272298286108/-0.16907006463280247，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1500 | nBodyLargeRegression34Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=157；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907272298286108/-0.16907002955913944，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1600 | nBodyLargeRegression34Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=158；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907269007984516/-0.16906999446615514，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION34TEST_1700 | nBodyLargeRegression34Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=159；dt=0.00375 | 初/中/末能量=-0.16907516382852453/-0.16907269007984516/-0.1690699593540726，误差<2e-11 | Pass |

### NBodyPartitionedRegression35Test

源码：[NBodyPartitionedRegression35Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression35Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0100 | nBodyPartitionedRegression35Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=160；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514002126336/-0.16907511591566055，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0200 | nBodyPartitionedRegression35Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=161；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907514002126336/-0.169075115612488，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0300 | nBodyPartitionedRegression35Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=162；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751397217675/-0.16907511530927036，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0400 | nBodyPartitionedRegression35Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=163；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751397217675/-0.16907511500600725，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0500 | nBodyPartitionedRegression35Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=164；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513942222477/-0.1690751147026989，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0600 | nBodyPartitionedRegression35Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=165；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513942222477/-0.16907511439934553，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0700 | nBodyPartitionedRegression35Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=166；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513912263564/-0.16907511409594667，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0800 | nBodyPartitionedRegression35Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=167；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513912263564/-0.16907511379250284，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_0900 | nBodyPartitionedRegression35Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=168；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513882299982/-0.1690751134890137，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1000 | nBodyPartitionedRegression35Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=169；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513882299982/-0.16907511318547935，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1100 | nBodyPartitionedRegression35Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=170；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513852331757/-0.16907511288189994，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1200 | nBodyPartitionedRegression35Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=171；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513852331757/-0.16907511257827534，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1300 | nBodyPartitionedRegression35Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=172；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513822358858/-0.1690751122746056，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1400 | nBodyPartitionedRegression35Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=173；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513822358858/-0.1690751119708908，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1500 | nBodyPartitionedRegression35Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=174；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513792381323/-0.16907511166713082，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1600 | nBodyPartitionedRegression35Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=175；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513792381323/-0.16907511136332584，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1700 | nBodyPartitionedRegression35Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=176；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513762399126/-0.16907511105947579，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1800 | nBodyPartitionedRegression35Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=177；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513762399126/-0.16907511075558085，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_1900 | nBodyPartitionedRegression35Test019 | 分段轨迹检查点 | 独立 Worker 初态 | steps=178；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513732412288/-0.16907511045164073，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_2000 | nBodyPartitionedRegression35Test020 | 分段轨迹检查点 | 独立 Worker 初态 | steps=179；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513732412288/-0.1690751101476557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_2100 | nBodyPartitionedRegression35Test021 | 分段轨迹检查点 | 独立 Worker 初态 | steps=180；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751370242081/-0.16907510984362556，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION35TEST_2200 | nBodyPartitionedRegression35Test022 | 分段轨迹检查点 | 独立 Worker 初态 | steps=181；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751370242081/-0.16907510953955054，误差<2e-11 | Pass |

### NBodyBalancedRegression36Test

源码：[NBodyBalancedRegression36Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression36Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0100 | nBodyBalancedRegression36Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=182；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513672424668/-0.16907510923543057，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0200 | nBodyBalancedRegression36Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=183；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513672424668/-0.16907510893126565，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0300 | nBodyBalancedRegression36Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=184；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513642423913/-0.1690751086270558，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0400 | nBodyBalancedRegression36Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=185；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513642423913/-0.16907510832280118，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0500 | nBodyBalancedRegression36Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=186；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513612418498/-0.16907510801850142，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0600 | nBodyBalancedRegression36Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=187；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513612418498/-0.16907510771415696，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0700 | nBodyBalancedRegression36Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=188；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751358240844/-0.16907510740976767，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0800 | nBodyBalancedRegression36Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=189；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751358240844/-0.16907510710533347，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_0900 | nBodyBalancedRegression36Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=190；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513552393735/-0.16907510680085458，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1000 | nBodyBalancedRegression36Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=191；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513552393735/-0.16907510649633067，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1100 | nBodyBalancedRegression36Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=192；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.169075135223744/-0.16907510619176214，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1200 | nBodyBalancedRegression36Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=193；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.169075135223744/-0.1690751058871489，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1300 | nBodyBalancedRegression36Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=194；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751349235043/-0.16907510558249084，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1400 | nBodyBalancedRegression36Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=195；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751349235043/-0.16907510527778785，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1500 | nBodyBalancedRegression36Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=196；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751346232181/-0.16907510497304035，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1600 | nBodyBalancedRegression36Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=197；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751346232181/-0.16907510466824824，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION36TEST_1700 | nBodyBalancedRegression36Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=198；dt=0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907513432288587/-0.16907510436341133，误差<2e-11 | Pass |

### NBodyRawRegression37Test

源码：[NBodyRawRegression37Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression37Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0100 | nBodyRawRegression37Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=199；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898754973135/-0.16928984688297802，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0200 | nBodyRawRegression37Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=200；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987521339442/-0.16928984659459123，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0300 | nBodyRawRegression37Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=201；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987521339442/-0.16928984630616048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0400 | nBodyRawRegression37Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=202；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987492943004/-0.16928984601768599，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0500 | nBodyRawRegression37Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=203；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987492943004/-0.1692898457291675，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0600 | nBodyRawRegression37Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=204；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987464542025/-0.16928984544060516，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0700 | nBodyRawRegression37Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=205；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987464542025/-0.16928984515199885，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0800 | nBodyRawRegression37Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=206；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987436136503/-0.169289844863349，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_0900 | nBodyRawRegression37Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=207；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987436136503/-0.1692898445746552，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1000 | nBodyRawRegression37Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=208；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987407726437/-0.16928984428591773，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1100 | nBodyRawRegression37Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=209；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987407726437/-0.16928984399713629，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1200 | nBodyRawRegression37Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=210；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987379311838/-0.1692898437083112，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1300 | nBodyRawRegression37Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=211；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987379311838/-0.16928984341944234，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1400 | nBodyRawRegression37Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=212；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898735089268/-0.16928984313052975，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1500 | nBodyRawRegression37Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=213；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.1692898735089268/-0.16928984284157336，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1600 | nBodyRawRegression37Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=214；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987322469033/-0.16928984255257334，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION37TEST_1700 | nBodyRawRegression37Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=215；dt=0.000375 | 初/中/末能量=-0.1692899033779057/-0.16928987322469033/-0.16928984226352975，误差<2e-11 | Pass |

### NBodyZeroRegression38Test

源码：[NBodyZeroRegression38Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression38Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0100 | nBodyZeroRegression38Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=729；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0200 | nBodyZeroRegression38Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=730；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0300 | nBodyZeroRegression38Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=731；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0400 | nBodyZeroRegression38Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=732；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0500 | nBodyZeroRegression38Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=733；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0600 | nBodyZeroRegression38Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=734；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0700 | nBodyZeroRegression38Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=735；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0800 | nBodyZeroRegression38Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=736；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_0900 | nBodyZeroRegression38Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=737；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1000 | nBodyZeroRegression38Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=738；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1100 | nBodyZeroRegression38Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=739；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1200 | nBodyZeroRegression38Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=740；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1300 | nBodyZeroRegression38Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=741；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1400 | nBodyZeroRegression38Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=742；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1500 | nBodyZeroRegression38Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=743；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1600 | nBodyZeroRegression38Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=744；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION38TEST_1700 | nBodyZeroRegression38Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=745；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression39Test

源码：[NBodyReverseRegression39Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression39Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0100 | nBodyReverseRegression39Test001 | 负时间步积分 | 独立 Worker 初态 | steps=233；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512983957518/-0.16907509622942674，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0200 | nBodyReverseRegression39Test002 | 负时间步积分 | 独立 Worker 初态 | steps=234；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512954941603/-0.16907509594513764，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0300 | nBodyReverseRegression39Test003 | 负时间步积分 | 独立 Worker 初态 | steps=235；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512954941603/-0.1690750956608995，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0400 | nBodyReverseRegression39Test004 | 负时间步积分 | 独立 Worker 初态 | steps=236；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512925930596/-0.16907509537671236，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0500 | nBodyReverseRegression39Test005 | 负时间步积分 | 独立 Worker 初态 | steps=237；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512925930596/-0.16907509509257648，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0600 | nBodyReverseRegression39Test006 | 负时间步积分 | 独立 Worker 初态 | steps=238；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512896924556/-0.16907509480849153，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0700 | nBodyReverseRegression39Test007 | 负时间步积分 | 独立 Worker 初态 | steps=239；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512896924556/-0.16907509452445774，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0800 | nBodyReverseRegression39Test008 | 负时间步积分 | 独立 Worker 初态 | steps=240；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751286792341/-0.16907509424047495，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_0900 | nBodyReverseRegression39Test009 | 负时间步积分 | 独立 Worker 初态 | steps=241；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751286792341/-0.16907509395654355，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1000 | nBodyReverseRegression39Test010 | 负时间步积分 | 独立 Worker 初态 | steps=242；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512838927216/-0.16907509367266296，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1100 | nBodyReverseRegression39Test011 | 负时间步积分 | 独立 Worker 初态 | steps=243；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512838927216/-0.16907509338883372，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1200 | nBodyReverseRegression39Test012 | 负时间步积分 | 独立 Worker 初态 | steps=244；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512809935962/-0.16907509310505553，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1300 | nBodyReverseRegression39Test013 | 负时间步积分 | 独立 Worker 初态 | steps=245；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.16907512809935962/-0.16907509282132877，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1400 | nBodyReverseRegression39Test014 | 负时间步积分 | 独立 Worker 初态 | steps=246；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751278094964/-0.16907509253765313，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1500 | nBodyReverseRegression39Test015 | 负时间步积分 | 独立 Worker 初态 | steps=247；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751278094964/-0.16907509225402859，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1600 | nBodyReverseRegression39Test016 | 负时间步积分 | 独立 Worker 初态 | steps=248；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751275196827/-0.16907509197045523，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION39TEST_1700 | nBodyReverseRegression39Test017 | 负时间步积分 | 独立 Worker 初态 | steps=249；dt=-0.000375 | 初/中/末能量=-0.16907516382852453/-0.1690751275196827/-0.16907509168693316，误差<2e-11 | Pass |

### NBodySmallRegression40Test

源码：[NBodySmallRegression40Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression40Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0100 | nBodySmallRegression40Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=250；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848747/-0.16907516382845034，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0200 | nBodySmallRegression40Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=251；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848747/-0.16907516382845014，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0300 | nBodySmallRegression40Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=252；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848714/-0.16907516382844975，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0400 | nBodySmallRegression40Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=253；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848714/-0.1690751638284495，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0500 | nBodySmallRegression40Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=254；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848684/-0.1690751638284493，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0600 | nBodySmallRegression40Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=255；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848684/-0.16907516382844875，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0700 | nBodySmallRegression40Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=256；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848656/-0.16907516382844864，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0800 | nBodySmallRegression40Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=257；dt=3.75e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848656/-0.16907516382844848，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_0900 | nBodySmallRegression40Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=1；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852394，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1000 | nBodySmallRegression40Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=2；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852394/-0.1690751638285235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1100 | nBodySmallRegression40Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=3；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852394/-0.16907516382852297，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1200 | nBodySmallRegression40Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=4；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285235/-0.1690751638285225，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1300 | nBodySmallRegression40Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=5；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285235/-0.16907516382852192，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1400 | nBodySmallRegression40Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=6；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852297/-0.1690751638285214，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1500 | nBodySmallRegression40Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=7；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852297/-0.169075163828521，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1600 | nBodySmallRegression40Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=8；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285225/-0.16907516382852042，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1700 | nBodySmallRegression40Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=9；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285225/-0.1690751638285198，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1800 | nBodySmallRegression40Test018 | 微小时间步积分 | 独立 Worker 初态 | steps=10；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852192/-0.16907516382851936，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_1900 | nBodySmallRegression40Test019 | 微小时间步积分 | 独立 Worker 初态 | steps=11；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852192/-0.169075163828519，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_2000 | nBodySmallRegression40Test020 | 微小时间步积分 | 独立 Worker 初态 | steps=12；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285214/-0.16907516382851828，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_2100 | nBodySmallRegression40Test021 | 微小时间步积分 | 独立 Worker 初态 | steps=13；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285214/-0.1690751638285178，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION40TEST_2200 | nBodySmallRegression40Test022 | 微小时间步积分 | 独立 Worker 初态 | steps=14；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.169075163828521/-0.1690751638285172，误差<2e-11 | Pass |

### NBodyLargeRegression41Test

源码：[NBodyLargeRegression41Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression41Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0100 | nBodyLargeRegression41Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=15；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907479376994747/-0.1690743638928275，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0200 | nBodyLargeRegression41Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=16；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907474043616616/-0.16907430964900116，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0300 | nBodyLargeRegression41Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=17；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907474043616616/-0.1690742552937629，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0400 | nBodyLargeRegression41Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=18；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907468698682823/-0.16907420082764182，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0500 | nBodyLargeRegression41Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=19；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907468698682823/-0.16907414625116887，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0600 | nBodyLargeRegression41Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=20；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907463342244344/-0.1690740915648777，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0700 | nBodyLargeRegression41Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=21；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907463342244344/-0.16907403676930385，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0800 | nBodyLargeRegression41Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=22；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907457974352422/-0.16907398186498543，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_0900 | nBodyLargeRegression41Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=23；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907457974352422/-0.1690739268524627，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1000 | nBodyLargeRegression41Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=24；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907452595058484/-0.16907387173227872，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1100 | nBodyLargeRegression41Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=25；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907452595058484/-0.1690738165049779，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1200 | nBodyLargeRegression41Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=26；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907447204414242/-0.16907376117110812，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1300 | nBodyLargeRegression41Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=27；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907447204414242/-0.16907370573121827，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1400 | nBodyLargeRegression41Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=28；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907441802471615/-0.1690736501858603，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1500 | nBodyLargeRegression41Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=29；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907441802471615/-0.1690735945355881，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1600 | nBodyLargeRegression41Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=30；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690743638928275/-0.16907353878095827，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1700 | nBodyLargeRegression41Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=31；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690743638928275/-0.1690734829225289，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1800 | nBodyLargeRegression41Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=32；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907430964900116/-0.16907342696086086，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_1900 | nBodyLargeRegression41Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=33；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907430964900116/-0.16907337089651683，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_2000 | nBodyLargeRegression41Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=34；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690742552937629/-0.16907331473006212，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION41TEST_2100 | nBodyLargeRegression41Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=35；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690742552937629/-0.1690732584620642，误差<2e-11 | Pass |

### NBodyPartitionedRegression42Test

源码：[NBodyPartitionedRegression42Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression42Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0100 | nBodyPartitionedRegression42Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=36；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751543485831/-0.16907514483209454，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0200 | nBodyPartitionedRegression42Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=37；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751543485831/-0.16907514430233514，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0300 | nBodyPartitionedRegression42Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=38；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751538208455/-0.16907514377246372，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0400 | nBodyPartitionedRegression42Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=39；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751538208455/-0.16907514324248069，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0500 | nBodyPartitionedRegression42Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=40；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515329299494/-0.16907514271238566，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0600 | nBodyPartitionedRegression42Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=41；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515329299494/-0.16907514218217898，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0700 | nBodyPartitionedRegression42Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=42；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515276503174/-0.16907514165186097，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0800 | nBodyPartitionedRegression42Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=43；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515276503174/-0.169075141121431，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_0900 | nBodyPartitionedRegression42Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=44；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515223695593/-0.16907514059088968，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1000 | nBodyPartitionedRegression42Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=45；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515223695593/-0.1690751400602369，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1100 | nBodyPartitionedRegression42Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=46；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515170876763/-0.16907513952947267，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1200 | nBodyPartitionedRegression42Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=47；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515170876763/-0.16907513899859694，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1300 | nBodyPartitionedRegression42Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=48；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751511804667/-0.16907513846761005，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1400 | nBodyPartitionedRegression42Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=49；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751511804667/-0.16907513793651172，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1500 | nBodyPartitionedRegression42Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=50；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751506520532/-0.1690751374053022，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1600 | nBodyPartitionedRegression42Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=51；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751506520532/-0.16907513687398157，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION42TEST_1700 | nBodyPartitionedRegression42Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=52；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515012352728/-0.16907513634254978，误差<2e-11 | Pass |

### NBodyBalancedRegression43Test

源码：[NBodyBalancedRegression43Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression43Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0100 | nBodyBalancedRegression43Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=53；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907515012352728/-0.16907513581100686，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0200 | nBodyBalancedRegression43Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=54；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514959488906/-0.169075135279353，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0300 | nBodyBalancedRegression43Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=55；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514959488906/-0.16907513474758812，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0400 | nBodyBalancedRegression43Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=56；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514906613821/-0.16907513421571232，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0500 | nBodyBalancedRegression43Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=57；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514906613821/-0.16907513368372581，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0600 | nBodyBalancedRegression43Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=58；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514853727532/-0.16907513315162834，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0700 | nBodyBalancedRegression43Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=59；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514853727532/-0.16907513261942006，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0800 | nBodyBalancedRegression43Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=60；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514800830015/-0.16907513208710112，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_0900 | nBodyBalancedRegression43Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=61；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514800830015/-0.16907513155467133，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1000 | nBodyBalancedRegression43Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=62；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514747921273/-0.1690751310221312，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1100 | nBodyBalancedRegression43Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=63；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514747921273/-0.16907513048948034，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1200 | nBodyBalancedRegression43Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=64；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514695001322/-0.16907512995671894，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1300 | nBodyBalancedRegression43Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=65；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514695001322/-0.16907512942384728，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1400 | nBodyBalancedRegression43Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=66；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751464207015/-0.16907512889086485，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1500 | nBodyBalancedRegression43Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=67；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751464207015/-0.16907512835777244，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1600 | nBodyBalancedRegression43Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=68；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514589127787/-0.16907512782456946，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION43TEST_1700 | nBodyBalancedRegression43Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=69；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907514589127787/-0.16907512729125632，误差<2e-11 | Pass |

### NBodyRawRegression44Test

源码：[NBodyRawRegression44Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression44Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0100 | nBodyRawRegression44Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=70；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988593096567/-0.16928986834959092，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0200 | nBodyRawRegression44Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=71；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988593096567/-0.16928986784531058，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0300 | nBodyRawRegression44Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=72；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988543049675/-0.16928986734092213，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0400 | nBodyRawRegression44Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=73；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988543049675/-0.1692898668364257，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0500 | nBodyRawRegression44Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=74；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988492991817/-0.16928986633182144，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0600 | nBodyRawRegression44Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=75；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988492991817/-0.16928986582710914，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0700 | nBodyRawRegression44Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=76；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988442922993/-0.16928986532228907，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0800 | nBodyRawRegression44Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=77；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988442922993/-0.1692898648173612，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_0900 | nBodyRawRegression44Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=78；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898839284321/-0.16928986431232557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1000 | nBodyRawRegression44Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=79；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898839284321/-0.16928986380718217，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1100 | nBodyRawRegression44Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=80；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988342752466/-0.1692898633019311，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1200 | nBodyRawRegression44Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=81；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988342752466/-0.16928986279657235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1300 | nBodyRawRegression44Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=82；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988292650762/-0.1692898622911063，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1400 | nBodyRawRegression44Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=83；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988292650762/-0.16928986178553254，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1500 | nBodyRawRegression44Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=84；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988242538134/-0.1692898612798512，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1600 | nBodyRawRegression44Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=85；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988242538134/-0.16928986077406244，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION44TEST_1700 | nBodyRawRegression44Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=86；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928988192414546/-0.16928986026816648，误差<2e-11 | Pass |

### NBodyZeroRegression45Test

源码：[NBodyZeroRegression45Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression45Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0100 | nBodyZeroRegression45Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=857；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0200 | nBodyZeroRegression45Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=858；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0300 | nBodyZeroRegression45Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=859；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0400 | nBodyZeroRegression45Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=860；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0500 | nBodyZeroRegression45Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=861；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0600 | nBodyZeroRegression45Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=862；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0700 | nBodyZeroRegression45Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=863；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0800 | nBodyZeroRegression45Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=864；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_0900 | nBodyZeroRegression45Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=865；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1000 | nBodyZeroRegression45Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=866；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1100 | nBodyZeroRegression45Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=867；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1200 | nBodyZeroRegression45Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=868；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1300 | nBodyZeroRegression45Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=869；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1400 | nBodyZeroRegression45Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=870；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1500 | nBodyZeroRegression45Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=871；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1600 | nBodyZeroRegression45Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=872；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION45TEST_1700 | nBodyZeroRegression45Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=873；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression46Test

源码：[NBodyReverseRegression46Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression46Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0100 | nBodyReverseRegression46Test001 | 负时间步积分 | 独立 Worker 初态 | steps=104；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513663517534/-0.16907510975270781，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0200 | nBodyReverseRegression46Test002 | 负时间步积分 | 独立 Worker 初态 | steps=105；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513663517534/-0.1690751092388289，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0300 | nBodyReverseRegression46Test003 | 负时间步积分 | 独立 Worker 初态 | steps=106；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.169075136115251/-0.16907510872506776，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0400 | nBodyReverseRegression46Test004 | 负时间步积分 | 独立 Worker 初态 | steps=107；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.169075136115251/-0.16907510821142416，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0500 | nBodyReverseRegression46Test005 | 负时间步积分 | 独立 Worker 初态 | steps=108；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751355954418/-0.16907510769789805，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0600 | nBodyReverseRegression46Test006 | 负时间步积分 | 独立 Worker 初态 | steps=109；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751355954418/-0.16907510718448968，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0700 | nBodyReverseRegression46Test007 | 负时间步积分 | 独立 Worker 初态 | steps=110；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751350757476/-0.16907510667119913，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0800 | nBodyReverseRegression46Test008 | 负时间步积分 | 独立 Worker 初态 | steps=111；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751350757476/-0.16907510615802634，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_0900 | nBodyReverseRegression46Test009 | 负时间步积分 | 独立 Worker 初态 | steps=112；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513455616843/-0.16907510564497122，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1000 | nBodyReverseRegression46Test010 | 负时间步积分 | 独立 Worker 初态 | steps=113；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513455616843/-0.16907510513203414，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1100 | nBodyReverseRegression46Test011 | 负时间步积分 | 独立 Worker 初态 | steps=114；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513403670454/-0.1690751046192148，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1200 | nBodyReverseRegression46Test012 | 负时间步积分 | 独立 Worker 初态 | steps=115；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513403670454/-0.1690751041065134，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1300 | nBodyReverseRegression46Test013 | 负时间步积分 | 独立 Worker 初态 | steps=116；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751335173558/-0.16907510359393008，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1400 | nBodyReverseRegression46Test014 | 负时间步积分 | 独立 Worker 初态 | steps=117；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751335173558/-0.1690751030814651，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1500 | nBodyReverseRegression46Test015 | 负时间步积分 | 独立 Worker 初态 | steps=118；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513299812257/-0.16907510256911779，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1600 | nBodyReverseRegression46Test016 | 负时间步积分 | 独立 Worker 初态 | steps=119；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513299812257/-0.16907510205688872，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION46TEST_1700 | nBodyReverseRegression46Test017 | 负时间步积分 | 独立 Worker 初态 | steps=120；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907513247900433/-0.16907510154477798，误差<2e-11 | Pass |

### NBodySmallRegression47Test

源码：[NBodySmallRegression47Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression47Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0100 | nBodySmallRegression47Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=121；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.169075163828493/-0.169075163828461，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0200 | nBodySmallRegression47Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=122；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284925/-0.1690751638284605，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0300 | nBodySmallRegression47Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=123；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284925/-0.16907516382846，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0400 | nBodySmallRegression47Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=124；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849197/-0.16907516382845944，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0500 | nBodySmallRegression47Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=125；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849197/-0.16907516382845883，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0600 | nBodySmallRegression47Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=126；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284914/-0.16907516382845825，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0700 | nBodySmallRegression47Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=127；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284914/-0.1690751638284578，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0800 | nBodySmallRegression47Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=128；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849094/-0.16907516382845725，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_0900 | nBodySmallRegression47Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=129；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849094/-0.16907516382845678，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1000 | nBodySmallRegression47Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=130；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284904/-0.16907516382845617，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1100 | nBodySmallRegression47Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=131；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638284904/-0.16907516382845567，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1200 | nBodySmallRegression47Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=132；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848983/-0.16907516382845508，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1300 | nBodySmallRegression47Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=133；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848983/-0.16907516382845467，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1400 | nBodySmallRegression47Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=134；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848928/-0.1690751638284541，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1500 | nBodySmallRegression47Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=135；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848928/-0.16907516382845356，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1600 | nBodySmallRegression47Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=136；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848883/-0.169075163828453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION47TEST_1700 | nBodySmallRegression47Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=137；dt=5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382848883/-0.16907516382845256，误差<2e-11 | Pass |

### NBodyLargeRegression48Test

源码：[NBodyLargeRegression48Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression48Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0100 | nBodyLargeRegression48Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=138；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907128912121933/-0.16906703496194292，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0200 | nBodyLargeRegression48Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=139；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907128912121933/-0.1690669715912664，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0300 | nBodyLargeRegression48Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=140；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690712296727826/-0.16906690818834177，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0400 | nBodyLargeRegression48Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=141；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690712296727826/-0.16906684475389477，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0500 | nBodyLargeRegression48Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=142；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690711701445886/-0.16906678128865243，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0600 | nBodyLargeRegression48Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=143；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690711701445886/-0.16906671779334168，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0700 | nBodyLargeRegression48Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=144；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690711105372778/-0.16906665426869072，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0800 | nBodyLargeRegression48Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=145；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690711105372778/-0.16906659071542837，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_0900 | nBodyLargeRegression48Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=146；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690710508514919/-0.16906652713428386，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1000 | nBodyLargeRegression48Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=147；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.1690710508514919/-0.16906646352598725，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1100 | nBodyLargeRegression48Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=148；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907099108787502/-0.16906639989126873，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1200 | nBodyLargeRegression48Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=149；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907099108787502/-0.16906633623085987，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1300 | nBodyLargeRegression48Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=150；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907093124707243/-0.16906627254549186，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1400 | nBodyLargeRegression48Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=151；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907093124707243/-0.16906620883589732，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1500 | nBodyLargeRegression48Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=152；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907087132973111/-0.16906614510280882，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1600 | nBodyLargeRegression48Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=153；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907087132973111/-0.16906608134695983，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION48TEST_1700 | nBodyLargeRegression48Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=154；dt=0.005 | 初/中/末能量=-0.16907516382852453/-0.16907081133650018/-0.16906601756908413，误差<2e-11 | Pass |

### NBodyPartitionedRegression49Test

源码：[NBodyPartitionedRegression49Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression49Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0100 | nBodyPartitionedRegression49Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=155；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751230207882/-0.16907508101955696，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0200 | nBodyPartitionedRegression49Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=156；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.169075122486485/-0.169075080476851，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0300 | nBodyPartitionedRegression49Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=157；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.169075122486485/-0.16907507993403945，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0400 | nBodyPartitionedRegression49Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=158；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512195207222/-0.16907507939112215，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0500 | nBodyPartitionedRegression49Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=159；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512195207222/-0.1690750788480994，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0600 | nBodyPartitionedRegression49Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=160；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512141754966/-0.16907507830497123，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0700 | nBodyPartitionedRegression49Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=161；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512141754966/-0.16907507776173752，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0800 | nBodyPartitionedRegression49Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=162；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512088291735/-0.1690750772183986，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_0900 | nBodyPartitionedRegression49Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=163；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512088291735/-0.16907507667495428，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1000 | nBodyPartitionedRegression49Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=164；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512034817568/-0.16907507613140477，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1100 | nBodyPartitionedRegression49Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=165；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907512034817568/-0.16907507558774992，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1200 | nBodyPartitionedRegression49Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=166；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511981332424/-0.16907507504398986，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1300 | nBodyPartitionedRegression49Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=167；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511981332424/-0.16907507450012474，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1400 | nBodyPartitionedRegression49Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=168；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751192783636/-0.1690750739561547，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1500 | nBodyPartitionedRegression49Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=169；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751192783636/-0.16907507341207967，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1600 | nBodyPartitionedRegression49Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=170；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511874329334/-0.16907507286789958，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION49TEST_1700 | nBodyPartitionedRegression49Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=171；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511874329334/-0.16907507232361463，误差<2e-11 | Pass |

### NBodyBalancedRegression50Test

源码：[NBodyBalancedRegression50Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression50Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0100 | nBodyBalancedRegression50Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=172；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751182081137/-0.16907507177922476，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0200 | nBodyBalancedRegression50Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=173；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751182081137/-0.1690750712347302，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0300 | nBodyBalancedRegression50Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=174；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751176728247/-0.16907507069013092，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0400 | nBodyBalancedRegression50Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=175；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751176728247/-0.16907507014542683，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0500 | nBodyBalancedRegression50Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=176；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511713742657/-0.1690750696006183，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0600 | nBodyBalancedRegression50Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=177；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511713742657/-0.16907506905570535，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0700 | nBodyBalancedRegression50Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=178；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511660191912/-0.1690750685106877，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0800 | nBodyBalancedRegression50Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=179；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511660191912/-0.16907506796556557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_0900 | nBodyBalancedRegression50Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=180；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751160663023/-0.169075067420339，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1000 | nBodyBalancedRegression50Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=181；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751160663023/-0.16907506687500815，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1100 | nBodyBalancedRegression50Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=182；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511553057664/-0.16907506632957292，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1200 | nBodyBalancedRegression50Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=183；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511553057664/-0.16907506578403345，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1300 | nBodyBalancedRegression50Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=184；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511499474198/-0.1690750652383898，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1400 | nBodyBalancedRegression50Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=185；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511499474198/-0.16907506469264214，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1500 | nBodyBalancedRegression50Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=186；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511445879816/-0.16907506414679024，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1600 | nBodyBalancedRegression50Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=187；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511445879816/-0.1690750636008344，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION50TEST_1700 | nBodyBalancedRegression50Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=188；dt=0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907511392274543/-0.16907506305477457，误差<2e-11 | Pass |

### NBodyRawRegression51Test

源码：[NBodyRawRegression51Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression51Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0100 | nBodyRawRegression51Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=189；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985621713832/-0.1692898075948348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0200 | nBodyRawRegression51Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=190；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985571027808/-0.169289807078037，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0300 | nBodyRawRegression51Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=191；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985571027808/-0.1692898065611369，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0400 | nBodyRawRegression51Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=192；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985520331083/-0.1692898060441346，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0500 | nBodyRawRegression51Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=193；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985520331083/-0.16928980552703018，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0600 | nBodyRawRegression51Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=194；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898546962369/-0.1692898050098236，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0700 | nBodyRawRegression51Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=195；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898546962369/-0.16928980449251502，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0800 | nBodyRawRegression51Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=196；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985418905604/-0.16928980397510443，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_0900 | nBodyRawRegression51Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=197；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985418905604/-0.16928980345759198，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1000 | nBodyRawRegression51Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=198；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898536817684/-0.1692898029399775，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1100 | nBodyRawRegression51Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=199；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898536817684/-0.16928980242226124，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1200 | nBodyRawRegression51Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=200；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985317437412/-0.1692898019044432，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1300 | nBodyRawRegression51Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=201；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985317437412/-0.1692898013865236，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1400 | nBodyRawRegression51Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=202；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985266687305/-0.16928980086850212，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1500 | nBodyRawRegression51Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=203；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985266687305/-0.1692898003503791，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1600 | nBodyRawRegression51Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=204；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985215926548/-0.16928979983215442，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1700 | nBodyRawRegression51Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=205；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985215926548/-0.16928979931382834，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1800 | nBodyRawRegression51Test018 | 未平衡初态积分 | 独立 Worker 初态 | steps=206；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985165155133/-0.16928979879540074，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_1900 | nBodyRawRegression51Test019 | 未平衡初态积分 | 独立 Worker 初态 | steps=207；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985165155133/-0.16928979827687177，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2000 | nBodyRawRegression51Test020 | 未平衡初态积分 | 独立 Worker 初态 | steps=208；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898511437308/-0.16928979775824138，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2100 | nBodyRawRegression51Test021 | 未平衡初态积分 | 独立 Worker 初态 | steps=209；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898511437308/-0.1692897972395095，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2200 | nBodyRawRegression51Test022 | 未平衡初态积分 | 独立 Worker 初态 | steps=210；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898506358037/-0.16928979672067654，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2300 | nBodyRawRegression51Test023 | 未平衡初态积分 | 独立 Worker 初态 | steps=211；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.1692898506358037/-0.16928979620174228，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2400 | nBodyRawRegression51Test024 | 未平衡初态积分 | 独立 Worker 初态 | steps=212；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985012777015/-0.16928979568270672，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION51TEST_2500 | nBodyRawRegression51Test025 | 未平衡初态积分 | 独立 Worker 初态 | steps=213；dt=0.0005 | 初/中/末能量=-0.1692899033779057/-0.16928985012777015/-0.16928979516357018，误差<2e-11 | Pass |

### NBodyZeroRegression52Test

源码：[NBodyZeroRegression52Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression52Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0100 | nBodyZeroRegression52Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=984；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0200 | nBodyZeroRegression52Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=985；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0300 | nBodyZeroRegression52Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=986；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0400 | nBodyZeroRegression52Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=987；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0500 | nBodyZeroRegression52Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=988；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0600 | nBodyZeroRegression52Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=989；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0700 | nBodyZeroRegression52Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=990；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0800 | nBodyZeroRegression52Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=991；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_0900 | nBodyZeroRegression52Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=992；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1000 | nBodyZeroRegression52Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=993；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1100 | nBodyZeroRegression52Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=994；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1200 | nBodyZeroRegression52Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=995；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1300 | nBodyZeroRegression52Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=996；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1400 | nBodyZeroRegression52Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=997；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1500 | nBodyZeroRegression52Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=998；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1600 | nBodyZeroRegression52Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=999；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1700 | nBodyZeroRegression52Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=1000；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1800 | nBodyZeroRegression52Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=1001；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_1900 | nBodyZeroRegression52Test019 | 零时间步恒等 | 独立 Worker 初态 | steps=1002；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2000 | nBodyZeroRegression52Test020 | 零时间步恒等 | 独立 Worker 初态 | steps=1003；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2100 | nBodyZeroRegression52Test021 | 零时间步恒等 | 独立 Worker 初态 | steps=1004；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2200 | nBodyZeroRegression52Test022 | 零时间步恒等 | 独立 Worker 初态 | steps=1005；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2300 | nBodyZeroRegression52Test023 | 零时间步恒等 | 独立 Worker 初态 | steps=1006；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2400 | nBodyZeroRegression52Test024 | 零时间步恒等 | 独立 Worker 初态 | steps=1007；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION52TEST_2500 | nBodyZeroRegression52Test025 | 零时间步恒等 | 独立 Worker 初态 | steps=1008；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression53Test

源码：[NBodyReverseRegression53Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression53Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0100 | nBodyReverseRegression53Test001 | 负时间步积分 | 独立 Worker 初态 | steps=239；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510205688872/-0.1690750414609229，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0200 | nBodyReverseRegression53Test002 | 负时间步积分 | 独立 Worker 初态 | steps=240；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510154477798/-0.1690750409633319，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0300 | nBodyReverseRegression53Test003 | 负时间步积分 | 独立 Worker 初态 | steps=241；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510154477798/-0.1690750404658644，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0400 | nBodyReverseRegression53Test004 | 负时间步积分 | 独立 Worker 初态 | steps=242；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510103278547/-0.16907503996852088，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0500 | nBodyReverseRegression53Test005 | 负时间步积分 | 独立 Worker 初态 | steps=243；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510103278547/-0.16907503947130106，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0600 | nBodyReverseRegression53Test006 | 负时间步积分 | 独立 Worker 初态 | steps=244；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510052091126/-0.16907503897420526，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0700 | nBodyReverseRegression53Test007 | 负时间步积分 | 独立 Worker 初态 | steps=245；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907510052091126/-0.16907503847723324，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0800 | nBodyReverseRegression53Test008 | 负时间步积分 | 独立 Worker 初态 | steps=246；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751000091553/-0.1690750379803852，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_0900 | nBodyReverseRegression53Test009 | 负时间步积分 | 独立 Worker 初态 | steps=247；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690751000091553/-0.16907503748366137，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1000 | nBodyReverseRegression53Test010 | 负时间步积分 | 独立 Worker 初态 | steps=248；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509949751776/-0.16907503698706136，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1100 | nBodyReverseRegression53Test011 | 负时间步积分 | 独立 Worker 初态 | steps=249；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509949751776/-0.16907503649058553，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1200 | nBodyReverseRegression53Test012 | 负时间步积分 | 独立 Worker 初态 | steps=250；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509898599873/-0.16907503599423387，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1300 | nBodyReverseRegression53Test013 | 负时间步积分 | 独立 Worker 初态 | steps=251；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509898599873/-0.16907503549800637，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1400 | nBodyReverseRegression53Test014 | 负时间步积分 | 独立 Worker 初态 | steps=252；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509847459798/-0.16907503500190293，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1500 | nBodyReverseRegression53Test015 | 负时间步积分 | 独立 Worker 初态 | steps=253；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509847459798/-0.16907503450592395，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1600 | nBodyReverseRegression53Test016 | 负时间步积分 | 独立 Worker 初态 | steps=254；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509796331588/-0.16907503401006926，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1700 | nBodyReverseRegression53Test017 | 负时间步积分 | 独立 Worker 初态 | steps=255；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.16907509796331588/-0.16907503351433878，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1800 | nBodyReverseRegression53Test018 | 负时间步积分 | 独立 Worker 初态 | steps=256；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690750974521524/-0.16907503301873275，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_1900 | nBodyReverseRegression53Test019 | 负时间步积分 | 独立 Worker 初态 | steps=257；dt=-0.0005 | 初/中/末能量=-0.16907516382852453/-0.1690750974521524/-0.16907503252325132，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2000 | nBodyReverseRegression53Test020 | 负时间步积分 | 独立 Worker 初态 | steps=1；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516300687575，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2100 | nBodyReverseRegression53Test021 | 负时间步积分 | 独立 Worker 初态 | steps=2；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907516300687575/-0.1690751621854465，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2200 | nBodyReverseRegression53Test022 | 负时间步积分 | 独立 Worker 初态 | steps=3；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907516300687575/-0.16907516136423645，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2300 | nBodyReverseRegression53Test023 | 负时间步积分 | 独立 Worker 初态 | steps=4；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751621854465/-0.1690751605432462，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2400 | nBodyReverseRegression53Test024 | 负时间步积分 | 独立 Worker 初态 | steps=5；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751621854465/-0.16907515972247567，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2500 | nBodyReverseRegression53Test025 | 负时间步积分 | 独立 Worker 初态 | steps=6；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907516136423645/-0.16907515890192487，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2600 | nBodyReverseRegression53Test026 | 负时间步积分 | 独立 Worker 初态 | steps=7；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907516136423645/-0.16907515808159398，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2700 | nBodyReverseRegression53Test027 | 负时间步积分 | 独立 Worker 初态 | steps=8；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751605432462/-0.1690751572614833，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION53TEST_2800 | nBodyReverseRegression53Test028 | 负时间步积分 | 独立 Worker 初态 | steps=9；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751605432462/-0.16907515644159282，误差<2e-11 | Pass |

### NBodySmallRegression54Test

源码：[NBodySmallRegression54Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression54Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0100 | nBodySmallRegression54Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=10；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852045/-0.1690751638285164，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0200 | nBodySmallRegression54Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=11；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382852045/-0.16907516382851556，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0300 | nBodySmallRegression54Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=12；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851973/-0.16907516382851473，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0400 | nBodySmallRegression54Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=13；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851973/-0.1690751638285139，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0500 | nBodySmallRegression54Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=14；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851884/-0.16907516382851306，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0600 | nBodySmallRegression54Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=15；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851884/-0.16907516382851223，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0700 | nBodySmallRegression54Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=16；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851795/-0.16907516382851154，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0800 | nBodySmallRegression54Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=17；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851795/-0.1690751638285107，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_0900 | nBodySmallRegression54Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=18；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851712/-0.16907516382850973，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1000 | nBodySmallRegression54Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=19；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851712/-0.169075163828509，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1100 | nBodySmallRegression54Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=20；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285164/-0.16907516382850798，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1200 | nBodySmallRegression54Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=21；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285164/-0.1690751638285072，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1300 | nBodySmallRegression54Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=22；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851556/-0.16907516382850646，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1400 | nBodySmallRegression54Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=23；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851556/-0.1690751638285057，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1500 | nBodySmallRegression54Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=24；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851473/-0.1690751638285048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1600 | nBodySmallRegression54Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=25；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851473/-0.16907516382850388，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1700 | nBodySmallRegression54Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=26；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285139/-0.16907516382850324，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1800 | nBodySmallRegression54Test018 | 微小时间步积分 | 独立 Worker 初态 | steps=27；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285139/-0.16907516382850235，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_1900 | nBodySmallRegression54Test019 | 微小时间步积分 | 独立 Worker 初态 | steps=28；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851306/-0.1690751638285015，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2000 | nBodySmallRegression54Test020 | 微小时间步积分 | 独立 Worker 初态 | steps=29；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851306/-0.16907516382850069，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2100 | nBodySmallRegression54Test021 | 微小时间步积分 | 独立 Worker 初态 | steps=30；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851223/-0.16907516382849988，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2200 | nBodySmallRegression54Test022 | 微小时间步积分 | 独立 Worker 初态 | steps=31；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851223/-0.1690751638284991，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2300 | nBodySmallRegression54Test023 | 微小时间步积分 | 独立 Worker 初态 | steps=32；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851154/-0.16907516382849822，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2400 | nBodySmallRegression54Test024 | 微小时间步积分 | 独立 Worker 初态 | steps=33；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382851154/-0.16907516382849744，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2500 | nBodySmallRegression54Test025 | 微小时间步积分 | 独立 Worker 初态 | steps=34；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285107/-0.1690751638284966，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2600 | nBodySmallRegression54Test026 | 微小时间步积分 | 独立 Worker 初态 | steps=35；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638285107/-0.16907516382849572，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2700 | nBodySmallRegression54Test027 | 微小时间步积分 | 独立 Worker 初态 | steps=36；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850973/-0.16907516382849494，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION54TEST_2800 | nBodySmallRegression54Test028 | 微小时间步积分 | 独立 Worker 初态 | steps=37；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850973/-0.1690751638284942，误差<2e-11 | Pass |

### NBodyLargeRegression55Test

源码：[NBodyLargeRegression55Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression55Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0100 | nBodyLargeRegression55Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=38；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690735663005981/-0.16907189204297285，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0200 | nBodyLargeRegression55Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=39；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690735663005981/-0.16907180197560348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0300 | nBodyLargeRegression55Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=40；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907348001501316/-0.16907171172337912，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0400 | nBodyLargeRegression55Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=41；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907348001501316/-0.16907162128776385，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0500 | nBodyLargeRegression55Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=42；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907339351799938/-0.16907153067022754，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0600 | nBodyLargeRegression55Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=43；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907339351799938/-0.16907143987224663，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0700 | nBodyLargeRegression55Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=44；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907330681089416/-0.1690713488953035，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0800 | nBodyLargeRegression55Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=45；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907330681089416/-0.16907125774088677，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_0900 | nBodyLargeRegression55Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=46；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907321989504254/-0.169071166410491，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1000 | nBodyLargeRegression55Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=47；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907321989504254/-0.16907107490561685，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1100 | nBodyLargeRegression55Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=48；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907313277179564/-0.16907098322777067，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1200 | nBodyLargeRegression55Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=49；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907313277179564/-0.16907089137846523，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1300 | nBodyLargeRegression55Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=50；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690730454425123/-0.16907079935921865，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1400 | nBodyLargeRegression55Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=51；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690730454425123/-0.1690707071715553，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1500 | nBodyLargeRegression55Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=52；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907295790855761/-0.1690706148170048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1600 | nBodyLargeRegression55Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=53；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907295790855761/-0.16907052229710318，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1700 | nBodyLargeRegression55Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=54；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907287017130404/-0.1690704296133916，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1800 | nBodyLargeRegression55Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=55；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907287017130404/-0.16907033676741692，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_1900 | nBodyLargeRegression55Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=56；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907278223213043/-0.16907024376073154，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2000 | nBodyLargeRegression55Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=57；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907278223213043/-0.16907015059489391，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2100 | nBodyLargeRegression55Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=58；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690726940924228/-0.16907005727146726，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2200 | nBodyLargeRegression55Test022 | 较大时间步积分 | 独立 Worker 初态 | steps=59；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690726940924228/-0.16906996379202066，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2300 | nBodyLargeRegression55Test023 | 较大时间步积分 | 独立 Worker 初态 | steps=60；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907260575357333/-0.16906987015812827，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2400 | nBodyLargeRegression55Test024 | 较大时间步积分 | 独立 Worker 初态 | steps=61；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907260575357333/-0.16906977637136986，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2500 | nBodyLargeRegression55Test025 | 较大时间步积分 | 独立 Worker 初态 | steps=62；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907251721698158/-0.16906968243333048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION55TEST_2600 | nBodyLargeRegression55Test026 | 较大时间步积分 | 独立 Worker 初态 | steps=63；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16907251721698158/-0.16906958834560004，误差<2e-11 | Pass |

### NBodyPartitionedRegression56Test

源码：[NBodyPartitionedRegression56Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression56Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0100 | nBodyPartitionedRegression56Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=64；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513743475813/-0.169075110817294，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0200 | nBodyPartitionedRegression56Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=65；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513743475813/-0.16907510998193823，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0300 | nBodyPartitionedRegression56Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=66；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513660632734/-0.1690751091463682，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0400 | nBodyPartitionedRegression56Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=67；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513660632734/-0.16907510831058392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0500 | nBodyPartitionedRegression56Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=68；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513577767808/-0.16907510747458557，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0600 | nBodyPartitionedRegression56Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=69；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513577767808/-0.16907510663837327，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0700 | nBodyPartitionedRegression56Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=70；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513494881074/-0.1690751058019471，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0800 | nBodyPartitionedRegression56Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=71；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513494881074/-0.16907510496530728，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_0900 | nBodyPartitionedRegression56Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=72；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513411972533/-0.16907510412845383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1000 | nBodyPartitionedRegression56Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=73；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513411972533/-0.1690751032913869，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1100 | nBodyPartitionedRegression56Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=74；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513329042193/-0.1690751024541069，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1200 | nBodyPartitionedRegression56Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=75；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513329042193/-0.16907510161661352，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1300 | nBodyPartitionedRegression56Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=76；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513246090047/-0.169075100778907，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1400 | nBodyPartitionedRegression56Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=77；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513246090047/-0.16907509994098774，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1500 | nBodyPartitionedRegression56Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=78；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751316311614/-0.16907509910285554，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1600 | nBodyPartitionedRegression56Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=79；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751316311614/-0.16907509826451084，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1700 | nBodyPartitionedRegression56Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=80；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513080120487/-0.1690750974259534，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION56TEST_1800 | nBodyPartitionedRegression56Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=81；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907513080120487/-0.1690750965871835，误差<2e-11 | Pass |

### NBodyBalancedRegression57Test

源码：[NBodyBalancedRegression57Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression57Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0100 | nBodyBalancedRegression57Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=82；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512997103086/-0.16907509574820145，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0200 | nBodyBalancedRegression57Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=83；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512997103086/-0.16907509490900713，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0300 | nBodyBalancedRegression57Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=84；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512914063938/-0.1690750940696008，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0400 | nBodyBalancedRegression57Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=85；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512914063938/-0.16907509322998243，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0500 | nBodyBalancedRegression57Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=86；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512831003071/-0.16907509239015253，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0600 | nBodyBalancedRegression57Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=87；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512831003071/-0.16907509155011072，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0700 | nBodyBalancedRegression57Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=88；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751274792051/-0.1690750907098575，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0800 | nBodyBalancedRegression57Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=89；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751274792051/-0.1690750898693928，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_0900 | nBodyBalancedRegression57Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=90；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751266481625/-0.169075089028717，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1000 | nBodyBalancedRegression57Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=91；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751266481625/-0.16907508818782988，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1100 | nBodyBalancedRegression57Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=92；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512581690282/-0.1690750873467316，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1200 | nBodyBalancedRegression57Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=93；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512581690282/-0.16907508650542263，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1300 | nBodyBalancedRegression57Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=94；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751249854266/-0.16907508566390295，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1400 | nBodyBalancedRegression57Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=95；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751249854266/-0.1690750848221725，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1500 | nBodyBalancedRegression57Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=96；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751241537338/-0.16907508398023158，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1600 | nBodyBalancedRegression57Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=97；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751241537338/-0.16907508313808026，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION57TEST_1700 | nBodyBalancedRegression57Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=98；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907512332182456/-0.1690750822957187，误差<2e-11 | Pass |

### NBodyRawRegression58Test

源码：[NBodyRawRegression58Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression58Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0100 | nBodyRawRegression58Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=99；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986510431746/-0.1692898255244516，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0200 | nBodyRawRegression58Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=100；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986431787194/-0.16928982472754223，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0300 | nBodyRawRegression58Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=101；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986431787194/-0.16928982393042655，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0400 | nBodyRawRegression58Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=102；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.169289863531214/-0.1692898231331048，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0500 | nBodyRawRegression58Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=103；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.169289863531214/-0.16928982233557716，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0600 | nBodyRawRegression58Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=104；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986274434416/-0.1692898215378434，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0700 | nBodyRawRegression58Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=105；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986274434416/-0.16928982073990387，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0800 | nBodyRawRegression58Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=106；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986195726234/-0.16928981994175873，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_0900 | nBodyRawRegression58Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=107；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986195726234/-0.16928981914340788，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1000 | nBodyRawRegression58Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=108；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.1692898611699689/-0.16928981834485182，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1100 | nBodyRawRegression58Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=109；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.1692898611699689/-0.16928981754609038，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1200 | nBodyRawRegression58Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=110；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986038246369/-0.16928981674712368，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1300 | nBodyRawRegression58Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=111；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928986038246369/-0.16928981594795203，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1400 | nBodyRawRegression58Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=112；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985959474688/-0.16928981514857538，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1500 | nBodyRawRegression58Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=113；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985959474688/-0.16928981434899373，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1600 | nBodyRawRegression58Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=114；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.1692898588068187/-0.16928981354920766，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1700 | nBodyRawRegression58Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=115；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.1692898588068187/-0.16928981274921667，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1800 | nBodyRawRegression58Test018 | 未平衡初态积分 | 独立 Worker 初态 | steps=116；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985801867916/-0.16928981194902132，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_1900 | nBodyRawRegression58Test019 | 未平衡初态积分 | 独立 Worker 初态 | steps=117；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985801867916/-0.16928981114862168，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_2000 | nBodyRawRegression58Test020 | 未平衡初态积分 | 独立 Worker 初态 | steps=118；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985723032838/-0.1692898103480179，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_2100 | nBodyRawRegression58Test021 | 未平衡初态积分 | 独立 Worker 初态 | steps=119；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985723032838/-0.1692898095472097，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_2200 | nBodyRawRegression58Test022 | 未平衡初态积分 | 独立 Worker 初态 | steps=120；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985644176658/-0.1692898087461978，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_2300 | nBodyRawRegression58Test023 | 未平衡初态积分 | 独立 Worker 初态 | steps=121；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985644176658/-0.16928980794498188，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION58TEST_2400 | nBodyRawRegression58Test024 | 未平衡初态积分 | 独立 Worker 初态 | steps=122；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928985565299384/-0.16928980714356232，误差<2e-11 | Pass |

### NBodyZeroRegression59Test

源码：[NBodyZeroRegression59Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression59Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0100 | nBodyZeroRegression59Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=1150；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0200 | nBodyZeroRegression59Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=1151；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0300 | nBodyZeroRegression59Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=1152；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0400 | nBodyZeroRegression59Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=1153；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0500 | nBodyZeroRegression59Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=1154；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0600 | nBodyZeroRegression59Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=1155；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0700 | nBodyZeroRegression59Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=1156；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0800 | nBodyZeroRegression59Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=1157；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_0900 | nBodyZeroRegression59Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=1158；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1000 | nBodyZeroRegression59Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=1159；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1100 | nBodyZeroRegression59Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=1160；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1200 | nBodyZeroRegression59Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=1161；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1300 | nBodyZeroRegression59Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=1162；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1400 | nBodyZeroRegression59Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=1163；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1500 | nBodyZeroRegression59Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=1164；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1600 | nBodyZeroRegression59Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=1165；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1700 | nBodyZeroRegression59Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=1166；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1800 | nBodyZeroRegression59Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=1167；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_1900 | nBodyZeroRegression59Test019 | 零时间步恒等 | 独立 Worker 初态 | steps=1168；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_2000 | nBodyZeroRegression59Test020 | 零时间步恒等 | 独立 Worker 初态 | steps=1169；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_2100 | nBodyZeroRegression59Test021 | 零时间步恒等 | 独立 Worker 初态 | steps=1170；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_2200 | nBodyZeroRegression59Test022 | 零时间步恒等 | 独立 Worker 初态 | steps=1171；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION59TEST_2300 | nBodyZeroRegression59Test023 | 零时间步恒等 | 独立 Worker 初态 | steps=1172；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression60Test

源码：[NBodyReverseRegression60Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression60Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0100 | nBodyReverseRegression60Test001 | 负时间步积分 | 独立 Worker 初态 | steps=146；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751044321277/-0.16907504625036512，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0200 | nBodyReverseRegression60Test002 | 负时间步积分 | 独立 Worker 初态 | steps=147；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751044321277/-0.16907504546199784，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0300 | nBodyReverseRegression60Test003 | 负时间步积分 | 独立 Worker 初态 | steps=148；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751036268078/-0.169075044673867，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0400 | nBodyReverseRegression60Test004 | 负时间步积分 | 独立 Worker 初态 | steps=149；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690751036268078/-0.16907504388597264，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0500 | nBodyReverseRegression60Test005 | 负时间步积分 | 独立 Worker 初态 | steps=150；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510282171606/-0.169075043098315，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0600 | nBodyReverseRegression60Test006 | 负时间步积分 | 独立 Worker 初态 | steps=151；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510282171606/-0.16907504231089407，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0700 | nBodyReverseRegression60Test007 | 负时间步积分 | 独立 Worker 初态 | steps=152；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510201685247/-0.16907504152371014，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0800 | nBodyReverseRegression60Test008 | 负时间步积分 | 独立 Worker 初态 | steps=153；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510201685247/-0.1690750407367631，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_0900 | nBodyReverseRegression60Test009 | 负时间步积分 | 独立 Worker 初态 | steps=154；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510121221725/-0.16907503995005316，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1000 | nBodyReverseRegression60Test010 | 负时间步积分 | 独立 Worker 初态 | steps=155；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510121221725/-0.16907503916358047，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1100 | nBodyReverseRegression60Test011 | 负时间步积分 | 独立 Worker 初态 | steps=156；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510040781035/-0.1690750383773449，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1200 | nBodyReverseRegression60Test012 | 负时间步积分 | 独立 Worker 初态 | steps=157；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907510040781035/-0.169075037591347，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1300 | nBodyReverseRegression60Test013 | 负时间步积分 | 独立 Worker 初态 | steps=158；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907509960363207/-0.16907503680558653，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1400 | nBodyReverseRegression60Test014 | 负时间步积分 | 独立 Worker 初态 | steps=159；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907509960363207/-0.16907503602006377，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1500 | nBodyReverseRegression60Test015 | 负时间步积分 | 独立 Worker 初态 | steps=160；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907509879968244/-0.16907503523477874，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1600 | nBodyReverseRegression60Test016 | 负时间步积分 | 独立 Worker 初态 | steps=161；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907509879968244/-0.16907503444973154，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION60TEST_1700 | nBodyReverseRegression60Test017 | 负时间步积分 | 独立 Worker 初态 | steps=162；dt=-0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750979959617/-0.16907503366492238，误差<2e-11 | Pass |

### NBodySmallRegression61Test

源码：[NBodySmallRegression61Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression61Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0100 | nBodySmallRegression61Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=163；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845797/-0.16907516382839077，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0200 | nBodySmallRegression61Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=164；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845725/-0.16907516382839008，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0300 | nBodySmallRegression61Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=165；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845725/-0.16907516382838914，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0400 | nBodySmallRegression61Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=166；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845644/-0.16907516382838825，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0500 | nBodySmallRegression61Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=167；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845644/-0.16907516382838741，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0600 | nBodySmallRegression61Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=168；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845555/-0.16907516382838658，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0700 | nBodySmallRegression61Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=169；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845555/-0.1690751638283859，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0800 | nBodySmallRegression61Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=170；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845458/-0.16907516382838506，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_0900 | nBodySmallRegression61Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=171；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845458/-0.16907516382838425，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1000 | nBodySmallRegression61Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=172；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845386/-0.16907516382838333，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1100 | nBodySmallRegression61Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=173；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845386/-0.16907516382838253，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1200 | nBodySmallRegression61Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=174；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845322/-0.16907516382838164，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1300 | nBodySmallRegression61Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=175；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845322/-0.1690751638283809，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1400 | nBodySmallRegression61Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=176；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845222/-0.16907516382838017，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1500 | nBodySmallRegression61Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=177；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845222/-0.16907516382837925，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1600 | nBodySmallRegression61Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=178；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845147/-0.16907516382837848，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION61TEST_1700 | nBodySmallRegression61Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=179；dt=6.25e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382845147/-0.16907516382837756，误差<2e-11 | Pass |

### NBodyLargeRegression62Test

源码：[NBodyLargeRegression62Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression62Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0100 | nBodyLargeRegression62Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=180；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690669973379822/-0.16905801376448973，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0200 | nBodyLargeRegression62Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=181；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690669973379822/-0.16905791415603186，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0300 | nBodyLargeRegression62Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=182；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906689972399697/-0.16905781460765204，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0400 | nBodyLargeRegression62Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=183；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906689972399697/-0.16905771512114046，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0500 | nBodyLargeRegression62Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=184；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906680200846153/-0.16905761569828448，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0600 | nBodyLargeRegression62Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=185；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906680200846153/-0.16905751634086993，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0700 | nBodyLargeRegression62Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=186；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690667041930968/-0.16905741705068061，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0800 | nBodyLargeRegression62Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=187；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690667041930968/-0.1690573178294982，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_0900 | nBodyLargeRegression62Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=188；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690666062796275/-0.16905721867910206，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1000 | nBodyLargeRegression62Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=189；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.1690666062796275/-0.16905711960126985，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1100 | nBodyLargeRegression62Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=190；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906650826978176/-0.16905702059777644，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1200 | nBodyLargeRegression62Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=191；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906650826978176/-0.16905692167039488，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1300 | nBodyLargeRegression62Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=192；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906641016529084/-0.16905682282089568，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1400 | nBodyLargeRegression62Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=193；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906641016529084/-0.16905672405104677，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1500 | nBodyLargeRegression62Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=194；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906631196788982/-0.1690566253626141，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1600 | nBodyLargeRegression62Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=195；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906631196788982/-0.16905652675736083，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1700 | nBodyLargeRegression62Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=196；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906621367931604/-0.16905642823704745，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION62TEST_1800 | nBodyLargeRegression62Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=197；dt=0.00625 | 初/中/末能量=-0.16907516382852453/-0.16906621367931604/-0.16905632980343202，误差<2e-11 | Pass |

### NBodyPartitionedRegression63Test

源码：[NBodyPartitionedRegression63Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression63Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0100 | nBodyPartitionedRegression63Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=198；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.169075081453147/-0.16907499702014775，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0200 | nBodyPartitionedRegression63Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=199；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.169075081453147/-0.1690749961572244，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0300 | nBodyPartitionedRegression63Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=200；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907508061036539/-0.16907499529410439，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0400 | nBodyPartitionedRegression63Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=201；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907508061036539/-0.16907499443078775，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0500 | nBodyPartitionedRegression63Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=202；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507976737374/-0.16907499356727457，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0600 | nBodyPartitionedRegression63Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=203；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507976737374/-0.16907499270356488，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0700 | nBodyPartitionedRegression63Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=204；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507892417242/-0.169074991839659，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0800 | nBodyPartitionedRegression63Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=205；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507892417242/-0.16907499097555717，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_0900 | nBodyPartitionedRegression63Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=206；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750780807616/-0.16907499011125912，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1000 | nBodyPartitionedRegression63Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=207；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750780807616/-0.16907498924676548，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1100 | nBodyPartitionedRegression63Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=208；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507723714132/-0.1690749883820761，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1200 | nBodyPartitionedRegression63Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=209；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507723714132/-0.16907498751719102，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1300 | nBodyPartitionedRegression63Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=210；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507639331146/-0.16907498665211057，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1400 | nBodyPartitionedRegression63Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=211；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507639331146/-0.16907498578683475，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1500 | nBodyPartitionedRegression63Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=212；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507554927256/-0.16907498492136383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1600 | nBodyPartitionedRegression63Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=213；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507554927256/-0.16907498405569799，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1700 | nBodyPartitionedRegression63Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=214；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507470502453/-0.16907498318983702，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1800 | nBodyPartitionedRegression63Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=215；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507470502453/-0.16907498232378143，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_1900 | nBodyPartitionedRegression63Test019 | 分段轨迹检查点 | 独立 Worker 初态 | steps=216；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750738605675/-0.1690749814575312，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_2000 | nBodyPartitionedRegression63Test020 | 分段轨迹检查点 | 独立 Worker 初态 | steps=217；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750738605675/-0.16907498059108658，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_2100 | nBodyPartitionedRegression63Test021 | 分段轨迹检查点 | 独立 Worker 初态 | steps=218；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507301590166/-0.16907497972444765，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_2200 | nBodyPartitionedRegression63Test022 | 分段轨迹检查点 | 独立 Worker 初态 | steps=219；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507301590166/-0.16907497885761438，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_2300 | nBodyPartitionedRegression63Test023 | 分段轨迹检查点 | 独立 Worker 初态 | steps=220；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507217102707/-0.16907497799058696，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION63TEST_2400 | nBodyPartitionedRegression63Test024 | 分段轨迹检查点 | 独立 Worker 初态 | steps=221；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507217102707/-0.16907497712336583，误差<2e-11 | Pass |

### NBodyBalancedRegression64Test

源码：[NBodyBalancedRegression64Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression64Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0100 | nBodyBalancedRegression64Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=222；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507132594402/-0.1690749762559508，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0200 | nBodyBalancedRegression64Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=223；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907507132594402/-0.16907497538834204，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0300 | nBodyBalancedRegression64Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=224；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750704806524/-0.1690749745205398，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0400 | nBodyBalancedRegression64Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=225；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750704806524/-0.16907497365254434，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0500 | nBodyBalancedRegression64Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=226；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750696351526/-0.1690749727843552，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0600 | nBodyBalancedRegression64Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=227；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750696351526/-0.16907497191597337，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0700 | nBodyBalancedRegression64Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=228；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506878944445/-0.16907497104739844，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0800 | nBodyBalancedRegression64Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=229；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506878944445/-0.16907497017863068，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_0900 | nBodyBalancedRegression64Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=230；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750679435282/-0.16907496930967014，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1000 | nBodyBalancedRegression64Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=231；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.1690750679435282/-0.1690749684405171，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1100 | nBodyBalancedRegression64Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=232；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506709740414/-0.16907496757117166，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1200 | nBodyBalancedRegression64Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=233；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506709740414/-0.16907496670163397，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1300 | nBodyBalancedRegression64Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=234；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506625107216/-0.16907496583190398，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1400 | nBodyBalancedRegression64Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=235；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506625107216/-0.169074964961982，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1500 | nBodyBalancedRegression64Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=236；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506540453274/-0.16907496409186826，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1600 | nBodyBalancedRegression64Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=237；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506540453274/-0.16907496322156276，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1700 | nBodyBalancedRegression64Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=238；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506455778576/-0.16907496235106564，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1800 | nBodyBalancedRegression64Test018 | 动量平衡正向积分 | 独立 Worker 初态 | steps=239；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506455778576/-0.169074961480377，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_1900 | nBodyBalancedRegression64Test019 | 动量平衡正向积分 | 独立 Worker 初态 | steps=240；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506371083122/-0.16907496060949712，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_2000 | nBodyBalancedRegression64Test020 | 动量平衡正向积分 | 独立 Worker 初态 | steps=241；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506371083122/-0.16907495973842612，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_2100 | nBodyBalancedRegression64Test021 | 动量平衡正向积分 | 独立 Worker 初态 | steps=242；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506286366947/-0.169074958867164，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_2200 | nBodyBalancedRegression64Test022 | 动量平衡正向积分 | 独立 Worker 初态 | steps=243；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506286366947/-0.1690749579957109，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION64TEST_2300 | nBodyBalancedRegression64Test023 | 动量平衡正向积分 | 独立 Worker 初态 | steps=244；dt=0.000625 | 初/中/末能量=-0.16907516382852453/-0.16907506201630051/-0.16907495712406703，误差<2e-11 | Pass |

### NBodyRawRegression65Test

源码：[NBodyRawRegression65Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression65Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0100 | nBodyRawRegression65Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=245；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980714356232/-0.16928970705395566，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0200 | nBodyRawRegression65Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=246；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980634193874/-0.1692897062282231，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0300 | nBodyRawRegression65Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=247；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980634193874/-0.1692897054023022，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0400 | nBodyRawRegression65Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=248；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980554011203/-0.1692897045761933，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0500 | nBodyRawRegression65Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=249；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980554011203/-0.16928970374989658，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0600 | nBodyRawRegression65Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=250；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980473808178/-0.1692897029234117，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0700 | nBodyRawRegression65Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=251；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980473808178/-0.16928970209673946，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0800 | nBodyRawRegression65Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=252；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980393584833/-0.16928970126987952，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_0900 | nBodyRawRegression65Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=253；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980393584833/-0.16928970044283193，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1000 | nBodyRawRegression65Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=254；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980313341171/-0.16928969961559717，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1100 | nBodyRawRegression65Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=255；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980313341171/-0.16928969878817515，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1200 | nBodyRawRegression65Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=256；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980233077198/-0.1692896979605661，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1300 | nBodyRawRegression65Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=257；dt=0.000625 | 初/中/末能量=-0.1692899033779057/-0.16928980233077198/-0.16928969713277014，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1400 | nBodyRawRegression65Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=1；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692899033779057/-0.1692899022606324，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1500 | nBodyRawRegression65Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=2；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692899022606324/-0.16928990114298248，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1600 | nBodyRawRegression65Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=3；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692899022606324/-0.1692899000249559，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION65TEST_1700 | nBodyRawRegression65Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=4；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928990114298248/-0.1692898989065532，误差<2e-11 | Pass |

### NBodyZeroRegression66Test

源码：[NBodyZeroRegression66Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression66Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0100 | nBodyZeroRegression66Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=1289；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0200 | nBodyZeroRegression66Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=1290；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0300 | nBodyZeroRegression66Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=1291；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0400 | nBodyZeroRegression66Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=1292；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0500 | nBodyZeroRegression66Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=1293；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0600 | nBodyZeroRegression66Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=1294；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0700 | nBodyZeroRegression66Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=1295；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0800 | nBodyZeroRegression66Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=1296；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_0900 | nBodyZeroRegression66Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=1297；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1000 | nBodyZeroRegression66Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=1298；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1100 | nBodyZeroRegression66Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=1299；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1200 | nBodyZeroRegression66Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=1300；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1300 | nBodyZeroRegression66Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=1301；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1400 | nBodyZeroRegression66Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=1302；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1500 | nBodyZeroRegression66Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=1303；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1600 | nBodyZeroRegression66Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=1304；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION66TEST_1700 | nBodyZeroRegression66Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=1305；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression67Test

源码：[NBodyReverseRegression67Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression67Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0100 | nBodyReverseRegression67Test001 | 负时间步积分 | 独立 Worker 初态 | steps=22；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907515083403704/-0.16907513788565584，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0200 | nBodyReverseRegression67Test002 | 负时间步积分 | 独立 Worker 初态 | steps=23；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907515083403704/-0.16907513671082805，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0300 | nBodyReverseRegression67Test003 | 负时间步积分 | 独立 Worker 初态 | steps=24；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514965500123/-0.16907513553638442，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0400 | nBodyReverseRegression67Test004 | 负时间步积分 | 独立 Worker 初态 | steps=25；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514965500123/-0.16907513436232502，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0500 | nBodyReverseRegression67Test005 | 负时间步积分 | 独立 Worker 初态 | steps=26；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514847634647/-0.1690751331886503，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0600 | nBodyReverseRegression67Test006 | 负时间步积分 | 独立 Worker 初态 | steps=27；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514847634647/-0.16907513201536026，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0700 | nBodyReverseRegression67Test007 | 负时间步积分 | 独立 Worker 初态 | steps=28；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514729807374/-0.16907513084245535，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0800 | nBodyReverseRegression67Test008 | 负时间步积分 | 独立 Worker 初态 | steps=29；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514729807374/-0.16907512966993574，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_0900 | nBodyReverseRegression67Test009 | 负时间步积分 | 独立 Worker 初态 | steps=30；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751461201825/-0.16907512849780162，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1000 | nBodyReverseRegression67Test010 | 负时间步积分 | 独立 Worker 初态 | steps=31；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751461201825/-0.16907512732605318，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1100 | nBodyReverseRegression67Test011 | 负时间步积分 | 独立 Worker 初态 | steps=32；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514494267337/-0.1690751261546911，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1200 | nBodyReverseRegression67Test012 | 负时间步积分 | 独立 Worker 初态 | steps=33；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514494267337/-0.16907512498371505，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1300 | nBodyReverseRegression67Test013 | 负时间步积分 | 独立 Worker 初态 | steps=34；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751437655466/-0.1690751238131257，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1400 | nBodyReverseRegression67Test014 | 负时间步积分 | 独立 Worker 初态 | steps=35；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751437655466/-0.16907512264292307，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1500 | nBodyReverseRegression67Test015 | 负时间步积分 | 独立 Worker 初态 | steps=36；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514258880244/-0.16907512147310752，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1600 | nBodyReverseRegression67Test016 | 负时间步积分 | 独立 Worker 初态 | steps=37；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907514258880244/-0.16907512030367916，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION67TEST_1700 | nBodyReverseRegression67Test017 | 负时间步积分 | 独立 Worker 初态 | steps=38；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751414124409/-0.16907511913463844，误差<2e-11 | Pass |

### NBodySmallRegression68Test

源码：[NBodySmallRegression68Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression68Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0100 | nBodySmallRegression68Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=39；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850213/-0.16907516382847837，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0200 | nBodySmallRegression68Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=40；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850082/-0.16907516382847723，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0300 | nBodySmallRegression68Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=41；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382850082/-0.16907516382847598，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0400 | nBodySmallRegression68Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=42；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849969/-0.16907516382847473，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0500 | nBodySmallRegression68Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=43；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849969/-0.16907516382847365，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0600 | nBodySmallRegression68Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=44；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849844/-0.16907516382847243，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0700 | nBodySmallRegression68Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=45；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849844/-0.16907516382847126，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0800 | nBodySmallRegression68Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=46；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849733/-0.16907516382847018，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_0900 | nBodySmallRegression68Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=47；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849733/-0.16907516382846885，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1000 | nBodySmallRegression68Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=48；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849613/-0.1690751638284678，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1100 | nBodySmallRegression68Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=49；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849613/-0.16907516382846655，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1200 | nBodySmallRegression68Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=50；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849497/-0.16907516382846535，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1300 | nBodySmallRegression68Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=51；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849497/-0.1690751638284641，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1400 | nBodySmallRegression68Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=52；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849386/-0.16907516382846294，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1500 | nBodySmallRegression68Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=53；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849386/-0.16907516382846177，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1600 | nBodySmallRegression68Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=54；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849258/-0.16907516382846047，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION68TEST_1700 | nBodySmallRegression68Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=55；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382849258/-0.16907516382845938，误差<2e-11 | Pass |

### NBodyLargeRegression69Test

源码：[NBodyLargeRegression69Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression69Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0100 | nBodyLargeRegression69Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=56；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690717103525379/-0.16906799219808974，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0200 | nBodyLargeRegression69Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=57；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690717103525379/-0.16906785535466032，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0300 | nBodyLargeRegression69Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=58；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907158173390552/-0.16906771826452452，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0400 | nBodyLargeRegression69Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=59；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907158173390552/-0.16906758093106025，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0500 | nBodyLargeRegression69Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=60；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907145277955912/-0.16906744335765703，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0600 | nBodyLargeRegression69Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=61；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907145277955912/-0.16906730554771704，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0700 | nBodyLargeRegression69Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=62；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690713234924741/-0.16906716750465375，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0800 | nBodyLargeRegression69Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=63；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690713234924741/-0.16906702923189265，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_0900 | nBodyLargeRegression69Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=64；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907119387564212/-0.16906689073287073，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1000 | nBodyLargeRegression69Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=65；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907119387564212/-0.1690667520110362，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1100 | nBodyLargeRegression69Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=66；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907106393207105/-0.1690666130698483，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1200 | nBodyLargeRegression69Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=67；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907106393207105/-0.16906647391277768，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1300 | nBodyLargeRegression69Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=68；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907093366478487/-0.16906633454330555，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1400 | nBodyLargeRegression69Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=69；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907093366478487/-0.16906619496492367，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1500 | nBodyLargeRegression69Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=70；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907080307682293/-0.1690660551811348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1600 | nBodyLargeRegression69Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=71；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907080307682293/-0.16906591519545153，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1700 | nBodyLargeRegression69Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=72；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690706721712409/-0.16906577501139655，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1800 | nBodyLargeRegression69Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=73；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690706721712409/-0.16906563463250324，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_1900 | nBodyLargeRegression69Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=74；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907054095110957/-0.1690654940623138，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2000 | nBodyLargeRegression69Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=75；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907054095110957/-0.16906535330438074，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2100 | nBodyLargeRegression69Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=76；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907040941951557/-0.16906521236226602，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2200 | nBodyLargeRegression69Test022 | 较大时间步积分 | 独立 Worker 初态 | steps=77；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907040941951557/-0.16906507123954034，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2300 | nBodyLargeRegression69Test023 | 较大时间步积分 | 独立 Worker 初态 | steps=78；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907027757956064/-0.16906492993978398，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2400 | nBodyLargeRegression69Test024 | 较大时间步积分 | 独立 Worker 初态 | steps=79；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16907027757956064/-0.16906478846658596，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2500 | nBodyLargeRegression69Test025 | 较大时间步积分 | 独立 Worker 初态 | steps=80；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690701454343617/-0.169064646823544，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2600 | nBodyLargeRegression69Test026 | 较大时间步积分 | 独立 Worker 初态 | steps=81；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690701454343617/-0.16906450501426437，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2700 | nBodyLargeRegression69Test027 | 较大时间步积分 | 独立 Worker 初态 | steps=82；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690700129870507/-0.1690643630423618，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2800 | nBodyLargeRegression69Test028 | 较大时间步积分 | 独立 Worker 初态 | steps=83；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690700129870507/-0.16906422091145937，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_2900 | nBodyLargeRegression69Test029 | 较大时间步积分 | 独立 Worker 初态 | steps=84；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16906988024077463/-0.16906407862518777，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_3000 | nBodyLargeRegression69Test030 | 较大时间步积分 | 独立 Worker 初态 | steps=85；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16906988024077463/-0.16906393618718582，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_3100 | nBodyLargeRegression69Test031 | 较大时间步积分 | 独立 Worker 初态 | steps=86；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690697471986952/-0.16906379360109983，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_3200 | nBodyLargeRegression69Test032 | 较大时间步积分 | 独立 Worker 初态 | steps=87；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690697471986952/-0.16906365087058392，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_3300 | nBodyLargeRegression69Test033 | 较大时间步积分 | 独立 Worker 初态 | steps=88；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16906961386398847/-0.1690635079992988，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION69TEST_3400 | nBodyLargeRegression69Test034 | 较大时间步积分 | 独立 Worker 初态 | steps=89；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16906961386398847/-0.16906336499091285，误差<2e-11 | Pass |

### NBodyPartitionedRegression70Test

源码：[NBodyPartitionedRegression70Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression70Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0100 | nBodyPartitionedRegression70Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=90；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907511022776006/-0.16907505587109994，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0200 | nBodyPartitionedRegression70Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=91；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907511022776006/-0.16907505465477163，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0300 | nBodyPartitionedRegression70Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=92；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751090279588/-0.1690750534380822，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0400 | nBodyPartitionedRegression70Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=93；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751090279588/-0.1690750522210317，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0500 | nBodyPartitionedRegression70Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=94；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751078277842/-0.16907505100362086，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0600 | nBodyPartitionedRegression70Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=95；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751078277842/-0.1690750497858495，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0700 | nBodyPartitionedRegression70Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=96；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510662723704/-0.16907504856771796，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0800 | nBodyPartitionedRegression70Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=97；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510662723704/-0.16907504734922676，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_0900 | nBodyPartitionedRegression70Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=98；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510542631743/-0.16907504613037588，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1000 | nBodyPartitionedRegression70Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=99；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510542631743/-0.16907504491116576，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1100 | nBodyPartitionedRegression70Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=100；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510422502536/-0.1690750436915967，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1200 | nBodyPartitionedRegression70Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=101；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510422502536/-0.16907504247166885，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1300 | nBodyPartitionedRegression70Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=102；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510302336132/-0.1690750412513825，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1400 | nBodyPartitionedRegression70Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=103；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510302336132/-0.16907504003073817，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1500 | nBodyPartitionedRegression70Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=104；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751018213256/-0.1690750388097357，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1600 | nBodyPartitionedRegression70Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=105；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690751018213256/-0.1690750375883756，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1700 | nBodyPartitionedRegression70Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=106；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510061891823/-0.1690750363666582，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1800 | nBodyPartitionedRegression70Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=107；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907510061891823/-0.16907503514458372，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION70TEST_1900 | nBodyPartitionedRegression70Test019 | 分段轨迹检查点 | 独立 Worker 初态 | steps=108；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509941613996/-0.16907503392215217，误差<2e-11 | Pass |

### NBodyBalancedRegression71Test

源码：[NBodyBalancedRegression71Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression71Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0100 | nBodyBalancedRegression71Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=109；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509941613996/-0.1690750326993642，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0200 | nBodyBalancedRegression71Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=110；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509821299044/-0.1690750314762199，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0300 | nBodyBalancedRegression71Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=111；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509821299044/-0.16907503025271953，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0400 | nBodyBalancedRegression71Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=112；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509700947027/-0.16907502902886348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0500 | nBodyBalancedRegression71Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=113；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509700947027/-0.16907502780465172，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0600 | nBodyBalancedRegression71Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=114；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750958055798/-0.169075026580085，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0700 | nBodyBalancedRegression71Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=115；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750958055798/-0.16907502535516336，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0800 | nBodyBalancedRegression71Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=116；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750946013191/-0.16907502412988684，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_0900 | nBodyBalancedRegression71Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=117；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750946013191/-0.16907502290425597，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1000 | nBodyBalancedRegression71Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=118；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750933966883/-0.169075021678271，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1100 | nBodyBalancedRegression71Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=119；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750933966883/-0.16907502045193207，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1200 | nBodyBalancedRegression71Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=120；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.169075092191688/-0.16907501922523976，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1300 | nBodyBalancedRegression71Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=121；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.169075092191688/-0.16907501799819402，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1400 | nBodyBalancedRegression71Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=122；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509098631832/-0.1690750167707952，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1500 | nBodyBalancedRegression71Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=123；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907509098631832/-0.16907501554304372，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1600 | nBodyBalancedRegression71Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=124；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508978057945/-0.1690750143149397，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1700 | nBodyBalancedRegression71Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=125；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508978057945/-0.1690750130864835，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1800 | nBodyBalancedRegression71Test018 | 动量平衡正向积分 | 独立 Worker 初态 | steps=126；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750885744718/-0.16907501185767537，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_1900 | nBodyBalancedRegression71Test019 | 动量平衡正向积分 | 独立 Worker 初态 | steps=127；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750885744718/-0.1690750106285154，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2000 | nBodyBalancedRegression71Test020 | 动量平衡正向积分 | 独立 Worker 初态 | steps=128；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508736799556/-0.16907500939900422，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2100 | nBodyBalancedRegression71Test021 | 动量平衡正向积分 | 独立 Worker 初态 | steps=129；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508736799556/-0.16907500816914184，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2200 | nBodyBalancedRegression71Test022 | 动量平衡正向积分 | 独立 Worker 初态 | steps=130；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508616115097/-0.1690750069389287，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2300 | nBodyBalancedRegression71Test023 | 动量平衡正向积分 | 独立 Worker 初态 | steps=131；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508616115097/-0.16907500570836484，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2400 | nBodyBalancedRegression71Test024 | 动量平衡正向积分 | 独立 Worker 初态 | steps=132；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750849539383/-0.16907500447745089，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2500 | nBodyBalancedRegression71Test025 | 动量平衡正向积分 | 独立 Worker 初态 | steps=133；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750849539383/-0.1690750032461868，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2600 | nBodyBalancedRegression71Test026 | 动量平衡正向积分 | 独立 Worker 初态 | steps=134；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508374635768/-0.16907500201457298，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2700 | nBodyBalancedRegression71Test027 | 动量平衡正向积分 | 独立 Worker 初态 | steps=135；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508374635768/-0.16907500078260954，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2800 | nBodyBalancedRegression71Test028 | 动量平衡正向积分 | 独立 Worker 初态 | steps=136；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508253840964/-0.16907499955029717，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_2900 | nBodyBalancedRegression71Test029 | 动量平衡正向积分 | 独立 Worker 初态 | steps=137；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508253840964/-0.16907499831763576，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_3000 | nBodyBalancedRegression71Test030 | 动量平衡正向积分 | 独立 Worker 初态 | steps=138；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750813300943/-0.1690749970846258，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_3100 | nBodyBalancedRegression71Test031 | 动量平衡正向积分 | 独立 Worker 初态 | steps=139；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750813300943/-0.16907499585126726，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION71TEST_3200 | nBodyBalancedRegression71Test032 | 动量平衡正向积分 | 独立 Worker 初态 | steps=140；dt=0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907508012141206/-0.16907499461756081，误差<2e-11 | Pass |

### NBodyRawRegression72Test

源码：[NBodyRawRegression72Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression72Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0100 | nBodyRawRegression72Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=141；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692898242719071/-0.16928974223332177，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0200 | nBodyRawRegression72Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=142；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928982312883528/-0.16928974106530623，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0300 | nBodyRawRegression72Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=143；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928982312883528/-0.1692897398969487，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0400 | nBodyRawRegression72Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=144；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692898219854035/-0.16928973872824907，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0500 | nBodyRawRegression72Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=145；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692898219854035/-0.16928973755920748，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0600 | nBodyRawRegression72Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=146；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928982084161187/-0.16928973638982472，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0700 | nBodyRawRegression72Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=147；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928982084161187/-0.1692897352201006，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0800 | nBodyRawRegression72Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=148；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692898196974609/-0.16928973405003556，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_0900 | nBodyRawRegression72Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=149；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.1692898196974609/-0.1692897328796298，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1000 | nBodyRawRegression72Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=150；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981855295047/-0.16928973170888373，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1100 | nBodyRawRegression72Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=151；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981855295047/-0.16928973053779728，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1200 | nBodyRawRegression72Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=152；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981740808105/-0.1692897293663709，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1300 | nBodyRawRegression72Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=153；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981740808105/-0.16928972819460497，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1400 | nBodyRawRegression72Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=154；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981626285278/-0.16928972702249964，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1500 | nBodyRawRegression72Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=155；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981626285278/-0.16928972585005506，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1600 | nBodyRawRegression72Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=156；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981511726598/-0.16928972467727169，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION72TEST_1700 | nBodyRawRegression72Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=157；dt=0.00075 | 初/中/末能量=-0.1692899033779057/-0.16928981511726598/-0.16928972350414936，误差<2e-11 | Pass |

### NBodyZeroRegression73Test

源码：[NBodyZeroRegression73Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyZeroRegression73Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0100 | nBodyZeroRegression73Test001 | 零时间步恒等 | 独立 Worker 初态 | steps=1442；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0200 | nBodyZeroRegression73Test002 | 零时间步恒等 | 独立 Worker 初态 | steps=1443；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0300 | nBodyZeroRegression73Test003 | 零时间步恒等 | 独立 Worker 初态 | steps=1444；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0400 | nBodyZeroRegression73Test004 | 零时间步恒等 | 独立 Worker 初态 | steps=1445；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0500 | nBodyZeroRegression73Test005 | 零时间步恒等 | 独立 Worker 初态 | steps=1446；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0600 | nBodyZeroRegression73Test006 | 零时间步恒等 | 独立 Worker 初态 | steps=1447；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0700 | nBodyZeroRegression73Test007 | 零时间步恒等 | 独立 Worker 初态 | steps=1448；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0800 | nBodyZeroRegression73Test008 | 零时间步恒等 | 独立 Worker 初态 | steps=1449；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_0900 | nBodyZeroRegression73Test009 | 零时间步恒等 | 独立 Worker 初态 | steps=1450；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1000 | nBodyZeroRegression73Test010 | 零时间步恒等 | 独立 Worker 初态 | steps=1451；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1100 | nBodyZeroRegression73Test011 | 零时间步恒等 | 独立 Worker 初态 | steps=1452；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1200 | nBodyZeroRegression73Test012 | 零时间步恒等 | 独立 Worker 初态 | steps=1453；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1300 | nBodyZeroRegression73Test013 | 零时间步恒等 | 独立 Worker 初态 | steps=1454；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1400 | nBodyZeroRegression73Test014 | 零时间步恒等 | 独立 Worker 初态 | steps=1455；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1500 | nBodyZeroRegression73Test015 | 零时间步恒等 | 独立 Worker 初态 | steps=1456；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1600 | nBodyZeroRegression73Test016 | 零时间步恒等 | 独立 Worker 初态 | steps=1457；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1700 | nBodyZeroRegression73Test017 | 零时间步恒等 | 独立 Worker 初态 | steps=1458；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1800 | nBodyZeroRegression73Test018 | 零时间步恒等 | 独立 Worker 初态 | steps=1459；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_1900 | nBodyZeroRegression73Test019 | 零时间步恒等 | 独立 Worker 初态 | steps=1460；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2000 | nBodyZeroRegression73Test020 | 零时间步恒等 | 独立 Worker 初态 | steps=1461；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2100 | nBodyZeroRegression73Test021 | 零时间步恒等 | 独立 Worker 初态 | steps=1462；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2200 | nBodyZeroRegression73Test022 | 零时间步恒等 | 独立 Worker 初态 | steps=1463；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2300 | nBodyZeroRegression73Test023 | 零时间步恒等 | 独立 Worker 初态 | steps=1464；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2400 | nBodyZeroRegression73Test024 | 零时间步恒等 | 独立 Worker 初态 | steps=1465；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2500 | nBodyZeroRegression73Test025 | 零时间步恒等 | 独立 Worker 初态 | steps=1466；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2600 | nBodyZeroRegression73Test026 | 零时间步恒等 | 独立 Worker 初态 | steps=1467；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2700 | nBodyZeroRegression73Test027 | 零时间步恒等 | 独立 Worker 初态 | steps=1468；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2800 | nBodyZeroRegression73Test028 | 零时间步恒等 | 独立 Worker 初态 | steps=1469；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_2900 | nBodyZeroRegression73Test029 | 零时间步恒等 | 独立 Worker 初态 | steps=1470；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |
| SUB_NBODY_NBODYZEROREGRESSION73TEST_3000 | nBodyZeroRegression73Test030 | 零时间步恒等 | 独立 Worker 初态 | steps=1471；dt=0.0 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907516382852453，误差<2e-11 | Pass |

### NBodyReverseRegression74Test

源码：[NBodyReverseRegression74Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyReverseRegression74Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0100 | nBodyReverseRegression74Test001 | 负时间步积分 | 独立 Worker 初态 | steps=188；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907505429441494/-0.16907494830531292，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0200 | nBodyReverseRegression74Test002 | 负时间步积分 | 独立 Worker 初态 | steps=189；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907505429441494/-0.16907494719752209，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0300 | nBodyReverseRegression74Test003 | 负时间步积分 | 独立 Worker 初态 | steps=190；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750531478668/-0.16907494609015417，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0400 | nBodyReverseRegression74Test004 | 负时间步积分 | 独立 Worker 初态 | steps=191；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750531478668/-0.16907494498320952，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0500 | nBodyReverseRegression74Test005 | 负时间步积分 | 独立 Worker 初态 | steps=192；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750520017201/-0.1690749438766882，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0600 | nBodyReverseRegression74Test006 | 负时间步积分 | 独立 Worker 初态 | steps=193；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750520017201/-0.16907494277059057，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0700 | nBodyReverseRegression74Test007 | 负时间步积分 | 独立 Worker 初态 | steps=194；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750508559754/-0.16907494166491688，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0800 | nBodyReverseRegression74Test008 | 负时间步积分 | 独立 Worker 初态 | steps=195；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750508559754/-0.16907494055966718，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_0900 | nBodyReverseRegression74Test009 | 负时间步积分 | 独立 Worker 初态 | steps=196；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504971063256/-0.16907493945484184，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1000 | nBodyReverseRegression74Test010 | 负时间步积分 | 独立 Worker 初态 | steps=197；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504971063256/-0.1690749383504411，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1100 | nBodyReverseRegression74Test011 | 负时间步积分 | 独立 Worker 初态 | steps=198；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504856569217/-0.16907493724646508，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1200 | nBodyReverseRegression74Test012 | 负时间步积分 | 独立 Worker 初态 | steps=199；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504856569217/-0.16907493614291402，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1300 | nBodyReverseRegression74Test013 | 负时间步积分 | 独立 Worker 初态 | steps=200；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504742115403/-0.16907493503978804，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1400 | nBodyReverseRegression74Test014 | 负时间步积分 | 独立 Worker 初态 | steps=201；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504742115403/-0.1690749339370877，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1500 | nBodyReverseRegression74Test015 | 负时间步积分 | 独立 Worker 初态 | steps=202；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504627701897/-0.1690749328348127，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1600 | nBodyReverseRegression74Test016 | 负时间步积分 | 独立 Worker 初态 | steps=203；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504627701897/-0.1690749317329636，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1700 | nBodyReverseRegression74Test017 | 负时间步积分 | 独立 Worker 初态 | steps=204；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504513328672/-0.16907493063154067，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1800 | nBodyReverseRegression74Test018 | 负时间步积分 | 独立 Worker 初态 | steps=205；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504513328672/-0.16907492953054398，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_1900 | nBodyReverseRegression74Test019 | 负时间步积分 | 独立 Worker 初态 | steps=206；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504398995785/-0.1690749284299737，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2000 | nBodyReverseRegression74Test020 | 负时间步积分 | 独立 Worker 初态 | steps=207；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504398995785/-0.16907492732983018，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2100 | nBodyReverseRegression74Test021 | 负时间步积分 | 独立 Worker 初态 | steps=208；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504284703234/-0.16907492623011364，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2200 | nBodyReverseRegression74Test022 | 负时间步积分 | 独立 Worker 初态 | steps=209；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504284703234/-0.16907492513082417，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2300 | nBodyReverseRegression74Test023 | 负时间步积分 | 独立 Worker 初态 | steps=210；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750417045104/-0.16907492403196206，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2400 | nBodyReverseRegression74Test024 | 负时间步积分 | 独立 Worker 初态 | steps=211；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750417045104/-0.1690749229335275，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2500 | nBodyReverseRegression74Test025 | 负时间步积分 | 独立 Worker 初态 | steps=212；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504056239248/-0.16907492183552067，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2600 | nBodyReverseRegression74Test026 | 负时间步积分 | 独立 Worker 初态 | steps=213；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907504056239248/-0.16907492073794197，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2700 | nBodyReverseRegression74Test027 | 负时间步积分 | 独立 Worker 初态 | steps=214；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907503942067867/-0.16907491964079133，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2800 | nBodyReverseRegression74Test028 | 负时间步积分 | 独立 Worker 初态 | steps=215；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907503942067867/-0.16907491854406917，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_2900 | nBodyReverseRegression74Test029 | 负时间步积分 | 独立 Worker 初态 | steps=216；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907503827936943/-0.16907491744777559，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_3000 | nBodyReverseRegression74Test030 | 负时间步积分 | 独立 Worker 初态 | steps=217；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.16907503827936943/-0.16907491635191094，误差<2e-11 | Pass |
| SUB_NBODY_NBODYREVERSEREGRESSION74TEST_3100 | nBodyReverseRegression74Test031 | 负时间步积分 | 独立 Worker 初态 | steps=218；dt=-0.00075 | 初/中/末能量=-0.16907516382852453/-0.1690750371384647/-0.1690749152564754，误差<2e-11 | Pass |

### NBodySmallRegression75Test

源码：[NBodySmallRegression75Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodySmallRegression75Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0100 | nBodySmallRegression75Test001 | 微小时间步积分 | 独立 Worker 初态 | steps=219；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839569/-0.16907516382826565，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0200 | nBodySmallRegression75Test002 | 微小时间步积分 | 独立 Worker 初态 | steps=220；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839444/-0.16907516382826432，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0300 | nBodySmallRegression75Test003 | 微小时间步积分 | 独立 Worker 初态 | steps=221；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839444/-0.16907516382826324，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0400 | nBodySmallRegression75Test004 | 微小时间步积分 | 独立 Worker 初态 | steps=222；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638283933/-0.16907516382826204，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0500 | nBodySmallRegression75Test005 | 微小时间步积分 | 独立 Worker 初态 | steps=223；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.1690751638283933/-0.16907516382826082，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0600 | nBodySmallRegression75Test006 | 微小时间步积分 | 独立 Worker 初态 | steps=224；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839208/-0.16907516382825966，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0700 | nBodySmallRegression75Test007 | 微小时间步积分 | 独立 Worker 初态 | steps=225；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839208/-0.16907516382825846，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0800 | nBodySmallRegression75Test008 | 微小时间步积分 | 独立 Worker 初态 | steps=226；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839083/-0.16907516382825732，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_0900 | nBodySmallRegression75Test009 | 微小时间步积分 | 独立 Worker 初态 | steps=227；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382839083/-0.16907516382825608，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1000 | nBodySmallRegression75Test010 | 微小时间步积分 | 独立 Worker 初态 | steps=228；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838975/-0.16907516382825494，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1100 | nBodySmallRegression75Test011 | 微小时间步积分 | 独立 Worker 初态 | steps=229；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838975/-0.16907516382825383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1200 | nBodySmallRegression75Test012 | 微小时间步积分 | 独立 Worker 初态 | steps=230；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838841/-0.16907516382825252，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1300 | nBodySmallRegression75Test013 | 微小时间步积分 | 独立 Worker 初态 | steps=231；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838841/-0.1690751638282514，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1400 | nBodySmallRegression75Test014 | 微小时间步积分 | 独立 Worker 初态 | steps=232；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838744/-0.16907516382825016，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1500 | nBodySmallRegression75Test015 | 微小时间步积分 | 独立 Worker 初态 | steps=233；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838744/-0.16907516382824905，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1600 | nBodySmallRegression75Test016 | 微小时间步积分 | 独立 Worker 初态 | steps=234；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838617/-0.16907516382824775，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1700 | nBodySmallRegression75Test017 | 微小时间步积分 | 独立 Worker 初态 | steps=235；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838617/-0.16907516382824653，误差<2e-11 | Pass |
| SUB_NBODY_NBODYSMALLREGRESSION75TEST_1800 | nBodySmallRegression75Test018 | 微小时间步积分 | 独立 Worker 初态 | steps=236；dt=7.5e-7 | 初/中/末能量=-0.16907516382852453/-0.16907516382838497/-0.16907516382824553，误差<2e-11 | Pass |

### NBodyLargeRegression76Test

源码：[NBodyLargeRegression76Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyLargeRegression76Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0100 | nBodyLargeRegression76Test001 | 较大时间步积分 | 独立 Worker 初态 | steps=237；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690591748087732/-0.16904274312887402，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0200 | nBodyLargeRegression76Test002 | 较大时间步积分 | 独立 Worker 初态 | steps=238；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.169059029420698/-0.16904262083730348，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0300 | nBodyLargeRegression76Test003 | 较大时间步积分 | 独立 Worker 初态 | steps=239；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.169059029420698/-0.16904249893804046，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0400 | nBodyLargeRegression76Test004 | 较大时间步积分 | 独立 Worker 初态 | steps=240；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905888401174374/-0.16904237743386225，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0500 | nBodyLargeRegression76Test005 | 较大时间步积分 | 独立 Worker 初态 | steps=241；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905888401174374/-0.16904225632752876，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0600 | nBodyLargeRegression76Test006 | 较大时间步积分 | 独立 Worker 初态 | steps=242；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905873858570755/-0.16904213562178194，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0700 | nBodyLargeRegression76Test007 | 较大时间步积分 | 独立 Worker 初态 | steps=243；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905873858570755/-0.16904201531934585，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0800 | nBodyLargeRegression76Test008 | 较大时间步积分 | 独立 Worker 初态 | steps=244；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905859314638805/-0.16904189542292697，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_0900 | nBodyLargeRegression76Test009 | 较大时间步积分 | 独立 Worker 初态 | steps=245；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905859314638805/-0.16904177593521286，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1000 | nBodyLargeRegression76Test010 | 较大时间步积分 | 独立 Worker 初态 | steps=246；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905844769758352/-0.16904165685887357，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1100 | nBodyLargeRegression76Test011 | 较大时间步积分 | 独立 Worker 初态 | steps=247；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905844769758352/-0.16904153819656034，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1200 | nBodyLargeRegression76Test012 | 较大时间步积分 | 独立 Worker 初态 | steps=248；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.169058302243094/-0.16904141995090602，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1300 | nBodyLargeRegression76Test013 | 较大时间步积分 | 独立 Worker 初态 | steps=249；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.169058302243094/-0.1690413021245243，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1400 | nBodyLargeRegression76Test014 | 较大时间步积分 | 独立 Worker 初态 | steps=250；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690581567867193/-0.1690411847200104，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1500 | nBodyLargeRegression76Test015 | 较大时间步积分 | 独立 Worker 初态 | steps=251；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.1690581567867193/-0.16904106773994035，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1600 | nBodyLargeRegression76Test016 | 较大时间步积分 | 独立 Worker 初态 | steps=252；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905801133225956/-0.16904095118687118，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1700 | nBodyLargeRegression76Test017 | 较大时间步积分 | 独立 Worker 初态 | steps=253；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905801133225956/-0.16904083506334022，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1800 | nBodyLargeRegression76Test018 | 较大时间步积分 | 独立 Worker 初态 | steps=254；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905786588351515/-0.16904071937186582，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_1900 | nBodyLargeRegression76Test019 | 较大时间步积分 | 独立 Worker 初态 | steps=255；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905786588351515/-0.16904060411494637，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2000 | nBodyLargeRegression76Test020 | 较大时间步积分 | 独立 Worker 初态 | steps=256；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905772044428607/-0.16904048929506094，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2100 | nBodyLargeRegression76Test021 | 较大时间步积分 | 独立 Worker 初态 | steps=257；dt=0.0075 | 初/中/末能量=-0.16907516382852453/-0.16905772044428607/-0.1690403749146684，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2200 | nBodyLargeRegression76Test022 | 较大时间步积分 | 独立 Worker 初态 | steps=1；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907516382852453/-0.16907500315359633，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2300 | nBodyLargeRegression76Test023 | 较大时间步积分 | 独立 Worker 初态 | steps=2；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907500315359633/-0.16907484181640114，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2400 | nBodyLargeRegression76Test024 | 较大时间步积分 | 独立 Worker 初态 | steps=3；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907500315359633/-0.16907467982150914，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2500 | nBodyLargeRegression76Test025 | 较大时间步积分 | 独立 Worker 初态 | steps=4；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907484181640114/-0.16907451717353178，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2600 | nBodyLargeRegression76Test026 | 较大时间步积分 | 独立 Worker 初态 | steps=5；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907484181640114/-0.16907435387712216，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2700 | nBodyLargeRegression76Test027 | 较大时间步积分 | 独立 Worker 初态 | steps=6；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907467982150914/-0.16907418993697548，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2800 | nBodyLargeRegression76Test028 | 较大时间步积分 | 独立 Worker 初态 | steps=7；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907467982150914/-0.16907402535782748，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_2900 | nBodyLargeRegression76Test029 | 较大时间步积分 | 独立 Worker 初态 | steps=8；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907451717353178/-0.16907386014445486，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3000 | nBodyLargeRegression76Test030 | 较大时间步积分 | 独立 Worker 初态 | steps=9；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907451717353178/-0.16907369430167546，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3100 | nBodyLargeRegression76Test031 | 较大时间步积分 | 独立 Worker 初态 | steps=10；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907435387712216/-0.16907352783434768，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3200 | nBodyLargeRegression76Test032 | 较大时间步积分 | 独立 Worker 初态 | steps=11；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907435387712216/-0.16907336074737，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3300 | nBodyLargeRegression76Test033 | 较大时间步积分 | 独立 Worker 初态 | steps=12；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907418993697548/-0.16907319304568116，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3400 | nBodyLargeRegression76Test034 | 较大时间步积分 | 独立 Worker 初态 | steps=13；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907418993697548/-0.16907302473425964，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3500 | nBodyLargeRegression76Test035 | 较大时间步积分 | 独立 Worker 初态 | steps=14；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907402535782748/-0.16907285581812384，误差<2e-11 | Pass |
| SUB_NBODY_NBODYLARGEREGRESSION76TEST_3600 | nBodyLargeRegression76Test036 | 较大时间步积分 | 独立 Worker 初态 | steps=15；dt=0.00875 | 初/中/末能量=-0.16907516382852453/-0.16907402535782748/-0.16907268630233124，误差<2e-11 | Pass |

### NBodyPartitionedRegression77Test

源码：[NBodyPartitionedRegression77Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyPartitionedRegression77Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0100 | nBodyPartitionedRegression77Test001 | 分段轨迹检查点 | 独立 Worker 初态 | steps=16；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907515093304082/-0.16907513799863022，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0200 | nBodyPartitionedRegression77Test002 | 分段轨迹检查点 | 独立 Worker 初态 | steps=17；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907515093304082/-0.16907513637910385，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0300 | nBodyPartitionedRegression77Test003 | 分段轨迹检查点 | 独立 Worker 初态 | steps=18；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751493183635/-0.1690751347589733，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0400 | nBodyPartitionedRegression77Test004 | 分段轨迹检查点 | 独立 Worker 初态 | steps=19；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751493183635/-0.16907513313823955，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0500 | nBodyPartitionedRegression77Test005 | 分段轨迹检查点 | 独立 Worker 初态 | steps=20；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751477030782/-0.1690751315169026，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0600 | nBodyPartitionedRegression77Test006 | 分段轨迹检查点 | 独立 Worker 初态 | steps=21；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751477030782/-0.16907512989496315，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0700 | nBodyPartitionedRegression77Test007 | 分段轨迹检查点 | 独立 Worker 初态 | steps=22；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514608718568/-0.16907512827242152，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0800 | nBodyPartitionedRegression77Test008 | 分段轨迹检查点 | 独立 Worker 初态 | steps=23；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514608718568/-0.1690751266492783，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_0900 | nBodyPartitionedRegression77Test009 | 分段轨迹检查点 | 独立 Worker 初态 | steps=24；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514447068636/-0.1690751250255339，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1000 | nBodyPartitionedRegression77Test010 | 分段轨迹检查点 | 独立 Worker 初态 | steps=25；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514447068636/-0.169075123401189，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1100 | nBodyPartitionedRegression77Test011 | 分段轨迹检查点 | 独立 Worker 初态 | steps=26；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514285358063/-0.16907512177624362，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1200 | nBodyPartitionedRegression77Test012 | 分段轨迹检查点 | 独立 Worker 初态 | steps=27；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514285358063/-0.16907512015069884，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1300 | nBodyPartitionedRegression77Test013 | 分段轨迹检查点 | 独立 Worker 初态 | steps=28；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514123586906/-0.16907511852455473，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1400 | nBodyPartitionedRegression77Test014 | 分段轨迹检查点 | 独立 Worker 初态 | steps=29；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907514123586906/-0.1690751168978118，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1500 | nBodyPartitionedRegression77Test015 | 分段轨迹检查点 | 独立 Worker 初态 | steps=30；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513961755222/-0.16907511527047053，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1600 | nBodyPartitionedRegression77Test016 | 分段轨迹检查点 | 独立 Worker 初态 | steps=31；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513961755222/-0.16907511364253158，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1700 | nBodyPartitionedRegression77Test017 | 分段轨迹检查点 | 独立 Worker 初态 | steps=32；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513799863022/-0.16907511201399536，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1800 | nBodyPartitionedRegression77Test018 | 分段轨迹检查点 | 独立 Worker 初态 | steps=33；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513799863022/-0.1690751103848622，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_1900 | nBodyPartitionedRegression77Test019 | 分段轨迹检查点 | 独立 Worker 初态 | steps=34；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513637910385/-0.16907510875513265，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_2000 | nBodyPartitionedRegression77Test020 | 分段轨迹检查点 | 独立 Worker 初态 | steps=35；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513637910385/-0.1690751071248074，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_2100 | nBodyPartitionedRegression77Test021 | 分段轨迹检查点 | 独立 Worker 初态 | steps=36；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751347589733/-0.1690751054938866，误差<2e-11 | Pass |
| SUB_NBODY_NBODYPARTITIONEDREGRESSION77TEST_2200 | nBodyPartitionedRegression77Test022 | 分段轨迹检查点 | 独立 Worker 初态 | steps=37；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751347589733/-0.1690751038623708，误差<2e-11 | Pass |

### NBodyBalancedRegression78Test

源码：[NBodyBalancedRegression78Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyBalancedRegression78Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0100 | nBodyBalancedRegression78Test001 | 动量平衡正向积分 | 独立 Worker 初态 | steps=38；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513313823955/-0.1690751022302608，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0200 | nBodyBalancedRegression78Test002 | 动量平衡正向积分 | 独立 Worker 初态 | steps=39；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907513313823955/-0.1690751005975567，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0300 | nBodyBalancedRegression78Test003 | 动量平衡正向积分 | 独立 Worker 初态 | steps=40；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751315169026/-0.169075098964259，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0400 | nBodyBalancedRegression78Test004 | 动量平衡正向积分 | 独立 Worker 初态 | steps=41；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751315169026/-0.16907509733036843，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0500 | nBodyBalancedRegression78Test005 | 动量平衡正向积分 | 独立 Worker 初态 | steps=42；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512989496315/-0.16907509569588533，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0600 | nBodyBalancedRegression78Test006 | 动量平衡正向积分 | 独立 Worker 初态 | steps=43；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512989496315/-0.16907509406081025，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0700 | nBodyBalancedRegression78Test007 | 动量平衡正向积分 | 独立 Worker 初态 | steps=44；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512827242152/-0.16907509242514357，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0800 | nBodyBalancedRegression78Test008 | 动量平衡正向积分 | 独立 Worker 初态 | steps=45；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512827242152/-0.16907509078888588，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_0900 | nBodyBalancedRegression78Test009 | 动量平衡正向积分 | 独立 Worker 初态 | steps=46；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751266492783/-0.1690750891520376，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1000 | nBodyBalancedRegression78Test010 | 动量平衡正向积分 | 独立 Worker 初态 | steps=47；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751266492783/-0.1690750875145991，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1100 | nBodyBalancedRegression78Test011 | 动量平衡正向积分 | 独立 Worker 初态 | steps=48；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751250255339/-0.169075085876571，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1200 | nBodyBalancedRegression78Test012 | 动量平衡正向积分 | 独立 Worker 初态 | steps=49；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751250255339/-0.1690750842379539，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1300 | nBodyBalancedRegression78Test013 | 动量平衡正向积分 | 独立 Worker 初态 | steps=50；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.169075123401189/-0.16907508259874812，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1400 | nBodyBalancedRegression78Test014 | 动量平衡正向积分 | 独立 Worker 初态 | steps=51；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.169075123401189/-0.16907508095895427，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1500 | nBodyBalancedRegression78Test015 | 动量平衡正向积分 | 独立 Worker 初态 | steps=52；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512177624362/-0.16907507931857263，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1600 | nBodyBalancedRegression78Test016 | 动量平衡正向积分 | 独立 Worker 初态 | steps=53；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512177624362/-0.1690750776776039，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1700 | nBodyBalancedRegression78Test017 | 动量平衡正向积分 | 独立 Worker 初态 | steps=54；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512015069884/-0.16907507603604846，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1800 | nBodyBalancedRegression78Test018 | 动量平衡正向积分 | 独立 Worker 初态 | steps=55；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907512015069884/-0.1690750743939068，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_1900 | nBodyBalancedRegression78Test019 | 动量平衡正向积分 | 独立 Worker 初态 | steps=56；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511852455473/-0.1690750727511793，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2000 | nBodyBalancedRegression78Test020 | 动量平衡正向积分 | 独立 Worker 初态 | steps=57；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511852455473/-0.16907507110786676，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2100 | nBodyBalancedRegression78Test021 | 动量平衡正向积分 | 独立 Worker 初态 | steps=58；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751168978118/-0.1690750694639694，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2200 | nBodyBalancedRegression78Test022 | 动量平衡正向积分 | 独立 Worker 初态 | steps=59；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751168978118/-0.1690750678194879，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2300 | nBodyBalancedRegression78Test023 | 动量平衡正向积分 | 独立 Worker 初态 | steps=60；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511527047053/-0.16907506617442247，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2400 | nBodyBalancedRegression78Test024 | 动量平衡正向积分 | 独立 Worker 初态 | steps=61；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511527047053/-0.16907506452877383，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2500 | nBodyBalancedRegression78Test025 | 动量平衡正向积分 | 独立 Worker 初态 | steps=62；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511364253158/-0.1690750628825424，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2600 | nBodyBalancedRegression78Test026 | 动量平衡正向积分 | 独立 Worker 初态 | steps=63；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511364253158/-0.16907506123572874，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2700 | nBodyBalancedRegression78Test027 | 动量平衡正向积分 | 独立 Worker 初态 | steps=64；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511201399536/-0.1690750595883333，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2800 | nBodyBalancedRegression78Test028 | 动量平衡正向积分 | 独立 Worker 初态 | steps=65；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907511201399536/-0.16907505794035635，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_2900 | nBodyBalancedRegression78Test029 | 动量平衡正向积分 | 独立 Worker 初态 | steps=66；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751103848622/-0.16907505629179878，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_3000 | nBodyBalancedRegression78Test030 | 动量平衡正向积分 | 独立 Worker 初态 | steps=67；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.1690751103848622/-0.16907505464266084，误差<2e-11 | Pass |
| SUB_NBODY_NBODYBALANCEDREGRESSION78TEST_3100 | nBodyBalancedRegression78Test031 | 动量平衡正向积分 | 独立 Worker 初态 | steps=68；dt=0.000875 | 初/中/末能量=-0.16907516382852453/-0.16907510875513265/-0.169075052992943，误差<2e-11 | Pass |

### NBodyRawRegression79Test

源码：[NBodyRawRegression79Test.test.ets](entry/src/ohosTest/ets/test/Numerical/NBodyRawRegression79Test.test.ets)。

| 编号 | 用例名 | 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|---|---|
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0100 | nBodyRawRegression79Test001 | 未平衡初态积分 | 独立 Worker 初态 | steps=69；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.1692898513413117/-0.16928979706856737，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0200 | nBodyRawRegression79Test002 | 未平衡初态积分 | 独立 Worker 初态 | steps=70；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984980050882/-0.1692897955075858，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0300 | nBodyRawRegression79Test003 | 未平衡初态积分 | 独立 Worker 初态 | steps=71；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984980050882/-0.16928979394603572，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0400 | nBodyRawRegression79Test004 | 未平衡初态积分 | 独立 Worker 初态 | steps=72；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984825912172/-0.16928979238391803，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0500 | nBodyRawRegression79Test005 | 未平衡初态积分 | 独立 Worker 初态 | steps=73；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984825912172/-0.16928979082123263，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0600 | nBodyRawRegression79Test006 | 未平衡初态积分 | 独立 Worker 初态 | steps=74；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984671715094/-0.16928978925798024，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0700 | nBodyRawRegression79Test007 | 未平衡初态积分 | 独立 Worker 初态 | steps=75；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984671715094/-0.16928978769416128，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0800 | nBodyRawRegression79Test008 | 未平衡初态积分 | 独立 Worker 初态 | steps=76；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984517459703/-0.1692897861297762，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_0900 | nBodyRawRegression79Test009 | 未平衡初态积分 | 独立 Worker 初态 | steps=77；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984517459703/-0.16928978456482552，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1000 | nBodyRawRegression79Test010 | 未平衡初态积分 | 独立 Worker 初态 | steps=78；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984363146005/-0.16928978299930963，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1100 | nBodyRawRegression79Test011 | 未平衡初态积分 | 独立 Worker 初态 | steps=79；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984363146005/-0.16928978143322895，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1200 | nBodyRawRegression79Test012 | 未平衡初态积分 | 独立 Worker 初态 | steps=80；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984208774078/-0.16928977986658394，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1300 | nBodyRawRegression79Test013 | 未平衡初态积分 | 独立 Worker 初态 | steps=81；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984208774078/-0.16928977829937517，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1400 | nBodyRawRegression79Test014 | 未平衡初态积分 | 独立 Worker 初态 | steps=82；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984054343973/-0.16928977673160303，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1500 | nBodyRawRegression79Test015 | 未平衡初态积分 | 独立 Worker 初态 | steps=83；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.16928984054343973/-0.16928977516326796，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1600 | nBodyRawRegression79Test016 | 未平衡初态积分 | 独立 Worker 初态 | steps=84；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.1692898389985571/-0.16928977359437072，误差<2e-11 | Pass |
| SUB_NBODY_NBODYRAWREGRESSION79TEST_1700 | nBodyRawRegression79Test017 | 未平衡初态积分 | 独立 Worker 初态 | steps=85；dt=0.000875 | 初/中/末能量=-0.1692899033779057/-0.1692898389985571/-0.16928977202491116，误差<2e-11 | Pass |
