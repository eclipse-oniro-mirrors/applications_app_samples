# 验证状态

完成本次修改的CLI主HAP和ohosTest HAP构建。工程目标SDK为26.1.0；本地使用26.1.0门禁ArkTS工具链及配套的预上屏样式C接口头文件、链接库。未修改设备系统运行库。本次未新增IDE构建截图。

在RK3568设备执行本工程OpenHarmonyTestRunner，结果为4项通过、0项失败、0项错误：

- OpenPreviewEditor_001：启动后显示默认编辑框。
- SendAndFinishJsPreview_002：编辑框收到预上屏文本，结束后保留文本。
- SendAndFinishCPreview_003：C编辑框收到预上屏文本，结束后保留文本，并可返回默认页面。
- VerifySettingsEntryRemoved_004：默认编辑框可见，输入法设置按钮不存在。

测试前按README中的ime命令以完整体验模式启用并切换本示例输入法，完成后恢复原输入法。基础模式的隔离启动未通过本次设备验证，不纳入上述通过结论。应用不自动切换输入法，也不依赖系统输入法设置窗口。

本次修改后的实际运行截图见[ArkTS编辑框](screenshots/Sample-Run-JS.jpeg)和[C编辑框](screenshots/Sample-Run-C.jpeg)。自动化用例校验文本和页面流程，不代替下划线视觉效果检视。
