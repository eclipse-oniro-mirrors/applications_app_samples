# PixelMap测试用例归档

## 用例表

| 测试功能         | 预置条件           | 输入                 | 预期输出                     | 是否自动 | 测试结果 |
| ---------------- | ------------------ | -------------------- | ---------------------------- | -------- | -------- |
| 拉起应用         | 设备正常运行       |                      | 成功拉起应用                 | 是       | Pass     |
| 裁剪功能         | 进入“剪切”界面     | 点击裁剪按钮         | 成功裁剪图片                 | 是       | Pass     |
| 缩放功能         | 进入“剪切”界面     | 点击缩放按钮         | 成功缩放图片                 | 是       | Pass     |
| 移动功能         | 进入“剪切”界面     | 点击移动按钮         | 成功移动图片                 | 是       | Pass     |
| 顺时针旋转功能   | 进入“翻转”界面     | 点击旋转按钮         | 成功顺时针旋转图片           | 是       | Pass     |
| 垂直翻转功能     | 进入“翻转”界面     | 点击垂直翻转按钮     | 成功垂直翻转图片             | 是       | Pass     |
| 水平翻转功能     | 进入“翻转”界面     | 点击水平翻转按钮     | 成功水平翻转图片             | 是       | Pass     |
| 位图操作功能     | 进入“调色”界面     | 点击位图操作按钮     | 成功改变部分位图像素         | 是       | Pass     |
| 位图操作全部功能 | 进入“调色”界面     | 点击位图操作全部按钮 | 成功改变全部位图像素         | 是       | Pass     |
| 设置透明度功能   | 进入“调色”界面     | 点击设置透明度按钮   | 成功改变图片透明度           | 是       | Pass     |
| 保存图片功能     | 进入“文件操作”界面 | 点击保存图片按钮     | 成功保存图片                 | 是       | Pass     |
| 打开图片功能     | 进入“文件操作”界面 | 点击打开图片按钮     | 成功打开图片                 | 是       | Pass     |
| 编辑EXIF信息功能 | 进入“文件操作”界面 | 点击编辑EXIF信息按钮 | 成功读取并编辑图片的EXIF信息 | 是       | Pass     |
| [图像来源与资源读取](./entry/src/ohosTest/ets/test/Expansion.test.ets#L732) | ImageKit、测试模块资源和沙箱可用 | 沙箱路径、文件描述符、rawfile、特殊名称及缺失资源 | 读取真实资源；成功时像素和尺寸与参考一致，失败时错误与 SDK 参考一致 | 是 | Pass（40/40） |
| [图像解码及像素比对](./entry/src/ohosTest/ets/test/Expansion.test.ets#L381) | ImageKit、测试模块资源和沙箱可用 | PNG/JPEG、固定资源、指定格式与 AUTO 参数 | 尺寸、像素与独立 SDK 参考一致；指定格式分支校验可编辑性 | 是 | Pass（24/24） |
| [JPEG 编码和重复输出](./entry/src/ohosTest/ets/test/Expansion.test.ets#L543) | ImageKit、测试模块资源和沙箱可用 | ImageSource/PixelMap 输入，流与文件接口；按用例切换打包选项 | 输出为可重新解码的完整 JPEG，与独立 SDK 结果比对，重复写入不读取旧结果 | 是 | Pass（60/60） |
| [显示相关尺寸换算](./entry/src/ohosTest/ets/test/Expansion.test.ets#L441) | ImageKit、测试模块资源和沙箱可用 | 稳定的实际默认显示设备，正常及边界目标宽度 | 各缩放接口与预期换算结果一致 | 是 | Pass（34/34） |
| [EXIF 属性读写](./entry/src/ohosTest/ets/test/Expansion.test.ets#L723) | ImageKit、测试模块资源和沙箱可用 | 新建 JPEG、文件描述符和指定 EXIF 字段 | 属性初始值、写入后回读及修改后的状态符合预期 | 是 | Pass（3/3） |
| [来源、解码和编码组合](./entry/src/ohosTest/ets/test/Expansion.test.ets#L864) | ImageKit、测试模块资源和沙箱可用 | 不同图片大小、图案、来源和连续编码组合 | 逐步校验像素与尺寸，前一次调用不污染后续结果或源图 | 是 | Pass（192/192） |

运行范围：连接测试设备后，在 DevEco Studio 使用 **All Tests in 'test (entry)'**。[List.test.ets](./entry/src/ohosTest/ets/test/List.test.ets) 只运行 [Expansion.test.ets](./entry/src/ohosTest/ets/test/Expansion.test.ets) 注册的用例，对应表中带通过数的条目；其余条目仅作历史归档，不由此入口执行。2026-11-18 的 API 26 真机归档记录：353/353 通过，应用启动检查通过。

既有真机回归中，设备未能分配 HDR 输出缓冲区，HDR 正向输出不在该次回归范围内。`EXP_PM_HDR_DECODE_001` 仅验证指定格式解码，不验证 HDR 输出。
