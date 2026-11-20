# MediaController 测试用例归档

## 测试环境

- 开发板：RK3568，OpenHarmony 7.1.0.21，API 26
- 测试套件：`MediaControllerTest`，共 2324 条，Level 0/2
- 测试提供方：由 `ohosTest` 在测试进程中创建 AVSession（audio），激活后发布元数据、播放列表、播放状态与歌词事件
- 运行方式：DevEco Studio 中选中 entry 模块右键 `Run 'test'`，或命令行：

```bash
hvigorw --mode module -p module=entry@ohosTest -p product=default test
```

## 用例清单

| 测试文件 | 用例数 | 说明 |
|---|---:|---|
| `Ability.test.ets` | 18 | 页面启动、元数据、播放控制、队列、歌词与状态同步 |
| `MediaControllerContract.test.ets` | 92 | AVMetadata、AVQueueItem、会话 Map、PlaybackState 枚举与 Logger 契约 |
| `MediaControllerBulkPart01.test.ets` | 94 | 元数据、队列、会话 Map、LoopMode 与命令载荷批量契约 |
| `MediaControllerBulkPart02.test.ets` | 93 | 元数据、队列、会话 Map、LoopMode 与命令载荷批量契约 |
| `MediaControllerBulkPart03.test.ets` | 17 | 元数据、队列、会话 Map、LoopMode 与命令载荷批量契约 |
| `MediaControllerEdgePart01.test.ets` | 95 | 空值/长文本/边界、无会话控制方法与枚举组合 |
| `MediaControllerEdgePart02.test.ets` | 94 | 空值/长文本/边界、无会话控制方法与枚举组合 |
| `MediaControllerEdgePart03.test.ets` | 91 | 空值/长文本/边界、无会话控制方法与枚举组合 |
| `MediaControllerPlaybackPart01.test.ets` | 70 | AVPlaybackState 组合、播放队列、批量 Map |
| `MediaControllerPlaybackPart02.test.ets` | 79 | AVPlaybackState 组合、播放队列、批量 Map |
| `MediaControllerPlaybackPart03.test.ets` | 87 | AVPlaybackState 组合、播放队列、批量 Map |
| `MediaControllerPlaybackPart04.test.ets` | 64 | AVPlaybackState 组合、播放队列、批量 Map |
| `MediaControllerSessionPart01.test.ets` | 65 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerSessionPart02.test.ets` | 70 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerSessionPart03.test.ets` | 68 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerSessionPart04.test.ets` | 69 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerSessionPart05.test.ets` | 8 | AVSessionDescriptor、播放时序、批量 Map 与 AppStorage |
| `MediaControllerMetadataPart01.test.ets` | 63 | AVMetadata 扩展字段、AVMediaDescription、多会话 Map 与 AppStorage 类型 |
| `MediaControllerMetadataPart02.test.ets` | 66 | AVMetadata 扩展字段、AVMediaDescription、多会话 Map 与 AppStorage 类型 |
| `MediaControllerMetadataPart03.test.ets` | 21 | AVMetadata 扩展字段、AVMediaDescription、多会话 Map 与 AppStorage 类型 |
| `MediaControllerSafePart01.test.ets` | 94 | 元数据、队列、Map、PlaybackState/LoopMode 枚举安全契约 |
| `MediaControllerSafePart02.test.ets` | 92 | 元数据、队列、Map、PlaybackState/LoopMode 枚举安全契约 |
| `MediaControllerSafePart03.test.ets` | 104 | 元数据、队列、Map、PlaybackState/LoopMode 枚举安全契约 |
| `MediaControllerSafePart04.test.ets` | 10 | 元数据、队列、Map、PlaybackState/LoopMode 枚举安全契约 |
| `MediaControllerVolumePart01.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart02.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart03.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart04.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart05.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart06.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart07.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart08.test.ets` | 80 | 元数据、多会话 Map 批量用例 |
| `MediaControllerVolumePart09.test.ets` | 60 | 元数据、多会话 Map 批量用例 |
| **合计** | **2324** | |
