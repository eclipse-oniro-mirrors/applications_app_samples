# 列表项交换案例 测试用例归档

## 用例表

| 测试功能                  | 预置条件               | 输入             | 预期输出              | 是否自动 |测试结果|
|-----------------------|--------------------|----------------|-------------------|------|--------------------------------|
| 拖动实现列表项之间的位置交换        | 成功拉起应用，进入案例页面 | 长按列表项，上下拖动     | 当前选中的列表项可以插入到目标位置 | 否    |Pass|
| 侧滑，显示删除按钮，点击删除按钮删除列表项 | 成功拉起应用，进入案例页面 | 列表项向左滑动，点击删除按钮 | 该列表项被删除           | 否    |Pass|

## 逻辑用例（数据驱动）

以下 2406 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| ListItemModifier.getInstance（静态方法） | 无 | 1 组输入（ListBeExchange_ListItemModifierGetInstance_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ListItemModifier（构造） | 无 | 1 组输入（ListBeExchange_ListItemModifierCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ListInfo（构造） | 无 | 1 组输入（ListBeExchange_ListInfoCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| CommonConstants（常量契约） | 无 | 3 组输入（ListBeExchange_CommonConstantsValues_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| OperationStatus（常量契约） | 无 | 5 组输入（ListBeExchange_OperationStatusValues_0001~0005） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| relativeOffsetOf（函数） | 无 | 250 组输入（ListBeExchange_RelativeOffsetOf_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| directionOf（函数） | 无 | 50 组输入（ListBeExchange_DirectionOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| curveInputOf（函数） | 无 | 120 组输入（ListBeExchange_CurveInputOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| shrinkScaleOf（函数） | 无 | 120 组输入（ListBeExchange_ShrinkScaleOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| neighbourScaleOf（函数） | 无 | 250 组输入（ListBeExchange_NeighbourScaleOf_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| passesSwapThreshold（函数） | 无 | 50 组输入（ListBeExchange_PassesSwapThreshold_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| canSwap（函数） | 无 | 50 组输入（ListBeExchange_CanSwap_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| swapTargetOf（函数） | 无 | 250 组输入（ListBeExchange_SwapTargetOf_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| offsetAfterSwapOf（函数） | 无 | 250 组输入（ListBeExchange_OffsetAfterSwapOf_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| refAfterSwapOf（函数） | 无 | 250 组输入（ListBeExchange_RefAfterSwapOf_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| reorder（函数） | 无 | 250 组输入（ListBeExchange_Reorder_0001~0250） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ExchangeItemState（构造） | 无 | 1 组输入（ListBeExchange_ExchangeItemStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new ListExchangeModel（构造） | 无 | 1 组输入（ListBeExchange_ListExchangeModelCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.initData（实例方法） | 无 | 8 组输入（ListBeExchange_ListExchangeModelInitData_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.longPress（实例方法） | 无 | 30 组输入（ListBeExchange_ListExchangeModelLongPress_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.move（实例方法） | 无 | 30 组输入（ListBeExchange_ListExchangeModelMove_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.drop（实例方法） | 无 | 30 组输入（ListBeExchange_ListExchangeModelDrop_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.changeItem（实例方法） | 无 | 30 组输入（ListBeExchange_ListExchangeModelChangeItem_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.deleteItem（实例方法） | 无 | 30 组输入（ListBeExchange_ListExchangeModelDeleteItem_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.addItem（实例方法） | 无 | 90 组输入（ListBeExchange_ListExchangeModelAddItem_0001~0090） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel.order（实例方法） | 无 | 1 组输入（ListBeExchange_ListExchangeModelOrder_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeModel flow（调用序列） | 无 | 249 组输入（ListBeExchange_ListExchangeModelFlow_0001~0249） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeBridge（常量契约） | 无 | 1 组输入（ListBeExchange_ListExchangeBridgeConstants_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| ListExchangeLogic（常量契约） | 无 | 4 组输入（ListBeExchange_ListExchangeLogicConstants_0001~0004） | 返回值与状态逐条符合预期 | 是 | 待执行 |
