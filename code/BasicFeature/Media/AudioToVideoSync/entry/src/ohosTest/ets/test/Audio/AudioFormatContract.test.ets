/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { paceTurn } from '../Shared/TestPace';

const FORMAT_VALUES: number[] = [
  audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
  audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
  audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
  audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE
];

function optionsFor(usage: audio.StreamUsage, rate: audio.AudioSamplingRate,
  channel: audio.AudioChannel, format: audio.AudioSampleFormat): audio.AudioRendererOptions {
  const streamInfo: audio.AudioStreamInfo = {
    samplingRate: rate,
    channels: channel,
    sampleFormat: format,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  };
  const rendererInfo: audio.AudioRendererInfo = {
    usage: usage,
    rendererFlags: 0
  };
  return {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
}

async function createFor(usage: audio.StreamUsage, rate: audio.AudioSamplingRate,
  channel: audio.AudioChannel): Promise<audio.AudioRenderer> {
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(
    optionsFor(usage, rate, channel, audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE));
  expect(renderer.state).assertEqual(1);
  return renderer;
}

export default function audioFormatContractTest() {
  describe('audioFormatContractTest', () => {
    beforeAll(() => {
      console.info('audioFormatContractTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioFormatContractTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0100
     * @tc.name      testAudioFormat0001
     * @tc.desc      Verify the sample format constants are distinct ordered values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const distinct: Set<number> = new Set<number>();
      for (let i = 0; i < FORMAT_VALUES.length; i++) {
        expect(FORMAT_VALUES[i]).assertLarger(0);
        distinct.add(FORMAT_VALUES[i]);
      }
      expect(distinct.size).assertEqual(FORMAT_VALUES.length);
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE).assertEqual(1);
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE).assertEqual(2);
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE).assertEqual(3);
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE).assertEqual(4);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0200
     * @tc.name      testAudioFormat0002
     * @tc.desc      Verify the channel and encoding constants keep their documented values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(audio.AudioChannel.CHANNEL_1).assertEqual(1);
      expect(audio.AudioChannel.CHANNEL_2).assertEqual(2);
      expect(audio.AudioEncodingType.ENCODING_TYPE_RAW).assertEqual(0);
      expect(audio.AudioSamplingRate.SAMPLE_RATE_44100).assertEqual(44100);
      expect(audio.AudioSamplingRate.SAMPLE_RATE_48000).assertEqual(48000);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0300
     * @tc.name      testAudioFormat0003
     * @tc.desc      Verify an S16LE renderer can be created for both sample rates and both channel counts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rates: audio.AudioSamplingRate[] = [
        audio.AudioSamplingRate.SAMPLE_RATE_44100,
        audio.AudioSamplingRate.SAMPLE_RATE_48000
      ];
      const channels: audio.AudioChannel[] = [
        audio.AudioChannel.CHANNEL_1,
        audio.AudioChannel.CHANNEL_2
      ];
      for (let i = 0; i < rates.length; i++) {
        for (let j = 0; j < channels.length; j++) {
          const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA,
            rates[i], channels[j]);
          try {
            expect(renderer.state).assertEqual(1);
          } finally {
            await renderer.release();
          }
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0400
     * @tc.name      testAudioFormat0004
     * @tc.desc      Verify an S16LE renderer can be created for every sampled usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const usages: audio.StreamUsage[] = [
        audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.StreamUsage.STREAM_USAGE_MUSIC,
        audio.StreamUsage.STREAM_USAGE_MOVIE,
        audio.StreamUsage.STREAM_USAGE_GAME,
        audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        audio.StreamUsage.STREAM_USAGE_RINGTONE,
        audio.StreamUsage.STREAM_USAGE_ALARM
      ];
      for (let i = 0; i < usages.length; i++) {
        const renderer: audio.AudioRenderer = await createFor(usages[i],
          audio.AudioSamplingRate.SAMPLE_RATE_48000, audio.AudioChannel.CHANNEL_2);
        try {
          expect(renderer.state).assertEqual(1);
        } finally {
          await renderer.release();
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0500
     * @tc.name      testAudioFormat0005
     * @tc.desc      Verify a released renderer keeps the terminal released state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.AudioSamplingRate.SAMPLE_RATE_48000, audio.AudioChannel.CHANNEL_2);
      await renderer.release();
      expect(renderer.state).assertEqual(4);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0600
     * @tc.name      testAudioFormat0006
     * @tc.desc      Verify the volume manager exposes numeric bounds for the media stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      const current: number = manager.getVolumeByStream(usage);
      expect(typeof min).assertEqual('number');
      expect(typeof max).assertEqual('number');
      expect(typeof current).assertEqual('number');
      expect(min).assertLargerOrEqual(0);
      expect(max).assertLargerOrEqual(min);
      expect(current).assertLargerOrEqual(min);
      expect(current).assertLessOrEqual(max);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0700
     * @tc.name      testAudioFormat0007
     * @tc.desc      Verify a renderer created for each rate releases without leaking a running state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rates: audio.AudioSamplingRate[] = [
        audio.AudioSamplingRate.SAMPLE_RATE_44100,
        audio.AudioSamplingRate.SAMPLE_RATE_48000
      ];
      for (let i = 0; i < rates.length; i++) {
        const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MOVIE,
          rates[i], audio.AudioChannel.CHANNEL_1);
        await renderer.release();
        expect(renderer.state).assertEqual(4);
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_FORMAT_0800
     * @tc.name      testAudioFormat0008
     * @tc.desc      Verify two renderers with different rates remain independent after release of one
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.AudioSamplingRate.SAMPLE_RATE_44100, audio.AudioChannel.CHANNEL_2);
      const second: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.AudioSamplingRate.SAMPLE_RATE_48000, audio.AudioChannel.CHANNEL_2);
      try {
        await first.release();
        expect(first.state).assertEqual(4);
        expect(second.state).assertEqual(1);
        await second.start();
        expect(second.state).assertEqual(2);
      } finally {
        await second.release();
      }
    })
  });
}
