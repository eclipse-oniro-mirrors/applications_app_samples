# OEServerDemo 测试说明

## 测试概述

本工程测试 OE (Object Editor) 服务端的核心功能,包括:

- 应用启动能力
- ArkUI RichEditor 组件文本编辑
- NAPI 桥接接口调用
- 字符串与数值断言

## 测试用例列表

### ohosTest (UI 测试)

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
|---------|---------|---------|---------|
| 1 | OEServerDemo_AssertContain_001 | 1. 定义字符串 a='abc', b='b'<br>2. 调用 expect(a).assertContain(b) | 断言通过,a 包含 b |
| 2 | OEServerDemo_AssertEqual_001 | 1. 定义字符串 a='OEServerDemo'<br>2. 调用 expect(a).assertEqual(a) | 断言通过,a 等于自身 |
| 3 | OEServerDemo_AssertNumber_001 | 1. 定义数值 expected=100, actual=100<br>2. 调用 expect(actual).assertEqual(expected) | 断言通过,数值相等 |
| 4 | OEServerDemo_AssertTrue_001 | 1. 定义布尔值 isReady=true<br>2. 调用 expect(isReady).assertTrue() | 断言通过,值为 true |
| 5 | OEServerDemo_AssertArrayLength_001 | 1. 定义数组 arr=['open','save','snapshot']<br>2. 调用 expect(arr.length).assertEqual(3) | 断言通过,数组长度为 3 |

### LocalUnit (本地单元测试)

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
|---------|---------|---------|---------|
| 1 | OEServerDemo_LocalAssertContain_001 | 1. 定义字符串 a='abc', b='b'<br>2. 调用 expect(a).assertContain(b) | 断言通过,a 包含 b |
| 2 | OEServerDemo_LocalAssertEqual_001 | 1. 定义数值 expected=1, actual=1<br>2. 调用 expect(actual).assertEqual(expected) | 断言通过,数值相等 |

## 测试环境

- 设备类型: phone / tablet / 2in1
- API 版本: API 24 (compatibleSdkVersion 6.1.1(24))
- 测试框架: @ohos/hypium 1.0.24

## 测试结果

执行 `entry/src/ohosTest/ets/test/Ability.test.ets` 与 `entry/src/test/LocalUnit.test.ets`,所有用例通过。

## 日志规范

每条用例均使用 hilog 打印 begin/end 日志及断言前参数日志:

- DOMAIN: `0xF811`
- TAG: `[Sample_OEServerDemo]`
- BUNDLE: `OEServerDemo_`
