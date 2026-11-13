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

const TAG: string = '[Sample_audioSampleFormatCore]';
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

export default function audioSampleFormatCoreTest(): void {
  describe('audioSampleFormatCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0100
     * @tc.name      testAudioSampleFormat0001
     * @tc.desc      Verify audioSampleFormatCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0200
     * @tc.name      testAudioSampleFormat0002
     * @tc.desc      Verify audioSampleFormatCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0300
     * @tc.name      testAudioSampleFormat0003
     * @tc.desc      Verify audioSampleFormatCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0400
     * @tc.name      testAudioSampleFormat0004
     * @tc.desc      Verify audioSampleFormatCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0500
     * @tc.name      testAudioSampleFormat0005
     * @tc.desc      Verify audioSampleFormatCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0600
     * @tc.name      testAudioSampleFormat0006
     * @tc.desc      Verify audioSampleFormatCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0700
     * @tc.name      testAudioSampleFormat0007
     * @tc.desc      Verify audioSampleFormatCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0800
     * @tc.name      testAudioSampleFormat0008
     * @tc.desc      Verify audioSampleFormatCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_0900
     * @tc.name      testAudioSampleFormat0009
     * @tc.desc      Verify audioSampleFormatCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1000
     * @tc.name      testAudioSampleFormat0010
     * @tc.desc      Verify audioSampleFormatCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1100
     * @tc.name      testAudioSampleFormat0011
     * @tc.desc      Verify audioSampleFormatCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1200
     * @tc.name      testAudioSampleFormat0012
     * @tc.desc      Verify audioSampleFormatCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1300
     * @tc.name      testAudioSampleFormat0013
     * @tc.desc      Verify audioSampleFormatCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1400
     * @tc.name      testAudioSampleFormat0014
     * @tc.desc      Verify audioSampleFormatCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1500
     * @tc.name      testAudioSampleFormat0015
     * @tc.desc      Verify audioSampleFormatCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1600
     * @tc.name      testAudioSampleFormat0016
     * @tc.desc      Verify audioSampleFormatCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1700
     * @tc.name      testAudioSampleFormat0017
     * @tc.desc      Verify audioSampleFormatCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1800
     * @tc.name      testAudioSampleFormat0018
     * @tc.desc      Verify audioSampleFormatCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_1900
     * @tc.name      testAudioSampleFormat0019
     * @tc.desc      Verify audioSampleFormatCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2000
     * @tc.name      testAudioSampleFormat0020
     * @tc.desc      Verify audioSampleFormatCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2100
     * @tc.name      testAudioSampleFormat0021
     * @tc.desc      Verify audioSampleFormatCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2200
     * @tc.name      testAudioSampleFormat0022
     * @tc.desc      Verify audioSampleFormatCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2300
     * @tc.name      testAudioSampleFormat0023
     * @tc.desc      Verify audioSampleFormatCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2400
     * @tc.name      testAudioSampleFormat0024
     * @tc.desc      Verify audioSampleFormatCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2500
     * @tc.name      testAudioSampleFormat0025
     * @tc.desc      Verify audioSampleFormatCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2600
     * @tc.name      testAudioSampleFormat0026
     * @tc.desc      Verify audioSampleFormatCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2700
     * @tc.name      testAudioSampleFormat0027
     * @tc.desc      Verify audioSampleFormatCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2800
     * @tc.name      testAudioSampleFormat0028
     * @tc.desc      Verify audioSampleFormatCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_2900
     * @tc.name      testAudioSampleFormat0029
     * @tc.desc      Verify audioSampleFormatCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3000
     * @tc.name      testAudioSampleFormat0030
     * @tc.desc      Verify audioSampleFormatCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3100
     * @tc.name      testAudioSampleFormat0031
     * @tc.desc      Verify audioSampleFormatCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3200
     * @tc.name      testAudioSampleFormat0032
     * @tc.desc      Verify audioSampleFormatCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3300
     * @tc.name      testAudioSampleFormat0033
     * @tc.desc      Verify audioSampleFormatCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3400
     * @tc.name      testAudioSampleFormat0034
     * @tc.desc      Verify audioSampleFormatCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3500
     * @tc.name      testAudioSampleFormat0035
     * @tc.desc      Verify audioSampleFormatCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3600
     * @tc.name      testAudioSampleFormat0036
     * @tc.desc      Verify audioSampleFormatCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3700
     * @tc.name      testAudioSampleFormat0037
     * @tc.desc      Verify audioSampleFormatCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3800
     * @tc.name      testAudioSampleFormat0038
     * @tc.desc      Verify audioSampleFormatCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_3900
     * @tc.name      testAudioSampleFormat0039
     * @tc.desc      Verify audioSampleFormatCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4000
     * @tc.name      testAudioSampleFormat0040
     * @tc.desc      Verify audioSampleFormatCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4100
     * @tc.name      testAudioSampleFormat0041
     * @tc.desc      Verify audioSampleFormatCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4200
     * @tc.name      testAudioSampleFormat0042
     * @tc.desc      Verify audioSampleFormatCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4300
     * @tc.name      testAudioSampleFormat0043
     * @tc.desc      Verify audioSampleFormatCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4400
     * @tc.name      testAudioSampleFormat0044
     * @tc.desc      Verify audioSampleFormatCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4500
     * @tc.name      testAudioSampleFormat0045
     * @tc.desc      Verify audioSampleFormatCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4600
     * @tc.name      testAudioSampleFormat0046
     * @tc.desc      Verify audioSampleFormatCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4700
     * @tc.name      testAudioSampleFormat0047
     * @tc.desc      Verify audioSampleFormatCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4800
     * @tc.name      testAudioSampleFormat0048
     * @tc.desc      Verify audioSampleFormatCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_4900
     * @tc.name      testAudioSampleFormat0049
     * @tc.desc      Verify audioSampleFormatCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5000
     * @tc.name      testAudioSampleFormat0050
     * @tc.desc      Verify audioSampleFormatCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5100
     * @tc.name      testAudioSampleFormat0051
     * @tc.desc      Verify audioSampleFormatCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5200
     * @tc.name      testAudioSampleFormat0052
     * @tc.desc      Verify audioSampleFormatCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5300
     * @tc.name      testAudioSampleFormat0053
     * @tc.desc      Verify audioSampleFormatCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5400
     * @tc.name      testAudioSampleFormat0054
     * @tc.desc      Verify audioSampleFormatCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5500
     * @tc.name      testAudioSampleFormat0055
     * @tc.desc      Verify audioSampleFormatCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5600
     * @tc.name      testAudioSampleFormat0056
     * @tc.desc      Verify audioSampleFormatCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5700
     * @tc.name      testAudioSampleFormat0057
     * @tc.desc      Verify audioSampleFormatCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5800
     * @tc.name      testAudioSampleFormat0058
     * @tc.desc      Verify audioSampleFormatCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_5900
     * @tc.name      testAudioSampleFormat0059
     * @tc.desc      Verify audioSampleFormatCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6000
     * @tc.name      testAudioSampleFormat0060
     * @tc.desc      Verify audioSampleFormatCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6100
     * @tc.name      testAudioSampleFormat0061
     * @tc.desc      Verify audioSampleFormatCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6200
     * @tc.name      testAudioSampleFormat0062
     * @tc.desc      Verify audioSampleFormatCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6300
     * @tc.name      testAudioSampleFormat0063
     * @tc.desc      Verify audioSampleFormatCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6400
     * @tc.name      testAudioSampleFormat0064
     * @tc.desc      Verify audioSampleFormatCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6500
     * @tc.name      testAudioSampleFormat0065
     * @tc.desc      Verify audioSampleFormatCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6600
     * @tc.name      testAudioSampleFormat0066
     * @tc.desc      Verify audioSampleFormatCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6700
     * @tc.name      testAudioSampleFormat0067
     * @tc.desc      Verify audioSampleFormatCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6800
     * @tc.name      testAudioSampleFormat0068
     * @tc.desc      Verify audioSampleFormatCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_6900
     * @tc.name      testAudioSampleFormat0069
     * @tc.desc      Verify audioSampleFormatCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7000
     * @tc.name      testAudioSampleFormat0070
     * @tc.desc      Verify audioSampleFormatCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7100
     * @tc.name      testAudioSampleFormat0071
     * @tc.desc      Verify audioSampleFormatCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7200
     * @tc.name      testAudioSampleFormat0072
     * @tc.desc      Verify audioSampleFormatCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7300
     * @tc.name      testAudioSampleFormat0073
     * @tc.desc      Verify audioSampleFormatCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7400
     * @tc.name      testAudioSampleFormat0074
     * @tc.desc      Verify audioSampleFormatCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7500
     * @tc.name      testAudioSampleFormat0075
     * @tc.desc      Verify audioSampleFormatCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7600
     * @tc.name      testAudioSampleFormat0076
     * @tc.desc      Verify audioSampleFormatCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7700
     * @tc.name      testAudioSampleFormat0077
     * @tc.desc      Verify audioSampleFormatCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7800
     * @tc.name      testAudioSampleFormat0078
     * @tc.desc      Verify audioSampleFormatCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_7900
     * @tc.name      testAudioSampleFormat0079
     * @tc.desc      Verify audioSampleFormatCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_8000
     * @tc.name      testAudioSampleFormat0080
     * @tc.desc      Verify audioSampleFormatCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_8100
     * @tc.name      testAudioSampleFormat0081
     * @tc.desc      Verify audioSampleFormatCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSampleFormat0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSampleFormat.U8, AudioSampleFormat.S16LE, AudioSampleFormat.S24LE,
        AudioSampleFormat.S32LE, AudioSampleFormat.F32LE];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(5);
    });

  });
}
