# rememberVariable测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @Builder内声明基础类型的状态变量 | 设备正常运行 | 点击Change message in builder | message内容追加! | 是 | Pass |
| @Builder内声明内置类型的状态变量 | 设备正常运行 | 点击Change messages in builder | messages追加Hello ArkTS | 是 | Pass |
| @Builder内声明interface字面量的状态变量 | 设备正常运行 | 点击Change name in builder | name内容追加! | 是 | Pass |
| @Builder内声明class类型的状态变量 | 设备正常运行 | 点击Change name in builder | name内容追加! | 是 | Pass |
| @Builder内声明状态变量并传递 | 设备正常运行 | 点击Change message in child builder | 子Builder中message追加! | 是 | Pass |
| 修改函数地址触发UI刷新 | 设备正常运行 | 点击Change function in builder | 显示文本在Hello World和Hello ArkTS间切换 | 是 | Pass |
| rememberVariable声明的状态变量不能同步数据 | 设备正常运行 | 点击Change source和Change message | Change source不刷新UI，Change message刷新UI | 是 | Pass |
