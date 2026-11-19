# 图片缩放效果案例

## 用例表

| 测试功能          | 预置条件            | 输入                 | 预期输出               | 是否自动 | 测试结果 |
|---------------|-----------------|--------------------|--------------------|------|------|
| 双指捏合缩放图片      | 	启动【图片缩放效果案例】   | 	双指捏合屏幕	           | 图片放大情况下，图片跟随手指捏合缩小 | 是    | Pass |
| 放大状态下，单指可拖动图片 | 启动【图片缩放效果案例】  	 | 双击放大后，单指点击屏幕后进行拖动	 | 图片跟随手指进行拖动         | 是    | Pass |
| 双击图片进行图片的大小切换 | 	启动【图片缩放效果案例】   | 	单指点击              | 图片大小发生变化           | 是    | Pass |

## 逻辑用例（数据驱动）

以下 2027 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ImageViewerConstants（常量契约） | 无 | 2 组输入（ImageViewer_ImageViewerConstantsValues_0001~0002） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new OffsetModel（构造） | 无 | 193 组输入（ImageViewer_OffsetModelCtor_0001~0193） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| OffsetModel.toString（实例方法） | 无 | 1 组输入（ImageViewer_OffsetModelToString_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| OffsetModel flow（调用序列） | 无 | 599 组输入（ImageViewer_OffsetModelFlow_0001~0599） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new RotateModel（构造） | 无 | 240 组输入（ImageViewer_RotateModelCtor_0001~0240） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RotateModel flow（调用序列） | 无 | 75 组输入（ImageViewer_RotateModelFlow_0001~0075） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ScaleModel（构造） | 无 | 141 组输入（ImageViewer_ScaleModelCtor_0001~0141） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ScaleModel.reset（实例方法） | 无 | 1 组输入（ImageViewer_ScaleModelReset_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ScaleModel.toString（实例方法） | 无 | 1 组输入（ImageViewer_ScaleModelToString_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ScaleModel flow（调用序列） | 无 | 599 组输入（ImageViewer_ScaleModelFlow_0001~0599） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| simplestRotationQuarter（函数） | 无 | 175 组输入（ImageViewer_SimplestRotationQuarter_0001~0175） | 返回值与状态逐条符合预期 | 是 | 待执行 |
