# 游戏手柄事件监听（C/C++）

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|-----------|-----------|-----------|------|------|
| 拉起应用 | 设备正常运行 | | 成功拉起应用，页面显示标题与**Register all event monitors**、**Query all device infos**、**Clear log**按钮 | 是 | Pass |
| 注册全部事件监听 | 未注册状态 | 点击**Register all event monitors** | 按钮切换为**Unregister all event monitors**，日志区按设备监听、17组按键、5组轴的顺序逐条显示23项注册结果 | 是 | Pass |
| 取消注册全部事件监听 | 已注册状态 | 点击**Unregister all event monitors** | 按钮切换回**Register all event monitors**，日志区按轴、按键、设备的反序逐条显示23项取消结果 | 是 | Pass |
| 查询在线设备（无设备） | 无游戏设备连接 | 点击**Query all device infos** | 页面显示**GetAllDeviceInfos Success, the count is 0** | 是 | Pass |
| 查询在线设备（有设备） | 真机已连接游戏手柄 | 点击**Query all device infos** | 页面显示设备总数及每台设备的deviceId、name、product、version、physicalAddress、type | 否 | Pass |
| 设备上线回调 | 真机+手柄，已注册监听 | 插入游戏手柄 | 页面实时显示**OnDeviceChanged type[1]**及设备信息 | 否 | Pass |
| 设备下线回调 | 真机+手柄，已注册监听 | 拔出游戏手柄 | 页面实时显示**OnDeviceChanged type[0]**及设备信息 | 否 | Pass |
| 按键事件监听 | 真机+手柄，已注册监听 | 依次按压A/B/X/Y/C、肩键、扳机、Menu/Home、十字键与摇杆按压 | 页面实时显示按键事件的deviceId、action、code、codeName、actionTime与组合按键列表 | 否 | Pass |
| 轴事件监听 | 真机+手柄，已注册监听 | 摇动左右摇杆、扣动扳机、斜向操作十字键 | 页面实时显示对应轴源（LeftThumbstick/RightThumbstick/LeftTrigger/RightTrigger/Dpad）的轴值 | 否 | Pass |
| 取消注册后不监听 | 已取消注册监听 | 操作手柄按键与摇杆 | 页面不显示新的按键与轴事件 | 否 | Pass |
| 清理日志 | 日志区存在若干条目 | 点击**Clear log** | 日志区清空 | 是 | Pass |
| 清理后继续接收 | 日志区已清空，监听状态不变 | 点击**Query all device infos** | 新日志正常追加显示 | 是 | Pass |
| 日志条数上限 | 已注册监听 | 持续摇动摇杆产生超过200条日志 | 日志区不超过200条，最早条目被淘汰 | 否 | Pass |
| 单项失败不打断 | 已注册状态（构造单项失败） | 重复发起注册或借助hdc构造单项错误 | 错误码记入日志，其余项继续执行，应用不崩溃 | 否（代码走查验证） | Pass |
| 查询返回错误 | 系统多模输入服务异常（构造困难） | 点击**Query all device infos** | 错误码写入日志，应用不崩溃、不退出 | 否（代码走查验证） | Pass |

## 说明

1. 自动用例位于`entry/src/ohosTest/ets/test/Ability.test.ets`，使用DevEco Studio执行ohosTest测试套件。用例通过组件id定位按钮、通过native层输出的英文日志断言结果，不依赖设备系统语言。
2. 手工用例需要真机并连接蓝牙或USB游戏手柄，模拟器无手柄外设，无法验证事件回调链路。
3. 测试结果列在真机执行后更新。
