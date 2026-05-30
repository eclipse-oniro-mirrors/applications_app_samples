# 测试用例归档

## 用例表

| 测试功能                            | 预置条件     | 输入                                         | 预期输出                                                     | 是否自动 | 测试结果 |
| ----------------------------------- | ------------ | -------------------------------------------- | ------------------------------------------------------------ | :------- | -------- |
| 操作节点树                          | 设备正常运行 | 进入首页-点击"OperationNodeTreeSample"                         | 预期显示“一个节点容器”和“getNextSibling按钮”。点击按钮，日志输入：RenderNode the position of child is x: 10, y: 70, the position of nextSibling is x: 10, y: 130 | 是       | Pass     |
| 设置和获取渲染相关属性              | 设备正常运行 | 进入首页-点击"RenderingPropertiesSample"              | 预期显示 “一个节点容器” 点击不同的按钮，会显示不同的效果。   | 是       | Pass     |
| 自定义绘制                          | 设备正常运行 | 进入首页-点击"CustomDrawSample"                          | 预期显示 “一个节点容器” 点击按钮后 界面上绘制的矩形的宽度会发生变化。 | 是       | Pass     |
| 调整自定义绘制Canvas的变换矩阵      | 设备正常运行 | 进入首页-点击"CustomDrawCanvasSample"      | 预期显示 “两个个节点容器” 出现两个矩形。                     | 是       | Pass     |
| 设置标签                            | 设备正常运行 | 进入首页-点击"SetLabelSample"                            | 预期显示 “一个节点容器” 出现一个红色的矩形。                 | 是       | Pass     |
| 查询当前RenderNode是否解除引用      | 设备正常运行 | 进入首页-点击"CheckRenderNodeDispoaedSample"      | 预期显示 “一个节点容器” ，点击按钮可以查看 render node disposed is true / false . | 是       | Pass     |
