# 音频焦点DUCK场景测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|---------|---------|------|---------|---------|
| 采样率枚举值验证 | AudioSamplingRate 已定义 | 无 | SAMPLE_RATE_8000=8000, SAMPLE_RATE_16000=16000, SAMPLE_RATE_44100=44100, SAMPLE_RATE_48000=48000 | 是 |
| 声道枚举值验证 | AudioChannel 已定义 | 无 | MONO=1, STEREO=2 | 是 |
| 采样格式枚举值验证 | AudioSampleFormat 已定义 | 无 | U8=0, S16LE=1, S24LE=2, S32LE=3, F32LE=4 | 是 |
| 打断提示枚举值验证 | InterruptHintType 已定义 | 无 | INTERRUPT_HINT_NONE=0, RESUME=1, PAUSE=2, STOP=3, DUCK=4, UNDUCK=5, MUTE=6, UNMUTE=7 | 是 |
| 应用内UI状态枚举值验证 | AppAudioState（应用内自定义UI状态）已定义 | 无 | RUNNING=0, PAUSED=1, STOPPED=2, DUCKED=3, UNDUCKED=4 | 是 |
| 流类型值验证 | StreamUsage 已定义 | 无 | MUSIC=1, NAVIGATION=9 | 是 |
| S16LE每采样字节数验证 | BYTES_PER_SAMPLE_S16LE 已定义 | 无 | BYTES_PER_SAMPLE_S16LE=2 | 是 |
| 音乐参数一致性验证 | MUSIC_SAMPLE_RATE/CHANNEL_COUNT/SAMPLE_FORMAT/BYTE_RATE/DURATION_MS 已定义 | 无 | BYTE_RATE=SAMPLE_RATE×CHANNEL_COUNT×BYTES_PER_SAMPLE_S16LE, DURATION_MS=30000 | 是 |
| 导航参数一致性验证 | NAV_SAMPLE_RATE/CHANNEL_COUNT/SAMPLE_FORMAT/BYTE_RATE/DURATION_MS 已定义 | 无 | BYTE_RATE=SAMPLE_RATE×CHANNEL_COUNT×BYTES_PER_SAMPLE_S16LE, DURATION_MS=8000 | 是 |
| 文件根路径常量验证 | APP_ROOT_FILE_PATH 已定义 | 无 | APP_ROOT_FILE_PATH="/data/storage/el2/base/haps/entry/files" | 是 |
| DUCK降低音乐音量 | 音乐处于 RUNNING（应用内UI状态） | INTERRUPT_HINT_DUCK | 应用内UI状态从 RUNNING 转为 DUCKED | 是 |
| UNDUCK恢复音乐音量 | 音乐处于 DUCKED（应用内UI状态） | INTERRUPT_HINT_UNDUCK | 应用内UI状态从 DUCKED 转为 UNDUCKED | 是 |
| STOP永久停止音乐 | 音乐处于 RUNNING（应用内UI状态） | INTERRUPT_HINT_STOP | 应用内UI状态从 RUNNING 转为 STOPPED | 是 |
| PAUSE暂时暂停音乐 | 音乐处于 RUNNING（应用内UI状态） | INTERRUPT_HINT_PAUSE | 应用内UI状态从 RUNNING 转为 PAUSED | 是 |
| RESUME恢复暂停音乐 | 音乐处于 PAUSED（应用内UI状态） | INTERRUPT_HINT_RESUME | 应用内UI状态从 PAUSED 转为 RUNNING | 是 |
| 导航对音乐焦点策略 | 无 | NAVIGATION StreamUsage 与 MUSIC StreamUsage 焦点冲突 | InterruptHint=DUCK | 是 |
| 音乐对音乐焦点策略 | 无 | MUSIC StreamUsage 与 MUSIC StreamUsage 焦点冲突 | InterruptHint=STOP | 是 |
