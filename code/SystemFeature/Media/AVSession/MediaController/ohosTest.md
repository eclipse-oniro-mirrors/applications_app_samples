# MediaController 测试用例归档

## 测试环境

- 开发板：RK3568，OpenHarmony 7.1.0.21，API 26
- 测试套件：`MediaControllerTest`，共 1624 条，Level 0/2
- 测试提供方：由 `ohosTest` 在测试进程中创建 AVSession（audio），激活后发布元数据、播放列表、播放状态与歌词事件
- 运行命令：

```bash
hdc shell aa test -b com.samples.mediacontroller -m entry_test \
  -s unittest /ets/TestRunner/OpenHarmonyTestRunner \
  -s class MediaControllerTest -s timeout 300000
```

## 用例清单

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `Ability.test.ets` | 18 | 页面启动、元数据、播放控制、队列、歌词与状态同步 |
| `MediaControllerContract.test.ets` | 92 | AVMetadata、AVQueueItem、会话 Map、PlaybackState 枚举与 Logger 契约 |
| `MediaControllerBulk.test.ets` | 204 | 元数据、队列、会话 Map、LoopMode 与命令载荷批量契约 |
| `MediaControllerEdge.test.ets` | 300 | 空值/长文本/边界、无会话控制方法与枚举组合 |
| `MediaControllerPlayback.test.ets` | 300 | AVPlaybackState 组合、播放队列、批量 Map |
| `MediaControllerSession.test.ets` | 300 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerMetadata.test.ets` | 180 | AVMetadata 扩展字段、AVMediaDescription、多会话 Map 与 AppStorage 类型 |
| `MediaControllerSafe.test.ets` | 300 | 元数据、队列、Map、PlaybackState/LoopMode 枚举安全契约 |
| **合计** | **1624** | |
