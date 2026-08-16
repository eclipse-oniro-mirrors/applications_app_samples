# SetWindowLimitsByModuleJson5测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|------|------|------|------|------|------|
| 打开应用显示主页 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页 | 应用启动成功，主页正常显示"Top layout area, do not hide the title bar."文字及两个控制按钮 | 是 | Pass |
| 隐藏标题栏并避让三键控制按钮 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮 | 窗口标题栏隐藏，顶部布局区域自动避让标题栏三键控制按钮区域，页面文字更新为"Top layout area, hide the title bar and avoid the three buttons." | 是 | Pass |
| 恢复显示标题栏 | 位于只有一个应用的空白页 | 1、打开应用，进入示例主页<br/>2、点击"hide the title bar and avoid the three buttons."按钮<br/>3、点击"do not hide the title bar."按钮 | 窗口标题栏恢复显示，顶部布局区域恢复为全宽显示，页面文字恢复为"Top layout area, do not hide the title bar." | 是 | Pass |
| 窗口尺寸限制生效 | 位于只有一个应用的空白页 | 1、打开应用，应用启动时通过module.json5静态配置窗口尺寸限制<br/>2、在自由窗口状态下拖拽调节窗口大小 | 窗口宽度、高度被限制在module.json5配置的范围内（宽度400px~2560px，高度200px~1300px） | 是 | Pass |

### 使用说明

自由窗口尺寸限制与标题栏避让相关用例仅在支持自由窗口的设备（如2in1、平板）上通过，普通手机仅通过页面展示类用例。
