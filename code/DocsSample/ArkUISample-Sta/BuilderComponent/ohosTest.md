# @Builder装饰器测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 私有自定义构建函数 | 设备正常运行 | 进入页面 | 显示Hello World和Hello @Builder文字 | 是 | Pass |
| 全局自定义构建函数 | 设备正常运行 | 进入页面 | 显示Hello World文字 | 是 | Pass |
| 按引用传递参数（makeBinding） | 设备正常运行 | 进入页面 | 显示number1和number2数值 | 是 | Pass |
| 引用传递参数 | 设备正常运行 | 点击Click me | 文本从Hello变为ArkUI | 是 | Pass |
| 值传递参数 | 设备正常运行 | 进入页面 | 显示Hello文字 | 是 | Pass |
| 自定义组件中使用@Builder | 设备正常运行 | 进入页面 | 显示Hello文字，2秒后变为Hello World | 是 | Pass |
| 全局@Builder使用场景 | 设备正常运行 | 点击按钮 | 各参数值更新显示 | 是 | Pass |
| 装饰器变量触发UI刷新 | 设备正常运行 | 点击按钮 | str_value和label值更新 | 是 | Pass |
| @Builder作为CustomBuilder类型 | 设备正常运行 | 进入页面 | 显示列表项 | 是 | Pass |
| 嵌套@Builder函数 | 设备正常运行 | 点击Click me | 各层级文本从Hello变为ArkUI | 是 | Pass |
| @Builder与V2装饰器联合使用 | 设备正常运行 | 点击按钮 | info1和info2的name和age更新为Cat和18 | 是 | Pass |
| @Builder与@Local联合使用 | 设备正常运行 | 点击按钮 | info2值更新，info1不刷新 | 是 | Pass |
| 跨组件复用@Builder | 设备正常运行 | 点击Click me | 切换显示不同的子组件 | 是 | Pass |
| 使用变量封装@Builder | 设备正常运行 | 进入页面 | 显示Hello world文字 | 是 | Pass |
| @Builder泛型 | 设备正常运行 | 进入页面 | 显示Hello genericBuilderFunc文字 | 是 | Pass |
| @Builder状态刷新 | 设备正常运行 | 点击按钮 | number1和number2值更新 | 是 | Pass |
| 单参数@Builder | 设备正常运行 | 点击按钮 | str_value和num值更新 | 是 | Pass |
| @ComponentV2中@Builder刷新 | 设备正常运行 | 进入页面 | builderParams值自动递增 | 是 | Pass |
| 正确修改@Builder参数 | 设备正常运行 | 点击click me | 文本从Hello变为ArkUI | 是 | Pass |
| 自定义组件拆分参数 | 设备正常运行 | 点击Click me | 张三变为李四，18变为20 | 是 | Pass |
| MutableBinding参数无SetterCallback | 设备正常运行 | 点击按钮 | strValue和num值正确更新 | 是 | Pass |
| 正确修改变量值 | 设备正常运行 | 点击按钮 | 参数值正确修改并更新UI | 是 | Pass |
| @Watch中不调用@Builder | 设备正常运行 | 点击按钮 | content值正确更新并显示 | 是 | Pass |
