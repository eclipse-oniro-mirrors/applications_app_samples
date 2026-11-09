# ManagingExternalStorageDevices 测试用例归档

## 自动化测试用例

当前 ohosTest 共 **2125 条**用例：

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `ManagingExternalStorageDevicesTest` | 4 | 启动、按钮存在、订阅、接收广播 |
| `ManagingExternalStorageBehaviorTest` | 15 | 启动状态、按钮 id/文案、订阅/接收状态流转、重复点击、异常恢复 |
| `ManagingExternalStorageSequenceTest` | 126 | 长度 1–6 的订阅/接收动作序列矩阵 |
| `ManagingExternalStorageBoundaryTest` | 70 | 1–25 次重复订阅/接收、1–20 轮交替操作边界 |
| `ManagingExternalStorageSequence7Test` | 128 | 长度 7 的动作序列矩阵 |
| `ManagingExternalStorageExtendedBoundaryTest` | 70 | 26–50 次重复、21–40 轮交替边界 |
| `ManagingExternalStorageUiStabilityTest` | 20 | 重复启动、状态可见性和 UI 稳定性 |
| `ManagingExternalStorageSequence8Test` | 256 | 长度 8 的动作序列矩阵 |
| `ManagingExternalStorageSequence9ATest` | 256 | 长度 9 的前半序列矩阵 |
| `ManagingExternalStorageSequence9BTest` | 256 | 长度 9 的后半序列矩阵 |
| `ManagingExternalStorageSequence10Test` | 400 | 长度 10 的前 400 条序列矩阵 |
| `ManagingExternalStorageSequence10BTest` | 312 | 长度 10 序列矩阵中段 |
| `ManagingExternalStorageSequence10CTest` | 212 | 长度 10 序列矩阵后段（已删 100 条重复） |

## 用例表

| 测试功能       | 预置条件           | 输入                                      | 预期输出                   | 是否自动 | 测试结果 |
| -------------- | ------------------ | ----------------------------------------- | -------------------------- | -------- | -------- |
| 拉起应用       | 设备正常运行       |                                           | 成功拉起应用               | 是       | Pass     |
| 权限检查       | 成功拉起应用       |                                           | 无需申请特殊权限           | 是       | Pass     |
| 获取卷设备信息 | 安装应用，进入首页 | 测试代码点击两次按钮之后，插入u盘到开发板 | 将成功结果输出到首页文本框 | 否       | Pass     |

