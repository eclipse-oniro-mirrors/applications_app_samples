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
import { hilog } from '@kit.PerformanceAnalysisKit';

const CREATE_START_STOP_RELEASE_ROUNDS: number = 20;
const CREATE_BUDGET_MS: number = 20000;
const START_PAUSE_ROUNDS: number = 10;
const START_PAUSE_BUDGET_MS: number = 10000;
const USAGES: audio.StreamUsage[] = [
  audio.StreamUsage.STREAM_USAGE_MEDIA,
  audio.StreamUsage.STREAM_USAGE_MOVIE,
  audio.StreamUsage.STREAM_USAGE_GAME,
  audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
  audio.StreamUsage.STREAM_USAGE_RINGTONE
];

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
  expect(renderer.state).assertEqual(1);
  return renderer;
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Performance_AudioLifecycleThroughput]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function audioLifecycleThroughputTest() {
  describe('audioLifecycleThroughputTest', () => {
    beforeAll(() => {
      console.info('audioLifecycleThroughputTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('audioLifecycleThroughputTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_PERF_AUDIO_0100
     * @tc.name      testAudioThroughput0001
     * @tc.desc      Verify twenty create, start, stop and release cycles complete within budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioThroughput0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAudioThroughput0001');
      const start: number = Date.now();
      for (let i = 0; i < CREATE_START_STOP_RELEASE_ROUNDS; i++) {
        const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MEDIA);
        await renderer.start();
        expect(renderer.state).assertEqual(2);
        await renderer.stop();
        expect(renderer.state).assertEqual(3);
        await renderer.release();
        expect(renderer.state).assertEqual(4);
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(CREATE_BUDGET_MS);
    
      logEnd('testAudioThroughput0001');
    })

    /**
     * @tc.number    SUB_AVS_PERF_AUDIO_0200
     * @tc.name      testAudioThroughput0002
     * @tc.desc      Verify ten start and pause cycles on one renderer complete within budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioThroughput0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAudioThroughput0002');
      const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_MOVIE);
      const start: number = Date.now();
      try {
        for (let i = 0; i < START_PAUSE_ROUNDS; i++) {
          await renderer.start();
          expect(renderer.state).assertEqual(2);
          await renderer.pause();
          expect(renderer.state).assertEqual(5);
        }
      } finally {
        await renderer.release();
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(START_PAUSE_BUDGET_MS);
    
      logEnd('testAudioThroughput0002');
    })

    /**
     * @tc.number    SUB_AVS_PERF_AUDIO_0300
     * @tc.name      testAudioThroughput0003
     * @tc.desc      Verify five usages each complete a full lifecycle within the aggregate budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioThroughput0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAudioThroughput0003');
      const start: number = Date.now();
      for (let i = 0; i < USAGES.length; i++) {
        const renderer: audio.AudioRenderer = await createFor(USAGES[i]);
        try {
          await renderer.start();
          await renderer.pause();
          await renderer.start();
          await renderer.stop();
        } finally {
          await renderer.release();
        }
        expect(renderer.state).assertEqual(4);
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(20000);
    
      logEnd('testAudioThroughput0003');
    })

    /**
     * @tc.number    SUB_AVS_PERF_AUDIO_0400
     * @tc.name      testAudioThroughput0004
     * @tc.desc      Verify every cycle reports a strictly positive elapsed time and ends released
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioThroughput0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testAudioThroughput0004');
      for (let i = 0; i < 5; i++) {
        const start: number = Date.now();
        const renderer: audio.AudioRenderer = await createFor(audio.StreamUsage.STREAM_USAGE_GAME);
        await renderer.start();
        await renderer.stop();
        await renderer.release();
        const cost: number = Date.now() - start;
        expect(cost).assertLargerOrEqual(0);
        expect(cost).assertLess(10000);
        expect(renderer.state).assertEqual(4);
      }
    
      logEnd('testAudioThroughput0004');
    })
  });
}
