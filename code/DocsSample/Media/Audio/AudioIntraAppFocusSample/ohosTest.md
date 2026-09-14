# 音频焦点同应用内管理测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|---------|---------|------|---------|---------|
| InterruptMode枚举值验证 | InterruptMode已定义 | 无 | SHARE_MODE=0, INDEPENDENT_MODE=1 | 是 |
| StreamUsageType枚举值验证 | StreamUsageType已定义 | 无 | MUSIC=0, MOVIE=1, GAME=2, AUDIOBOOK=3, NAVIGATION=4 | 是 |
| InterruptHintType枚举值验证 | InterruptHintType已定义 | 无 | INTERRUPT_HINT_NONE=0, RESUME=1, PAUSE=2, STOP=3, DUCK=4, UNDUCK=5 | 是 |
| InterruptForceType枚举值验证 | InterruptForceType已定义 | 无 | INTERRUPT_FORCE=0, INTERRUPT_SHARE=1 | 是 |
| AudioStreamState枚举值验证 | AudioStreamState已定义 | 无 | PREPARED=0, RUNNING=1, PAUSED=2, STOPPED=3, RELEASED=4 | 是 |
| 文件根路径常量验证 | APP_ROOT_FILE_PATH已定义 | 无 | APP_ROOT_FILE_PATH="/data/storage/el2/base/haps/entry/files" | 是 |
| SHARE_MODE为默认模式 | InterruptMode已定义 | 无 | SHARE_MODE值为0（默认值） | 是 |
| INDEPENDENT_MODE导致STOP | InterruptMode已定义 | 无 | INDEPENDENT_MODE值为1 | 是 |
| MUSIC与MUSIC同类型验证 | StreamUsageType已定义 | 无 | MUSIC StreamUsageType值相同 | 是 |
| MUSIC与MOVIE不同类型验证 | StreamUsageType已定义 | 无 | MUSIC与MOVIE StreamUsageType值不同 | 是 |
| MUSIC与GAME不同类型验证 | StreamUsageType已定义 | 无 | MUSIC与GAME StreamUsageType值不同 | 是 |
| NAVIGATION对MUSIC焦点策略 | 无 | NAVIGATION StreamUsage与MUSIC StreamUsage焦点冲突 | InterruptHint=DUCK | 是 |
| MUSIC对MUSIC焦点策略 | 无 | MUSIC StreamUsage与MUSIC StreamUsage焦点冲突 | InterruptHint=STOP（INDEPENDENT_MODE下） | 是 |
| MUSIC对MOVIE焦点策略 | 无 | MOVIE StreamUsage与MUSIC StreamUsage焦点冲突 | InterruptHint=STOP（INDEPENDENT_MODE下） | 是 |
| SHARE_MODE下PAUSE暂停音乐 | 音乐处于RUNNING状态 | 应用管控开启，B流开始播放 | 应用内UI状态从RUNNING转为PAUSED | 是 |
| SHARE_MODE下RESUME恢复音乐 | 音乐处于PAUSED状态（被应用管控暂停） | B流停止播放 | 应用内UI状态从PAUSED转为RUNNING | 是 |
| INDEPENDENT_MODE下STOP永久停止 | 音乐处于RUNNING状态 | B流开始播放 | 系统自动STOP音乐，音乐不恢复 | 是 |
| GAME与MUSIC并发混音 | 无 | GAME StreamUsage与MUSIC StreamUsage | 并发混音，不打断，InterruptHint=NONE | 是 |
