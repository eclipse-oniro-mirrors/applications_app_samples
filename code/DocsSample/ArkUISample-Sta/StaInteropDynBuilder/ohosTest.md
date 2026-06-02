# @Builder跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Builder按引用传递示例 | 设备正常运行 | 点击按钮changeName | name文本末尾追加字符'a'，UI刷新 | 否 | Pass |
| @Builder按引用传递示例 | 设备正常运行 | 点击按钮changeAge | age数值加1，UI刷新 | 否 | Pass |
| @Builder按值传递示例 | 设备正常运行 | 进入StaBuilderValue页面 | 页面正常显示ArkTS-Dyn @Builder传入的Hello World!文本 | 否 | Pass |
