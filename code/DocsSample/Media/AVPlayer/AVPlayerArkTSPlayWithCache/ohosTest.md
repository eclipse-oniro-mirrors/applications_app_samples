# AVPlayerArkTSPlayWithCache测试用例归档

## 用例表

| 测试功能         | 预置条件           | 输入                 | 预期输出                     | 是否自动 | 测试结果 |
| ---------------- | ------------------ | -------------------- | ---------------------------- | -------- | -------- |
| 拉起应用         | 设备正常运行       |                     | 成功拉起应用                 | 是       | Pass     |
| 播放功能         | 进入示例应用       | 点击播放按钮         | 成功播放资源                 | 是       | Pass     |
| 拖动功能         | 进入示例应用       | 点击、拖动进度条     | 成功改变播放进度               | 是       | Pass     |
| 暂停功能         | 进入示例应用       | 点击移动按钮         | 成功暂停播放                |  是       | Pass     |

## 新增自动化测试覆盖

除基础 UI 用例外，ohosTest 还包含以下自动化测试套件，均通过 `List.test.ets` 注册执行。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| PlayWithCacheTimeConvert | 毫秒转 `min:sec`、补零与跨分钟边界 | 80 |
| PlayWithCacheVideoLayout | 横竖屏视频画面等比缩放布局 | 66 |
| PlayWithCacheSpeedCycle | 4 档倍速索引循环 | 80 |
| PlayWithCacheMediaSourceContract | URL、空 headers、M3U8 类型、缓存开关与播放策略 | 80 |
| PlayWithCacheM3U8Playlist | EXTINF 时长与分片累计时间轴 | 80 |
| PlayWithCacheOfflineCacheState | 离线缓存开关切换与缓存键 | 80 |
| PlayWithCacheRangeRequest | Range 头、区间终点与 200/206 接受规则 | 80 |
| PlayWithCacheBufferWindow | 20 秒缓冲窗口与时间包含判断 | 80 |
| PlayWithCachePlayerState | AVPlayer 状态-操作允许矩阵 | 80 |
| PlayWithCacheAppStorage | duration/current/speed 状态键读写与删除 | 80 |
| PlayWithCacheSeekContract | 进度条取整、重复 seek 抑制与边界 | 80 |
| PlayWithCacheUrlContract | URL 协议、扩展名与主机契约 | 80 |
| PlayWithCacheEviction | LRU 缓存淘汰与容量边界 | 62 |
| PlayWithCacheQuota | 缓存配额、占用与剩余空间 | 80 |
| PlayWithCacheVariant | HLS 码率与分辨率选择 | 80 |
| PlayWithCacheRetry | 分片下载重试与退避 | 80 |
| PlayWithCacheRangeMerge | 相邻/重叠 Range 合并 | 80 |
| PlayWithCachePrefetch | 预取分片顺序与边界 | 80 |
| PlayWithCacheKeyNormalize | URL 归一化与缓存键 | 80 |
| PlayWithCacheProgress | 播放进度百分比与钳制 | 80 |
| PlayWithCacheSegmentPlan | 分片索引、偏移与片内时间 | 80 |
| PlayWithCacheFlags | 缓存、M3U8、缓冲与首帧标志组合 | 80 |
| PlayWithCacheM3U8Advanced | MEDIA-SEQUENCE、BYTERANGE、KEY 标签解析 | 76 |
| PlayWithCacheFileLifecycle | 缓存文件创建、清理与条目一致性 | 80 |
| PlayWithCacheNetworkError | HTTP 异常、超时、可重试与退避 | 80 |
| PlayWithCachePersistence | 缓存键持久化、恢复与清空 | 80 |
| PlayWithCacheUiSpeed | 倍速、播放控件、进度条 UI 交互 | 8 |
| PlayWithCacheM3U8Keys | KEY 轮换、IV、DISCONTINUITY 与 MAP | 80 |
| PlayWithCacheDiskConsistency | 缓存文件写入、移除与总大小一致性 | 80 |
| PlayWithCacheNetworkRecovery | 超时、取消、重试与恢复状态 | 60 |
| PlayWithCacheUiSeek | 倍速、进度条与播放控件 UI 契约 | 12 |
| PlayWithCacheKeyCollision | 缓存键分桶与冲突统计 | 30 |
| PlayWithCacheM3U8Crypto | KEY 方法、URI、IV 与异常校验 | 40 |
| PlayWithCacheFileRecord | 缓存记录数量、移除与总大小 | 30 |
| PlayWithCacheOfflineState | 缓存开关、清空与恢复状态 | 20 |
| PlayWithCacheUiSeekActual | 倍速、seek 拖动与时间文本 UI 验证 | 20 |
| PlayWithCacheFileIoIntegration | 真实缓存文件写入、读取、大小与删除 | 12 |
| PlayWithCachePlaybackIntegration | 真实播放控件、seek、暂停恢复与倍速 | 12 |

以上自动化用例合计约 **2,452** 条，可在 DevEco Studio 或 OpenHarmonyTestRunner 中按套件运行。
