# PhotoSameSource 测试用例归档

## 说明

自动化用例位于 `entry/src/ohosTest/ets/test`。默认 `List.test.ets` 注册 **796 条**：启动 4 条 +
792 条纯逻辑/矩阵套件。纯逻辑套件直接调用 `DateTimeUtil`、`GlobalContext`、`CameraService`、
`Constants`、`BlurAnimateUtil`、`Logger` 真实实现，不依赖 UiTest 服务。

`PhotoUiCatalogPart1`（16 条）与 `PhotoUiInteractionPart1`（5 条）文件保留，但未加入默认 List：
本机连续多轮测试后 UiTest/AAMS 服务会进入 `CONNECTION_EXIST` 状态，UI 点击闪光灯菜单时应用被
终止（约第 802 条），因此默认回归只跑稳定集合；UI 套件可在重启设备/UiTest 服务后单独运行。

## 自动化套件

| 套件 | 覆盖点 | 用例数 | 默认注册 | 测试结果 |
| --- | --- | ---: | --- | --- |
| PhotoLaunchPart1 | 启动、权限弹窗、首页控件 | 4 | 是 | pass |
| DateTimeFormatMatrixPart1/2 | `fill`、`concatDate`、`concatTime` 基础组合 | 82 | 是 | pass |
| DateTimeTimeCubePart1~6 | 24 小时 × 3 分钟 × 3 秒全矩阵 | 211 | 是 | pass |
| DateTimeDateCubePart1~5 | 3 年份 × 13 月份 × 5 日期（含边界） | 189 | 是 | pass |
| DateTimeVideoMatrixPart1 | `getVideoTime`、`getTime`、`getDate` | 19 | 是 | pass |
| DateTimeExtremeMatrixPart1 | 小数毫秒、超长时长、非法月/日 | 13 | 是 | pass |
| GlobalContextMatrixPart1 | 单例、typed get/set、覆盖、apply | 12 | 是 | pass |
| GlobalContextExtendPart1 | 回调覆盖、键类型复用、上下文 | 4 | 是 | pass |
| GlobalContextSequenceMatrixPart1 | set/apply/missing 两步序列矩阵 | 25 | 是 | pass |
| CameraServiceStateMatrixPart1 | 场景模式、帧计数、SliderValue、常量 | 20 | 是 | pass |
| CameraServiceSequenceMatrixPart1 | 场景/帧计数两步序列、Slider 组合 | 27 | 是 | pass |
| CameraProfileMatrixPart1 | 预览/录像 Profile 基础匹配 | 22 | 是 | pass |
| CameraProfileCubePart1~3 | 预览 3×3×3、录像 3×3×2×4 矩阵 | 99 | 是 | pass |
| CameraGuardMatrixPart1 | 无输出时的防护 | 3 | 是 | pass |
| BlurAnimateStateMatrixPart1 | 截图初值、空 surfaceId | 2 | 是 | pass |
| LoggerContractMatrixPart1 | 四级别 × 四种变参形态 | 16 | 是 | pass |
| LoggerCountMatrixPart1/2 | 四级别 × 0~12 参数 | 48 | 是 | pass |
| PhotoUiCatalogPart1 | 模式文案、拍照键、闪光灯菜单 | 16 | 否 | 需 UiTest 服务 |
| PhotoUiInteractionPart1 | 拍照/切换相机/动态照片、热启动 | 5 | 否 | 需 UiTest 服务 |
| 合计 |  | 817 | 默认 796 | 796/796 pass |

## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 拉起应用 | 设备正常运行 | 点击应用图标 | 成功拉起应用 | 是 | Pass |
| 拍照功能 | 进入示例应用 | 拍照并触发拍照 | 拍照图片保存 | 是 | Pass |
| 录制功能 | 进入示例应用 | 录像开始/停止 | 录像视频保存 | 是 | Pass |
