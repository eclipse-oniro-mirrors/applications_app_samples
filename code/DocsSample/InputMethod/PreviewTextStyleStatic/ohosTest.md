# 自动化测试

安装 `default` 产品的主应用，在设备设置中启用并选中本示例输入法。在DevEco Studio选择 `uiTest` 产品后运行 `entry` 的 `ohosTest`。

用例名称以 `com.samples.previewstylestatic_` 开头。

| 用例 | 操作 | 预期结果 |
| --- | --- | --- |
| OpenPreviewEditor_001 | 启动示例 | 显示静态编辑区 |
| ShowPreviewControls_002 | 点击编辑区绑定输入法 | 显示发送和结束预上屏按钮 |
| SendAndFinishPreview_003 | 发送并结束预上屏 | 编辑区收到资源文本，结束后保留该文本 |
