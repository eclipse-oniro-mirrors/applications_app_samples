# 音频渲染功能测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|------|------|------|------|------|
| 拉起应用 | 设备正常运行 | - | 成功拉起应用，进入主页 | 是 |
| 初始化音频渲染器 | 位于主页 | 点击"Init" | 创建音频渲染对象成功，日志显示"Succeeded in creating audio renderer." | 是 |
| 开始播放 | 位于主页，已初始化 | 点击"Start Play" | 开始播放音频，日志显示"Succeeded in starting audio renderer." | 是 |
| 暂停播放 | 位于主页，正在播放 | 点击"Pause Play" | 暂停播放音频，日志显示"Succeeded in pausing audio renderer." | 是 |
| 停止播放 | 位于主页，正在播放或已暂停 | 点击"Stop Play" | 停止播放音频，日志显示"Succeeded in stopping audio renderer." | 是 |
| 释放资源 | 位于主页，已初始化 | 点击"Release" | 释放音频渲染器资源，日志显示"Succeeded in releasing audio renderer." | 是 |
| 获取音频流音量 | 位于主页，已初始化 | 点击"Get Stream Volume" | 获取并显示音频流音量信息 | 是 |
| 设置应用音量 | 位于主页，已初始化 | 点击"Set App Volume" | 设置应用音量成功，日志显示"Succeeded in setting app volume percentage." | 是 |
| 设置音频流音量 | 位于主页，已初始化 | 点击"Set Stream Volume" | 设置音频流音量成功，日志显示"Succeeded in setting volume." | 是 |
| 查询是否支持空间音频 | 位于主页 | 点击"Spatial Audio Supported" | 获取设备信息并显示 | 是 |
| 查询空间音频状态 | 位于主页 | 点击"Query Spatial Audio Status" | 查询并显示空间音频开关状态 | 是 |
| 订阅空间音频状态变化 | 位于主页 | 点击"Subscribe Status Event" | 订阅成功，日志显示"Succeeded in regist isSpatializationEnabledForCurrentDevice callback" | 是 |
| 取消订阅空间音频状态 | 位于主页，已订阅 | 点击"Unsubscribe" | 取消订阅成功，日志显示"Succeeded in unregist isSpatializationEnabledForCurrentDevice callback" | 是 |
| 查看播放状态 | 位于主页，已初始化 | 点击"Check Play State" | 查询并显示当前播放状态 | 是 |
| 获取所有流信息 | 位于主页，已初始化 | 点击"Get All Stream Info" | 获取并显示所有音频流信息 | 是 |
