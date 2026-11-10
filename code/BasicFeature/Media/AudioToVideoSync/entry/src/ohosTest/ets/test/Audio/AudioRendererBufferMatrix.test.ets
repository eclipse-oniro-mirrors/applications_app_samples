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
  return {
    streamInfo: streamInfo,
    rendererInfo: rendererInfo
  };
}

async function createFor(usage: audio.StreamUsage): Promise<audio.AudioRenderer> {
  const renderer: audio.AudioRenderer = await audio.createAudioRenderer(optionsFor(usage));
  expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
  return renderer;
}

export default function audioRendererBufferMatrixTest() {
  describe('audioRendererBufferMatrixTest', () => {
    beforeAll(() => {
      console.info('audioRendererBufferMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioRendererBufferMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0100
     * @tc.name      testAudioBuffer0001
     * @tc.desc      Verify a renderer can be stopped and restarted from the stopped state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      try {
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        await renderer.start();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await renderer.stop();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0200
     * @tc.name      testAudioBuffer0002
     * @tc.desc      Verify five start and pause cycles preserve the paused and running states
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MOVIE);
      try {
        for (let i = 0; i < 5; i++) {
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
          await renderer.pause();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
        }
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0300
     * @tc.name      testAudioBuffer0003
     * @tc.desc      Verify five start and stop cycles preserve the running and stopped states
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_GAME);
      try {
        for (let i = 0; i < 5; i++) {
          await renderer.start();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
          await renderer.stop();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
        }
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0400
     * @tc.name      testAudioBuffer0004
     * @tc.desc      Verify releasing a running renderer reaches the released terminal state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      await renderer.start();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0500
     * @tc.name      testAudioBuffer0005
     * @tc.desc      Verify releasing a paused renderer reaches the released terminal state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      await renderer.start();
      await renderer.pause();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_PAUSED);
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0600
     * @tc.name      testAudioBuffer0006
     * @tc.desc      Verify releasing a stopped renderer reaches the released terminal state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_RINGTONE);
      await renderer.start();
      await renderer.stop();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_STOPPED);
      await renderer.release();
      expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0700
     * @tc.name      testAudioBuffer0007
     * @tc.desc      Verify two renderers can start and stop independently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      const second: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_GAME);
      try {
        await first.start();
        expect(first.state).assertEqual(audio.AudioState.STATE_RUNNING);
        expect(second.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await second.start();
        expect(second.state).assertEqual(audio.AudioState.STATE_RUNNING);
        await first.stop();
        expect(first.state).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(second.state).assertEqual(audio.AudioState.STATE_RUNNING);
      } finally {
        await first.release();
        await second.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0800
     * @tc.name      testAudioBuffer0008
     * @tc.desc      Verify the running state is stable across repeated reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
      try {
        await renderer.start();
        for (let i = 0; i < 50; i++) {
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RUNNING);
        }
      } finally {
        await renderer.release();
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_0900
     * @tc.name      testAudioBuffer0009
     * @tc.desc      Verify the full prepared to released sequence for three usages
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const usages: audio.StreamUsage[] = [
        audio.StreamUsage.STREAM_USAGE_MEDIA,
        audio.StreamUsage.STREAM_USAGE_MOVIE,
        audio.StreamUsage.STREAM_USAGE_GAME
      ];
      for (let i = 0; i < usages.length; i++) {
        const renderer: audio.AudioRenderer = await createFor(usages[i]);
        try {
          await renderer.start();
          await renderer.pause();
          await renderer.start();
          await renderer.stop();
          await renderer.release();
          expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
        } finally {
          try {
            await renderer.release();
          } catch (error) {
            console.info('already released');
          }
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_AUDIO_BUFFER_1000
     * @tc.name      testAudioBuffer0010
     * @tc.desc      Verify ten create and release cycles never leave a renderer running
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < 10; i++) {
        const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
        await renderer.release();
        expect(renderer.state).assertEqual(audio.AudioState.STATE_RELEASED);
      }
    })
  });
}
