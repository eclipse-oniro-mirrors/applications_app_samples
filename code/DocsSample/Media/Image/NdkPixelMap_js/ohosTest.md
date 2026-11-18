# NdkPixelMap_js测试用例归档

## 用例表

| 测试功能             | 预置条件                   | 输入             | 预期输出                 | 是否自动 | 测试结果 |
| -------------------- | -------------------------- | ---------------- | ------------------------ | -------- | -------- |
| 拉起应用             | 设备正常运行               |                  | 成功拉起应用             | 是       | Pass     |
| 获取权限功能         | 成功拉起应用               |                  | 成功获取权限             | 是       | Pass     |
| 图片解码功能         | 进入“图片解码”界面         |                  | 成功显示解码出来的图片   | 是       | Pass     |
| 图片变换功能         | 进入“图片变换”界面         | 点击IMAGE按钮    | 输出成功日志信息         | 是       | Pass     |
| 处理PixelMap数据功能 | 进入“处理PixelMap数据”界面 | 点击PixelMap按钮 | 成功显示处理后的图片信息 | 是       | Pass     |
| 图片编码功能         | 进入“图片编码”界面         | 点击图片编码按钮 | 成功将图片编码保存到文件 | 是       | Pass     |
| [Native 位图创建和资源解码](./entry/src/ohosTest/ets/test/Expansion.test.ets#L237) | 测试包 Native 库和 ImageKit 可用 | Native 固定创建参数、工程 rawfile JPEG | 输出尺寸、格式及像素可读，资源解码与参考首帧一致 | 是 | Pass（2/2） |
| [Native 信息读取和像素锁定](./entry/src/ohosTest/ets/test/Expansion.test.ets#L225) | 测试包 Native 库和 ImageKit 可用 | 不同尺寸、格式和透明度的位图，信息读取与成对锁定/解锁交错 | 元信息和像素在信息读取、锁定和解锁前后保持一致，不污染其他位图 | 是 | Pass（136/136） |
| [Native 位图变换](./entry/src/ohosTest/ets/test/Expansion.test.ets#L267) | 测试包 Native 库和 ImageKit 可用 | 不同大小及图案的可编辑位图，执行变换后读像素、再次锁定和编码 | 按预期获得可读可编码的 100×100 位图，遵守锁定及独立对象约定 | 是 | Pass（37/37） |
| [Native JPEG 文件输出](./entry/src/ohosTest/ets/test/Expansion.test.ets#L240) | 测试包 Native 库和 ImageKit 可用 | 图案位图、不同尺寸和 Alpha 类型；写入沙箱文件后重新读取 | 生成完整且可解码的 JPEG，源像素和其他位图不被改变 | 是 | Pass（22/22） |

运行范围：连接测试设备后，在 DevEco Studio 使用 **All Tests in 'test (entry)'**。[List.test.ets](./entry/src/ohosTest/ets/test/List.test.ets) 只运行 [Expansion.test.ets](./entry/src/ohosTest/ets/test/Expansion.test.ets) 注册的用例，对应表中带通过数的条目；其余条目仅作历史归档，不由此入口执行。2026-11-18 的 API 26 真机归档记录：197/197 通过，应用启动检查通过。

对比图片编码时使用独立像素副本，并保留源图的实际色彩空间及像素。
