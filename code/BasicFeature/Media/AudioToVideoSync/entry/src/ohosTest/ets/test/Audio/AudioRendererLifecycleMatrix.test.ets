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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { audio } from '@kit.AudioKit';
import { paceTurn } from '../Shared/TestPace';

function optionsFor(usage: audio.StreamUsage): audio.AudioRendererOptions {
  const streamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
    channels: audio.AudioChannel.CHANNEL_2,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
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

async function createFor(usage: audio.StreamUsage): Promise<audio.AudioRenderer> {
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(optionsFor(usage));
  expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
  return renderer;
}

async function fullLifecycle(usage: audio.StreamUsage): Promise<void> {
  const renderer: audio.AudioRenderer = await createFor(usage);
  try {
    expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
    await renderer.start();
    expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
    await renderer.pause();
    expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
    await renderer.start();
    expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
    await renderer.stop();
    expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
  } finally {
    await renderer.release();
  }
  expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
}

export default function audioRendererLifecycleMatrixTest() {
  describe('audioRendererLifecycleMatrixTest', () => {
    beforeAll(() => {
      console.info('audioRendererLifecycleMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioRendererLifecycleMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0100
     * @tc.name      testAudioLifecycle0001
     * @tc.desc      Verify the media usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0001', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_MEDIA);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0200
     * @tc.name      testAudioLifecycle0002
     * @tc.desc      Verify the music usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0002', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_MUSIC);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0300
     * @tc.name      testAudioLifecycle0003
     * @tc.desc      Verify the movie usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0003', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_MOVIE);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0400
     * @tc.name      testAudioLifecycle0004
     * @tc.desc      Verify the game usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0004', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_GAME);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0500
     * @tc.name      testAudioLifecycle0005
     * @tc.desc      Verify the notification usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0005', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0600
     * @tc.name      testAudioLifecycle0006
     * @tc.desc      Verify the ringtone usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0006', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_RINGTONE);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0700
     * @tc.name      testAudioLifecycle0007
     * @tc.desc      Verify the alarm usage renderer completes the prepared to released lifecycle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0007', 0, async () => {
      await fullLifecycle(audio.StreamUsage.STREAM_USAGE_ALARM);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0800
     * @tc.name      testAudioLifecycle0008
     * @tc.desc      Verify the media volume range exists and contains the current media volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0008', 0, () => {
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
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_0900
     * @tc.name      testAudioLifecycle0009
     * @tc.desc      Verify the movie volume range exists and contains the current movie volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0009', 0, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MOVIE;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      const current: number = manager.getVolumeByStream(usage);
      expect(min).assertLargerOrEqual(0);
      expect(max).assertLargerOrEqual(min);
      expect(current).assertLargerOrEqual(min);
      expect(current).assertLessOrEqual(max);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1000
     * @tc.name      testAudioLifecycle0010
     * @tc.desc      Verify the game volume range exists and contains the current game volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0010', 0, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_GAME;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      const current: number = manager.getVolumeByStream(usage);
      expect(min).assertLargerOrEqual(0);
      expect(max).assertLargerOrEqual(min);
      expect(current).assertLargerOrEqual(min);
      expect(current).assertLessOrEqual(max);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1100
     * @tc.name      testAudioLifecycle0011
     * @tc.desc      Verify the notification volume range exists and contains the current notification volume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0011', 0, () => {
      const manager: audio.AudioVolumeManager = audio.getAudioManager().getVolumeManager();
      const usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_NOTIFICATION;
      const min: number = manager.getMinVolumeByStream(usage);
      const max: number = manager.getMaxVolumeByStream(usage);
      const current: number = manager.getVolumeByStream(usage);
      expect(min).assertLargerOrEqual(0);
      expect(max).assertLargerOrEqual(min);
      expect(current).assertLargerOrEqual(min);
      expect(current).assertLessOrEqual(max);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1200
     * @tc.name      testAudioLifecycle0012
     * @tc.desc      Verify a released renderer preserves the released state after a start attempt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0012', 0, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      await renderer.release();
      try {
        await renderer.start();
      } catch (error) {
        console.info('start after release raised an error');
      }
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1300
     * @tc.name      testAudioLifecycle0013
     * @tc.desc      Verify two renderers with different usages keep independent states
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0013', 0, async () => {
      const media: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const game: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_GAME);
      try {
        await media.start();
        expect(media.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(game.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await game.start();
        expect(game.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await game.stop();
        expect(game.state).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(media.state).assertEqual(audio.AudioState.STATE_RUNNING);
      } finally {
        await media.release();
        await game.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1400
     * @tc.name      testAudioLifecycle0014
     * @tc.desc      Verify repeated full lifecycles for the movie usage end in the released state each time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0014', 0, async () => {
      for (let i = 0; i < 3; i++) {
        await fullLifecycle(audio.StreamUsage.STREAM_USAGE_MOVIE);
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_LIFECYCLE_1500
     * @tc.name      testAudioLifecycle0015
     * @tc.desc      Verify every sampled usage reports a state inside the documented AudioState enumeration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioLifecycle0015', 0, async () => {
      const usages: audio.StreamUsage[] = [
        audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.StreamUsage.STREAM_USAGE_MOVIE,
        audio.StreamUsage.STREAM_USAGE_GAME,
        audio.StreamUsage.STREAM_USAGE_NOTIFICATION
      ];
      const allowed: number[] = [
        audio.AudioState.STATE_NEW,
        audio.AudioState.STATE_PREPARED,
        audio.AudioState.STATE_RUNNING,
        audio.AudioState.STATE_STOPPED,
        audio.AudioState.STATE_RELEASED,
        audio.AudioState.STATE_PAUSED
      ];
      for (let i = 0; i < usages.length; i++) {
        const renderer: audio.AudioRenderer = await createFor(usages[i]);
        expect(allowed.indexOf(renderer.state) >= 0).assertTrue();
        await renderer.release();
        expect(allowed.indexOf(renderer.state) >= 0).assertTrue();
      }
    })
  });
}
