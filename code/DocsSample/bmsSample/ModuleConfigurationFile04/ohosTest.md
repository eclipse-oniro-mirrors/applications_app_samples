# ModuleConfigurationFile04 测试用例归档

## 测试环境

| 项目 | 说明 |
|------|------|
| 设备 | 上轮使用 OpenHarmony 7.1.0.22 设备；当前工程配置支持 tablet 与 default |
| SDK | 当前编译使用 OpenHarmony API 26（26.0.0.38），本机 SDK 根目录为 `E:/sdk` |
| 测试框架 | Hypium 1.0.21 |
| 测试入口 | `entry/src/ohosTest/ets/test/List.test.ets` |

## 执行方式

1. 使用 DevEco Studio 打开工程，以同一产品、版本和签名编译 `entry@default` 与 `entry@ohosTest`。
2. 设备安装 `entry-default-signed.hap` 与 `entry-ohosTest-signed.hap` 即可运行当前测试，支持 IDE 默认仅部署 entry 和 entry_test 的流程。
3. 已移除四条依赖设备安装 feature 的集成用例；feature 配置、预加载、设备类型与跨模块规则的逻辑用例仍保留。
4. 可从工程根目录使用 Git Bash 执行以下命令安装两个 HAP。安装完成后在 DevEco Studio 中选择 `entry_test` 测试配置运行全部用例，测试框架参数为 `-s unittest /ets/testrunner/OpenHarmonyTestRunner`；feature HAP 仅在体验完整多模块应用时另外安装。

```bash
export MSYS_NO_PATHCONV=1
hdc shell mkdir -p /data/local/tmp/moduleconfig04-tests
hdc file send 'entry\build\default\outputs\default\entry-default-signed.hap' /data/local/tmp/moduleconfig04-tests/entry-default-signed.hap
hdc file send 'entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap' /data/local/tmp/moduleconfig04-tests/entry-ohosTest-signed.hap
hdc shell bm install -p /data/local/tmp/moduleconfig04-tests
```

5. 全部用例的测试编号以 `SUB_SYS_MODULE_CONFIG_` 开头，可按编号或测试套件筛选执行。保留的安装包检查仅校验应用身份与 entry 模块；逻辑用例仍按构造的配置对象校验。

## 用例表

| 测试套件 | 测试编号范围 | 用例数 | 测试功能 | 测试步骤 | 预期结果 |
|----------|--------------|--------|----------|----------|----------|
| ModuleConfig.test.ets | 0100-0200 | 2 | 校验安装包中的应用身份与 entry 模块字段 | 通过 bundleManager 读取自身 BundleInfo 并断言字段 | 字段与 module.json5/app.json5 配置一致 |
| HarnessSmoke.test.ets | 9000-9010 | 11 | 校验校验框架、序列化与报告聚合的基本通路 | 调用各 harness 组件并断言返回值 | 全部断言通过 |
| AppConfigValidation.test.ets | 1000-1299 | 88 | 校验 app.json5 的 bundleName、vendor、versionCode、versionName、icon、label | 逐字段构造合法与非法输入并执行 AppConfigValidator | 合法输入无问题，非法输入返回对应问题码 |
| ModuleIdentityValidation.test.ets | 1300-1599 | 95 | 校验模块名称、类型、mainElement、installationFree、pages 等模块标识 | 修改模块字段并执行 ModuleConfigValidator | 返回对应模块级问题码 |
| DeviceTypeValidation.test.ets | 1600-1799 | 31 | 校验 deviceTypes 的合法性、重复项与数量上限 | 构造设备类型列表并执行 validateDeviceTypes | 返回空、未知、重复等问题码 |
| AbilityValidation.test.ets | 2000-2499 | 97 | 校验 ability 的名称、srcEntry、资源引用、启动模式、方向等字段 | 修改 ability 字段并执行 validateAbility | 返回对应 ability 问题码 |
| SkillValidation.test.ets | 3000-3199 | 35 | 校验 skills 的 entities 与 actions 配置 | 构造 skill 配置并执行 validateSkills | 返回实体、动作相关问题码 |
| UriValidation.test.ets | 3200-3399 | 36 | 校验 uri 的 scheme、host、path 配置 | 构造 uri 配置并执行 uri 校验 | 返回 scheme、host、path 问题码 |
| AtomicServiceValidation.test.ets | 3400-3499 | 22 | 校验 atomicService 预加载模块配置 | 修改 preloads 与 resizeable 并执行校验 | 返回预加载相关问题码 |
| CrossModuleValidation.test.ets | 3600-3699 | 25 | 校验跨模块规则（预加载目标、重复模块、入口唯一性） | 构造模块快照并执行 CrossModuleValidator | 返回跨模块问题码 |
| NameUtilsValidation.test.ets | 3700-3799 | 69 | 校验名称工具函数的分类与判断 | 传入不同字符串并断言返回值 | 返回值与工具函数语义一致 |
| SemverUtilsValidation.test.ets | 3800-3899 | 43 | 校验语义化版本的解析、比较与递增 | 传入版本字符串并断言比较结果 | 返回值符合语义化版本规则 |
| ResourceReferenceValidation.test.ets | 3900-3999 | 35 | 校验资源引用解析与合法性 | 传入 `$kind:name` 引用并断言结果 | 正确识别 kind、name 与问题码 |
| FindingReportValidation.test.ets | 4200-4299 | 42 | 校验问题报告聚合、排序、签名与过滤 | 构造问题列表并断言报告接口 | 报告统计、排序与签名一致 |
| ConfigSerializerValidation.test.ets | 4400-4499 | 30 | 校验配置序列化与反序列化 | 序列化快照后反序列化并断言等价 | 往返序列化结果一致 |
| ConfigIndexValidation.test.ets | 4500-4599 | 36 | 校验配置索引的模块、ability、预加载查找 | 构造索引并断言查找结果 | 查找结果与实际配置一致 |
| PagePathValidation.test.ets | 4300-4399 | 27 | 校验 main_pages 页面路径列表 | 构造页面列表并执行 PagePathValidator | 返回重复、穿越、扩展名等问题码 |
| ValidationPipeline.test.ets | 4700-4799 | 24 | 校验 app、module、cross 校验流水线 | 构造违规快照并执行 ValidationPipeline | 流水线输出对应问题码 |
| AppConfigMatrix.test.ets | 4800-5499 | 108 | app 配置参数矩阵（bundleName × vendor） | 组合合法与非法参数执行校验 | 问题码与参数组合一致 |
| VersionMatrix.test.ets | 5500-5699 | 64 | 版本号矩阵（versionCode × versionName） | 组合版本参数执行校验 | 问题码与参数组合一致 |
| ModuleMatrix.test.ets | 5700-5999 | 60 | 模块名称与类型矩阵 | 组合模块名称与类型执行校验 | 问题码与参数组合一致 |
| AbilityMatrix.test.ets | 6000-6399 | 220 | ability 名称、启动模式与方向矩阵 | 组合 ability 参数执行校验 | 问题码与参数组合一致 |
| DeviceMatrix.test.ets | 6400-6599 | 35 | 设备类型矩阵 | 组合设备类型列表执行校验 | 问题码与参数组合一致 |
| ResourceMatrix.test.ets | 6600-6699 | 66 | 资源引用矩阵（kind × name） | 组合资源引用执行校验 | 问题码与参数组合一致 |
| CrossMatrix.test.ets | 6700-6799 | 30 | 预加载模块数量矩阵 | 构造 1-15 个预加载模块执行校验 | 合规数量无问题，超出范围返回告警 |

合计：25 个测试套件，1331 条用例。

## 用例规范

- 每条用例包含 `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.type`、`@tc.size`、`@tc.level` 注释。
- 每条用例开始与结束均打印 begin/end 日志。
- 每条断言前打印参数日志，日志统一使用 `TestLog`（hilog，DOMAIN 0xF811，TAG `[Sample_ModuleConfig]`）。
- 配置校验断言同时校验问题码、问题路径、严重级别排序与重复执行签名一致性。
- 每个套件在 `beforeEach` 中等待一次 `setTimeout(resolve, 1)`，将控制权交回事件循环，避免全量用例连续执行导致 `THREAD_BLOCK_6S`；该调度不跳过用例、不改变断言、不关闭系统看门狗。

## 测试结果

| 检查项 | 结果 |
|--------|------|
| OpenHarmony SDK 切换后 entry@default、feature@default、entry@ohosTest 编译及签名 | Pass（SDK 26.0.0.38，hvigor assembleHap，BUILD SUCCESSFUL） |
| 补充主机逻辑回归 | Pass（1329 条通过；两条安装包检查仅在设备上验证） |
| 设备全量用例执行（2026-11-19，仅 entry 与 entry_test） | Pass（Tests run: 1331, Failure: 0, Error: 0, Pass: 1331, Ignore: 0） |
| 设备测试进程结束状态 | TestFinished-ResultCode: 0，总耗时 32605 ms |

本次 SDK 切换已在本机 local.properties 配置 `sdk.dir=E:/sdk`，将三个模块的 `phone` 设备类型替换为 OpenHarmony 支持的 `default` 并保留 `tablet`，刷新 hvigor 守护进程后，IDE 原构建命令验证通过。上述设备运行结果来自 SDK 切换前的复测；本次仅验证编译及签名，未重新部署或运行设备测试。

此前已修正全大写名称、首尾空格、安装标志组合、序列化包名与页面 WARN 级别的用例数据/预期；修复孤立 feature 用例的 Ability 重名干扰，并新增路径内部空格负向覆盖。全量执行的 `THREAD_BLOCK_6S` 问题通过每条用例前的 1 ms 异步调度解决。

之前同时安装 entry、feature 与 entry_test 时，1335 条用例全部通过（结束码 0，32647 ms）。IDE 随后卸载应用并仅重新安装 entry 与 entry_test，导致四条多模块安装检查再次失败。本轮按要求删除 `testHarnessInstalledBundle0012`、`testModuleConfigFeatureModule0003`、`testModuleConfigAtomicPreloads0004` 与 `testModuleConfigDeviceTypes0005`；其余用例与断言保持不变，不将缺失模块伪装为通过。
