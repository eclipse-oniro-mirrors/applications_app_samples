# AvoidWindowTitleButton测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 打开应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页正常显示"Top layout area, do not hide the title bar."文字及两个控制按钮 | 是 | Pass |
| 隐藏标题栏并避让三键控制按钮 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮 | 窗口标题栏隐藏，顶部粉色布局区域自动缩短避让右上角三键控制按钮，页面文字更新为"Top layout area, hide the title bar and avoid the three buttons." | 是 | Pass |
| 恢复显示标题栏 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮<br/>3、点击"do not hide the title bar."按钮 | 窗口标题栏恢复显示，顶部布局区域恢复为全宽显示，页面文字恢复为"Top layout area, do not hide the title bar." | 是 | Pass |

### 使用说明

标题栏三键控制按钮的避让相关用例仅在支持自由窗口的设备（如2in1、平板）上通过，普通手机仅通过页面展示类用例。

## 自动化补充用例（10 条）

| 用例编号 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| AvoidWindowTitleButton_extra_001 | 初始标题文本 | 显示 do not hide 文案 | Pass |
| AvoidWindowTitleButton_extra_002 | 初始隐藏按钮 | 按钮存在 | Pass |
| AvoidWindowTitleButton_extra_003 | 初始恢复按钮 | 按钮存在 | Pass |
| AvoidWindowTitleButton_extra_004 | 点击隐藏标题栏 | 文案切换为 hide | Pass |
| AvoidWindowTitleButton_extra_005 | 隐藏后恢复 | 文案恢复为 do not hide | Pass |
| AvoidWindowTitleButton_extra_006 | 重复隐藏 | 文案保持 hide | Pass |
| AvoidWindowTitleButton_extra_007 | 重复恢复 | 文案保持 do not hide | Pass |
| AvoidWindowTitleButton_extra_008 | 隐藏-恢复-隐藏 | 最终为 hide | Pass |
| AvoidWindowTitleButton_extra_009 | 两轮切换 | 最终为恢复状态 | Pass |
| AvoidWindowTitleButton_extra_010 | 启动后顶层 Ability | EntryAbility | Pass |

## 布局与压力补充用例（10 条）

| 用例编号 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| AvoidWindowTitleButton_layout_001 | 标题文本布局边界 | 宽高大于 0 | Pass |
| AvoidWindowTitleButton_layout_002 | 隐藏按钮布局边界 | 宽高大于 0 | Pass |
| AvoidWindowTitleButton_layout_003 | 恢复按钮布局边界 | 宽高大于 0 | Pass |
| AvoidWindowTitleButton_layout_004 | 连续 5 次隐藏 | 最终显示隐藏文案 | Pass |
| AvoidWindowTitleButton_layout_005 | 5 轮交替点击 | 最终恢复文案 | Pass |
| AvoidWindowTitleButton_layout_006 | 连续启动 3 次 | EntryAbility 置顶 | Pass |
| AvoidWindowTitleButton_layout_007 | 隐藏后重启 | 不崩溃 | Pass |
| AvoidWindowTitleButton_layout_008 | 恢复后重启 | 不崩溃 | Pass |
| AvoidWindowTitleButton_layout_009 | 隐藏后按钮可点击 | 恢复按钮存在 | Pass |
| AvoidWindowTitleButton_layout_010 | 恢复后标题可见 | 标题组件存在 | Pass |

## 压力补充用例（10 条）

| 用例编号 | 测试内容 | 预期输出 | 测试结果 |
|---|---|---|---|
| AvoidWindowTitleButton_stress_001 | 10 次隐藏 | 保持隐藏文案 | Pass |
| AvoidWindowTitleButton_stress_002 | 10 次恢复 | 保持恢复文案 | Pass |
| AvoidWindowTitleButton_stress_003 | 20 次交替 | 最终恢复 | Pass |
| AvoidWindowTitleButton_stress_004 | 隐藏后按钮边界 | 宽高大于 0 | Pass |
| AvoidWindowTitleButton_stress_005 | 恢复后标题边界 | 宽大于 0 | Pass |
| AvoidWindowTitleButton_stress_006 | 隐藏后标题组件 | 存在 | Pass |
| AvoidWindowTitleButton_stress_007 | 恢复后标题组件 | 存在 | Pass |
| AvoidWindowTitleButton_stress_008 | 连续启动 5 次 | EntryAbility 置顶 | Pass |
| AvoidWindowTitleButton_stress_009 | 隐藏后启动 5 次 | EntryAbility 置顶 | Pass |
| AvoidWindowTitleButton_stress_010 | 10 轮切换 | 最终恢复 | Pass |
