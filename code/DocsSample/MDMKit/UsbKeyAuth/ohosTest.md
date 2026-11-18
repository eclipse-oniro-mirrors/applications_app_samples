# USB Key可信持有物认证 (UsbKeyAuth) 测试用例归档

## 用例表

> 本示例的绑定/解绑流程依赖实体 USB Key 硬件与 PIN 交互，且需要认证器提供方给出真实的
> `pluginInfo`（`Constants.ets` 中的 `com.example.usbkeyplugin` 仅为占位值），因此全部用例均为手工验证。
>
> USB Key可信持有物认证仅支持 PC 和 2in1 设备。在不支持该能力的设备（如开发板）上，
> 所有接口均返回错误码 **801**，示例已做兼容处理，结果区统一输出
> `<操作名> is not supported on this device. Code: 801, message: <错误信息>`，对应下表「不支持设备」分组。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | -------- | -------- | :------- | -------- |
| 拉起应用 | 设备正常运行，已安装应用；已执行 `hdc shell edm enable-admin -n com.example.usbkeyauth -a EnterpriseAdminAbility` 激活企业设备管理扩展能力 | 点击应用图标 | 成功拉起应用，主页标题正常展示 | 否 | Pass |
| 主页展示 | 应用已成功拉起 | | 绑定 USB Key、解绑 USB Key、查询已绑定凭据、设置解锁策略、查询解锁策略 5 个按钮均正常展示 | 否 | Pass |
| 查询凭据（未插入USB Key） | 支持该能力的设备（PC/2in1）；未插入USB Key；已完成激活 | 点击“查询已绑定凭据”按钮 | 结果区输出 `Found 0 USB Key credential(s).`；若查询接口报错则输出 `Query credentials failed. Code: <错误码>, message: <错误信息>` | 否 | Pass |
| 查询解锁策略（未插入USB Key） | 支持该能力的设备（PC/2in1）；未插入USB Key；已完成激活 | 点击“查询解锁策略”按钮 | 结果区输出 `Current unlock policy: <策略值>`，日志同步输出 DEFAULT / EXTENDED_AUTH_ONLY / EXTENDED_AUTH_REQUIRED；失败时输出 `Get unlock policy failed. Code: <错误码>, message: <错误信息>` | 否 | Pass |
| 绑定（未插入USB Key） | 支持该能力的设备（PC/2in1）；未插入USB Key；已完成激活；系统已设置锁屏PIN码 | 点击“绑定 USB Key”按钮，在弹出的用户认证控件中输入PIN码完成认证 | 认证控件正常弹出；认证通过后绑定失败，结果区输出 `USB Key binding failed. Code: <错误码>, message: <错误信息>` | 否 | Pass |
| 解绑（未插入USB Key） | 支持该能力的设备（PC/2in1）；未插入USB Key；已完成激活；当前账号下无已绑定的USB Key凭据 | 点击“解绑 USB Key”按钮 | 因查询不到凭据而提前返回，结果区输出 `No USB Key credential found.`，且不弹出用户认证控件；若查询接口报错则输出 `USB Key unbinding failed. Code: <错误码>, message: <错误信息>` | 否 | Pass |
| 设置解锁策略（未插入USB Key） | 支持该能力的设备（PC/2in1）；未插入USB Key；已完成激活 | 点击“设置解锁策略”按钮 | 结果区输出 `Set unlock policy succeeded.`；失败时输出 `Set unlock policy failed. Code: <错误码>, message: <错误信息>`。该操作会将解锁策略置为 EXTENDED_AUTH_ONLY，验证后建议手工恢复 | 否 | Pass |
| 不支持设备：绑定 | 开发板等不支持该能力的设备（deviceType 为 default）；已完成激活 | 点击“绑定 USB Key”按钮 | 结果区输出 `USB Key binding is not supported on this device. Code: 801, message: <错误信息>` | 否 | Pass |
| 不支持设备：解绑 | 同上 | 点击“解绑 USB Key”按钮 | 结果区输出 `USB Key unbinding is not supported on this device. Code: 801, message: <错误信息>` | 否 | Pass |
| 不支持设备：查询凭据 | 同上 | 点击“查询已绑定凭据”按钮 | 结果区输出 `Query credentials is not supported on this device. Code: 801, message: <错误信息>` | 否 | Pass |
| 不支持设备：设置解锁策略 | 同上 | 点击“设置解锁策略”按钮 | 结果区输出 `Set unlock policy is not supported on this device. Code: 801, message: <错误信息>` | 否 | Pass |
| 不支持设备：查询解锁策略 | 同上 | 点击“查询解锁策略”按钮 | 结果区输出 `Get unlock policy is not supported on this device. Code: 801, message: <错误信息>` | 否 | Pass |
