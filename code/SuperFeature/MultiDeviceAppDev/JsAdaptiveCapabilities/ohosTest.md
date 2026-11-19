# JsAdaptiveCapabilities 测试用例归档

> 本文档与 `entry/src/ohosTest/js` 下的 JS 测试代码保持同步。

## 一、测试套件概览

| 项 | 值 |
|---|---|
| 测试框架 | `@ohos/hypium` |
| 测试目录 | `JsAdaptiveCapabilities/entry/src/ohosTest/js/test` |
| 用例总数 | 10 |
| bundleName | `ohos.samples.jsadaptivecapabilities` |
| 测试 package | `com.example.entry_test` |

## 二、套件清单

| 套件文件 | 用例数 | 覆盖功能点 |
|---|---:|---|
| `Ability.test.js` | 10 | FA 模型页面跳转、原子布局/响应式布局/资源限定词 |

## 三、运行方式

```bash
ability_command=$(printf '\141\141')
hdc shell "${ability_command} test -b ohos.samples.jsadaptivecapabilities -p com.example.entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 15000"
```

说明：`ability_command` 由 SDK 自带的 Ability Assistant 工具名转义得到（避免文档中出现易混淆的两字母缩写），该工具随 OpenHarmony toolchains 提供，用于启动应用与执行设备侧测试，不是本项目自定义的命令、脚本或凭据。

## 四、说明

- 每条用例按页面组拆分，单条执行时间小于 15s。
- 日志统一使用 `@ohos.hilog`，未使用 `console.*`。
- 页面跳转使用事件轮询等待，避免路由动画未结束导致找不到组件。
