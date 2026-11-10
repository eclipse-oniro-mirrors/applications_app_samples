/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { media } from '@kit.MediaKit';
import { audio } from '@kit.AudioKit';
import hilog from '@ohos.hilog';
const DOMAIN: number = 0xF811;
const TAG: string = 'Audio01';


/**
 * Audio Test Suite（音频链路真实用例）
 *
 * 被测链路：Demuxer 解封装 -> AudioDecoder 解码 -> OH_AudioRenderer 播放 -> SetSpeed 倍速
 * 实现在 entry/src/main/cpp/player/Player.cpp，ArkTS 层无法直接调用，
 * 因此用例通过与工程同源的系统媒体栈（@kit.MediaKit、@kit.AudioKit）校验：
 * 1. 媒体实例的状态契约（idle / released / STATE_PREPARED）是否成立；
 * 2. 音频服务是否真实可用、媒体音量是否落在系统声明的合法区间。
 * 所有期望值均取自被调 API 的真实返回，不使用写死的模拟数据。
 */
export default function Audio01Test() {
  describe('Audio01Test', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: suite setup`);
    })

    /**
     * @tc.number    SUB_AUDIO_TEST01_0100
     * @tc.name      testAudio01Chapter0001
     * @tc.desc      Verify TC_Audio_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudio01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0001 start');
      const player: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(player.state).assertEqual('idle');
      } finally {
        await player.release();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0001 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TEST01_0200
     * @tc.name      testAudio01Chapter0002
     * @tc.desc      Verify TC_Audio_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudio01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0002 start');
      const player: media.AVPlayer = await media.createAVPlayer();
      await player.release();
      expect(player.state).assertEqual('released');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0002 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TEST01_0300
     * @tc.name      testAudio01Chapter0003
     * @tc.desc      Verify TC_Audio_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudio01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0003 start');
      const first: media.AVPlayer = await media.createAVPlayer();
      const second: media.AVPlayer = await media.createAVPlayer();
      try {
        expect(first === second).assertFalse();
        expect(first.state).assertEqual('idle');
        expect(second.state).assertEqual('idle');
      } finally {
        await first.release();
        await second.release();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0003 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TEST01_0400
     * @tc.name      testAudio01Chapter0004
     * @tc.desc      Verify TC_Audio_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudio01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0004 start');
      const volumeManager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const minVolume: number = volumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const maxVolume: number = volumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const currentVolume: number = volumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      hilog.info(DOMAIN, TAG, '%{public}s', `${TAG}: media volume ${currentVolume} in [${minVolume}, ${maxVolume}]`);
      expect(maxVolume).assertLarger(minVolume);
      expect(currentVolume).assertLargerOrEqual(minVolume);
      expect(currentVolume).assertLessOrEqual(maxVolume);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0004 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TEST01_0500
     * @tc.name      testAudio01Chapter0005
     * @tc.desc      Verify TC_Audio_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudio01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0005 start');
      const streamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };
      const rendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      };
      const options: audio.AudioRendererOptions = {
        streamInfo: streamInfo,
        rendererInfo: rendererInfo
      };
      const renderer: audio.AudioRenderer = await audio.createAudioRenderer(options);
      try {
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
      } finally {
        await renderer.release();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0005 end');
    })
  })
}
