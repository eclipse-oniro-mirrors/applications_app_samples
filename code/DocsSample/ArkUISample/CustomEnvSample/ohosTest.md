# 组件扩展测试用例归档

 ## 用例表
 ### @CustomEnv用例

| 测试功能                                                                | 预置条件    | 输入                                                              | 预期输出                                        | 是否自动 | 测试结果 |
|---------------------------------------------------------------------|---------|-----------------------------------------------------------------|---------------------------------------------|:-----|------|
| 测试@CustomEnv用例-自定义key和value                                        | 设备正常运行 | 运行程序                                                            | 页面显示自定义的key和value                           | 是    | Pass |
| 测试@CustomEnv用例-支持多种数据类型（string、number、boolean、class）                  | 设备正常运行 | 运行程序                                                            | 页面显示正常，显示四种数据类型的值                           | 是    | Pass |
| 测试@CustomEnv用例-支持默认初始值                                             | 设备正常运行 | 运行程序                                                            | 页面显示默认初始值                                  | 是    | Pass |
| 测试@CustomEnv用例-遵循就近查找原则                                           | 设备正常运行 | 运行程序                                                            | 页面显示正常，内容显示为子组件最近的WithEnv的值                 | 是    | Pass |
| 测试@CustomEnv用例-响应式更新能力                                            | 设备正常运行 | 点击"update"按钮，更新.customEnv的值                                     | 页面显示正常，对应子组件的值同步更新                         | 是    | Pass |
| 测试@CustomEnv用例-支持与@Watch连用                                        | 设备正常运行 | 点击"update"按钮，更改被监听属性的值                                         | 页面显示正常，触发@Watch回调                           | 是    | Pass |
| 测试@CustomEnv用例-支持与@Monitor连用                                      | 设备正常运行 | 点击"change message"按钮，更改被监听属性的值                                  | 页面显示正常，触发@Monitor监听                         | 是    | Pass |
| 测试@CustomEnv用例-装饰Array类型变量                                        | 设备正常运行 | 点击"Push element"按钮，新增数组元素                                       | 页面显示正常，数组元素新增，UI刷新                         | 是    | Pass |
| 测试@CustomEnv用例-装饰Date类型变量                                         | 设备正常运行 | 点击"increase the year by 1"按钮，修改Date年份                            | 页面显示正常，DatePicker年份增加1                     | 是    | Pass |
| 测试@CustomEnv用例-装饰Map类型变量                                          | 设备正常运行 | 点击"Set entry cherry"按钮，新增Map键值对                                 | 页面显示正常，Map新增cherry条目，UI刷新                  | 是    | Pass |
| 测试@CustomEnv用例-装饰Set类型变量                                          | 设备正常运行 | 点击"Add element"按钮，新增Set元素                                       | 页面显示正常，Set新增元素，UI刷新                        | 是    | Pass |
| 测试@CustomEnv用例-@CustomEnv装饰的变量传递给V2只有@Param可以接收外部变量                | 设备正常运行 | 点击"update"按钮                                                    | 页面显示正常，子组件的值同步更新                           | 是    | Pass |
| 测试@CustomEnv用例-支持组件冻结                                              | 设备正常运行 | 点击"change message"按钮，TabContent中的冻结子组件接收环境变量变化                  | 页面显示正常，冻结组件的message同步更新                     | 是    | Pass |
| 测试@CustomEnv用例-@CustomEnv装饰的变量传递给V1时不能接收@ObservedV2装饰的class，需调用enableV2Compatibility | 设备正常运行 | 点击"update"按钮，@ObservedV2装饰的类通过enableV2Compatibility传递给V1的@ObjectLink | 页面显示正常，子组件的值同步更新                           | 是    | Pass |
| 测试@CustomEnv用例-当@CustomEnv装饰的变量类型被@Observed装饰时需要调用enableV2Compatibility   | 设备正常运行 | 运行程序                                                            | 页面显示正常，V2的@CustomEnv变量正确传递给V1的@Prop           | 是    | Pass |
| 测试@CustomEnv用例-支持@Watch监听二维数组内部变化                                   | 设备正常运行 | 点击"ss"按钮，修改二维数组内部元素的值                                          | 页面显示正常，触发@Watch回调用以监听二维数组内部变化                | 是    | Pass |