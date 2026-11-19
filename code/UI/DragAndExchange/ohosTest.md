## Grid和List内拖拽交换子组件位置案例测试用例

### 用例表

|               测试功能                |         预置条件          |           输入            |  预期输出  | 是否自动 | 测试结果 |
|:---------------------------------:|:---------------------:|:-----------------------:|:------:|:----:|:----:|
| 拖拽Grid中子组件，到目标Grid子组件位置，进行两者位置互换。 | 启动Grid和List内拖拽交换子组件位置 | 拖拽Grid中子组件，到目标Grid子组件位置 | 两者位置互换 |  是   | Pass |
| 拖拽List中子组件，到目标List子组件位置，进行两者位置互换。 | 启动Grid和List内拖拽交换子组件位置 | 拖拽List中子组件，到目标List子组件位置 | 两者位置互换 |  是   | Pass |

## 逻辑用例（数据驱动）

以下 2267 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new AppInfo（构造） | 无 | 1 组输入（DragAndExchange_AppInfoCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSource.totalCount（实例方法） | 无 | 1 组输入（DragAndExchange_DataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSource.getData（实例方法） | 无 | 30 组输入（DragAndExchange_DataSourceGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSource flow（调用序列） | 无 | 136 组输入（DragAndExchange_DataSourceFlow_0001~0136） | 返回值与状态逐条符合预期 | 是 | Pass |
| new DragParams（构造） | 无 | 1 组输入（DragAndExchange_DragParamsCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridAppNames（函数） | 无 | 120 组输入（DragAndExchange_GridAppNames_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| listItemNames（函数） | 无 | 120 组输入（DragAndExchange_ListItemNames_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridIconName（函数） | 无 | 120 组输入（DragAndExchange_GridIconName_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| listIconName（函数） | 无 | 120 组输入（DragAndExchange_ListIconName_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridRowOf（函数） | 无 | 100 组输入（DragAndExchange_GridRowOf_0001~0100） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridColumnOf（函数） | 无 | 120 组输入（DragAndExchange_GridColumnOf_0001~0120） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridIndexOf（函数） | 无 | 136 组输入（DragAndExchange_GridIndexOf_0001~0136） | 返回值与状态逐条符合预期 | 是 | Pass |
| isGridDropAccepted（函数） | 无 | 50 组输入（DragAndExchange_IsGridDropAccepted_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| isListDropAccepted（函数） | 无 | 50 组输入（DragAndExchange_IsListDropAccepted_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| swapNames（函数） | 无 | 136 组输入（DragAndExchange_SwapNames_0001~0136） | 返回值与状态逐条符合预期 | 是 | Pass |
| gridDropResult（函数） | 无 | 135 组输入（DragAndExchange_GridDropResult_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| listDropResult（函数） | 无 | 135 组输入（DragAndExchange_ListDropResult_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| parseDragParams（函数） | 无 | 30 组输入（DragAndExchange_ParseDragParams_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| dragParamsText（函数） | 无 | 135 组输入（DragAndExchange_DragParamsText_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel.totalCount（实例方法） | 无 | 1 组输入（DragAndExchange_DataSourceModelTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel.getData（实例方法） | 无 | 30 组输入（DragAndExchange_DataSourceModelGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel.listenerCount（实例方法） | 无 | 1 组输入（DragAndExchange_DataSourceModelListenerCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel.order（实例方法） | 无 | 1 组输入（DragAndExchange_DataSourceModelOrder_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel.events（实例方法） | 无 | 1 组输入（DragAndExchange_DataSourceModelEvents_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| DataSourceModel flow（调用序列） | 无 | 135 组输入（DragAndExchange_DataSourceModelFlow_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession.dragStart（实例方法） | 无 | 30 组输入（DragAndExchange_GridDragSessionDragStart_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession.drop（实例方法） | 无 | 50 组输入（DragAndExchange_GridDragSessionDrop_0001~0050） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession.movedName（实例方法） | 无 | 1 组输入（DragAndExchange_GridDragSessionMovedName_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession.order（实例方法） | 无 | 1 组输入（DragAndExchange_GridDragSessionOrder_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession.events（实例方法） | 无 | 1 组输入（DragAndExchange_GridDragSessionEvents_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| GridDragSession flow（调用序列） | 无 | 135 组输入（DragAndExchange_GridDragSessionFlow_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.dragStart（实例方法） | 无 | 30 组输入（DragAndExchange_ListDragSessionDragStart_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.drop（实例方法） | 无 | 30 组输入（DragAndExchange_ListDragSessionDrop_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.currentDragIndex（实例方法） | 无 | 1 组输入（DragAndExchange_ListDragSessionCurrentDragIndex_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.visibleCount（实例方法） | 无 | 1 组输入（DragAndExchange_ListDragSessionVisibleCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.order（实例方法） | 无 | 1 组输入（DragAndExchange_ListDragSessionOrder_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession.events（实例方法） | 无 | 1 组输入（DragAndExchange_ListDragSessionEvents_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| ListDragSession flow（调用序列） | 无 | 135 组输入（DragAndExchange_ListDragSessionFlow_0001~0135） | 返回值与状态逐条符合预期 | 是 | Pass |
| DragExchangeLogic（常量契约） | 无 | 5 组输入（DragAndExchange_DragExchangeLogicConstants_0001~0005） | 返回值与状态逐条符合预期 | 是 | Pass |
