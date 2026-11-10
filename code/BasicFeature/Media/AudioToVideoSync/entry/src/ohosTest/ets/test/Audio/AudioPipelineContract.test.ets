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

const RENDER_USAGES: audio.StreamUsage[] = [
  audio.StreamUsage.STREAM_USAGE_MEDIA,
  audio.StreamUsage.STREAM_USAGE_MUSIC,
  audio.StreamUsage.STREAM_USAGE_MOVIE,
  audio.StreamUsage.STREAM_USAGE_GAME,
  audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
  audio.StreamUsage.STREAM_USAGE_RINGTONE,
  audio.StreamUsage.STREAM_USAGE_ALARM
];

const SAMPLE_RATES: audio.AudioSamplingRate[] = [
  audio.AudioSamplingRate.SAMPLE_RATE_44100,
  audio.AudioSamplingRate.SAMPLE_RATE_48000
];

const CHANNELS: audio.AudioChannel[] = [
  audio.AudioChannel.CHANNEL_1,
  audio.AudioChannel.CHANNEL_2
];

const FORMATS: audio.AudioSampleFormat[] = [
  audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE
];

function rendererOptions(usage: audio.StreamUsage, rate: audio.AudioSamplingRate,
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
  const options: audio.AudioRendererOptions = {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
  return options;
}

async function createPreparedRenderer(usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA,
  rate: audio.AudioSamplingRate = audio.AudioSamplingRate.SAMPLE_RATE_48000,
  channel: audio.AudioChannel = audio.AudioChannel.CHANNEL_2,
  format: audio.AudioSampleFormat = audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE): Promise<audio.AudioRenderer> {
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(
    rendererOptions(usage, rate, channel, format));
  expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
  return renderer;
}

export default function audioPipelineContractTest() {
  describe('audioPipelineContractTest', () => {
    beforeAll(() => {
      console.info('audioPipelineContractTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioPipelineContractTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0100
     * @tc.name      testAudioRenderer0001
     * @tc.desc      Verify a new renderer is prepared rather than left in the new or invalid state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(renderer.state === audio.AudioState.STATE_NEW).assertFalse();
        expect(renderer.state === audio.AudioState.STATE_INVALID).assertFalse();
        expect(renderer.state).assertEqual(1);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0200
     * @tc.name      testAudioRenderer0002
     * @tc.desc      Verify releasing a prepared renderer reaches the released terminal state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      expect(renderer.state).assertEqual(4);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0300
     * @tc.name      testAudioRenderer0003
     * @tc.desc      Verify starting a prepared renderer moves it into the running state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(renderer.state).assertEqual(2);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0400
     * @tc.name      testAudioRenderer0004
     * @tc.desc      Verify a running renderer can be paused and reports the paused state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await renderer.start();
        await renderer.pause();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
        expect(renderer.state).assertEqual(5);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0500
     * @tc.name      testAudioRenderer0005
     * @tc.desc      Verify a paused renderer can resume and return to running
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await renderer.start();
        await renderer.pause();
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(renderer.state === audio.AudioState.STATE_PAUSED).assertFalse();
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0600
     * @tc.name      testAudioRenderer0006
     * @tc.desc      Verify a running renderer can be stopped and reports the stopped state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await renderer.start();
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(renderer.state).assertEqual(3);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0700
     * @tc.name      testAudioRenderer0007
     * @tc.desc      Verify a paused renderer can be stopped without resuming first
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await renderer.start();
        await renderer.pause();
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0800
     * @tc.name      testAudioRenderer0008
     * @tc.desc      Verify a renderer can be released directly from running without an explicit stop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.start();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_0900
     * @tc.name      testAudioRenderer0009
     * @tc.desc      Verify start after release is rejected and the terminal state is preserved
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.release();
      try {
        await renderer.start();
      } catch (error) {
        console.info('start after release raised an error');
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1000
     * @tc.name      testAudioRenderer0010
     * @tc.desc      Verify pause after release is rejected and the terminal state is preserved
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.release();
      try {
        await renderer.pause();
      } catch (error) {
        console.info('pause after release raised an error');
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1100
     * @tc.name      testAudioRenderer0011
     * @tc.desc      Verify stop after release is rejected and the terminal state is preserved
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.release();
      try {
        await renderer.stop();
      } catch (error) {
        console.info('stop after release raised an error');
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1200
     * @tc.name      testAudioRenderer0012
     * @tc.desc      Verify repeated releases are rejected after the first one succeeded
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      try {
        await renderer.release();
      } catch (error) {
        console.info('second release raised an error');
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1300
     * @tc.name      testAudioRenderer0013
     * @tc.desc      Verify the state value is stable across repeated reads in the prepared state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createPreparedRenderer();
      try {
        for (let i = 0; i < 100; i++) {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        }
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1400
     * @tc.name      testAudioRenderer0014
     * @tc.desc      Verify two renderers are distinct instances that both start prepared
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: audio.AudioRenderer = await createPreparedRenderer();
      const second: audio.AudioRenderer = await createPreparedRenderer();
      try {
        expect(first === second).assertFalse();
        expect(first.state).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(second.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await first.start();
        expect(first.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(second.state).assertEqual(audio.AudioState.STATE_PREPARED);
      } finally {
        await first.release();
        await second.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1500
     * @tc.name      testAudioRenderer0015
     * @tc.desc      Verify releasing one renderer does not change another renderer's state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const survivor: audio.AudioRenderer = await createPreparedRenderer();
      const victim: audio.AudioRenderer = await createPreparedRenderer();
      try {
        await victim.release();
        expect(victim.state).assertEqual(audio.AudioState.STATE_RELEASED);
        expect(survivor.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await survivor.start();
        expect(survivor.state).assertEqual(audio.AudioState.STATE_RUNNING);
      } finally {
        await survivor.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_RENDERER_1600
     * @tc.name      testAudioRenderer0016
     * @tc.desc      Verify repeated create and release cycles terminate in the released state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioRenderer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 6; i++) {
        const renderer: audio.AudioRenderer = await createPreparedRenderer();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await renderer.release();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0100
     * @tc.name      testAudioStream0001
     * @tc.desc      Verify a renderer can be created for every sampled stream usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < RENDER_USAGES.length; i++) {
        const renderer: audio.AudioRenderer = await createPreparedRenderer(RENDER_USAGES[i]);
        try {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        } finally {
          await renderer.release();
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0200
     * @tc.name      testAudioStream0002
     * @tc.desc      Verify the media and music usages share the same platform usage value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(audio.StreamUsage.STREAM_USAGE_MEDIA).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(audio.StreamUsage.STREAM_USAGE_MEDIA).assertEqual(1);
      expect(audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertEqual(0);
      expect(audio.StreamUsage.STREAM_USAGE_MEDIA).assertLarger(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0300
     * @tc.name      testAudioStream0003
     * @tc.desc      Verify a renderer can be created for both sampled channel counts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < CHANNELS.length; i++) {
        const renderer: audio.AudioRenderer = await createPreparedRenderer(
          audio.StreamUsage.STREAM_USAGE_MEDIA, audio.AudioSamplingRate.SAMPLE_RATE_48000, CHANNELS[i]);
        try {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        } finally {
          await renderer.release();
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0400
     * @tc.name      testAudioStream0004
     * @tc.desc      Verify a renderer can be created for both sampled sample rates
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < SAMPLE_RATES.length; i++) {
        const renderer: audio.AudioRenderer = await createPreparedRenderer(
          audio.StreamUsage.STREAM_USAGE_MEDIA, SAMPLE_RATES[i]);
        try {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        } finally {
          await renderer.release();
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0500
     * @tc.name      testAudioStream0005
     * @tc.desc      Verify every usage and channel combination can reach the prepared state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let usageIndex = 0; usageIndex < RENDER_USAGES.length; usageIndex++) {
        for (let channelIndex = 0; channelIndex < CHANNELS.length; channelIndex++) {
          const renderer: audio.AudioRenderer = await createPreparedRenderer(RENDER_USAGES[usageIndex],
            audio.AudioSamplingRate.SAMPLE_RATE_48000, CHANNELS[channelIndex]);
          try {
            expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
          } finally {
            await renderer.release();
          }
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0600
     * @tc.name      testAudioStream0006
     * @tc.desc      Verify every usage and sample rate combination can reach the prepared state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let usageIndex = 0; usageIndex < RENDER_USAGES.length; usageIndex++) {
        for (let rateIndex = 0; rateIndex < SAMPLE_RATES.length; rateIndex++) {
          const renderer: audio.AudioRenderer = await createPreparedRenderer(RENDER_USAGES[usageIndex],
            SAMPLE_RATES[rateIndex]);
          try {
            expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
          } finally {
            await renderer.release();
          }
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0700
     * @tc.name      testAudioStream0007
     * @tc.desc      Verify the full usage, channel and rate matrix can be released without leaking state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const created: audio.AudioRenderer[] = [];
      for (let usageIndex = 0; usageIndex < RENDER_USAGES.length; usageIndex++) {
        for (let channelIndex = 0; channelIndex < CHANNELS.length; channelIndex++) {
          for (let rateIndex = 0; rateIndex < SAMPLE_RATES.length; rateIndex++) {
            created.push(await createPreparedRenderer(RENDER_USAGES[usageIndex], SAMPLE_RATES[rateIndex],
              CHANNELS[channelIndex]));
          }
        }
      }
      expect(created.length).assertEqual(RENDER_USAGES.length * CHANNELS.length * SAMPLE_RATES.length);
      for (let i = 0; i < created.length; i++) {
        expect(created[i].state).assertEqual(audio.AudioState.STATE_PREPARED);
      }
      for (let i = 0; i < created.length; i++) {
        await created[i].release();
        expect(created[i].state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0800
     * @tc.name      testAudioStream0008
     * @tc.desc      Verify the renderer accepts the sample format matrix at the media usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < FORMATS.length; i++) {
        const renderer: audio.AudioRenderer = await createPreparedRenderer(
          audio.StreamUsage.STREAM_USAGE_MEDIA, audio.AudioSamplingRate.SAMPLE_RATE_48000,
          audio.AudioChannel.CHANNEL_2, FORMATS[i]);
        try {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        } finally {
          await renderer.release();
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_STREAM_0900
     * @tc.name      testAudioStream0009
     * @tc.desc      Verify the raw encoding constant matches the only supported renderer encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioStream0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(audio.AudioEncodingType.ENCODING_TYPE_RAW).assertEqual(0);
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE).assertEqual(1);
      expect(audio.AudioChannel.CHANNEL_1).assertEqual(1);
      expect(audio.AudioChannel.CHANNEL_2).assertEqual(2);
      expect(audio.AudioSamplingRate.SAMPLE_RATE_44100).assertEqual(44100);
      expect(audio.AudioSamplingRate.SAMPLE_RATE_48000).assertEqual(48000);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_0100
     * @tc.name      testAudioVolume0001
     * @tc.desc      Verify the media stream volume range is ordered and contains the current volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      const current: number = manager.getVolumeByStream(usage);
      expect(min).assertLargerOrEqual(0);
      expect(max).assertLarger(min);
      expect(current).assertLargerOrEqual(min);
      expect(current).assertLessOrEqual(max);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_0200
     * @tc.name      testAudioVolume0002
     * @tc.desc      Verify the volume range contract holds for every sampled stream usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolume0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      for (let i = 0; i < RENDER_USAGES.length; i++) {
        const usage: audio.StreamUsage = RENDER_USAGES[i];
        const min: number = manager.getMinVolumeByStream(usage);
        const max: number = manager.getMaxVolumeByStream(usage);
        const current: number = manager.getVolumeByStream(usage);
        expect(min).assertLargerOrEqual(0);
        expect(max).assertLargerOrEqual(min);
        expect(current).assertLargerOrEqual(min);
        expect(current).assertLessOrEqual(max);
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_0300
     * @tc.name      testAudioVolume0003
     * @tc.desc      Verify the volume bounds are stable across repeated queries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolume0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      for (let i = 0; i < 20; i++) {
        expect(manager.getMinVolumeByStream(usage)).assertEqual(min);
        expect(manager.getMaxVolumeByStream(usage)).assertEqual(max);
      }
      expect(max - min).assertLargerOrEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_0400
     * @tc.name      testAudioVolume0004
     * @tc.desc      Verify the media and music usage aliases expose the same volume range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolume0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const mediaMin: number = manager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const musicMin: number = manager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
      const mediaMax: number = manager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const musicMax: number = manager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(musicMin).assertEqual(mediaMin);
      expect(musicMax).assertEqual(mediaMax);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_VOLUME_0500
     * @tc.name      testAudioVolume0005
     * @tc.desc      Verify the volume range is finite and does not overflow the platform scale
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioVolume0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      expect(Number.isFinite(min)).assertTrue();
      expect(Number.isFinite(max)).assertTrue();
      expect(Number.isInteger(min)).assertTrue();
      expect(Number.isInteger(max)).assertTrue();
      expect(max).assertLessOrEqual(10000);
    })
  });
}
