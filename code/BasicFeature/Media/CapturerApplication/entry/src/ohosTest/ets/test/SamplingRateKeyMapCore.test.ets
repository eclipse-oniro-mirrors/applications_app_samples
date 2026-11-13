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
import {
  SAMPLING_RATE_KEY_MAP, CHANNEL_KEY_MAP, SOURCE_TYPE_KEY_MAP, SAMPLE_FORMAT_KEY_MAP,
  SAMPLING_RATE_OPTIONS, CHANNEL_OPTIONS, SOURCE_TYPE_OPTIONS, SAMPLE_FORMAT_OPTIONS
} from '../../../main/ets/common/constants/SelectConstants';

const TAG: string = '[Sample_samplingRateKeyMapCore]';
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

export default function samplingRateKeyMapCoreTest(): void {
  describe('samplingRateKeyMapCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0100
     * @tc.name      testSamplingRateKeyMap0001
     * @tc.desc      Verify samplingRateKeyMapCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0200
     * @tc.name      testSamplingRateKeyMap0002
     * @tc.desc      Verify samplingRateKeyMapCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0300
     * @tc.name      testSamplingRateKeyMap0003
     * @tc.desc      Verify samplingRateKeyMapCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0400
     * @tc.name      testSamplingRateKeyMap0004
     * @tc.desc      Verify samplingRateKeyMapCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0500
     * @tc.name      testSamplingRateKeyMap0005
     * @tc.desc      Verify samplingRateKeyMapCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0600
     * @tc.name      testSamplingRateKeyMap0006
     * @tc.desc      Verify samplingRateKeyMapCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0700
     * @tc.name      testSamplingRateKeyMap0007
     * @tc.desc      Verify samplingRateKeyMapCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0800
     * @tc.name      testSamplingRateKeyMap0008
     * @tc.desc      Verify samplingRateKeyMapCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_0900
     * @tc.name      testSamplingRateKeyMap0009
     * @tc.desc      Verify samplingRateKeyMapCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1000
     * @tc.name      testSamplingRateKeyMap0010
     * @tc.desc      Verify samplingRateKeyMapCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1100
     * @tc.name      testSamplingRateKeyMap0011
     * @tc.desc      Verify samplingRateKeyMapCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1200
     * @tc.name      testSamplingRateKeyMap0012
     * @tc.desc      Verify samplingRateKeyMapCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1300
     * @tc.name      testSamplingRateKeyMap0013
     * @tc.desc      Verify samplingRateKeyMapCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1400
     * @tc.name      testSamplingRateKeyMap0014
     * @tc.desc      Verify samplingRateKeyMapCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1500
     * @tc.name      testSamplingRateKeyMap0015
     * @tc.desc      Verify samplingRateKeyMapCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1600
     * @tc.name      testSamplingRateKeyMap0016
     * @tc.desc      Verify samplingRateKeyMapCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1700
     * @tc.name      testSamplingRateKeyMap0017
     * @tc.desc      Verify samplingRateKeyMapCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1800
     * @tc.name      testSamplingRateKeyMap0018
     * @tc.desc      Verify samplingRateKeyMapCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_1900
     * @tc.name      testSamplingRateKeyMap0019
     * @tc.desc      Verify samplingRateKeyMapCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2000
     * @tc.name      testSamplingRateKeyMap0020
     * @tc.desc      Verify samplingRateKeyMapCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2100
     * @tc.name      testSamplingRateKeyMap0021
     * @tc.desc      Verify samplingRateKeyMapCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2200
     * @tc.name      testSamplingRateKeyMap0022
     * @tc.desc      Verify samplingRateKeyMapCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2300
     * @tc.name      testSamplingRateKeyMap0023
     * @tc.desc      Verify samplingRateKeyMapCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2400
     * @tc.name      testSamplingRateKeyMap0024
     * @tc.desc      Verify samplingRateKeyMapCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2500
     * @tc.name      testSamplingRateKeyMap0025
     * @tc.desc      Verify samplingRateKeyMapCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2600
     * @tc.name      testSamplingRateKeyMap0026
     * @tc.desc      Verify samplingRateKeyMapCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2700
     * @tc.name      testSamplingRateKeyMap0027
     * @tc.desc      Verify samplingRateKeyMapCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2800
     * @tc.name      testSamplingRateKeyMap0028
     * @tc.desc      Verify samplingRateKeyMapCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_2900
     * @tc.name      testSamplingRateKeyMap0029
     * @tc.desc      Verify samplingRateKeyMapCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3000
     * @tc.name      testSamplingRateKeyMap0030
     * @tc.desc      Verify samplingRateKeyMapCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3100
     * @tc.name      testSamplingRateKeyMap0031
     * @tc.desc      Verify samplingRateKeyMapCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3200
     * @tc.name      testSamplingRateKeyMap0032
     * @tc.desc      Verify samplingRateKeyMapCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3300
     * @tc.name      testSamplingRateKeyMap0033
     * @tc.desc      Verify samplingRateKeyMapCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3400
     * @tc.name      testSamplingRateKeyMap0034
     * @tc.desc      Verify samplingRateKeyMapCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3500
     * @tc.name      testSamplingRateKeyMap0035
     * @tc.desc      Verify samplingRateKeyMapCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3600
     * @tc.name      testSamplingRateKeyMap0036
     * @tc.desc      Verify samplingRateKeyMapCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3700
     * @tc.name      testSamplingRateKeyMap0037
     * @tc.desc      Verify samplingRateKeyMapCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3800
     * @tc.name      testSamplingRateKeyMap0038
     * @tc.desc      Verify samplingRateKeyMapCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_3900
     * @tc.name      testSamplingRateKeyMap0039
     * @tc.desc      Verify samplingRateKeyMapCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4000
     * @tc.name      testSamplingRateKeyMap0040
     * @tc.desc      Verify samplingRateKeyMapCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4100
     * @tc.name      testSamplingRateKeyMap0041
     * @tc.desc      Verify samplingRateKeyMapCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4200
     * @tc.name      testSamplingRateKeyMap0042
     * @tc.desc      Verify samplingRateKeyMapCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4300
     * @tc.name      testSamplingRateKeyMap0043
     * @tc.desc      Verify samplingRateKeyMapCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4400
     * @tc.name      testSamplingRateKeyMap0044
     * @tc.desc      Verify samplingRateKeyMapCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4500
     * @tc.name      testSamplingRateKeyMap0045
     * @tc.desc      Verify samplingRateKeyMapCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4600
     * @tc.name      testSamplingRateKeyMap0046
     * @tc.desc      Verify samplingRateKeyMapCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4700
     * @tc.name      testSamplingRateKeyMap0047
     * @tc.desc      Verify samplingRateKeyMapCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4800
     * @tc.name      testSamplingRateKeyMap0048
     * @tc.desc      Verify samplingRateKeyMapCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_4900
     * @tc.name      testSamplingRateKeyMap0049
     * @tc.desc      Verify samplingRateKeyMapCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5000
     * @tc.name      testSamplingRateKeyMap0050
     * @tc.desc      Verify samplingRateKeyMapCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5100
     * @tc.name      testSamplingRateKeyMap0051
     * @tc.desc      Verify samplingRateKeyMapCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5200
     * @tc.name      testSamplingRateKeyMap0052
     * @tc.desc      Verify samplingRateKeyMapCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5300
     * @tc.name      testSamplingRateKeyMap0053
     * @tc.desc      Verify samplingRateKeyMapCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5400
     * @tc.name      testSamplingRateKeyMap0054
     * @tc.desc      Verify samplingRateKeyMapCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5500
     * @tc.name      testSamplingRateKeyMap0055
     * @tc.desc      Verify samplingRateKeyMapCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5600
     * @tc.name      testSamplingRateKeyMap0056
     * @tc.desc      Verify samplingRateKeyMapCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5700
     * @tc.name      testSamplingRateKeyMap0057
     * @tc.desc      Verify samplingRateKeyMapCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5800
     * @tc.name      testSamplingRateKeyMap0058
     * @tc.desc      Verify samplingRateKeyMapCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_5900
     * @tc.name      testSamplingRateKeyMap0059
     * @tc.desc      Verify samplingRateKeyMapCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6000
     * @tc.name      testSamplingRateKeyMap0060
     * @tc.desc      Verify samplingRateKeyMapCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6100
     * @tc.name      testSamplingRateKeyMap0061
     * @tc.desc      Verify samplingRateKeyMapCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6200
     * @tc.name      testSamplingRateKeyMap0062
     * @tc.desc      Verify samplingRateKeyMapCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6300
     * @tc.name      testSamplingRateKeyMap0063
     * @tc.desc      Verify samplingRateKeyMapCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6400
     * @tc.name      testSamplingRateKeyMap0064
     * @tc.desc      Verify samplingRateKeyMapCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6500
     * @tc.name      testSamplingRateKeyMap0065
     * @tc.desc      Verify samplingRateKeyMapCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6600
     * @tc.name      testSamplingRateKeyMap0066
     * @tc.desc      Verify samplingRateKeyMapCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6700
     * @tc.name      testSamplingRateKeyMap0067
     * @tc.desc      Verify samplingRateKeyMapCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6800
     * @tc.name      testSamplingRateKeyMap0068
     * @tc.desc      Verify samplingRateKeyMapCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_6900
     * @tc.name      testSamplingRateKeyMap0069
     * @tc.desc      Verify samplingRateKeyMapCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7000
     * @tc.name      testSamplingRateKeyMap0070
     * @tc.desc      Verify samplingRateKeyMapCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7100
     * @tc.name      testSamplingRateKeyMap0071
     * @tc.desc      Verify samplingRateKeyMapCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7200
     * @tc.name      testSamplingRateKeyMap0072
     * @tc.desc      Verify samplingRateKeyMapCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7300
     * @tc.name      testSamplingRateKeyMap0073
     * @tc.desc      Verify samplingRateKeyMapCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7400
     * @tc.name      testSamplingRateKeyMap0074
     * @tc.desc      Verify samplingRateKeyMapCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7500
     * @tc.name      testSamplingRateKeyMap0075
     * @tc.desc      Verify samplingRateKeyMapCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7600
     * @tc.name      testSamplingRateKeyMap0076
     * @tc.desc      Verify samplingRateKeyMapCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7700
     * @tc.name      testSamplingRateKeyMap0077
     * @tc.desc      Verify samplingRateKeyMapCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7800
     * @tc.name      testSamplingRateKeyMap0078
     * @tc.desc      Verify samplingRateKeyMapCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_7900
     * @tc.name      testSamplingRateKeyMap0079
     * @tc.desc      Verify samplingRateKeyMapCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_8000
     * @tc.name      testSamplingRateKeyMap0080
     * @tc.desc      Verify samplingRateKeyMapCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(9);
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_MAP_8100
     * @tc.name      testSamplingRateKeyMap0081
     * @tc.desc      Verify samplingRateKeyMapCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateKeyMap0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      const expected: number[] = [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 96000];
      expect(SAMPLING_RATE_KEY_MAP[keys[8]]).assertEqual(expected[8]);
      expect(keys.length).assertEqual(9);
    });

  });
}
