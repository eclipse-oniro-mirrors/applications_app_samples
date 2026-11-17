# UIAgentGetPageText 测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 页面文本与多语言采集 | 应用启动并进入示例页面，输入框为空 | 点击“采集页面文本” | 返回可解析的 JSON，schemaVersion 为 1；包含示例文本、中文、英文、emoji 和输入框提示文字 | 是 | Pass |
| 文本更新 | 位于示例页面 | 点击“切换示例文本”，再点击“采集页面文本” | 结果包含更新后的文本，不包含旧文本 | 是 | Pass |
| 普通输入框内容过滤 | 位于示例页面 | 输入 PageTextInput123，收起键盘后采集 | 结果不含普通输入框的输入内容；已隐藏的提示文字不参与采集 | 是 | Pass |
| 连续采集与页面返回 | 已完成一次采集 | 返回示例页面并重复采集 5 次 | 每次均返回有效 JSON，包含多语言文本，结果页 JSON 不被递归收录，无崩溃 | 是 | Pass |

用例还校验节点 ID 为整数，rect 包含 4 个有限数值，宽高非负。

## 执行方式

在 DevEco Studio 中运行 [PageText.test.ets](entry/src/ohosTest/ets/test/PageText.test.ets)，或在安装应用与测试 HAP 后执行：

```shell
hdc shell aa test -b com.samples.uiagentpagetext -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 60000 -w 60
```

自动化测试结果：4 项通过，0 项失败，0 项错误。
