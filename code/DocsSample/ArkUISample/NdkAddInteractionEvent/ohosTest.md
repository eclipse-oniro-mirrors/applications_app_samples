| 测试功能                              | 预置条件     | 输入                   | 预期输出      | 测试结果 |
|-----------------------------------| ------------ | ---------------------- |-----------| -------- |
| 首页加载测试                            | 设备正常运行 | 验证基础元素渲染       | 检查标题和列表组件 | Pass     |
| 给点击添加相关事件测试 | 设备正常运行 | 点击"NormalTextList"，再点击"ShowNativeUI",点击输出对应坐标相关日志 | 页面加载成功，输出对应日志    | Pass     |
| 自定义手势判定回调测试 | 设备正常运行 | 点击"BindGestureEvent"，再点击"ShowNativeUI",点击屏幕相关日志 | 页面加载成功，点击事件无效    | Pass     |
| 按钮点击监听事件测试 | 设备正常运行 | 点击"ComponentListenEvent"，再点击"ShowNativeUI",点击"test" | 页面加载成功，输出对应日志     | Pass     |
| 顺序识别长按和滑动手势测试 | 设备正常运行 | 点击"LongPressAndSwipe"，再点击"ShowNativeUI", | 页面加载成功，长按，输出对应日志    | Pass     |
| 并行识别长按和快滑手势测试 | 设备正常运行 | 点击"LongPressAndFlick"，再点击"ShowNativeUI", | 页面加载成功，长按，输出对应日志    | Pass     |
| 互斥识别滑动手势和捏合手势 | 设备正常运行 | 点击"LongPressAndFlick"，再点击"ShowNativeUI", | 页面加载成功，捏合，输出对应日志    | Pass     |

