# SensorJsSamples 测试用例归档

## 本次自动化测试范围（2026-11-17）

测试代码位于 `entry/src/ohosTest/ets`，由 `OpenHarmonyTestRunner` 拉起 `TestAbility`，再通过 `List.test.ets` 注册并执行 Hypium 套件。

| 测试范围 | 文件数 | 用例数 | 主要校验内容 |
| --- | ---: | ---: | --- |
| Calculations | 78 | 1733 | 海拔、地磁场、倾角、角度变化、旋转矩阵、坐标变换、四元数、方向角及重复调用、输入隔离和边界场景 |
| Ability.test.ets | 1 | 2 | 业务 EntryAbility 启动、控件可用性和再次启动 |
| SensorSample.test.ets | 1 | 24 | 页面按钮与真实 Sensor API 的交互、结果显示及清理 |
| SensorServices.test.ets | 1 | 27 | 传感器发现、回调与 Promise 一致性、订阅取消、单次监听、事件及参数错误码 |
| 合计 | 81 | 1786 | 所有测试文件均已接入 List.test.ets，无遗漏注册 |

公共辅助模块位于 `test/Shared/SharedDriver.ets`，负责串行化 UiTest 操作、限制回调等待时间、在订阅结束后清理监听，并提供数值、矩阵、四元数和传感器元数据校验。

### 运行前置条件

- 使用本工程的 OpenHarmony API 20 SDK、对应的 Hypium/UiTest 依赖及兼容设备环境；传感器发现和订阅用例需要设备具备相应能力及业务应用需要的权限。订阅超时、权限不足和 API 异常均按失败处理。
- 业务 `EntryAbility` 应包含用例使用的控件 ID，例如 `sensor_type_selector`、`sensorApiText`、`subscribeId`、`cleanId`，页面按钮必须调用真实的 Sensor API。
- 测试启动依赖 `entry/src/ohosTest/module.json5` 中的 `TestAbility`、测试页面及其资源声明。仅有测试源码并不足以启动当前测试宿主；应由工程环境单独准备所需的模块配置。
- 本次按提交范围排除所有配置文件，包括本地 `build-profile.json5`、`entry/src/ohosTest/module.json5` 和 `entry/src/main/syscap.json`；这些本地配置未随测试提交推送。签名材料也应由运行环境自行提供。

### 用例命名与断言

- 每个文件内的 `@tc.name` 与 `it()` 名称按出现顺序连续编号，`@tc.number` 使用 `SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_` 前缀及文件名区分。
- 参数校验用例在用例体内直接断言实际捕获的错误码为 `401`，随后校验有效输入可正常恢复；不会将其他硬件或权限错误当作参数校验通过。
- 断言中的计算或异步取值先赋给局部变量，再执行断言；原有输入、预期值和表达式求值顺序保持一致。
- `Ability` 和 `SensorSample` 共 26 个用例已补入注册入口，与 1760 个计算及服务用例一起执行。

### 本次验证状态

本次进行了红线扫描、源码语法解析、相对导入与测试注册检查，以及修复前后的语法树比对。未重新执行完整 hvigor 编译、HAP 打包或设备测试，1786 个用例的当前运行状态均为 **Pending**。本地已有 HAP 不能作为本次修复后的运行证据。

## 原有页面功能归档

下表保留原文的功能归档及 Pass 标记；它们不代表上述 1786 个用例在本次提交中已运行通过。

### 用例表

| 测试功能            | 预置条件      | 输入                              | 预期输出             | 是否自动 | 测试结果 |
| --------------- | --------- | ------------------------------- | ---------------- | ---- | ---- |
|                 | 设备正常运行    |                                 | 成功拉起应用           | 是    | Pass |
| 申请权限            | 成功拉起应用    |                                 | 弹出提示框            | 是    | Pass |
| 订阅传感器           | 选择一个传感器类型 | 点击subscribe按钮                   | 订阅成功，数据上报正常      | 是    | Pass |
| 去订阅传感器          | 选择一个传感器类型 | 点击unsubscribe按钮                 | 去订阅成功，数据停止上报     | 是    | Pass |
| 获取设备传感器信息列表     | 无         | 点击getSensorListDeviceSync按钮     | 设备传感器列表信息获取正常    | 是    | Pass |
| 获取指定设备指定类型传感器信息 | 无         | 点击getSingleSensorByDeviceSync按钮 | 指定设备的指定传感器信息获取正常 | 是    | Pass |
| 订阅扩展设备热插拔事件     | 无         | 点击on SensorStatusChange按钮       | 订阅正常             | 是    | Pass |
| 去订阅扩展设备热插拔事件    | 无         | 点击off SensorStatusChange按钮      | 去订阅正常            | 是    | Pass |
| 订阅传感器By SensorInfoParam    | 选择一个传感器类型 | 点击subscribeUseSensorInfoParam按钮                   | 订阅成功，数据上报正常      | 是    | Pass |
| 订阅传感器变化一次    | 选择一个传感器类型 | 点击onceSubscribe按钮                   | 订阅成功，数据上报正常      | 是    | Pass |
| 取消订阅传感器by SensorInfoParam    | 选择一个传感器类型 | 点击unSubscribeUseSensorInfoParam按钮                 | 去订阅成功，数据停止上报     | 是    | Pass |
| 获取某时刻地球上特定位置的地磁场信息    | 无         | 点击getGeomagneticInfo按钮      | 弹出提示框            | 是    | Pass |
| 根据气压值获取海拔高度    | 无         | 点击getDeviceAltitude按钮      | 弹出提示框            | 是    | Pass |
| 根据倾斜矩阵计算地磁倾角    | 无         | 点击getInclination按钮      | 弹出提示框            | 是    | Pass |
| 计算两个旋转矩阵之间的角度变化    | 无         | 点击getAngleVariation按钮      | 弹出提示框            | 是    | Pass |
| 根据旋转矢量获取旋转矩阵    | 无         | 点击getRotationMatrix按钮      | 弹出提示框            | 是    | Pass |
| 根据指定坐标系映射旋转矩阵    | 无         | 点击transformRotationMatrix按钮      | 弹出提示框            | 是    | Pass |
| 根据旋转向量计算归一化四元数    | 无         | 点击getQuaternion按钮      | 弹出提示框            | 是    | Pass |
| 根据旋转矩阵计算设备方向    | 无         | 点击getOrientation按钮      | 弹出提示框            | 是    | Pass |
| 根据重力矢量和地磁矢量计算旋转矩阵    | 无         | 点击getRotationMatrixTwoParam按钮      | 弹出提示框            | 是    | Pass |
| 获取指定传感器类型的属性信息    | 无         | 点击getSingleSensor按钮      | 弹出提示框            | 是    | Pass |
| 清除sensor信息列表    | 无         | 点击clean按钮                       | 列表显示恢复默认         | 是    | Pass |
