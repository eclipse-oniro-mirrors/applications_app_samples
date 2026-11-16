# 测试用例归档

## 说明

自动化用例位于 `entry/src/ohosTest/ets/test`，基于 `@ohos/hypium` 与 `@kit.TestKit`，
通过 `Driver` 驱动真实页面完成校验。执行前需保证设备已安装并启动被测应用。

## 用例表

| 用例套件               | 覆盖点                                             | 用例数 | 预置条件     | 是否自动 | 测试结果 |
| ---------------------- | -------------------------------------------------- | ------ | ------------ | -------- | -------- |
| IndexCatalogPart1      | 首页 10 个入口的文案与跳转                         | 20     | 设备正常运行 | 是       | pass     |
| PageButtonCatalogPart1 | 各连接页次要按钮可见性                             | 24     | 设备正常运行 | 是       | pass     |
| PageTextCatalogPart1   | 各连接页文本标签展示                               | 39     | 设备正常运行 | 是       | pass     |
| ButtonLabelTextPart1   | 各按钮文案精确值                                   | 34     | 设备正常运行 | 是       | pass     |
| NavigationMatrixPart1  | 首页进入各连接页并返回                             | 10     | 设备正常运行 | 是       | pass     |
| StabilityRepeatPart1   | 连接页三次重复进出稳定性                           | 10     | 设备正常运行 | 是       | pass     |
| PerfBudgetPart1        | 连接页 5 秒内完成打开                              | 10     | 设备正常运行 | 是       | pass     |
| RecoveryPart1          | 系统返回键从连接页恢复到首页                       | 10     | 设备正常运行 | 是       | pass     |
| LoggerContractPart1    | Logger 五个级别方法与 isLoggable 级别入参契约      | 26     | 设备正常运行 | 是       | pass     |
| IndexOrderPart1        | 首页入口自上而下的排列顺序                         | 9      | 设备正常运行 | 是       | pass     |
| InputRetentionPart1    | 各连接页输入框录入后保留输入值                     | 16     | 设备正常运行 | 是       | pass     |
| ValidationGuardPart1   | 缺少必填项/证书时的校验提示                        | 7      | 设备正常运行 | 是       | pass     |
| LoggerVariadicPart1    | Logger 变参与越界级别入参                          | 24     | 设备正常运行 | 是       | pass     |
| CrossPageRevisitPart1  | 两个连接页交替进入/返回后的状态隔离                | 10     | 设备正常运行 | 是       | pass     |
| 合计                   |                                                    | 249    |              |          |          |

## 手工用例

| 测试功能       | 预置条件     | 输入                             | 预期输出                                | 是否自动 | 测试结果 |
| -------------- | ------------ | -------------------------------- | --------------------------------------- | -------- | -------- |
| 多播通信测试   | 设备正常运行 | 点击"StartMulticast"按钮         | 多播通信成功，显示"Joined"信息          | 是       | pass     |
| 启动本地服务器 | 设备正常运行 | 点击"启动Local_Socket服务器"按钮 | 本地服务器启动成功，显示"Listening"信息 | 是       | pass     |
| 启动本地客户端 | 设备正常运行 | 点击"开启LocalSocket通信"按钮    | 本地客户端连接成功，显示"Connected"信息 | 是       | pass     |

