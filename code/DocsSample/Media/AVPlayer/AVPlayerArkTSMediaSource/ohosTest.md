# AVPlayerArkTSMediaSource测试用例归档

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
| MediaSourceRangeCore/Tail | HTTP Range 头格式、区间边界与长度 | 200 |
| MediaSourceStateCore/Tail | AVPlayer 状态字符串、seek 与倍速时间计算 | 197 |
| MediaSourceFileInfoCore/Tail | FileInfo 字段、FileType/ProgressType 枚举契约 | 200 |
| MediaSourceHlsCore/Tail | HLS 分片时长与时间轴映射 | 200 |
| MediaSourceRequestCore/Tail | MediaSource 读写请求长度与响应边界 | 200 |
| MediaSourceTimeCore | 毫秒转 `min:sec` 文本 | 100 |
| MediaSourceAssetCore | 本地媒体资源大小与扩展名 | 100 |
| MediaSourceTimeConvertEdge | 0 值、跨分钟、长时长与补零边界 | 80 |
| MediaSourceVideoLayout | 横竖屏视频画面的等比缩放布局 | 66 |
| MediaSourceSpeedCycle | 倍速索引循环与 4 档倍速选择 | 80 |
| MediaSourceDownloadPath | 分片缓存文件路径与 uuid/offset 组合 | 80 |
| MediaSourceRequestHandle | 请求句柄打开、查询、关闭与 HashMap 一致性 | 75 |
| MediaSourcePlayerLifecycle | AVPlayer 状态迁移合法性矩阵 | 81 |
| MediaSourceDownloadContract | DownloadPool/FileInfo 字段、枚举组合与可变性 | 80 |
| MediaSourceSpeedMapping | 倍速索引到 PlaybackSpeed 枚举映射 | 72 |
| MediaSourceHttpResponse | 200/206 接受规则、异常响应码与 Range 边界 | 73 |
| MediaSourceLoaderLifecycle | SourceLoader 句柄打开、关闭与非法读取 | 60 |
| MediaSourceSubtitleDefaults | 字幕空值、0 值与缺省字段兜底 | 80 |
| MediaSourceAppStorageContract | duration/current/speed 等状态键读写与删除 | 80 |
| MediaSourceSeekContract | 进度条取整、重复 seek 抑制与边界值 | 80 |
| MediaSourcePredownloadContract | 预下载 URL、空 headers 与 buffer 策略 | 80 |
| MediaSourceRangeParser | Range 头前缀、分段与非法格式解析 | 80 |
| MediaSourceRawFdContract | rawfile 文件描述符打开、长度与关闭重开 | 30 |
| MediaSourceUiPlayback | 倍速按钮循环、播放控件与时间文本 | 8 |
| MediaSourceHlsPlaylistCore | EXTINF 时长解析与分片累计时间轴 | 80 |
| MediaSourceSegmentCacheCore | 分片缓存键、路径与 Range 终点 | 80 |
| MediaSourceBufferWindowCore | 缓冲区间包含与重叠判断 | 80 |
| MediaSourceSeekWindowCore | seek 取整、钳制与边界 | 80 |
| MediaSourceSpeedTimelineCore | 不同倍速下的有效时长 | 80 |
| MediaSourceDownloadRetryCore | 重试退避、尝试次数与响应接受 | 80 |
| MediaSourceUrlContractCore | URL 协议、扩展名与主机契约 | 80 |
| MediaSourceStateGuardCore | 状态-操作允许矩阵 | 80 |
| MediaSourceQueuePriorityCore | 优先级与顺序稳定性 | 80 |

以上自动化用例合计约 **3,106** 条，可执行 `aa test -b com.samples.avplayerarktsmediasource -m entry_test -s unittest OpenHarmonyTestRunner -s class <ClassName>` 按套件运行。
