# MultiHap 测试用例归档

## 用例表

|测试功能|预置条件|输入|预期输出|测试结果|
|--------------------------------|--------------------------------|--------------------------------|--------------------------------|--------------------------------|
|拉起应用|	设备正常运行|		|成功拉起应用|Pass|
|验证打开audio按钮|进入应用主页|点击audio按钮|跳转到audio播放页面|Pass|
|验证audio的播放按钮|进入audio播放页面|点击播放按钮|音频文件正常播放|Pass|
|验证audio的暂停按钮|进入audio播放页面|点击暂停按钮|音频文件正常暂停|Pass|
|验证打开video按钮|进入应用主页|点击video按钮|跳转video播放页面|Pass|
|验证video播放按钮|进入video播放页面|点击video播放按钮|视频文件正常播放|Pass|
|验证video暂停按钮|进入video播放页面|点击video暂停按钮|视频文件正常暂停|Pass|
|验证video滑动进度条|进入video播放页面|滑动进度条|视频文件进度变化|Pass|
|验证video全屏按钮|进入video播放页面|点击video全屏按钮|视频占满全屏|Pass|
|验证video关闭按钮|进入video播放页面，且视频全屏|点击全屏后的video全屏按钮|视频变为正常大小|Pass|
|[播放列表初始化、增删与容器归属](./entry/src/ohosTest/ets/test/Expansion.test.ets#L340)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|空表、不同长度列表，替换、添加、删除和清空歌曲|歌曲顺序、当前索引、当前歌曲及数组和元素的引用关系正确|Pass（89/89）|
|[歌曲切换、收藏和连续操作](./entry/src/ohosTest/ets/test/Expansion.test.ets#L442)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|首尾及越界索引、上一首/下一首、收藏和播放列表操作组合|当前歌曲、索引、收藏状态和歌曲顺序符合模型约定|Pass（71/71）|
|[列表清空重建和删除后重加](./entry/src/ohosTest/ets/test/Expansion.test.ets#L976)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|收藏，删除后重新加入原对象；清空后重建列表并切换当前歌曲|操作各阶段的元数据、对象引用和歌曲顺序正确|Pass（46/46）|
|[播放模式及默认歌曲](./entry/src/ohosTest/ets/test/Expansion.test.ets#L820)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|读取 PlayMode 和默认歌曲|枚举取值、默认字段及默认资源与定义一致|Pass（2/2）|
|[歌曲时长格式化](./entry/src/ohosTest/ets/test/Expansion.test.ets#L826)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|秒数、小数、分钟边界和异常数值|按现有规则截断和格式化，边界结果准确|Pass（47/47）|
|[媒体项转歌曲](./entry/src/ohosTest/ets/test/Expansion.test.ets#L901)|entry 测试模块可用，已加载 audioFeature 的歌曲及播放列表模型|有无标题、作者、专辑、缩略图等元数据；毫秒时长边界|完整映射和回退值正确，时长换算正确，转换结果互不影响|Pass（57/57）|

运行范围：连接测试设备后，在 DevEco Studio 使用 **All Tests in 'test (entry)'**。[List.test.ets](./entry/src/ohosTest/ets/test/List.test.ets) 只运行 [Expansion.test.ets](./entry/src/ohosTest/ets/test/Expansion.test.ets) 注册的用例，对应表中带通过数的条目；其余条目仅作历史归档，不由此入口执行。2026-11-18 的 API 26 真机归档记录：312/312 通过，应用启动检查通过。

`entry` 中的模型用例引用实际 `audioFeature` 的歌曲与播放列表代码。
