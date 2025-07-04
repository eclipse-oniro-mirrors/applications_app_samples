# AVCodecSample测试用例归档

### 用例表

| 测试功能                   | 预置条件                                     | 输入                      | 预期输出                                                                    | 是否自动 | 测试结果 |
|:-----------------------|:-----------------------------------------|:------------------------|:------------------------------------------------------------------------|:-----|:-----|
| 首次拉起应用                 | 设备正常运行                                   | 无                       | 弹出相机权限申请                                                                | 是    | Pass |
| 主页从上往下第一个 设置 按钮点击      | 位于主页                                     | 点击第一个设置按钮               | 弹出滑动选择器弹窗                                                               | 否    | Pass |
| 第一个设置触发的滑动选择器弹窗        | 位于主页，已点击第一个设置按钮                          | 滑动选择参数后点击确定             | 主页弹出"成功"文字弹窗                                                            | 否    | Pass |
| 播放按钮点击                 | 位于主页                                     | 点击播放按钮                  | 弹出滑动选择器弹窗                                                               | 否    | Pass |
| 播放按钮触发的滑动选择器弹窗         | 位于主页，已点击播放按钮                             | 滑动选择参数后点击确定             | 根据用户的选择，弹出对应的文件选择模块                                                     | 否    | Pass |   
| 图库视频Picker             | 位于主页，点击主页播放后，选择“从图库选取”后，点击确定             | 选取一个视频后，勾选原图后，点击完成      | 主页开始播放用户选取的视频/视频含音频，播放按钮文字变为“播放中”，同时主页“倍速”按钮变为可点击状态，主页其余按钮变为不可点击状态      | 否    | Pass |
| 图库视频Picker             | 位于主页，点击主页播放后，选择“从图库选取”后，点击确定             | 不选取视频，直接返回              | 主页弹出“未选择视频！”文字弹窗                                                        | 否    | Pass |
| 文件管理FilePicker         | 位于主页，点击主页播放后，选择“从文件管理选取”后，点击确定           | 选取一个视频或音频文件后，勾选原图后，点击完成 | 主页开始播放用户选取的视频/视频含音频/音频，播放按钮文字变为“播放中”，同时主页“倍速”按钮变为可点击状态，主页其余按钮变为不可点击状态   | 否    | Pass |
| 文件管理FilePicker         | 位于主页，点击主页播放后，选择“从文件管理选取”后，点击确定           | 不选取视频，直接返回              | 主页弹出“未选择视频！”文字弹窗                                                        | 否    | Pass |
| 播放画面自动裁剪               | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后            | 无                       | 横竖屏视频，保持视频原有的宽高比例，缩放至其中一边碰到手机任意侧边                                       | 是    | Pass |
| 倍速播放按钮触发倍速播放           | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后            | 点击倍速按钮                  | 主页弹出“播放时长按播放窗口也可倍速播放”文字弹窗，和速度选择器弹窗                                      | 否    | Pass |
| 倍速播放速度选择器弹窗            | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后，点击倍速按钮后    | 滑动选择参数后点击确定             | 用户选择了什么参数，主页就弹出对应的文字弹窗，比如，用户选择了“X3”并点击确定后，主页就会弹出“X3”文字弹窗，同时播放速度也变成对应的倍速 | 否    | Pass |
| 播放中长按播放窗口触发倍速播放        | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后            | 长按播放窗口                  | 主页闪烁文字弹窗“X2”，播放速度变为两倍                                                   | 否    | Pass |
| 播放中松开长按播放窗口的手指后，恢复原速播放 | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后，长按播放窗口时    | 松开手指                    | 主页弹出文字弹窗“X1”，播放速度变为原速                                                   | 否    | Pass |
| 播放结束                   | 位于主页，点击主页播放后，选择文件后，点击确定，开始播放后，播放结束后      | 无                       | 主页倍速按钮变为不可点击状态，其余按钮变为可点击状态，主页播放窗口保留视频最后一帧画面，播放按钮文字由“播放中”变回“播放”          | 是    | Pass |
| 主页从上往下第二个 设置 按钮点击      | 位于主页                                     | 点击第二个设置按钮               | 弹出滑动选择器弹窗                                                               | 否    | Pass |
| 第二个设置触发的滑动选择器弹窗        | 已允许应用访问相机权限申请，位于主页，已点击第二个设置按钮            | 滑动选择参数后点击确定             | 若设备支持应用使用此参数的相机，会弹出“成功”的文字弹窗；若不支持，则弹出“本设备相机不支持此类型录像流，将切换至默认配置”          | 否    | Pass |
| 第二个设置触发的滑动选择器弹窗        | 已允许应用访问相机权限申请，位于主页，已点击第二个设置按钮            | 滑动选择参数后点击确定             | 若设备支持应用使用此参数的相机，会弹出“成功”的文字弹窗；若不支持，则弹出“本设备相机不支持此类型录像流，将切换至默认配置”          | 否    | Pass |
| 录制按钮点击                 | 已允许应用访问相机权限申请，位于主页                       | 点击录制按钮                  | 弹出“视频保存位置确认”弹窗                                                          | 否    | Pass |
| 首次视频保存位置确认弹窗           | 已允许应用访问相机权限申请，位于主页，已点击录制按钮               | 点击保存按钮                  | 弹出安全保存图片和视频弹窗                                                           | 否    | Pass |
| 安全保存图片和视频弹窗            | 已允许应用访问相机权限申请，位于主页，已点击录制按钮，已点击视频保存位置确认弹窗 | 点击允许按钮                  | 点击允许后，跳转页面至录像页面，录像页面预览正常正常，同时弹出“成功”文字弹窗                                 | 否    | Pass |
| 视频保存位置确认弹窗             | 已允许应用访问相机权限申请，位于主页，已点击录制按钮               | 点击保存按钮                  | 点击允许后，跳转页面至录像页面，录像页面预览正常正常，同时弹出“成功”文字弹窗                                 | 否    | Pass |
| 开始录制按钮点击               | 已允许应用访问相机权限申请，位于录制页面                     | 点击开始录制                  | 点击开始录制后，按钮文字变成“停止录制”，按钮状态变成不可点击状态，1.3秒后，按钮状态变回可点击状态；同时页面上方出现计时器，计时器开始记时 | 否    | Pass |
| 停止录制按钮点击               | 已允许应用访问相机权限申请，位于录制页面，已点击开始录制             | 点击停止录制                  | 点击停止录制后，页面跳转回主页，图库中出现录制的视频                                              | 否    | Pass |
| 相机缩放                   | 已允许应用访问相机权限申请，位于录制页面                     | 双指捏合放大                  | 预览画面随着双指捏合放大，同步缩放                                                       | 否    | Pass |