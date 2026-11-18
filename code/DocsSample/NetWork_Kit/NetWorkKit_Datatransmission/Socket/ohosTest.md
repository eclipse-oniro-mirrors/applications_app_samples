# 测试用例归档

## 说明

自动化用例位于 `entry/src/ohosTest/ets/test`，默认 `List.test.ets` 一次性注册全部 **402 条**用例，
不拆分为多个批次。文件数与 List 完全一致：20 个测试模块 + `List.test.ets`，共 21 个 `.test.ets`。

## 用例表

| 套件 | 覆盖点 | 用例数 | 测试结果 |
| --- | --- | ---: | --- |
| PhotoLaunch/ActsAbilityTest | 启动、权限、首页控件 | 4 | pass |
| IndexCatalogPart1 | 首页 10 个入口文案与跳转 | 20 | pass |
| IndexOrderPart1 | 首页相邻入口顺序 | 9 | pass |
| IndexPairOrderMatrixPart1 | 首页全部非相邻入口前后顺序 | 36 | pass |
| IndexLabelTypeMatrixPart1 | 10 个入口组件类型 | 10 | pass |
| PageButtonCatalogPart1 | 各连接页按钮存在性 | 24 | pass |
| PageTextCatalogPart1 | 各连接页文本标签 | 39 | pass |
| ButtonLabelTextPart1 | 按钮文案精确值 | 34 | pass |
| NavigationMatrixPart1 | 进入/返回导航 | 10 | pass |
| StabilityRepeatPart1 | 三次重复进出稳定性 | 10 | pass |
| PerfBudgetPart1 | 页面 5s 内打开 | 10 | pass |
| RecoveryPart1 | 系统返回恢复首页 | 10 | pass |
| InputRetentionPart1 | 每页前两个输入框留存 | 16 | pass |
| ValidationGuardPart1 | 必填/证书校验提示 | 7 | pass |
| CrossPageRevisitPart1 | 相邻两页交替进入/返回 | 10 | pass |
| LoggerContractPart1 | Logger 方法与级别契约 | 26 | pass |
| LoggerVariadicPart1 | Logger 变参与越界级别 | 24 | pass |
| LoggerCountLevelMatrixPart1~3 | 5 方法 × 0~20 参数 + 12 个级别值 | 103 | pass |
| 合计 |  | 402 |  |

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 多播通信测试 | 设备正常运行 | 点击"StartMulticast"按钮 | 多播通信成功，显示"Joined"信息 | 是 | pass |
| 启动本地服务器 | 设备正常运行 | 点击"启动Local_Socket服务器"按钮 | 本地服务器启动成功，显示"Listening"信息 | 是 | pass |
| 启动本地客户端 | 设备正常运行 | 点击"开启LocalSocket通信"按钮 | 本地客户端连接成功，显示"Connected"信息 | 是 | pass |
