# 自动化测试

1. 在设备上安装Release主HAP，启用并选中本示例输入法。
2. 在DevEco Studio中选择该设备，打开 `entry/src/ohosTest/ets/test/List.test.ets`，右键选择 **Run**。DevEco Studio会构建并安装测试HAP，执行测试套件。

| 用例 | 操作 | 预期结果 |
| --- | --- | --- |
| OpenPreviewEditor_001 | 启动示例 | 默认显示JS编辑区 |
| SendAndFinishJsPreview_002 | 绑定JS编辑区，发送并结束预上屏 | 收到资源文本，结束后正文保留 |
| SendAndFinishCPreview_003 | 打开C编辑器，绑定、发送、结束并返回 | C编辑区收到文本，结束后正文保留，能返回JS页面 |
| OpenInputMethodSettings_004 | 点击输入法设置 | 有系统入口时打开设置窗口，无入口时显示相应提示 |

设置应用启动失败的分支需在能复现该错误的设备上验证。
