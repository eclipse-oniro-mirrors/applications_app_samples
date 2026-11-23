# RadioTech ohosTest 测试说明

## 1. 概述

本目录为 RadioTech 示例工程的单元/接口级自动化测试，覆盖 `entry/src/main/ets/model` 下的
`NetworkStateFormatter`、`RadioTechFormatter`、`SignalFormatter`、`SlotModel`、`SimInfoFormatter`
五个纯逻辑模型及其组合行为。

- 测试框架：`@ohos/hypium` 1.0.30（`entry/src/ohosTest`）
- 运行入口：`entry/src/ohosTest/ets/test/List.test.ets`
- 测试 Runner：`entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ts`

## 2. 套件与用例

| 套件文件 | 主题 | 编号段 | 用例数 | 类型 |
|---|---|---|---|---|
| RadioNetStateReal01.test.ets | 网络状态八行快照组合 | SUB_RADIO_NSREAL_0001~0040 | 40 | 功能 |
| RadioTechReal01.test.ets | 制式映射与 ps/cs 组合 | SUB_RADIO_TECHREAL_0001~0040 | 40 | 功能 |
| RadioSignalReal01.test.ets | 单信号/信号列表聚合 | SUB_RADIO_SIGREAL_0001~0046 | 46 | 功能 |
| RadioSimInfoReal01.test.ets | SPN/ISO 国家码/开关状态 | SUB_RADIO_SIMREAL_0001~0035 | 35 | 功能 |
| RadioSlotReal01.test.ets | 槽位校验、标题还原、选网模式 | SUB_RADIO_SLOTREAL_0001~0041 | 41 | 功能 |
| RadioIntegrationReal01.test.ets | 跨模型枚举一致性 | SUB_RADIO_INTEG_0001~0035 | 35 | 组合 |
| RadioBoundaryReal01.test.ets | 极值、NaN、Infinity、越界输入 | SUB_RADIO_BOUND_0001~0031 | 31 | 边界 |
| RadioIsoUpper01~03.test.ets | ISO 3166-1 两字母转大写 | SUB_RADIO_ISO_0001~0252 | 252 | 枚举 |
| RadioIsoLower04~06.test.ets | ISO 3166-1 小写输入归一化 | SUB_RADIO_ISOLOWER_0001~0252 | 252 | 枚举 |
| RadioIsoInvalid01.test.ets | 非法国家码回退 | SUB_RADIO_ISOINVALID_0001~0027 | 27 | 非法 |
| RadioNetStateOperator01.test.ets | 运营商名去空白与空值回退 | SUB_RADIO_NETSTATE_0001~0080 | 80 | 功能 |
| RadioNetStatePlmn01.test.ets | PLMN 5/6 位数字校验 | SUB_RADIO_NETSTATE_0081~0160 | 80 | 边界 |
| RadioNetStateReg01.test.ets | 注册状态 0~3 映射 | SUB_RADIO_NETSTATE_0161~0240 | 80 | 枚举 |
| RadioNetStateNsa01.test.ets | NSA 状态 0~6 映射 | SUB_RADIO_NETSTATE_0241~0320 | 80 | 枚举 |
| RadioNetStateFormat01~03.test.ets | format 八行顺序与内容 | SUB_RADIO_NETSTATE_0321~0560 | 240 | 组合 |
| RadioSpn01~02.test.ets | SPN 控制字符替换与裁剪 | SUB_RADIO_SPN_0001~0134 | 134 | 边界 |
| RadioTechName01.test.ets | 制式索引 0~12 映射 | SUB_RADIO_RADIOTECH_0001~0080 | 80 | 枚举 |
| RadioTechPair02~03.test.ets | formatPair 双域名称组合 | SUB_RADIO_RADIOTECHPAIR_0001~0160 | 160 | 组合 |
| RadioSignalType01.test.ets | 信号类型 0~6 映射 | SUB_RADIO_SIGNAL_0001~0080 | 80 | 枚举 |
| RadioSignalLevel01.test.ets | 信号等级 0~4 映射 | SUB_RADIO_SIGNALLEVEL_0001~0080 | 80 | 枚举 |
| RadioSignalFormat01.test.ets | 单信号三段格式 | SUB_RADIO_SIGNALFORMAT_0001~0080 | 80 | 功能 |
| RadioSignalList04~05.test.ets | 列表连接、计数、等级选取、dBm 合计 | SUB_RADIO_SIGNALLIST_0001~0160 | 160 | 组合 |
| RadioSlotValid01.test.ets | 槽位 0~3 校验与归一化 | SUB_RADIO_SLOT_0001~0080 | 80 | 边界 |
| RadioSlotTitle01.test.ets | SIM 标题与索引还原 | SUB_RADIO_SLOTTITLE_0001~0080 | 80 | 枚举 |
| RadioSelectionMode01.test.ets | 选网模式 0~2 映射 | SUB_RADIO_SELMODE_0001~0080 | 80 | 枚举 |
| RadioSlotParse01.test.ets | 标题解析边界 | SUB_RADIO_PARSE_0001~0080 | 80 | 非法 |

合计：35 个测试套件，2453 条用例。

## 3. 覆盖策略

- 每个模型覆盖六个维度：合法输入、边界值、非法输入、极值（NaN/Infinity/越界）、组合调用、状态相关行为。
- 枚举类接口（制式、信号类型、信号等级、注册状态、NSA 状态、选网模式）按取值域逐项覆盖，并覆盖域外回退。
- 字符归一化接口（ISO 国家码、SPN、运营商名、PLMN）覆盖大小写、首尾空白、控制字符与长度边界。
- 组合类接口（`format`、`formatPair`、`formatList`）校验行顺序、分隔符与缺省回退的一致性。

## 4. 执行方式

```bash
# 构建测试 HAP（工程根目录）
hvigorw --mode module -p module=entry@ohosTest -p product=default -p buildMode=test assembleHap --no-daemon

# 安装测试 HAP（需连接真机）
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

安装完成后，在 DevEco Studio 中选择 `entry@ohosTest` 运行配置启动测试，或在测试框架启动时传入如下参数：

| 参数 | 取值 |
|---|---|
| `-b` | `ohos.samples.radiotech` |
| `-m` | `entry_test` |
| `-s unittest` | `OpenHarmonyTestRunner` |
| `-s timeout` | `600000` |

## 5. 执行结果

> 真机：ohos（hdc 目标 `d629034339413535311095d600002b00`），修复版测试 HAP 安装后逐套件执行。
> 结论：全量 2453 条用例全部通过（Failure 0 / Error 0）。

| 轮次 | 构建 | 用例数 | Tests run | Failure | Error | Pass | 备注 |
|---|---|---|---|---|---|---|---|
| 全量 | 通过（含签名安装） | 2453 | 2453 | 0 | 0 | 2453 | 35 个套件逐套件执行，单批 27~84 例，全部通过 |

首版基线曾发现 `testRadioSignalFormat0080` 用例期望长度误写（`lte/none/-113` 实为 13 字符，期望写为 12），属用例侧错误，main 代码无缺陷；修正后已重新构建、签名并全量复跑通过。
后续词表整改将用例中的品牌运营商名替换为通用示例名（`Sample LTE`），涉及 `RadioSpn01`、`RadioSpn02`、`RadioNetStateOperator01` 三个套件；重新构建签名后增量复跑 214 条用例全部通过（Failure 0 / Error 0）。
