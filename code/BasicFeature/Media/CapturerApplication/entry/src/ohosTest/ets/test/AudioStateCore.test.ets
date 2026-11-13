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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AudioSourceType, AudioSamplingRate, AudioChannel, AudioSampleFormat, InterruptHintType, AudioState, SECOND_BUFFER_WALK } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioStateCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function audioStateCoreTest(): void {
  describe('audioStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_STATE_0100
     * @tc.name      testAudioState0001
     * @tc.desc      Verify audioStateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0200
     * @tc.name      testAudioState0002
     * @tc.desc      Verify audioStateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0300
     * @tc.name      testAudioState0003
     * @tc.desc      Verify audioStateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0400
     * @tc.name      testAudioState0004
     * @tc.desc      Verify audioStateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0500
     * @tc.name      testAudioState0005
     * @tc.desc      Verify audioStateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0600
     * @tc.name      testAudioState0006
     * @tc.desc      Verify audioStateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0700
     * @tc.name      testAudioState0007
     * @tc.desc      Verify audioStateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0800
     * @tc.name      testAudioState0008
     * @tc.desc      Verify audioStateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_0900
     * @tc.name      testAudioState0009
     * @tc.desc      Verify audioStateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1000
     * @tc.name      testAudioState0010
     * @tc.desc      Verify audioStateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1100
     * @tc.name      testAudioState0011
     * @tc.desc      Verify audioStateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1200
     * @tc.name      testAudioState0012
     * @tc.desc      Verify audioStateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1300
     * @tc.name      testAudioState0013
     * @tc.desc      Verify audioStateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1400
     * @tc.name      testAudioState0014
     * @tc.desc      Verify audioStateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1500
     * @tc.name      testAudioState0015
     * @tc.desc      Verify audioStateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1600
     * @tc.name      testAudioState0016
     * @tc.desc      Verify audioStateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1700
     * @tc.name      testAudioState0017
     * @tc.desc      Verify audioStateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1800
     * @tc.name      testAudioState0018
     * @tc.desc      Verify audioStateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_1900
     * @tc.name      testAudioState0019
     * @tc.desc      Verify audioStateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2000
     * @tc.name      testAudioState0020
     * @tc.desc      Verify audioStateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2100
     * @tc.name      testAudioState0021
     * @tc.desc      Verify audioStateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2200
     * @tc.name      testAudioState0022
     * @tc.desc      Verify audioStateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2300
     * @tc.name      testAudioState0023
     * @tc.desc      Verify audioStateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2400
     * @tc.name      testAudioState0024
     * @tc.desc      Verify audioStateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2500
     * @tc.name      testAudioState0025
     * @tc.desc      Verify audioStateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2600
     * @tc.name      testAudioState0026
     * @tc.desc      Verify audioStateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2700
     * @tc.name      testAudioState0027
     * @tc.desc      Verify audioStateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2800
     * @tc.name      testAudioState0028
     * @tc.desc      Verify audioStateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_2900
     * @tc.name      testAudioState0029
     * @tc.desc      Verify audioStateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3000
     * @tc.name      testAudioState0030
     * @tc.desc      Verify audioStateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3100
     * @tc.name      testAudioState0031
     * @tc.desc      Verify audioStateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3200
     * @tc.name      testAudioState0032
     * @tc.desc      Verify audioStateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3300
     * @tc.name      testAudioState0033
     * @tc.desc      Verify audioStateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3400
     * @tc.name      testAudioState0034
     * @tc.desc      Verify audioStateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3500
     * @tc.name      testAudioState0035
     * @tc.desc      Verify audioStateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3600
     * @tc.name      testAudioState0036
     * @tc.desc      Verify audioStateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3700
     * @tc.name      testAudioState0037
     * @tc.desc      Verify audioStateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3800
     * @tc.name      testAudioState0038
     * @tc.desc      Verify audioStateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_3900
     * @tc.name      testAudioState0039
     * @tc.desc      Verify audioStateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4000
     * @tc.name      testAudioState0040
     * @tc.desc      Verify audioStateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4100
     * @tc.name      testAudioState0041
     * @tc.desc      Verify audioStateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4200
     * @tc.name      testAudioState0042
     * @tc.desc      Verify audioStateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4300
     * @tc.name      testAudioState0043
     * @tc.desc      Verify audioStateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4400
     * @tc.name      testAudioState0044
     * @tc.desc      Verify audioStateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4500
     * @tc.name      testAudioState0045
     * @tc.desc      Verify audioStateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4600
     * @tc.name      testAudioState0046
     * @tc.desc      Verify audioStateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4700
     * @tc.name      testAudioState0047
     * @tc.desc      Verify audioStateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4800
     * @tc.name      testAudioState0048
     * @tc.desc      Verify audioStateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_4900
     * @tc.name      testAudioState0049
     * @tc.desc      Verify audioStateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5000
     * @tc.name      testAudioState0050
     * @tc.desc      Verify audioStateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5100
     * @tc.name      testAudioState0051
     * @tc.desc      Verify audioStateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5200
     * @tc.name      testAudioState0052
     * @tc.desc      Verify audioStateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5300
     * @tc.name      testAudioState0053
     * @tc.desc      Verify audioStateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5400
     * @tc.name      testAudioState0054
     * @tc.desc      Verify audioStateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5500
     * @tc.name      testAudioState0055
     * @tc.desc      Verify audioStateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5600
     * @tc.name      testAudioState0056
     * @tc.desc      Verify audioStateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5700
     * @tc.name      testAudioState0057
     * @tc.desc      Verify audioStateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5800
     * @tc.name      testAudioState0058
     * @tc.desc      Verify audioStateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_5900
     * @tc.name      testAudioState0059
     * @tc.desc      Verify audioStateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6000
     * @tc.name      testAudioState0060
     * @tc.desc      Verify audioStateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6100
     * @tc.name      testAudioState0061
     * @tc.desc      Verify audioStateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6200
     * @tc.name      testAudioState0062
     * @tc.desc      Verify audioStateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6300
     * @tc.name      testAudioState0063
     * @tc.desc      Verify audioStateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6400
     * @tc.name      testAudioState0064
     * @tc.desc      Verify audioStateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6500
     * @tc.name      testAudioState0065
     * @tc.desc      Verify audioStateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6600
     * @tc.name      testAudioState0066
     * @tc.desc      Verify audioStateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6700
     * @tc.name      testAudioState0067
     * @tc.desc      Verify audioStateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6800
     * @tc.name      testAudioState0068
     * @tc.desc      Verify audioStateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_6900
     * @tc.name      testAudioState0069
     * @tc.desc      Verify audioStateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7000
     * @tc.name      testAudioState0070
     * @tc.desc      Verify audioStateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7100
     * @tc.name      testAudioState0071
     * @tc.desc      Verify audioStateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7200
     * @tc.name      testAudioState0072
     * @tc.desc      Verify audioStateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7300
     * @tc.name      testAudioState0073
     * @tc.desc      Verify audioStateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7400
     * @tc.name      testAudioState0074
     * @tc.desc      Verify audioStateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7500
     * @tc.name      testAudioState0075
     * @tc.desc      Verify audioStateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7600
     * @tc.name      testAudioState0076
     * @tc.desc      Verify audioStateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7700
     * @tc.name      testAudioState0077
     * @tc.desc      Verify audioStateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7800
     * @tc.name      testAudioState0078
     * @tc.desc      Verify audioStateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_7900
     * @tc.name      testAudioState0079
     * @tc.desc      Verify audioStateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_8000
     * @tc.name      testAudioState0080
     * @tc.desc      Verify audioStateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_STATE_8100
     * @tc.name      testAudioState0081
     * @tc.desc      Verify audioStateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioState0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioState.RUNNING, AudioState.PAUSED, AudioState.STOPPED,
        AudioState.MUTED, AudioState.UNMUTED];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

  });
}
