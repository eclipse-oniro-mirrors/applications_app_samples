# 按键音打断音视频测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 |
|---------|---------|------|---------|---------|
| MUSIC 流类型创建验证 | AudioRenderer 已初始化 | createAudioRenderer with STREAM_USAGE_MUSIC | renderer 不为 null | 是 |
| NOTIFICATION 流类型创建验证 | AudioRenderer 已初始化 | createAudioRenderer with STREAM_USAGE_NOTIFICATION | renderer 不为 null | 是 |
| MIX 策略激活验证 | AudioSessionManager 已获取 | setIndependentAudioSessionStrategy with CONCURRENCY_MIX_WITH_OTHERS | 调用不抛异常 | 是 |
| DEFAULT 策略重置验证 | MIX 策略已设置 | setIndependentAudioSessionStrategy with CONCURRENCY_DEFAULT | 调用不抛异常 | 是 |
| 默认场景打断外部音乐 | 外部音乐正在播放 | 点击默认按钮，MUSIC 流 start | 外部音乐被 STOP 打断，不恢复 | 否 |
| 解决方案不打断外部音乐 | 外部音乐正在播放 | 点击解决方案按钮，NOTIFICATION + MIX 流 start | 外部音乐继续播放，按键音并发 | 否 |
| 快速重复点击 | 渲染器已启动 | 连续多次点击同一按钮 | 每次点击播放短促按键音，不叠加 | 否 |
| 场景切换策略重置 | 解决方案 MIX 已设置 | 点击默认按钮触发 resetStrategy | MIX 策略重置为 DEFAULT，默认场景正常打断 | 否 |

## 新增自动化覆盖

新增 10 个纯逻辑/契约套件，共 540 条；加上原有 24 条，工程测试用例合计约 **564** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| KeyboardSoundConstantsCore | 采样率、声道、帧长、频率、振幅与时长 | 80 |
| KeyboardSoundPcmMath | 帧/字节数、相位、量化与声道布局 | 80 |
| KeyboardSoundControllerContract | 默认/解决方案控制器未初始化路径 | 80 |
| KeyboardSoundRendererOptions | USAGE、采样率、声道与时长组合 | 60 |
| KeyboardSoundPcmEdge | PCM 振幅/频率/相位极值 | 40 |
| KeyboardSoundStrategyMatrix | USAGE/会话策略/时长/采样率组合 | 40 |
| KeyboardSoundControllerState | 控制器重复 play/release 状态 | 40 |
| KeyboardSoundFrameMatrix | 帧数、声道、字节数与样本数组合 | 40 |
| KeyboardSoundUsageMatrix | USAGE/策略/时长/采样率/振幅组合 | 40 |
| KeyboardSoundControllerReset | 重复 release 与 MIX 策略重置 | 40 |

## 新增逻辑补充

新增 4 个与按键音业务相关的逻辑套件，覆盖会话策略、时长/帧数、控制器令牌和 UI 计数。工程测试用例合计约 **868** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| KeyboardSoundSessionStrategyCore | MUSIC/NOTIFICATION、DEFAULT/MIX 与外部音源组合 | 80 |
| KeyboardSoundDurationEnvelopeCore | 时长、帧数、字节数与首尾采样 | 80 |
| KeyboardSoundControllerGuardMatrix | play/stop/release 令牌和启动状态 | 80 |
| KeyboardSoundUiCounterCore | 默认/解决方案按钮计数与就绪状态 | 60 |

## 补充至 2 万行

新增 PCM 波形与会话切换套件，工程测试代码达到约 **20,006 行**，测试用例合计约 **1,044** 条。

| 测试套件 | 覆盖点 | 用例数 |
| -------- | ------ | ------ |
| KeyboardSoundPcmWaveformCore | 频率/振幅/相位波形与量化边界 | 83 |
| KeyboardSoundSessionTransitionCore | DEFAULT/MIX 会话切换组合 | 91 |

> 当前工程测试用例总数：**1287** 条。
