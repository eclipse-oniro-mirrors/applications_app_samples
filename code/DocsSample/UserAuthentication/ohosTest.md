# 测试用例归档

## 用例表

| 测试功能               | 预置条件                                                     | 输入                                                         | 预期显示                                                     | 是否自动 | 测试结果 |
| ---------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | -------- | -------- |
| 启动应用               | 设备正常运行                                                 | 1.开启开发板 <br/>2.在运行测试前需要修改启动页面为`testPage`，具体修改方式为：将`src/main/ets/entryability/EntryAbility.ets`中的`windowStage.loadContent('pages/Index', ...)`修改为`windowStage.loadContent('pages/testPage', ...)` <br />3.编译hap包并将hap包及环境烧录进开发板，运行测试用例<br /> | 成功拉起应用。                                               | 是       | 验证通过 |
| 查询 Auth 能力           | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 |                                                              | 1.按钮下方文本从Wait变为Pass                                 | 是       | 验证通过 |
| 测试实例1              | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.输入用户 Auth 信息                                           | 1.上方tab切换到“实例1、2”<br/>2.自动点击第一个按钮后拉起用户 Auth 页面，在十秒内输入用户 Auth 信息后，第一个按钮下方的文本从Wait变为Pass | 否       | 验证通过 |
| 测试实例2              | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.输入用户 Auth 信息                                           | 1.自动点击第二个按钮后拉起用户 Auth 页面，在十秒内输入用户 Auth 信息后，第一个按钮下方的文本从Wait变为Pass | 否       | 验证通过 |
| 测试实例3              | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.输入用户 Auth 信息                                           | 1.上方tab切换到“实例3、4”<br/>2.自动点击第一个按钮后拉起用户 Auth 页面，在十秒内输入用户 Auth 信息后，第一个按钮下方的文本从Wait变为Pass | 否       | 验证通过 |
| 测试实例4              | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.输入用户 Auth 信息                                           | 1.自动点击第二个按钮后拉起用户 Auth 页面，在十秒内输入用户 Auth 信息后，第一个按钮下方的文本从Wait变为Pass | 否       | 验证通过 |
| 切换自定义 Auth         | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.在用户 Auth 界面点击“使用应用密码”按钮                       | 1.上方tab切换到“自定义”<br/>2.自动点击按钮后拉起用户 Auth 页面，在用户 Auth 界面点击“使用应用密码”按钮后，按钮下方的文本从Wait变为Pass<br />3.如果测试设备不支持人脸和指纹 Auth，那么自动点击按钮后下方Wait变为Pass | 否       | 验证通过 |
| Auth 流程中取消 Auth     | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 |                                                              | 1.上方tab切换到“取消实例”<br/>2.自动点击按钮后拉起用户 Auth 页面，3秒后用户 Auth 页面被关闭，按钮下方的文本从Wait变为Pass | 是       | 验证通过 |
| 查询用户注册凭据的状态 | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 |                                                              | 1.上方tab切换到“查询凭据”<br/>2.自动点击按钮后按钮下方的文本从Wait变为Pass，并在Pass下方输出凭据号 | 是       | 验证通过 |
| 模拟场景               | 开发板需提前设置用户 Auth 信息，即PIN、人脸或指纹 | 1.输入用户 Auth 信息<br/>2.在用户 Auth 界面点击“使用应用密码”按钮 | 1.上方tab切换到“模拟验证”<br/>2.自动点击第一个按钮后按钮下方的文本输出“支持 Auth 能力”<br/>3.自动点击第二个按钮后拉起用户 Auth 界面<br/>4.自动点击第三个按钮，拉起用户 Auth 界面<br/>5.自动点击第四个按钮，在第四个按钮下方输出凭据号 | 否       | 验证通过 |

## 自动化用例统计

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `UserAuth.test.ets` | 16 | 通过 UiTest 驱动 `Index` 页面，覆盖 Auth 能力查询、Auth 实例、取消、凭据、模拟验证等 UI 场景 |
| `UserAuthContract.test.ets` | 55 | UserAuthType、AuthTrustLevel、AuthParam 契约 |
| `UserAuthMatrixPart01.test.ets` | 91 | AuthParam/UserAuthType 矩阵组合 |
| `UserAuthMatrixPart02.test.ets` | 109 | SecureLevel、AuthType 等枚举矩阵组合 |
| `UserAuthMorePart01.test.ets` | 91 | 扩展 challenge 与 AuthParam 组合 |
| `UserAuthMorePart02.test.ets` | 102 | 扩展 authType 数组与枚举交叉组合 |
| `UserAuthMorePart03.test.ets` | 7 | AuthParam 字段一致性补充 |
| `UserAuthVolumePart01.test.ets` | 77 | AuthParam challenge 长度、authType 与等级批量组合 |
| `UserAuthVolumePart02.test.ets` | 77 | AuthParam challenge 长度、authType 与等级批量组合 |
| `UserAuthVolumePart03.test.ets` | 77 | AuthParam challenge 长度、authType 与等级批量组合 |
| `UserAuthVolumePart04.test.ets` | 19 | AuthParam challenge 长度、authType 与等级批量组合 |
| **合计** | **721** | |

## 补充契约用例（55 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testUserAuthContract0001-0015 | UserAuthType PIN/FACE/FINGERPRINT | 枚举值 1/2/4 | Pass |
| testUserAuthContract0016-0035 | AuthTrustLevel ATL1-ATL4 | 10000/20000/30000/40000 | Pass |
| testUserAuthContract0036-0045 | AuthParam 参数组合 | challenge 16、authType 3 项 | Pass |
| testUserAuthContract0046-0055 | challenge 长度 17-26 | 长度与数组一致 | Pass |

## 批量矩阵用例（200 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testUserAuthMatrix0001-0050 | AuthParam challenge/authType/trustLevel 组合 | 长度、类型、等级正确 | Pass |
| testUserAuthMatrix0051-0100 | UserAuthType 数组组合 | 数组非空且元素为 number | Pass |
| testUserAuthMatrix0101-0150 | SecureLevel S1-S4 | 字符串值正确 | Pass |
| testUserAuthMatrix0151-0200 | AuthType ALL/FACE_ONLY | 字符串值正确 | Pass |

## 扩展矩阵用例（200 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testUserAuthMore0001-0050 | 扩展 challenge 33-82 | 长度/类型/等级正确 | Pass |
| testUserAuthMore0051-0100 | 扩展 authType 数组 | 数组长度正确 | Pass |
| testUserAuthMore0101-0150 | SecureLevel/AuthType 交叉 | 字符串正确 | Pass |
| testUserAuthMore0151-0200 | AuthParam 相等性 | 字段一致 | Pass |

## 批量参数用例（250 条）

| 用例范围 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| testUserAuthVolume0001-0077 | AuthParam challenge 长度 17-26、authType 与等级组合 | 长度、类型、等级正确 | Pass |
| testUserAuthVolume0078-0231 | AuthParam challenge 长度、authType 与等级批量组合 | 长度、类型、等级正确 | Pass |
| testUserAuthVolume0232-0250 | AuthParam 字段一致性补充 | 字段一致 | Pass |
