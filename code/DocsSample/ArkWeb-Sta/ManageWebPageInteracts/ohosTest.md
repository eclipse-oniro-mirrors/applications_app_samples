## entry:

### ImpNestedScroll

| 测试功能           | 预置条件                                 | 输入                            | 预期输出                                                     | 是否自动 | 测试结果 |
| ------------------ | ---------------------------------------- | ------------------------------- | ------------------------------------------------------------ | -------- | -------- |
| Web组件嵌套滚动    | 设备运转正常，example.com 页面可正常访问 | 应用启动成功，点击SELF_ONLY按钮 | 当前内嵌前滚动模式 scrollForward ---NestedScrollMode.SELF_ONLY | Yes      | Pass     |
| 设置滚动模式（前） | 设备运转正常，example.com 页面可正常访问 | 点击SELF_FIRST按钮              | 当前内嵌前滚动模式 scrollForward ---NestedScrollMode.SELF_FIRST | Yes      | Pass     |
| 设置滚动模式（前） | 设备运转正常，example.com 页面可正常访问 | 点击PARENT_FIRST按钮            | 当前内嵌前滚动模式 scrollForward ---NestedScrollMode.PARENT_FIRST | Yes      | Pass     |
| 设置滚动模式（前） | 设备运转正常，example.com 页面可正常访问 | 点击PARALLEL 按钮               | 当前内嵌前滚动模式 scrollForward ---NestedScrollMode.PARALLEL | Yes      | Pass     |


