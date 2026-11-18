# CompConfigCenter ohosTest 测试说明

## 测试环境

- 设备类型：default / tablet
- 测试框架：@ohos/hypium
- 测试模块：entry_test（entry/src/ohosTest）

## 测试用例列表

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
|---------|---------|---------|---------|
| CompConfigCenter_StartAbility_001 | 启动应用主 Ability | 通过 AbilityDelegator 启动 com.samples.compconfigcenter 的 EntryAbility | Ability 启动成功，AbilityDelegator 可用 |
| CompConfigCenter_Resource_002 | 校验主标题资源 | 通过 resourceManager 读取 main_title 资源 | 资源值为 CompConfigCenter |
| CompConfigCenter_Resource_003 | 校验按钮资源 | 通过 resourceManager 读取 push_page1、back 资源 | 资源值分别为 Push DetailPage1、Back |

## 测试执行

1. 使用 DevEco Studio 打开工程，连接 OpenHarmony 设备
2. 在 entry 模块下执行 ohosTest 测试（Run 'entry' with ohosTest 或命令行执行测试）
3. 测试结果输出在 DevEco Studio 测试面板，同时通过 hilog（DOMAIN=0xF811，TAG=[Sample_CompConfigCenter]）输出每条用例的 begin/end 日志与断言参数

## 测试结果

- 全部用例通过（Passed: 3, Failed: 0），测试时间：2026-11-13，设备：OpenHarmony 开发板
