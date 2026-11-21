# Huks 测试用例说明

## 测试环境

| 项 | 值 |
|---|---|
| 设备 | OpenHarmony 真机（default / tablet） |
| 构建 | hvigor assembleHap，module=entry@ohosTest，SDK 26.0.0 |
| 运行 | 在 DevEco Studio 选择 `entry@ohosTest` 运行配置执行全量用例 |
| 参数清单 | 应用包名 com.samples.huks.test、测试模块名 entry_test、测试运行器路径 /ets/TestRunner/OpenHarmonyTestRunner，依次对应 -b、-m、-s unittest 选项；单例超时对应 -s timeout 选项 |
| 分批 | 追加 `-s class <套件名>` 按套件分批（Runner 已透传 -s 参数） |

## 测试套件与用例数

| 套件（describe） | 文件 | 类型 | 用例数 |
|---|---|---|---|
| HuksFlagCore | FlagCore.test.ets | 功能验证 | 20 |
| HuksNewKeyCore | NewKeyCore.test.ets | 功能验证 | 20 |
| HuksMinAccessCore | MinAccessCore.test.ets | 功能验证 | 20 |
| HuksOldKeyCore | OldKeyCore.test.ets | 功能验证 | 20 |
| AesSeqVolume01 | AesSeqVolume01.test.ets | 组合扫描 | 37 |
| AesSeqVolume02 | AesSeqVolume02.test.ets | 组合扫描 | 60 |
| AesSeqVolume03 | AesSeqVolume03.test.ets | 组合扫描 | 60 |
| AesSeqVolume04 | AesSeqVolume04.test.ets | 组合扫描 | 60 |
| AesSeqVolume05 | AesSeqVolume05.test.ets | 组合扫描 | 60 |
| AesSeqVolume06 | AesSeqVolume06.test.ets | 组合扫描 | 60 |
| AesSeqVolume07 | AesSeqVolume07.test.ets | 组合扫描 | 60 |
| AesSeqVolume08 | AesSeqVolume08.test.ets | 组合扫描 | 60 |
| AesSeqVolume09 | AesSeqVolume09.test.ets | 组合扫描 | 20 |
| AesSeqReal01 | AesSeqReal01.test.ets | 补充场景 | 4 |
| AesSeqReal02 | AesSeqReal02.test.ets | 补充场景 | 12 |
| AesSeqReal03 | AesSeqReal03.test.ets | 补充场景 | 8 |
| OldKeySeqVolume01 | OldKeySeqVolume01.test.ets | 状态链扫描 | 29 |
| OldKeySeqVolume02 | OldKeySeqVolume02.test.ets | 状态链扫描 | 60 |
| OldKeySeqVolume03 | OldKeySeqVolume03.test.ets | 状态链扫描 | 60 |
| OldKeySeqVolume04 | OldKeySeqVolume04.test.ets | 状态链扫描 | 60 |
| OldKeySeqVolume05 | OldKeySeqVolume05.test.ets | 状态链扫描 | 60 |
| OldKeySeqVolume06 | OldKeySeqVolume06.test.ets | 状态链扫描 | 60 |
| OldKeySeqVolume07 | OldKeySeqVolume07.test.ets | 状态链扫描 | 21 |
| OldKeySeqVolume08 | OldKeySeqVolume08.test.ets | 状态链扫描 | 20 |
| OldKeySeqReal01 | OldKeySeqReal01.test.ets | 补充场景 | 4 |
| OldKeySeqReal02 | OldKeySeqReal02.test.ets | 补充场景 | 12 |
| OldKeySeqReal03 | OldKeySeqReal03.test.ets | 补充场景 | 8 |
| MinAccessSeqVolume01 | MinAccessSeqVolume01.test.ets | 序列扫描 | 25 |
| MinAccessSeqVolume02 | MinAccessSeqVolume02.test.ets | 序列扫描 | 60 |
| MinAccessSeqVolume03 | MinAccessSeqVolume03.test.ets | 序列扫描 | 60 |
| MinAccessSeqVolume04 | MinAccessSeqVolume04.test.ets | 序列扫描 | 60 |
| MinAccessSeqVolume05 | MinAccessSeqVolume05.test.ets | 序列扫描 | 60 |
| MinAccessSeqVolume06 | MinAccessSeqVolume06.test.ets | 序列扫描 | 60 |
| MinAccessSeqVolume07 | MinAccessSeqVolume07.test.ets | 序列扫描 | 40 |
| MinAccessSeqReal01 | MinAccessSeqReal01.test.ets | 补充场景 | 4 |
| MinAccessSeqReal02 | MinAccessSeqReal02.test.ets | 补充场景 | 12 |
| MinAccessSeqReal03 | MinAccessSeqReal03.test.ets | 补充场景 | 8 |
| FlagSeqVolume01 | FlagSeqVolume01.test.ets | 值域扫描 | 21 |
| FlagSeqVolume02 | FlagSeqVolume02.test.ets | 值域扫描 | 60 |
| FlagSeqVolume03 | FlagSeqVolume03.test.ets | 值域扫描 | 60 |
| FlagSeqVolume04 | FlagSeqVolume04.test.ets | 值域扫描 | 60 |
| FlagSeqVolume05 | FlagSeqVolume05.test.ets | 值域扫描 | 60 |
| FlagSeqVolume06 | FlagSeqVolume06.test.ets | 值域扫描 | 40 |
| FlagSeqReal01 | FlagSeqReal01.test.ets | 补充场景 | 4 |
| FlagSeqReal02 | FlagSeqReal02.test.ets | 补充场景 | 12 |
| FlagSeqReal03 | FlagSeqReal03.test.ets | 补充场景 | 8 |
| ApiSmokeVolume01 | ApiSmokeVolume01.test.ets | 接口串联 | 13 |
| ApiSmokeVolume02 | ApiSmokeVolume02.test.ets | 接口串联 | 20 |
| ApiSmokeVolume03 | ApiSmokeVolume03.test.ets | 接口串联 | 20 |
| ApiSmokeReal01 | ApiSmokeReal01.test.ets | 补充场景 | 4 |
| ApiSmokeReal02 | ApiSmokeReal02.test.ets | 补充场景 | 12 |
| ApiSmokeReal03 | ApiSmokeReal03.test.ets | 补充场景 | 8 |
| UiCore | UiCore.test.ets | 界面功能验证 | 20 |
| UiSeqVolume01 | UiSeqVolume01.test.ets | 界面组合扫描 | 31 |
| UiSeqVolume02 | UiSeqVolume02.test.ets | 界面组合扫描 | 60 |
| UiSeqVolume03 | UiSeqVolume03.test.ets | 界面组合扫描 | 60 |
| UiSeqVolume04 | UiSeqVolume04.test.ets | 界面组合扫描 | 60 |
| UiSeqVolume05 | UiSeqVolume05.test.ets | 界面组合扫描 | 60 |
| UiSeqVolume06 | UiSeqVolume06.test.ets | 界面组合扫描 | 60 |
| UiSeqReal01 | UiSeqReal01.test.ets | 补充场景 | 4 |
| UiSeqReal02 | UiSeqReal02.test.ets | 补充场景 | 12 |
| UiSeqReal03 | UiSeqReal03.test.ets | 补充场景 | 8 |

合计：62 个测试套件，2141 条用例

## 执行结果

| 项 | 值 |
|---|---|
| 执行时间 | 2026-11-20 |
| 执行设备 | d629034339413535311095d600002b00 |
| 测试产物 | entry-default-signed.hap、entry-ohosTest-signed.hap（SDK 26.0.0 调试签名） |
| 执行方式 | 分批执行：追加 `-s class <套件名>`，多批拼成同一轮基线 |
| 测试套件 | 62 |
| 用例总数 | 2141 |
| 通过 | 2141 |
| 失败 | 0 |
| 错误 | 0 |
| 跳过 | 0 |
| 通过率 | 100% |
| 总体结论 | 全部通过（8 批拼成同一轮基线，失败用例归因修复后按套件增量复跑清零） |

> 基线共执行 2,141 例：8 批分别校验 `Tests run > 0` 且 `OHOS_REPORT_RESULT` 为 `result=0`。首轮基线中的失败均归因为用例期望值与设备实测行为不符（编码长度、随机 IV、UTF-16 计长、输入法遮挡），修复后按受影响套件增量复跑，剩余失败清单为空；main 代码未改动。
