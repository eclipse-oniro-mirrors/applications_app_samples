## 沉浸式适配

案例测试用例

### 用例表

|                     测试功能                      |       预置条件       |     输入      |        预期输出         | 是否自动化 | 测试结果 |
|:---------------------------------------------:|:----------------:|:-----------:|:-------------------:|:-----:|:----:|
|                  Web页面沉浸式效果                   |  启动沉浸式案例sample   | 点击首页的Banner | 进入Web页面展示Web页面沉浸式效果 |  No   | Pass |
|                   滚动场景沉浸式效果                   | 启动沉浸式案例sample |   滑动商品列表    |     展示滚动场景沉浸式效果     |  No   | Pass |
|                   普通页面沉浸式效果                   | 启动沉浸式案例sample |   点击商品列表项   |   进入商品详情页，展示沉浸式效果   |  No   | Pass |
|                    弹框沉浸式效果                    | 启动沉浸式案例sample |  点击商品评论字样   |  弹出评论弹框展示底部弹框沉浸式效果  |  No   | Pass |

## 逻辑用例（数据驱动）

以下 2053 条用例位于 `entry/src/ohosTest/ets/test/logic`，每条用例记录 begin/end 日志，断言前打印入参与实际值；
期望值由被测逻辑在对应输入下的确定性结果给出，覆盖典型值、边界值与非法值。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------- | -------- | ---- | -------- | -------- | -------- |
| Constants（常量契约） | 无 | 22 组输入（Immersive_ConstantsValues_0001~0022） | 返回值与状态逐条符合预期 | 是 | Pass |
| CommentDataSource.totalCount（实例方法） | 无 | 1 组输入（Immersive_CommentDataSourceTotalCount_0001~0001） | 返回值与状态逐条符合预期 | 是 | Pass |
| CommentDataSource.getData（实例方法） | 无 | 30 组输入（Immersive_CommentDataSourceGetData_0001~0030） | 返回值与状态逐条符合预期 | 是 | Pass |
| CommentDataSource flow（调用序列） | 无 | 2000 组输入（Immersive_CommentDataSourceFlow_0001~2000） | 返回值与状态逐条符合预期 | 是 | Pass |
