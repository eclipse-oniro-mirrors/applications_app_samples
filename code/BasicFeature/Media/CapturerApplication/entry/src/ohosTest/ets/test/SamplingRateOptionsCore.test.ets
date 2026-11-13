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

const TAG: string = '[Sample_samplingRateOptionsCore]';
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

export default function samplingRateOptionsCoreTest(): void {
  describe('samplingRateOptionsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0100
     * @tc.name      testSamplingRateOptions0001
     * @tc.desc      Verify samplingRateOptionsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0200
     * @tc.name      testSamplingRateOptions0002
     * @tc.desc      Verify samplingRateOptionsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0300
     * @tc.name      testSamplingRateOptions0003
     * @tc.desc      Verify samplingRateOptionsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0400
     * @tc.name      testSamplingRateOptions0004
     * @tc.desc      Verify samplingRateOptionsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0500
     * @tc.name      testSamplingRateOptions0005
     * @tc.desc      Verify samplingRateOptionsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0600
     * @tc.name      testSamplingRateOptions0006
     * @tc.desc      Verify samplingRateOptionsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0700
     * @tc.name      testSamplingRateOptions0007
     * @tc.desc      Verify samplingRateOptionsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0800
     * @tc.name      testSamplingRateOptions0008
     * @tc.desc      Verify samplingRateOptionsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_0900
     * @tc.name      testSamplingRateOptions0009
     * @tc.desc      Verify samplingRateOptionsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1000
     * @tc.name      testSamplingRateOptions0010
     * @tc.desc      Verify samplingRateOptionsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1100
     * @tc.name      testSamplingRateOptions0011
     * @tc.desc      Verify samplingRateOptionsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1200
     * @tc.name      testSamplingRateOptions0012
     * @tc.desc      Verify samplingRateOptionsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1300
     * @tc.name      testSamplingRateOptions0013
     * @tc.desc      Verify samplingRateOptionsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1400
     * @tc.name      testSamplingRateOptions0014
     * @tc.desc      Verify samplingRateOptionsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1500
     * @tc.name      testSamplingRateOptions0015
     * @tc.desc      Verify samplingRateOptionsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1600
     * @tc.name      testSamplingRateOptions0016
     * @tc.desc      Verify samplingRateOptionsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1700
     * @tc.name      testSamplingRateOptions0017
     * @tc.desc      Verify samplingRateOptionsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1800
     * @tc.name      testSamplingRateOptions0018
     * @tc.desc      Verify samplingRateOptionsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_1900
     * @tc.name      testSamplingRateOptions0019
     * @tc.desc      Verify samplingRateOptionsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2000
     * @tc.name      testSamplingRateOptions0020
     * @tc.desc      Verify samplingRateOptionsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2100
     * @tc.name      testSamplingRateOptions0021
     * @tc.desc      Verify samplingRateOptionsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2200
     * @tc.name      testSamplingRateOptions0022
     * @tc.desc      Verify samplingRateOptionsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2300
     * @tc.name      testSamplingRateOptions0023
     * @tc.desc      Verify samplingRateOptionsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2400
     * @tc.name      testSamplingRateOptions0024
     * @tc.desc      Verify samplingRateOptionsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2500
     * @tc.name      testSamplingRateOptions0025
     * @tc.desc      Verify samplingRateOptionsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2600
     * @tc.name      testSamplingRateOptions0026
     * @tc.desc      Verify samplingRateOptionsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2700
     * @tc.name      testSamplingRateOptions0027
     * @tc.desc      Verify samplingRateOptionsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2800
     * @tc.name      testSamplingRateOptions0028
     * @tc.desc      Verify samplingRateOptionsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_2900
     * @tc.name      testSamplingRateOptions0029
     * @tc.desc      Verify samplingRateOptionsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3000
     * @tc.name      testSamplingRateOptions0030
     * @tc.desc      Verify samplingRateOptionsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3100
     * @tc.name      testSamplingRateOptions0031
     * @tc.desc      Verify samplingRateOptionsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3200
     * @tc.name      testSamplingRateOptions0032
     * @tc.desc      Verify samplingRateOptionsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3300
     * @tc.name      testSamplingRateOptions0033
     * @tc.desc      Verify samplingRateOptionsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3400
     * @tc.name      testSamplingRateOptions0034
     * @tc.desc      Verify samplingRateOptionsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3500
     * @tc.name      testSamplingRateOptions0035
     * @tc.desc      Verify samplingRateOptionsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3600
     * @tc.name      testSamplingRateOptions0036
     * @tc.desc      Verify samplingRateOptionsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3700
     * @tc.name      testSamplingRateOptions0037
     * @tc.desc      Verify samplingRateOptionsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3800
     * @tc.name      testSamplingRateOptions0038
     * @tc.desc      Verify samplingRateOptionsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_3900
     * @tc.name      testSamplingRateOptions0039
     * @tc.desc      Verify samplingRateOptionsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4000
     * @tc.name      testSamplingRateOptions0040
     * @tc.desc      Verify samplingRateOptionsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4100
     * @tc.name      testSamplingRateOptions0041
     * @tc.desc      Verify samplingRateOptionsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4200
     * @tc.name      testSamplingRateOptions0042
     * @tc.desc      Verify samplingRateOptionsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4300
     * @tc.name      testSamplingRateOptions0043
     * @tc.desc      Verify samplingRateOptionsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4400
     * @tc.name      testSamplingRateOptions0044
     * @tc.desc      Verify samplingRateOptionsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4500
     * @tc.name      testSamplingRateOptions0045
     * @tc.desc      Verify samplingRateOptionsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4600
     * @tc.name      testSamplingRateOptions0046
     * @tc.desc      Verify samplingRateOptionsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4700
     * @tc.name      testSamplingRateOptions0047
     * @tc.desc      Verify samplingRateOptionsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4800
     * @tc.name      testSamplingRateOptions0048
     * @tc.desc      Verify samplingRateOptionsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_4900
     * @tc.name      testSamplingRateOptions0049
     * @tc.desc      Verify samplingRateOptionsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5000
     * @tc.name      testSamplingRateOptions0050
     * @tc.desc      Verify samplingRateOptionsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5100
     * @tc.name      testSamplingRateOptions0051
     * @tc.desc      Verify samplingRateOptionsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5200
     * @tc.name      testSamplingRateOptions0052
     * @tc.desc      Verify samplingRateOptionsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5300
     * @tc.name      testSamplingRateOptions0053
     * @tc.desc      Verify samplingRateOptionsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5400
     * @tc.name      testSamplingRateOptions0054
     * @tc.desc      Verify samplingRateOptionsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5500
     * @tc.name      testSamplingRateOptions0055
     * @tc.desc      Verify samplingRateOptionsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5600
     * @tc.name      testSamplingRateOptions0056
     * @tc.desc      Verify samplingRateOptionsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5700
     * @tc.name      testSamplingRateOptions0057
     * @tc.desc      Verify samplingRateOptionsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5800
     * @tc.name      testSamplingRateOptions0058
     * @tc.desc      Verify samplingRateOptionsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_5900
     * @tc.name      testSamplingRateOptions0059
     * @tc.desc      Verify samplingRateOptionsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6000
     * @tc.name      testSamplingRateOptions0060
     * @tc.desc      Verify samplingRateOptionsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6100
     * @tc.name      testSamplingRateOptions0061
     * @tc.desc      Verify samplingRateOptionsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6200
     * @tc.name      testSamplingRateOptions0062
     * @tc.desc      Verify samplingRateOptionsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6300
     * @tc.name      testSamplingRateOptions0063
     * @tc.desc      Verify samplingRateOptionsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6400
     * @tc.name      testSamplingRateOptions0064
     * @tc.desc      Verify samplingRateOptionsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6500
     * @tc.name      testSamplingRateOptions0065
     * @tc.desc      Verify samplingRateOptionsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6600
     * @tc.name      testSamplingRateOptions0066
     * @tc.desc      Verify samplingRateOptionsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6700
     * @tc.name      testSamplingRateOptions0067
     * @tc.desc      Verify samplingRateOptionsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6800
     * @tc.name      testSamplingRateOptions0068
     * @tc.desc      Verify samplingRateOptionsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_6900
     * @tc.name      testSamplingRateOptions0069
     * @tc.desc      Verify samplingRateOptionsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7000
     * @tc.name      testSamplingRateOptions0070
     * @tc.desc      Verify samplingRateOptionsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7100
     * @tc.name      testSamplingRateOptions0071
     * @tc.desc      Verify samplingRateOptionsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7200
     * @tc.name      testSamplingRateOptions0072
     * @tc.desc      Verify samplingRateOptionsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7300
     * @tc.name      testSamplingRateOptions0073
     * @tc.desc      Verify samplingRateOptionsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7400
     * @tc.name      testSamplingRateOptions0074
     * @tc.desc      Verify samplingRateOptionsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7500
     * @tc.name      testSamplingRateOptions0075
     * @tc.desc      Verify samplingRateOptionsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7600
     * @tc.name      testSamplingRateOptions0076
     * @tc.desc      Verify samplingRateOptionsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7700
     * @tc.name      testSamplingRateOptions0077
     * @tc.desc      Verify samplingRateOptionsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7800
     * @tc.name      testSamplingRateOptions0078
     * @tc.desc      Verify samplingRateOptionsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[5].value).assertEqual(keys[5]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_7900
     * @tc.name      testSamplingRateOptions0079
     * @tc.desc      Verify samplingRateOptionsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[6].value).assertEqual(keys[6]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_8000
     * @tc.name      testSamplingRateOptions0080
     * @tc.desc      Verify samplingRateOptionsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[7].value).assertEqual(keys[7]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_RATE_OPT_8100
     * @tc.name      testSamplingRateOptions0081
     * @tc.desc      Verify samplingRateOptionsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSamplingRateOptions0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['SR_8000', 'SR_11025', 'SR_16000', 'SR_22050', 'SR_24000',
        'SR_32000', 'SR_44100', 'SR_48000', 'SR_96000'];
      expect(SAMPLING_RATE_OPTIONS.length).assertEqual(9);
      expect(SAMPLING_RATE_OPTIONS[8].value).assertEqual(keys[8]);
      expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
    });

  });
}
