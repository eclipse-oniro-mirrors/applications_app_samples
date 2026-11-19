## 使用ArkUI的FrameNode扩展实现动态布局类框架

案例测试用例

### 用例表

|   测试功能    |       预置条件       |   输入   |               预期输出                | 是否自动化 | 测试结果 |
|:---------:|:----------------:|:------:|:---------------------------------:|:-----:|:----:|
|  动态布局能力   |  启动案例sample   | 查看页面效果 | 页面显示正常，包含上方轮播图、TabBar、每日推荐和底部刷新按钮 |  No   | Pass |
| 动态布局能力 | 启动案例sample | 点击刷新按钮 |           影视图片变化，刷新按钮消失           |  No   | Pass |

## 逻辑用例（数据驱动）

以下 1587 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| new DslCss（构造） | 无 | 264 组输入（ImperativeDynamicLayouts_DslCssCtor_0001~0264） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| factoryKindOf（函数） | 无 | 30 组输入（ImperativeDynamicLayouts_FactoryKindOf_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| columnAlignOf（函数） | 无 | 50 组输入（ImperativeDynamicLayouts_ColumnAlignOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| appliesRowSpacing（函数） | 无 | 30 组输入（ImperativeDynamicLayouts_AppliesRowSpacing_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| typeAt（函数） | 无 | 8 组输入（ImperativeDynamicLayouts_TypeAt_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| contentAt（函数） | 无 | 8 组输入（ImperativeDynamicLayouts_ContentAt_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| childCountAt（函数） | 无 | 8 组输入（ImperativeDynamicLayouts_ChildCountAt_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| widthAt（函数） | 无 | 8 组输入（ImperativeDynamicLayouts_WidthAt_0001~0008） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| nodeCountOf（函数） | 无 | 50 组输入（ImperativeDynamicLayouts_NodeCountOf_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| treeDepth（函数） | 无 | 1 组输入（ImperativeDynamicLayouts_TreeDepth_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| textContents（函数） | 无 | 1 组输入（ImperativeDynamicLayouts_TextContents_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| carouselImages（函数） | 无 | 1 组输入（ImperativeDynamicLayouts_CarouselImages_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| carouselAfterRefresh（函数） | 无 | 1 组输入（ImperativeDynamicLayouts_CarouselAfterRefresh_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| hasRefreshNode（函数） | 无 | 50 组输入（ImperativeDynamicLayouts_HasRefreshNode_0001~0050） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| fontSizeOfText（函数） | 无 | 30 组输入（ImperativeDynamicLayouts_FontSizeOfText_0001~0030） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| new RefreshButtonState（构造） | 无 | 1 组输入（ImperativeDynamicLayouts_RefreshButtonStateCtor_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RefreshButtonState.click（实例方法） | 无 | 1 组输入（ImperativeDynamicLayouts_RefreshButtonStateClick_0001~0001） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RefreshButtonState.imageAt（实例方法） | 无 | 175 组输入（ImperativeDynamicLayouts_RefreshButtonStateImageAt_0001~0175） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| RefreshButtonState flow（调用序列） | 无 | 867 组输入（ImperativeDynamicLayouts_RefreshButtonStateFlow_0001~0867） | 返回值与状态逐条符合预期 | 是 | 待执行 |
| DynamicLayoutLogic（常量契约） | 无 | 3 组输入（ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0001~0003） | 返回值与状态逐条符合预期 | 是 | 待执行 |
