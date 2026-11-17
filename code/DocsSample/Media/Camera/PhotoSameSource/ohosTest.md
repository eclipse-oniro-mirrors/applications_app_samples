# PhotoSameSource 测试用例归档

## 说明

自动化用例位于 `entry/src/ohosTest/ets/test`，基于 `@ohos/hypium` 与 `@kit.TestKit`。
纯逻辑用例直接调用 `DateTimeUtil`、`GlobalContext`、`CameraService`、`Constants`、`BlurAnimateUtil`
与 `Logger` 的真实实现；UI 用例通过 `Driver` 驱动真实页面，首次启动会自动处理相机/麦克风权限弹窗。
状态类套件统一排在 UI 套件之前，避免应用初始化改变工具类默认状态。

## 自动化套件

| 套件                           | 覆盖点                                                   | 用例数 | 是否自动 | 测试结果 |
| ------------------------------ | -------------------------------------------------------- | ------ | -------- | -------- |
| PhotoLaunchPart1               | 启动、权限弹窗关闭、首页控件存在                         | 4      | 是       | pass     |
| DateTimeFormatMatrixPart1      | `fill` 补零边界 + `concatDate` 日期拼接                   | 41     | 是       | pass     |
| DateTimeFormatMatrixPart2      | `concatDate` 剩余组合 + `concatTime` 时分秒拼接           | 41     | 是       | pass     |
| DateTimeVideoMatrixPart1       | `getVideoTime` 毫秒换算 + `getTime`/`getDate` 格式        | 19     | 是       | pass     |
| GlobalContextMatrixPart1       | 单例、typed get/set、覆盖、`apply` 回调、缺失键           | 12     | 是       | pass     |
| CameraServiceStateMatrixPart1  | 场景模式、帧计数、`SliderValue`、常量与动画不变量         | 20     | 是       | pass     |
| LoggerContractMatrixPart1      | `Logger` 四级别方法 × 四种变参形态                       | 16     | 是       | pass     |
| CameraProfileMatrixPart1       | 预览/录像 Profile 匹配：尺寸、格式、帧率与多候选扫描      | 22     | 是       | pass     |
| DateTimeExtremeMatrixPart1     | 小数毫秒、超长录像时长、非法月/日拼接                     | 13     | 是       | pass     |
| GlobalContextExtendPart1       | 回调覆盖、覆盖后执行、键类型复用、未设置上下文            | 4      | 是       | pass     |
| CameraGuardMatrixPart1         | 无输出时的动态照片/上下文防护                             | 3      | 是       | pass     |
| BlurAnimateStateMatrixPart1    | 截图状态初值与空 surfaceId 不产生截图                     | 2      | 是       | pass     |
| PhotoUiCatalogPart1            | 模式文案、拍照键、闪光灯菜单、反复启停稳定性              | 16     | 是       | pass     |
| PhotoUiInteractionPart1        | 拍照/切换相机/动态照片点击后 UI 保持 + 热启动预算         | 5      | 是       | pass     |
| 合计                           |                                                          | 218    |          |          |

## 手工用例

| 测试功能 | 预置条件     | 输入                                   | 预期输出       | 是否自动 | 测试结果 |
| -------- | ------------ | -------------------------------------- | -------------- | -------- | -------- |
| 拉起应用 | 设备正常运行 | 点击应用图标                           | 成功拉起应用   | 是       | Pass     |
| 拍照功能 | 进入示例应用 | 1. 点击拍照<br/>2. 点击拍照按钮        | 拍照图片保存   | 是       | Pass     |
| 录制功能 | 进入示例应用 | 1. 点击录像<br/>2. 开始录像<br/>3. 停止 | 录像视频保存   | 是       | Pass     |
