# AVCodecSample_VideoPlayer 测试说明

准备一台支持 SDK 26.0.0 所用接口的设备。运行 `entry`，将同一段短视频放在图库和文件管理中。素材使用 8 位 H.264 MP4。设备自动化可用组件 ID `playbackMode` 和 `play` 定位这两个按钮。

| 用例 | 操作 | 预期 |
|---|---|---|
| 异步 Surface | 保持默认模式，从文件管理选片。 | 画面正常播放，片尾自然结束。 |
| 同步 Surface | 改为同步 Surface，从文件管理选片。 | 画面正常播放，片尾自然结束。 |
| 异步 Buffer | 改为异步 Buffer，从图库选片。 | 送显正常，画面无明显错色或错行，片尾自然结束。 |
| 同步 Buffer | 改为同步 Buffer，从文件管理选片。 | 送显正常，画面无明显错色或错行，片尾自然结束。 |
| 取消选片 | 打开任意来源的选片页，再返回。 | 没有启动播放，可以再次打开选择器。 |
| 连续播放 | 等第一段视频自然结束，再选另一段视频。 | 两段视频依次播放并自然结束，第二段可以使用另一种模式。 |

四种组合都应在片尾恢复「播放」按钮。取消和播放失败后也应能再次选片。

真机使用同一段约 6.7 秒的 8 位 H.264 MP4，依次验证异步 Surface、异步 Buffer、同步 Surface 和同步 Buffer。四次都收到视频 EOS，释放后「播放」恢复可用。在文件管理返回后也可再次选片。模式和视频来源弹窗均在设备上核对了选项和点击区域。

## 首页冒烟测试

连接设备后，通过 DevEco Studio 执行 `entry` 模块的设备测试。`VideoPlayerHomeTest` 启动首页并检查两个按钮是否存在。测试名称为 `AVCodecSample_VideoPlayer_HomeControls_001`。[测试源码](entry/src/ohosTest/ets/test/Ability.test.ets)
