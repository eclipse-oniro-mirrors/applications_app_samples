# ImageEffect测试用例归档

## 用例表

| 测试功能               | 预置条件         | 输入                                                         | 预期输出                       | 是否自动 | 测试结果 |
|--------------------| ---------------- | ------------------------------------------------------------ | ------------------------------ | -------- | -------- |
| 拉起应用               | 设备正常运行     |                                                              | 成功拉起应用                   | 是       | Pass     |
| 申请相机权限 | 进入主界面 | 点击允许按钮 | 成功获取相机权限 | 是 | Pass |
| 关闭参数设置页面           | 进入参数设置页面 | 点击dialog取消按钮                                           | 成功关闭参数设置页面           | 是       | Pass     |
| 亮度滤镜功能             | 进入参数设置页面 | 点击Brightness按钮，滑动Brightness滑动条，点击确认与Apply按钮 | 成功调节图片亮度               | 是       | Pass     |
| 对比度滤镜功能            | 进入参数设置页面 | 点击Contrast按钮，滑动Contrast滑动条，点击确认与Apply按钮    | 成功调节图片对比度             | 是       | Pass     |
| 裁剪滤镜功能             | 进入参数设置页面 | 点击Crop按钮，滑动Crop滑动条，点击确认与Apply按钮            | 成功裁剪图片大小               | 是       | Pass     |
| 自定义亮度滤镜功能          | 进入参数设置页面 | 点击CustomBright按钮，滑动CustomBright滑动条，点击确认与Apply按钮        | CustomBright滤镜效果应用成功         | 是       | Pass     |
| 自定义裁剪滤镜功能          | 进入参数设置页面 | 点击CustomCrop按钮，滑动CustomCrop滑动条，点击确认与Apply按钮        | CustomCrop滤镜效果应用成功         | 是       | Pass     |
| 重置滤镜功能             | 进入主界面       | 点击Reset按钮                                                | 图像效果成功复原               | 是       | Pass     |
| 查询Brightness滤镜信息   | 进入参数设置页面 | 点击Brightness滑动条旁的查询按钮                             | 显示Brightness滤镜信息         | 是       | Pass     |
| 查询Contrast滤镜信息     | 进入参数设置页面 | 点击Contrast滑动条旁的查询按钮                               | 显示Contrast滤镜信息           | 是       | Pass     |
| 查询Crop滤镜信息         | 进入参数设置页面 | 点击Crop滑动条旁的查询按钮                                   | 显示Crop滤镜信息               | 是       | Pass     |
| 查询CustomBright滤镜信息 | 进入参数设置页面 | 点击CustomBright滑动条旁的查询按钮                                 | 显示CustomBright滤镜信息             | 是       | Pass     |
| 查询CustomCrop滤镜信息   | 进入参数设置页面 | 点击CustomCrop滑动条旁的查询按钮                                 | 显示CustomCrop滤镜信息             | 是       | Pass     |
| 根据编码格式查询滤镜信息       | 进入参数设置页面 | 点击查询按钮，点击编码格式                                   | 显示对应编码格式支持的滤镜信息 | 是       | Pass     |
| 测试NativeBuffer输入场景 | 进入参数设置页面 | 切换输入场景为NativeBuffer，点击确认与Apply按钮 | 在NativeBuffer场景下成功应用滤镜链 | 是 | Pass |
| 测试URI输入场景 | 进入参数设置页面 | 切换输入场景为URI，点击确认与Apply按钮 | 在URI场景下成功应用滤镜链 | 是 | Pass |
| 测试NativeWindow输入场景 | 进入参数设置页面 | 切换输入场景为NativeWindow，点击确认与Apply按钮 | 在NativeWindow场景下成功应用滤镜链 | 是 | Pass |
| [亮度、对比度和自定义亮度](./entry/src/ohosTest/ets/test/Expansion.test.ets#L467) | 测试包 Native 滤镜库、测试资源和沙箱可用 | 真实图片输入与强度边界、不同图案和小数强度 | 滤镜输出完整有效，像素值、方向或饱和边界符合独立预期 | 是 | Pass（228/228） |
| [滤镜链顺序](./entry/src/ohosTest/ets/test/Expansion.test.ets#L497) | 测试包 Native 滤镜库、测试资源和沙箱可用 | 多段滤镜、交换顺序、含裁剪或饱和的链 | 像素和尺寸与按原顺序计算的参考一致，能区分顺序敏感的输出 | 是 | Pass（41/41） |
| [内置和自定义裁剪](./entry/src/ohosTest/ets/test/Expansion.test.ets#L521) | 测试包 Native 滤镜库、测试资源和沙箱可用 | 不同尺寸和行带图案、多个裁剪比例和 ROI 边界 | ROI、裁剪形状及对应像素符合预期 | 是 | Pass（76/76） |
| [滤镜输入路径与未初始化滤镜实例的边界](./entry/src/ohosTest/ets/test/Expansion.test.ets#L428) | 测试包 Native 滤镜库、测试资源和沙箱可用 | NativeBuffer、URI 资源，以及在新进程未初始化滤镜实例时调用启动和停止 | 支持的输入产生预期结果，实例未初始化时启动和停止均返回 false | 是 | Pass（22/22） |
| [滤镜列表和信息](./entry/src/ohosTest/ets/test/Expansion.test.ets#L599) | 测试包 Native 滤镜库、测试资源和沙箱可用 | 按像素格式查询可用滤镜，并按名称查询参数 | 内置、自定义滤镜及返回信息符合注册定义 | 是 | Pass（8/8） |
| [图像工具与解码](./entry/src/ohosTest/ets/test/Expansion.test.ets#L608) | 测试包 Native 滤镜库、测试资源和沙箱可用 | 读取文件、资源等输入，检查工具对象和解码结果 | 实例行为、输出尺寸和像素符合资源及参考结果 | 是 | Pass（25/25） |

运行范围：连接测试设备后，在 DevEco Studio 使用 **All Tests in 'test (entry)'**。[List.test.ets](./entry/src/ohosTest/ets/test/List.test.ets) 只运行 [Expansion.test.ets](./entry/src/ohosTest/ets/test/Expansion.test.ets) 注册的用例，对应表中带通过数的条目；其余条目仅作历史归档，不由此入口执行。2026-11-18 的 API 26 真机归档记录：400/400 通过，应用启动检查通过。
