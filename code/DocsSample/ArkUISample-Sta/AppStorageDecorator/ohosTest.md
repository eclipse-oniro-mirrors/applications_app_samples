# AppStorage装饰器测试用例归档
    	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 从UI内部使用AppStorage和LocalStorage | 设备正常运行 | 点击按钮修改属性 | UI刷新显示新值 | 是 | Pass |
| @StoragePropRef获得数据源引用 | 设备正常运行 | 点击按钮修改属性 | UI刷新显示新值 | 是 | Pass |
| AppStorage支持联合类型 | 设备正常运行 | 点击文本改变类型 | UI刷新显示新值和类型 | 是 | Pass |
| 装饰Date类型变量 | 设备正常运行 | 点击按钮修改Date | UI刷新显示新Date内容 | 是 | Pass |
| 装饰Map类型变量 | 设备正常运行 | 点击按钮修改Map | UI刷新显示新Map内容 | 是 | Pass |
| 装饰Set类型变量 | 设备正常运行 | 点击按钮修改Set | UI刷新显示新Set内容 | 是 | Pass |
| 从UI中访问Environment参数 | 设备正常运行 | 查看页面 | 显示设备环境参数（languageCode、colorMode等） | 是 | Pass |