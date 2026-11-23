# NdkTsDrawing 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|是否自动|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
| 拉起应用 | 设备正常运行 |		|成功拉起应用|是| Pass |
| 绘制图形 | 位于首页 | 点击** Path** | 页面绘制路径效果   | 是  | Pass |
| 绘制图形 | 位于首页 | 点击**Canvas** | 页面绘制画布效果   | 是  | Pass |
| 绘制图形 | 位于首页 | 点击**Image and Font** | 页面显示图片和文字效果   | 是  | Pass |

## 逻辑用例（数据驱动）

以下 2384 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new RectBox（构造） | 无 | 75 组输入（TsDrawingSample_RectBoxCtor_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| starPointX（函数） | 无 | 75 组输入（TsDrawingSample_StarPointX_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| starPointY（函数） | 无 | 75 组输入（TsDrawingSample_StarPointY_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| polygonRadiusOf（函数） | 无 | 75 组输入（TsDrawingSample_PolygonRadiusOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| polygonAngleOf（函数） | 无 | 75 组输入（TsDrawingSample_PolygonAngleOf_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| polygonVertexX（函数） | 无 | 75 组输入（TsDrawingSample_PolygonVertexX_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| polygonVertexY（函数） | 无 | 74 组输入（TsDrawingSample_PolygonVertexY_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| polygonVertexCount（函数） | 无 | 74 组输入（TsDrawingSample_PolygonVertexCount_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pentagonVertexX（函数） | 无 | 74 组输入（TsDrawingSample_PentagonVertexX_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pentagonVertexY（函数） | 无 | 74 组输入（TsDrawingSample_PentagonVertexY_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| panelOffsetOf（函数） | 无 | 74 组输入（TsDrawingSample_PanelOffsetOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shapeColumnWidthOf（函数） | 无 | 74 组输入（TsDrawingSample_ShapeColumnWidthOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shapeRectOf（函数） | 无 | 74 组输入（TsDrawingSample_ShapeRectOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| roundRectOf（函数） | 无 | 74 组输入（TsDrawingSample_RoundRectOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shapeLineLengthOf（函数） | 无 | 74 组输入（TsDrawingSample_ShapeLineLengthOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| arcRectOf（函数） | 无 | 74 组输入（TsDrawingSample_ArcRectOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shapeCircleCenterXOf（函数） | 无 | 74 组输入（TsDrawingSample_ShapeCircleCenterXOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shapePointXOf（函数） | 无 | 74 组输入（TsDrawingSample_ShapePointXOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| clipRectOf（函数） | 无 | 74 组输入（TsDrawingSample_ClipRectOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| canvasCellOf（函数） | 无 | 74 组输入（TsDrawingSample_CanvasCellOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| smallTextSizeOf（函数） | 无 | 74 组输入（TsDrawingSample_SmallTextSizeOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pathTextSizeOf（函数） | 无 | 74 组输入（TsDrawingSample_PathTextSizeOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| canvasRowStartYOf（函数） | 无 | 74 组输入（TsDrawingSample_CanvasRowStartYOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| canvasCircleXOf（函数） | 无 | 74 组输入（TsDrawingSample_CanvasCircleXOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rotatePivotXOf（函数） | 无 | 74 组输入（TsDrawingSample_RotatePivotXOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rotatePivotYOf（函数） | 无 | 74 组输入（TsDrawingSample_RotatePivotYOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rotatedRectLeftOf（函数） | 无 | 74 组输入（TsDrawingSample_RotatedRectLeftOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| pathColumnWidthOf（函数） | 无 | 74 组输入（TsDrawingSample_PathColumnWidthOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| titleXOf（函数） | 无 | 74 组输入（TsDrawingSample_TitleXOf_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rectWidthOf（函数） | 无 | 4 组输入（TsDrawingSample_RectWidthOf_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| rectHeightOf（函数） | 无 | 4 组输入（TsDrawingSample_RectHeightOf_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ShapePanelLayout（构造） | 无 | 56 组输入（TsDrawingSample_ShapePanelLayoutCtor_0001~0056） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout.labelX（实例方法） | 无 | 74 组输入（TsDrawingSample_ShapePanelLayoutLabelX_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout.labelY（实例方法） | 无 | 1 组输入（TsDrawingSample_ShapePanelLayoutLabelY_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout.rectWidth（实例方法） | 无 | 1 组输入（TsDrawingSample_ShapePanelLayoutRectWidth_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout.roundRectWidth（实例方法） | 无 | 1 组输入（TsDrawingSample_ShapePanelLayoutRoundRectWidth_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout.lineY（实例方法） | 无 | 1 组输入（TsDrawingSample_ShapePanelLayoutLineY_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ShapePanelLayout flow（调用序列） | 无 | 74 组输入（TsDrawingSample_ShapePanelLayoutFlow_0001~0074） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DrawingGeometryLogic（常量契约） | 无 | 16 组输入（TsDrawingSample_DrawingGeometryLogicConstants_0001~0016） | 返回值与状态逐条符合预期 | 是 | 待执行 |
