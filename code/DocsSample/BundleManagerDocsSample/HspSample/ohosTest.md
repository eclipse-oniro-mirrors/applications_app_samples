# HspSample 测试说明

## 自动化测试概览

当前 ohosTest 共 **460 条用例**，测试代码 **10,846 行**：

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `HspResourceResolutionTest` | 8 | HSP 模块上下文下的字符串、图片、媒体与 Drawable 资源真实解析 |
| `HspNativeNumericEdgeTest` | 8 | native 乘法的分数、极值、Infinity 与 NaN 边界 |
| `HspArithmeticNumericEdgeTest` | 8 | 算术接口的浮点误差、安全整数、溢出与特殊值边界 |
| `HspUiPageTest` | 4 | 首页元素、HSP 子页文案、返回入口与结果状态切换 |
| `ActsAbilityTest` | 7 | 首页 UI、HSP 资源、native 方法、路由跳转与返回 |
| `HspArithmeticMatrixTest` | 60 | `add` / `minus` 算术矩阵 |
| `HspNativeMethodMatrixTest` | 30 | `nativeMulti` native 方法矩阵 |
| `HspResourceContractTest` | 10 | `ResManager` 图片和描述资源契约 |
| `HspLibraryApiTest` | 20 | HSP 导出接口组合与类型校验 |
| `HspArithmeticExtraTest` | 40 | 算术边界补充 |
| `HspNativeExtraTest` | 20 | native 方法补充 |
| `HspResourceExtraTest` | 10 | HSP 资源补充 |
| `HspLibraryEdgeTest` | 3 | 接口组合边界 |
| `HspArithmeticExtra2Test` | 25 | 算术结合律补充 |
| `HspNativeExtra2Test` | 15 | native 乘法补充 |
| `HspResourceExtra2Test` | 10 | 资源对象补充 |
| `HspArithmeticExtra3Test` | 25 | 算术矩阵最终补充 |
| `HspNativeExtra3Test` | 15 | native 乘法最终补充 |
| `HspResourceExtra3Test` | 10 | 资源契约最终补充 |
| `HspNumericResidualTest` | 10 | 非数、负零、下溢、上溢和安全整数边界 |
| `HspLogResidualTest` | 6 | 日志空串、Unicode、长文本和导出函数类型 |
| `HspBulkNumericResidualTest` | 46 | 算术与 native 乘法批量数值组合 |
| `HspBulkNumericResidual2Test` | 70 | 算术与 native 乘法批量数值补充 |

质量门禁：

- 用例名统一 `testHspXxxNNNN`；
- `@tc.number`、`@tc.name`、`@tc.desc`、`@tc.type`、`@tc.size`、`@tc.level` 全量存在；
- 用例名和编号全局唯一；
- 每条用例至少 3 个断言；
- 全量执行结果：**460/460 通过**（需先拉起应用，连续两轮 `Failure: 0`）。

## 手工用例表

| 测试功能                 | 预置条件     | 输入                                                            | 预期输出                                                   |是否自动|测试结果|
|----------------------|----------|---------------------------------------------------------------|--------------------------------------------------------|--------------------------------|--------------------------------|
| 验证引用HSP的ArkUI组件及图片资源功能 | 	设备正常运行  | 拉起应用 | 页面正确显示ArkUI组件，组件内容为library，且正常显示HSP的图片信息 |是|Pass|
| 验证引用HSP的ts类和方法功能     | 位于主页     | 点击'引用HSP的ts类和方法'按钮                                    | 页面显示字段为result: 3                            |是|Pass|
| 验证引用HSP导出的native方法功能 | 位于主页     | 点击'引用HSP导出的native方法'按钮                       | 页面显示字段为result: 12                           |是|Pass|
| 验证正确访问HSP中的资源功能      | 位于主页     | 点击'访问HSP中的资源'按钮                                 | 跳转至HSP中Index页面，Index页面正确访问HSP中的资源，显示内容为example.png的图片信息 |是|Pass|
| 验证引用HSP中的资源功能        | 	位于主页    | 点击'引用HSP中的资源'按钮                                 | 页面显示字段为getStringValue is shared             |是|Pass|
| 验证引用HSP的路由跳转功能及路由返回功能 | 位于主页     | 1.点击'页面路由跳转'按钮<br/>2.点击'router to HSP page'按钮<br/>3.页面跳转后点击'back to HSP page'按钮| 跳转至新页面，页面显示内容为：The page is menu<br/>2-1.跳转至新页面<br/>3-1.返回menu页面 |是|Pass|
| 验证引用HSP的路由返回功能       | 位于主页 | 1.点击'页面路由返回'按钮<br/>2.页面跳转后点击'back to HAP page'按钮             | 1-1.跳转至新页面<br/>2-1.返回主页面    |是|Pass|