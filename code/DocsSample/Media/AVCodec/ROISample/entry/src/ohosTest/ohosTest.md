# ROI视频编码直播功能 测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 |  | 成功拉起应用，显示主页 | 是 | Pass |
| 申请权限 | 成功拉起应用 |  | 弹出相机、麦克风、分布式文件权限提示框 | 是 | Pass |
| 主页显示ROI通路按钮 | 成功拉起应用 |  | 页面显示NativeBuffer元数据配置、参数回调配置、Buffer帧数据配置三个按钮 | 是 | Pass |
| 选择NativeBuffer元数据配置通路 | 位于主页 | 点击NativeBuffer元数据配置按钮 | selectedRoiPathType为0，显示确认对话框 | 是 | Pass |
| 选择参数回调配置通路 | 位于主页 | 点击参数回调配置按钮 | selectedRoiPathType为1，显示确认对话框 | 是 | Pass |
| 选择Buffer帧数据配置通路 | 位于主页 | 点击Buffer帧数据配置按钮 | selectedRoiPathType为2，显示确认对话框 | 是 | Pass |
| 确认保存录制文件 | 位于确认对话框 | 点击确认按钮 | 创建mp4文件和roi日志文件，跳转直播页面 | 否 | Pass |
| 直播页面渲染 | 位于直播页面 |  | XComponent加载，相机预览画面正常显示 | 否 | Pass |
| ROI路径类型枚举验证 |  |  | ROI_PATH_NATIVEBUFFER=0, ROI_PATH_METADATA_CALLBACK=1, ROI_PATH_BUFFER_MODE=2 | 是 | Pass |
| CommonConstants常量验证 |  |  | KEY_PREFIX='live_stream', DEFAULT_WIDTH=1920, DEFAULT_HEIGHT=1080 | 是 | Pass |
| DateTimeUtil零填充验证 |  | fill(5) | 返回'05' | 是 | Pass |
| DateTimeUtil日期拼接验证 |  | concatDate(2026, 1, 9) | 返回'20260109' | 是 | Pass |
| DateTimeUtil时间拼接验证 |  | concatTime(8, 5, 3) | 返回'080503' | 是 | Pass |
| 视频分辨率常量验证 |  |  | VIDEO_WIDTH_4K=3840, VIDEO_HEIGHT_4K=2160 | 是 | Pass |
| 视频码率常量验证 |  |  | BITRATE_VIDEO_3M=3145728 | 是 | Pass |
| 帧率常量验证 |  |  | FRAMERATE_VIDEO_30FPS=30, FRAMERATE_VIDEO_60FPS=60 | 是 | Pass |
| Recorder模块接口存在性验证 |  |  | librecorder.so模块包含initNative、startNative接口 | 是 | Pass |
| Player模块接口存在性验证 |  |  | libplayer.so模块包含initNative、startNative接口 | 是 | Pass |
