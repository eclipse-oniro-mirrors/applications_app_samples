# 音频低时延耳返功能测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|------|------|------|------|------|
| 拉起应用 | 设备正常运行 | - | 成功拉起应用，弹出权限确认弹窗 | 是 |
| 麦克风权限弹窗确认 | 位于主页 | 点击"允许" | 权限弹窗消失，进入主页 | 是 |
| 创建音频低时延耳返实例 | 位于主页，已授权麦克风权限 | 点击"Create Audio Loopback Instance" | 创建返听实例成功，日志显示"Succeeded in creating audio loopback." | 是 |
| 设置返听音量 | 位于主页，已创建实例 | 点击"Set the audio monitor volume" | 设置音量成功，日志显示"Succeeded in setting volume." | 是 |
| 设置混响模式 | 位于主页，已创建实例 | 点击"Set the reverb mode" | 设置混响模式成功，日志显示"Succeeded in setting reverb preset." | 是 |
| 设置均衡器类型 | 位于主页，已创建实例 | 点击"Set the equalizer type" | 设置均衡器类型成功，日志显示"Succeeded in setting equalizer preset." | 是 |
| 查询返听状态 | 位于主页，已创建实例 | 点击"Query the monitor status" | 查询并显示当前返听状态 | 是 |
| 查询混响模式 | 位于主页，已创建实例 | 点击"Query the reverb mode" | 查询并显示当前混响模式 | 是 |
| 查询均衡器类型 | 位于主页，已创建实例 | 点击"Query the equalizer type" | 查询并显示当前均衡器类型 | 是 |
| 启用音频返听 | 位于主页，已创建实例 | 点击"Enable audio monitor" | 启用返听成功，日志显示"Succeeded in using enable function." | 是 |
| 禁用音频返听 | 位于主页，已启用返听 | 点击"Disable audio monitor" | 禁用返听成功，日志显示"Succeeded in using enable function." | 是 |
