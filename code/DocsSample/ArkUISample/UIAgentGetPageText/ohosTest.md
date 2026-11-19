# UIAgentGetPageText 测试用例归档

## 用例表

| 用例名称 | 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- | --- |
| UIAgentGetPageText_InitialTextAndUnicode_001 | 页面文本与多语言采集 | 应用启动并进入示例页面，输入框为空 | 点击“采集页面文本” | 返回可解析的 JSON，schemaVersion 为 1；包含示例文本、中文、英文、emoji 和输入框提示文字 | 是 | Pass |
| UIAgentGetPageText_UpdateText_002 | 文本更新 | 位于示例页面 | 点击“切换示例文本”，再点击“采集页面文本” | 结果包含更新后的文本，不包含旧文本 | 是 | Pass |
| UIAgentGetPageText_InputAndPlaceholderExcluded_003 | 普通输入框及提示文字过滤 | 位于示例页面 | 输入 PageTextInput123，确认输入成功，收起键盘后采集 | 结果既不含普通输入框的输入内容，也不含原提示文字 | 是 | Pass |
| UIAgentGetPageText_RepeatedCollection_004 | 连续采集与页面返回 | 位于初始示例页面，输入框为空 | 采集后返回示例页面并重复 5 次 | 每次均返回有效 JSON，包含多语言文本，结果 JSON 不被递归收录，无崩溃 | 是 | Pass |

用例还校验节点 ID 为整数，rect 包含 4 个有限数值，宽高非负。每个用例记录 begin/end 日志，每条断言前记录实际值与期望值。日志标签为 `[Sample_UIAgentGetPageText]`，不打印采集到的完整页面文本。

每个用例通过 `beforeEach` 和 `afterEach` 恢复初始状态：退出残留的结果界面、清空输入、收起键盘并恢复原始示例文本。原始文本从当前应用资源中读取，适配不同语言；恢复后校验输入为空且示例文本正确，避免用例间状态相互影响。

## 执行方式

在 DevEco Studio 中运行 [PageText.test.ets](entry/src/ohosTest/ets/test/PageText.test.ets)。

自动化测试结果：4 项通过，0 项失败，0 项错误。已确认四个用例均输出 begin/end 日志，并记录提示文字过滤断言的实际值和期望值。

状态隔离验证：正常顺序和将输入用例前置的乱序执行均为 4 项通过；在临时测试副本中故意触发首个采集断言失败后，下一用例的前置恢复成功，后续 3 个用例全部通过。当前 Hypium 会跳过失败用例的 `afterEach`，因此 `beforeEach` 同时承担失败恢复职责。故障注入仅用于验证，工程保留正常测试用例。

本次回归使用包含所需接口的 OpenHarmony API 26 开发 SDK 和配套系统镜像；正式 `26.2.0` 发行 SDK 的编译运行验证尚未完成。工程的最低 SDK 要求见 [README.md](README.md)。
