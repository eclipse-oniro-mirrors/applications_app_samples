# 获取支持的编解码能力 测试用例归档

## 用例表

| 用例编号 | 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|---|
| CodecCapability_StartAbility_001 | 拉起应用 | 设备正常运行 | 无 | 成功拉起应用，当前顶层 Ability 为 EntryAbility | 是 | Pass |
| CodecCapability_CodecCategory_001 | 编解码器类别枚举验证 | 无 | 无 | 视频解码=0, 视频编码=1, 音频解码=2, 音频编码=3 | 是 | Pass |
| CodecCapability_CodecCategory_002 | 类别唯一性验证 | 无 | 无 | 四个类别取值互不相同 | 是 | Pass |
| CodecCapability_NativeLibrary_001 | native库存在性验证 | 应用已安装 | 无 | getCodecList 返回数组，native 库加载成功 | 是 | Pass |
| CodecCapability_ScenarioGroups_001 | 场景分组数量验证 | 无 | 无 | 共19个场景分组、39个场景条目 | 是 | Pass |
| CodecCapability_HomeTabs_001 | 主页显示两个页签 | 成功拉起应用 | 无 | 页面显示"编解码器列表"与"场景验证"两个页签 | 否 | Pass |
| CodecCapability_CodecList_001 | 查询视频解码器列表 | 位于编解码器列表页签 | 选择视频解码类别 | 列表展示解码器名称、MIME类型、软硬件类别 | 否 | Pass |
| CodecCapability_CodecList_002 | 查询音频编码器列表 | 位于编解码器列表页签 | 选择音频编码类别 | 列表展示编码器名称、MIME类型、软硬件类别 | 否 | Pass |
| CodecCapability_CodecDetail_001 | 查看编解码器详情 | 位于编解码器列表页签 | 点击列表项 | 详情页展示宽高范围、帧率范围、码控模式等能力 | 否 | Pass |
| CodecCapability_Scenario_001 | 执行方式一获取能力实例 | 位于场景验证页签 | 点击按MIME获取场景 | 结果包含系统推荐音频AAC解码器信息 | 否 | Pass |
| CodecCapability_Scenario_002 | 执行安全解码器筛选场景 | 位于场景验证页签 | 点击DRM安全解码器场景 | 返回H.264安全解码器查询结果 | 否 | Pass |
| CodecCapability_Scenario_003 | 场景结果缓存验证 | 已执行任一场景 | 再次点击同一场景 | 直接返回缓存结果，不重复创建实例 | 否 | Pass |
