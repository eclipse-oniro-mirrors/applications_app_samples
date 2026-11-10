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
import { display } from '@kit.ArkUI';
import { audio } from '@kit.AudioKit';
import { media } from '@kit.MediaKit';
import { fileIo } from '@kit.CoreFileKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { paceTurn } from '../Shared/TestPace';
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';
import {
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

const DISPLAY_QUERIES: number = 1000;
const DISPLAY_BUDGET_MS: number = 3000;
const FILE_ROUNDS: number = 200;
const FILE_BUDGET_MS: number = 8000;
const AUDIO_ROUNDS: number = 10;
const AUDIO_BUDGET_MS: number = 8000;
const MEDIA_ROUNDS: number = 10;
const MEDIA_BUDGET_MS: number = 8000;
const VIEWPORT_ROUNDS: number = 10000;
const VIEWPORT_BUDGET_MS: number = 500;

function viewportHeight(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
}

export default function operationLatencyTest() {
  describe('operationLatencyTest', () => {
    beforeAll(() => {
      console.info('operationLatencyTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('operationLatencyTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_PERF_0100
     * @tc.name      testOperationLatency0001
     * @tc.desc      Verify many synchronous display queries complete within a bounded budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0001', 0, () => {
      const start: number = Date.now();
      let sample: display.Display = display.getDefaultDisplaySync();
      for (let i = 0; i < DISPLAY_QUERIES; i++) {
        sample = display.getDefaultDisplaySync();
      }
      const cost: number = Date.now() - start;
      expect(sample.width).assertLarger(0);
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(DISPLAY_BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0200
     * @tc.name      testOperationLatency0002
     * @tc.desc      Verify many file write and read round trips complete within a bounded budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0002', 0, () => {
      const path: string = pathInFiles(uniqueName('avs_perf_file', '.txt'));
      const payload: string = repeatPayload(64, 'perf');
      try {
        const start: number = Date.now();
        for (let i = 0; i < FILE_ROUNDS; i++) {
          writeTextFile(path, payload);
          expect(readTextFile(path, payload.length)).assertEqual(payload);
        }
        const cost: number = Date.now() - start;
        expect(cost).assertLargerOrEqual(0);
        expect(cost).assertLess(FILE_BUDGET_MS);
        expect(fileIo.statSync(path).size).assertEqual(payload.length);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_PERF_0300
     * @tc.name      testOperationLatency0003
     * @tc.desc      Verify repeated audio renderer creation and release stay within a bounded budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0003', 0, async () => {
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
      const start: number = Date.now();
      for (let i = 0; i < AUDIO_ROUNDS; i++) {
        const renderer: audio.AudioRenderer = await audio.createAudioRenderer({
          streamInfo: streamInfo,
          rendererInfo: rendererInfo
        });
        expect(renderer.state).assertEqual(audio.AudioState.STATE_PREPARED);
        await renderer.release();
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(AUDIO_BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0400
     * @tc.name      testOperationLatency0004
     * @tc.desc      Verify repeated AVPlayer creation and release stay within a bounded budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0004', 0, async () => {
      const start: number = Date.now();
      for (let i = 0; i < MEDIA_ROUNDS; i++) {
        const player: media.AVPlayer = await media.createAVPlayer();
        expect(player.state).assertEqual('idle');
        await player.release();
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(MEDIA_BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0500
     * @tc.name      testOperationLatency0005
     * @tc.desc      Verify the pure viewport height calculation stays within a bounded budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0005', 0, () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      let accumulator: number = 0;
      const start: number = Date.now();
      for (let i = 0; i < VIEWPORT_ROUNDS; i++) {
        accumulator += viewportHeight(screen.width + (i % 2));
      }
      const cost: number = Date.now() - start;
      expect(accumulator).assertLarger(0);
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(VIEWPORT_BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0600
     * @tc.name      testOperationLatency0006
     * @tc.desc      Verify creating unique sandbox names is fast enough for batch use
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0006', 0, () => {
      const start: number = Date.now();
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < 500; i++) {
        seen.add(uniqueName('avs_perf_name', '.txt'));
      }
      const cost: number = Date.now() - start;
      expect(seen.size).assertEqual(500);
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(2000);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0700
     * @tc.name      testOperationLatency0007
     * @tc.desc      Verify a single file create, write, read and delete completes within a local budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0007', 0, () => {
      const path: string = pathInFiles(uniqueName('avs_perf_single', '.txt'));
      const start: number = Date.now();
      try {
        writeTextFile(path, 'latency');
        expect(readTextFile(path, 7)).assertEqual('latency');
      } finally {
        removeQuietly(path);
      }
      const cost: number = Date.now() - start;
      expect(cost).assertLargerOrEqual(0);
      expect(cost).assertLess(2000);
    })

    /**
     * @tc.number    SUB_AVS_PERF_0800
     * @tc.name      testOperationLatency0008
     * @tc.desc      Verify the uptime clock advances by a plausible amount across a measured loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOperationLatency0008', 0, () => {
      const before: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      let accumulator: number = 0;
      for (let i = 0; i < 100000; i++) {
        accumulator += i % 7;
      }
      const after: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      expect(accumulator).assertLarger(0);
      expect(after).assertLargerOrEqual(before);
      expect(after - before).assertLess(2000);
    })
  });
}
