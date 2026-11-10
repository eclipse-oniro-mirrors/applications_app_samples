# 自动化测试

安装 `default` 产品的主应用，设备开启开发者模式并连接HDC后，执行以下命令启用并切换到本示例输入法：

```shell
hdc shell ime -e com.samples.previewstylestatic -f
hdc shell ime -s com.samples.previewstylestatic
hdc shell ime -g
```

`-f`用于完整体验模式，运行设备需支持该模式。确认当前输入法为`com.samples.previewstylestatic`后，在DevEco Studio选择 `uiTest` 产品并运行 `entry` 的 `ohosTest`。

用例名称以 `com.samples.previewstylestatic_` 开头。

| 用例 | 操作 | 预期结果 |
| --- | --- | --- |
| OpenPreviewEditor_001 | 启动示例 | 显示静态编辑区 |
| ShowPreviewControls_002 | 点击编辑区绑定输入法 | 显示发送和结束预上屏按钮 |
| SendAndFinishPreview_003 | 发送并结束预上屏 | 编辑区收到资源文本，结束后保留该文本 |
