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

const TAG: string = '[Sample_audioSamplingRateCore]';
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

export default function audioSamplingRateCoreTest(): void {
  describe('audioSamplingRateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_RATE_0100
     * @tc.name      testAudioSamplingRate0001
     * @tc.desc      Verify audioSamplingRateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0200
     * @tc.name      testAudioSamplingRate0002
     * @tc.desc      Verify audioSamplingRateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0300
     * @tc.name      testAudioSamplingRate0003
     * @tc.desc      Verify audioSamplingRateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0400
     * @tc.name      testAudioSamplingRate0004
     * @tc.desc      Verify audioSamplingRateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0500
     * @tc.name      testAudioSamplingRate0005
     * @tc.desc      Verify audioSamplingRateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0600
     * @tc.name      testAudioSamplingRate0006
     * @tc.desc      Verify audioSamplingRateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0700
     * @tc.name      testAudioSamplingRate0007
     * @tc.desc      Verify audioSamplingRateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0800
     * @tc.name      testAudioSamplingRate0008
     * @tc.desc      Verify audioSamplingRateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_0900
     * @tc.name      testAudioSamplingRate0009
     * @tc.desc      Verify audioSamplingRateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1000
     * @tc.name      testAudioSamplingRate0010
     * @tc.desc      Verify audioSamplingRateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1100
     * @tc.name      testAudioSamplingRate0011
     * @tc.desc      Verify audioSamplingRateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1200
     * @tc.name      testAudioSamplingRate0012
     * @tc.desc      Verify audioSamplingRateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1300
     * @tc.name      testAudioSamplingRate0013
     * @tc.desc      Verify audioSamplingRateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1400
     * @tc.name      testAudioSamplingRate0014
     * @tc.desc      Verify audioSamplingRateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1500
     * @tc.name      testAudioSamplingRate0015
     * @tc.desc      Verify audioSamplingRateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1600
     * @tc.name      testAudioSamplingRate0016
     * @tc.desc      Verify audioSamplingRateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1700
     * @tc.name      testAudioSamplingRate0017
     * @tc.desc      Verify audioSamplingRateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1800
     * @tc.name      testAudioSamplingRate0018
     * @tc.desc      Verify audioSamplingRateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_1900
     * @tc.name      testAudioSamplingRate0019
     * @tc.desc      Verify audioSamplingRateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2000
     * @tc.name      testAudioSamplingRate0020
     * @tc.desc      Verify audioSamplingRateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2100
     * @tc.name      testAudioSamplingRate0021
     * @tc.desc      Verify audioSamplingRateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2200
     * @tc.name      testAudioSamplingRate0022
     * @tc.desc      Verify audioSamplingRateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2300
     * @tc.name      testAudioSamplingRate0023
     * @tc.desc      Verify audioSamplingRateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2400
     * @tc.name      testAudioSamplingRate0024
     * @tc.desc      Verify audioSamplingRateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2500
     * @tc.name      testAudioSamplingRate0025
     * @tc.desc      Verify audioSamplingRateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2600
     * @tc.name      testAudioSamplingRate0026
     * @tc.desc      Verify audioSamplingRateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2700
     * @tc.name      testAudioSamplingRate0027
     * @tc.desc      Verify audioSamplingRateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2800
     * @tc.name      testAudioSamplingRate0028
     * @tc.desc      Verify audioSamplingRateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_2900
     * @tc.name      testAudioSamplingRate0029
     * @tc.desc      Verify audioSamplingRateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3000
     * @tc.name      testAudioSamplingRate0030
     * @tc.desc      Verify audioSamplingRateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3100
     * @tc.name      testAudioSamplingRate0031
     * @tc.desc      Verify audioSamplingRateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3200
     * @tc.name      testAudioSamplingRate0032
     * @tc.desc      Verify audioSamplingRateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3300
     * @tc.name      testAudioSamplingRate0033
     * @tc.desc      Verify audioSamplingRateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3400
     * @tc.name      testAudioSamplingRate0034
     * @tc.desc      Verify audioSamplingRateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3500
     * @tc.name      testAudioSamplingRate0035
     * @tc.desc      Verify audioSamplingRateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3600
     * @tc.name      testAudioSamplingRate0036
     * @tc.desc      Verify audioSamplingRateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3700
     * @tc.name      testAudioSamplingRate0037
     * @tc.desc      Verify audioSamplingRateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3800
     * @tc.name      testAudioSamplingRate0038
     * @tc.desc      Verify audioSamplingRateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_3900
     * @tc.name      testAudioSamplingRate0039
     * @tc.desc      Verify audioSamplingRateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4000
     * @tc.name      testAudioSamplingRate0040
     * @tc.desc      Verify audioSamplingRateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4100
     * @tc.name      testAudioSamplingRate0041
     * @tc.desc      Verify audioSamplingRateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4200
     * @tc.name      testAudioSamplingRate0042
     * @tc.desc      Verify audioSamplingRateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4300
     * @tc.name      testAudioSamplingRate0043
     * @tc.desc      Verify audioSamplingRateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4400
     * @tc.name      testAudioSamplingRate0044
     * @tc.desc      Verify audioSamplingRateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4500
     * @tc.name      testAudioSamplingRate0045
     * @tc.desc      Verify audioSamplingRateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4600
     * @tc.name      testAudioSamplingRate0046
     * @tc.desc      Verify audioSamplingRateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4700
     * @tc.name      testAudioSamplingRate0047
     * @tc.desc      Verify audioSamplingRateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4800
     * @tc.name      testAudioSamplingRate0048
     * @tc.desc      Verify audioSamplingRateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_4900
     * @tc.name      testAudioSamplingRate0049
     * @tc.desc      Verify audioSamplingRateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5000
     * @tc.name      testAudioSamplingRate0050
     * @tc.desc      Verify audioSamplingRateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5100
     * @tc.name      testAudioSamplingRate0051
     * @tc.desc      Verify audioSamplingRateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5200
     * @tc.name      testAudioSamplingRate0052
     * @tc.desc      Verify audioSamplingRateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5300
     * @tc.name      testAudioSamplingRate0053
     * @tc.desc      Verify audioSamplingRateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5400
     * @tc.name      testAudioSamplingRate0054
     * @tc.desc      Verify audioSamplingRateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5500
     * @tc.name      testAudioSamplingRate0055
     * @tc.desc      Verify audioSamplingRateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5600
     * @tc.name      testAudioSamplingRate0056
     * @tc.desc      Verify audioSamplingRateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5700
     * @tc.name      testAudioSamplingRate0057
     * @tc.desc      Verify audioSamplingRateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5800
     * @tc.name      testAudioSamplingRate0058
     * @tc.desc      Verify audioSamplingRateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_5900
     * @tc.name      testAudioSamplingRate0059
     * @tc.desc      Verify audioSamplingRateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6000
     * @tc.name      testAudioSamplingRate0060
     * @tc.desc      Verify audioSamplingRateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6100
     * @tc.name      testAudioSamplingRate0061
     * @tc.desc      Verify audioSamplingRateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6200
     * @tc.name      testAudioSamplingRate0062
     * @tc.desc      Verify audioSamplingRateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6300
     * @tc.name      testAudioSamplingRate0063
     * @tc.desc      Verify audioSamplingRateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6400
     * @tc.name      testAudioSamplingRate0064
     * @tc.desc      Verify audioSamplingRateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6500
     * @tc.name      testAudioSamplingRate0065
     * @tc.desc      Verify audioSamplingRateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6600
     * @tc.name      testAudioSamplingRate0066
     * @tc.desc      Verify audioSamplingRateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6700
     * @tc.name      testAudioSamplingRate0067
     * @tc.desc      Verify audioSamplingRateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6800
     * @tc.name      testAudioSamplingRate0068
     * @tc.desc      Verify audioSamplingRateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_6900
     * @tc.name      testAudioSamplingRate0069
     * @tc.desc      Verify audioSamplingRateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7000
     * @tc.name      testAudioSamplingRate0070
     * @tc.desc      Verify audioSamplingRateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7100
     * @tc.name      testAudioSamplingRate0071
     * @tc.desc      Verify audioSamplingRateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7200
     * @tc.name      testAudioSamplingRate0072
     * @tc.desc      Verify audioSamplingRateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7300
     * @tc.name      testAudioSamplingRate0073
     * @tc.desc      Verify audioSamplingRateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[0]).assertEqual(expected[0]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7400
     * @tc.name      testAudioSamplingRate0074
     * @tc.desc      Verify audioSamplingRateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[1]).assertEqual(expected[1]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7500
     * @tc.name      testAudioSamplingRate0075
     * @tc.desc      Verify audioSamplingRateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[2]).assertEqual(expected[2]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7600
     * @tc.name      testAudioSamplingRate0076
     * @tc.desc      Verify audioSamplingRateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[3]).assertEqual(expected[3]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7700
     * @tc.name      testAudioSamplingRate0077
     * @tc.desc      Verify audioSamplingRateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[4]).assertEqual(expected[4]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7800
     * @tc.name      testAudioSamplingRate0078
     * @tc.desc      Verify audioSamplingRateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[5]).assertEqual(expected[5]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_7900
     * @tc.name      testAudioSamplingRate0079
     * @tc.desc      Verify audioSamplingRateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[6]).assertEqual(expected[6]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_8000
     * @tc.name      testAudioSamplingRate0080
     * @tc.desc      Verify audioSamplingRateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[7]).assertEqual(expected[7]);
      expect(values.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_8100
     * @tc.name      testAudioSamplingRate0081
     * @tc.desc      Verify audioSamplingRateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAudioSamplingRate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: number[] = [AudioSamplingRate.SAMPLE_RATE_8000, AudioSamplingRate.SAMPLE_RATE_11025,
        AudioSamplingRate.SAMPLE_RATE_16000, AudioSamplingRate.SAMPLE_RATE_22050,
        AudioSamplingRate.SAMPLE_RATE_24000, AudioSamplingRate.SAMPLE_RATE_32000,
        AudioSamplingRate.SAMPLE_RATE_44100, AudioSamplingRate.SAMPLE_RATE_48000,
        AudioSamplingRate.SAMPLE_RATE_96000];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(values[8]).assertEqual(expected[8]);
      expect(values.length).assertEqual(9);
    });

  });
}
