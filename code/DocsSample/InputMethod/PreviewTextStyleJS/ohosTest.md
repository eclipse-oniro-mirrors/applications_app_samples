# 自动化测试

1. 在设备上安装Release主HAP，按README中的ime命令以完整体验模式启用并切换至本示例输入法。
2. 在DevEco Studio中选择该设备，打开 `entry/src/ohosTest/ets/test/List.test.ets`，右键选择 **Run**。DevEco Studio会构建并安装测试HAP，执行测试套件。

| 用例 | 操作 | 预期结果 |
| --- | --- | --- |
| OpenPreviewEditor_001 | 启动示例 | 默认显示JS编辑区 |
| SendAndFinishJsPreview_002 | 绑定JS编辑区，发送并结束预上屏 | 收到资源文本，结束后正文保留 |
| SendAndFinishCPreview_003 | 打开C编辑器，绑定、发送、结束并返回 | C编辑区收到文本，结束后正文保留，能返回JS页面 |
| VerifySettingsEntryRemoved_004 | 启动示例并检查默认页面 | 显示编辑框，不显示输入法设置按钮 |
