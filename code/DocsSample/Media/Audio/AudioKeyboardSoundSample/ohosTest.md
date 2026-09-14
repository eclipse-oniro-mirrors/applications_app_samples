# 按键音打断音视频测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|---------|---------|------|---------|---------|
| MUSIC 流类型创建验证 | AudioRenderer 已初始化 | createAudioRenderer with STREAM_USAGE_MUSIC | renderer 不为 null | 是 |
| NOTIFICATION 流类型创建验证 | AudioRenderer 已初始化 | createAudioRenderer with STREAM_USAGE_NOTIFICATION | renderer 不为 null | 是 |
| MIX 策略激活验证 | AudioSessionManager 已获取 | setIndependentAudioSessionStrategy with CONCURRENCY_MIX_WITH_OTHERS | 调用不抛异常 | 是 |
| DEFAULT 策略重置验证 | MIX 策略已设置 | setIndependentAudioSessionStrategy with CONCURRENCY_DEFAULT | 调用不抛异常 | 是 |
| 默认场景打断外部音乐 | 外部音乐正在播放 | 点击默认按钮，MUSIC 流 start | 外部音乐被 STOP 打断，不恢复 | 否 |
| 解决方案不打断外部音乐 | 外部音乐正在播放 | 点击解决方案按钮，NOTIFICATION + MIX 流 start | 外部音乐继续播放，按键音并发 | 否 |
| 快速重复点击 | 渲染器已启动 | 连续多次点击同一按钮 | 每次点击播放短促按键音，不叠加 | 否 |
| 场景切换策略重置 | 解决方案 MIX 已设置 | 点击默认按钮触发 resetStrategy | MIX 策略重置为 DEFAULT，默认场景正常打断 | 否 |
