# RenderingControl 测试用例归档

## 用例表

| 测试功能            | 预置条件       | 输入                                    | 预期输出     | 是否自动 | 测试结果 |
| ------------------- | -------------- |---------------------------------------|----------| :------- | -------- |
| RenderingControl示例代码验证    | 设备正常运行   | 进入首页，查看对应页面渲染情况                   | 渲染显示正常 | 是       | Pass     |
| 测试ForEach键值生成功能 | 设备正常运行 | 进入首页，展开'RenderingForeach'分组，点击'ForeachKeyGeneration'页面 | 列表正常渲染，显示one、two、three三个文本项 | 是       | Pass     |
| 测试Repeat键值生成功能 | 设备正常运行 | 进入首页，展开'RenderingRepeat'分组，点击'RepeatKeyGeneration'页面 | 列表正常渲染，显示20条data数据项 | 是       | Pass     |
| 测试ForEach迁移Repeat后子属性变化观测 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'ForEachToRepeatChildProperties'页面，点击文章项的点赞图标 | 点赞图标切换，点赞数相应增加或减少 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后的数据更新操作 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatDataUpdate'页面，依次点击'Add new item'、'Delete item 0'、'Swap item 0 and item 1'、'Change item 0'、'Change all items'按钮 | 列表数据相应地新增、删除、交换、修改，渲染正常 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后修改数据子属性 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatChildProperties'页面，点击列表项 | 列表项文本追加'0'，UI正常刷新 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后观测组件内部状态 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatInternalState'页面，分别点击列表项的文本和子组件文本 | @Trace和@Local修饰的变量变化后对应文本正常刷新 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后接收外部输入 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatExternalInput'页面，点击列表项 | 子组件接收外部输入数据并正常显示刷新 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后拖拽排序 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatDragSort'页面，长按列表项拖拽至目标位置 | 列表项位置随拖拽调整，排序正常 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后使用Repeat自身复用能力 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatReuseSelf'页面，上下滑动列表 | 列表项复用正常，滑动渲染流畅 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后使用@ReusableV2实现组件复用 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatReuseV2'页面，上下滑动列表 | 组件复用回调正常触发，渲染显示正常 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后使用Repeat自身模板渲染 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatTemplateSelf'页面，上下滑动列表 | 不同类型数据项按模板A/B渲染，显示正常 | 是       | Pass     |
| 测试LazyForEach迁移Repeat后开发者自定义模板渲染 | 设备正常运行 | 进入首页，展开'RepeatMigration'分组，点击'LazyForEachToRepeatTemplateCustom'页面，上下滑动列表 | 不同类型数据项按对应模板A/B渲染，显示正常 | 是       | Pass     |