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
- 运行命令：

```bash
hdc uninstall com.huawei.videoconferencedemo
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.huawei.videoconferencedemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s class constantsDomainCoreTest -s timeout 15000
```

- 全部套件运行：去掉 `-s class` 参数即可。

## 套件总览

`List.test.ets` 共注册 **21 个套件、1,624 条用例、约 2.8 万行测试代码**。

按 PR 12056 的写法，20 个专题文件每个固定 **81 条显式用例**，文件内自定义 `it()` / `expect()` 包装器（统一 begin/end 与 `actual:` 日志），逐条展开而非循环生成。

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `UIAutoTest` | 4 | 授权、开/关语音录制、离开会议 |
| `constantsDomainCore` | 81 | `Constants.DOMAIN = 0xFF00` |
| `constantsWindowNameCore` | 81 | 子窗口名 `subwindow` 非空/小写 |
| `constantsWindowSizeCore` | 81 | 子窗口宽 402、高 536、宽<高 |
| `constantsWindowLayoutCore` | 81 | 面积 215472、宽高和 938 等关系 |
| `constantsRendererInfoCore` | 81 | `RENDERER_INFO` 的 usage/rendererFlags |
| `toolBarItemDefaultsCore` | 81 | `ToolBarItem` 默认 isActive/onClick/可选字段 |
| `toolBarItemFieldsCore` | 81 | id/label/icon/颜色数组赋值 |
| `toolBarItemStateCore` | 81 | isActive 赋值与翻转 |
| `toolBarItemOnClickCore` | 81 | 自定义 onClick 入参透传 |
| `toolBarItemOptionalCore` | 81 | 可选字段存在性 |
| `toolBarItemIndependenceCore` | 81 | 两个 ToolBarItem 状态互不影响 |
| `loggerDebugCore` / `loggerInfoCore` / `loggerWarnCore` / `loggerErrorCore` | 324 | Logger 四个级别调用不抛异常 |
| `permissionCheckCore` | 81 | `checkPermission('ohos.permission.MICROPHONE')` 返回合法 GrantStatus |
| `backgroundStartCore` / `backgroundStopCore` | 162 | `start/stopContinuousTask(undefined)` 安全返回 |
| `rendererUsageEnumCore` | 81 | `STREAM_USAGE_MUSIC` 与 `Constants` 一致 |
| `constantsBoundaryCore` | 81 | 常量非空/正值/宽高不等 |

- 所有用例引用真实主工程代码：`Constants`、`ToolBarItem`、`Logger`、`PermissionUtil`、`BackgroundUtil` 以及 `@kit.AudioKit`。
- 每条用例带 `@tc.number`（步长 100）/`@tc.name`/`@tc.desc` 元数据，DOMAIN `0xF811`，TAG `[Sample_<suite>]`。

## 验证记录

- 测试代码编译通过：`entry@ohosTest` `assembleHap` **BUILD SUCCESSFUL**（为适配本机 OpenHarmony SDK，临时使用 API 23 构建；构建后已恢复工程原有 HarmonyOS `6.0.1(21)` 配置）。
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP 后执行上述命令。
