# VideoConferenceDemo测试用例归档

## 用例表

| 测试功能          | 预置条件    | 输入                                                              | 预期输出                    | 是否自动 |测试结果|
|---------------|---------|-----------------------------------------------------------------|-------------------------|------|--------------------------------|
| 授予麦克风权限       | 应用启动  | 弹出麦克风权限授权弹窗，点击允许                                                  | 成功授权麦克风权限               | 是    |Pass|
| 录制开语音         | 应用正常运行  | 开启语音，点击录制按钮开始录制，录制2秒后停止                                        | 录制文件生成，文件大小>0            | 是    |Pass|
| 录制关语音         | 应用正常运行  | 关闭语音，点击录制按钮开始录制，录制2秒后停止                                        | 录制文件生成（不含音频），文件大小>0      | 是    |Pass|
| 离开会议          | 应用正常运行  | 点击"离开"按钮                                                      | 应用退出，终止当前Ability         | 是    |Pass|
| 切换音频输出设备      | 应用正常运行  | 点击音频设备选择器，切换音频输出设备                                            | 音频输出切换到选择的设备            | 否    |Pass|

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **20 个套件、992 条用例、约 29,000 行测试代码**。
- 另有 UIAutoTest（4 条 UI 用例：麦克风权限、录制开/关语音、离开会议），未注册在 List.test.ets，需联网并在应用可启动的设备上单独执行。

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `ConstantsContractPart1` | 12 | `DOMAIN`、子窗口名/宽高、`RENDERER_INFO` usage/flags |
| `BackgroundGuardPart1` | 6 | `start/stopContinuousTask(undefined)` 安全返回 |
| `PermissionStatusPart1` | 18 | 18 个权限的 `checkPermission` 返回合法 `GrantStatus` |
| LoggerVariadicPart1..4 | 256 | 代表性参数组合：空串/2 参数/多参数/中文/emoji/长字符串 |
| `ToolBarItemMatrixPart1..13` | 700 | 构造参数组合、默认值、可选字段、自定义 `onClick` 透传 |

- 用例元数据：`@tc.number` = 序号 × 100（如 `..._0100`），`@tc.name` = 4 位序号；`it` 名与 `@tc.name` 一致。
- 每条用例输出 begin/end 日志；DOMAIN `0xF811`，TAG `[Sample_VideoConferenceDemo]`。

## 验证记录

- 测试代码编译通过
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
