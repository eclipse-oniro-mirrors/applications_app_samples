# AvoidWindowTitleButton测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 打开应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页正常显示"Top layout area, do not hide the title bar."文字及两个控制按钮 | 是 | Pass |
| 隐藏标题栏并避让三键控制按钮 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮 | 窗口标题栏隐藏，顶部粉色布局区域自动缩短避让右上角三键控制按钮，页面文字更新为"Top layout area, hide the title bar and avoid the three buttons." | 是 | Pass |
| 恢复显示标题栏 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮<br/>3、点击"do not hide the title bar."按钮 | 窗口标题栏恢复显示，顶部布局区域恢复为全宽显示，页面文字恢复为"Top layout area, do not hide the title bar." | 是 | Pass |

### 使用说明

标题栏三键控制按钮的避让相关用例仅在支持自由窗口的设备（如2in1、平板）上通过，普通手机仅通过页面展示类用例。
