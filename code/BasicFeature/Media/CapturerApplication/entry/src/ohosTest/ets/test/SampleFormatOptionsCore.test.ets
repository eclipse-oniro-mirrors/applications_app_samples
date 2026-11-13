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

const TAG: string = '[Sample_sampleFormatOptionsCore]';
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

export default function sampleFormatOptionsCoreTest(): void {
  describe('sampleFormatOptionsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0100
     * @tc.name      testSampleFormatOptions0001
     * @tc.desc      Verify sampleFormatOptionsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0200
     * @tc.name      testSampleFormatOptions0002
     * @tc.desc      Verify sampleFormatOptionsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0300
     * @tc.name      testSampleFormatOptions0003
     * @tc.desc      Verify sampleFormatOptionsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0400
     * @tc.name      testSampleFormatOptions0004
     * @tc.desc      Verify sampleFormatOptionsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0500
     * @tc.name      testSampleFormatOptions0005
     * @tc.desc      Verify sampleFormatOptionsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0600
     * @tc.name      testSampleFormatOptions0006
     * @tc.desc      Verify sampleFormatOptionsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0700
     * @tc.name      testSampleFormatOptions0007
     * @tc.desc      Verify sampleFormatOptionsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0800
     * @tc.name      testSampleFormatOptions0008
     * @tc.desc      Verify sampleFormatOptionsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_0900
     * @tc.name      testSampleFormatOptions0009
     * @tc.desc      Verify sampleFormatOptionsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1000
     * @tc.name      testSampleFormatOptions0010
     * @tc.desc      Verify sampleFormatOptionsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1100
     * @tc.name      testSampleFormatOptions0011
     * @tc.desc      Verify sampleFormatOptionsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1200
     * @tc.name      testSampleFormatOptions0012
     * @tc.desc      Verify sampleFormatOptionsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1300
     * @tc.name      testSampleFormatOptions0013
     * @tc.desc      Verify sampleFormatOptionsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1400
     * @tc.name      testSampleFormatOptions0014
     * @tc.desc      Verify sampleFormatOptionsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1500
     * @tc.name      testSampleFormatOptions0015
     * @tc.desc      Verify sampleFormatOptionsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1600
     * @tc.name      testSampleFormatOptions0016
     * @tc.desc      Verify sampleFormatOptionsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1700
     * @tc.name      testSampleFormatOptions0017
     * @tc.desc      Verify sampleFormatOptionsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1800
     * @tc.name      testSampleFormatOptions0018
     * @tc.desc      Verify sampleFormatOptionsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_1900
     * @tc.name      testSampleFormatOptions0019
     * @tc.desc      Verify sampleFormatOptionsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2000
     * @tc.name      testSampleFormatOptions0020
     * @tc.desc      Verify sampleFormatOptionsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2100
     * @tc.name      testSampleFormatOptions0021
     * @tc.desc      Verify sampleFormatOptionsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2200
     * @tc.name      testSampleFormatOptions0022
     * @tc.desc      Verify sampleFormatOptionsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2300
     * @tc.name      testSampleFormatOptions0023
     * @tc.desc      Verify sampleFormatOptionsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2400
     * @tc.name      testSampleFormatOptions0024
     * @tc.desc      Verify sampleFormatOptionsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2500
     * @tc.name      testSampleFormatOptions0025
     * @tc.desc      Verify sampleFormatOptionsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2600
     * @tc.name      testSampleFormatOptions0026
     * @tc.desc      Verify sampleFormatOptionsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2700
     * @tc.name      testSampleFormatOptions0027
     * @tc.desc      Verify sampleFormatOptionsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2800
     * @tc.name      testSampleFormatOptions0028
     * @tc.desc      Verify sampleFormatOptionsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_2900
     * @tc.name      testSampleFormatOptions0029
     * @tc.desc      Verify sampleFormatOptionsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3000
     * @tc.name      testSampleFormatOptions0030
     * @tc.desc      Verify sampleFormatOptionsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3100
     * @tc.name      testSampleFormatOptions0031
     * @tc.desc      Verify sampleFormatOptionsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3200
     * @tc.name      testSampleFormatOptions0032
     * @tc.desc      Verify sampleFormatOptionsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3300
     * @tc.name      testSampleFormatOptions0033
     * @tc.desc      Verify sampleFormatOptionsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3400
     * @tc.name      testSampleFormatOptions0034
     * @tc.desc      Verify sampleFormatOptionsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3500
     * @tc.name      testSampleFormatOptions0035
     * @tc.desc      Verify sampleFormatOptionsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3600
     * @tc.name      testSampleFormatOptions0036
     * @tc.desc      Verify sampleFormatOptionsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3700
     * @tc.name      testSampleFormatOptions0037
     * @tc.desc      Verify sampleFormatOptionsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3800
     * @tc.name      testSampleFormatOptions0038
     * @tc.desc      Verify sampleFormatOptionsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_3900
     * @tc.name      testSampleFormatOptions0039
     * @tc.desc      Verify sampleFormatOptionsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4000
     * @tc.name      testSampleFormatOptions0040
     * @tc.desc      Verify sampleFormatOptionsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4100
     * @tc.name      testSampleFormatOptions0041
     * @tc.desc      Verify sampleFormatOptionsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4200
     * @tc.name      testSampleFormatOptions0042
     * @tc.desc      Verify sampleFormatOptionsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4300
     * @tc.name      testSampleFormatOptions0043
     * @tc.desc      Verify sampleFormatOptionsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4400
     * @tc.name      testSampleFormatOptions0044
     * @tc.desc      Verify sampleFormatOptionsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4500
     * @tc.name      testSampleFormatOptions0045
     * @tc.desc      Verify sampleFormatOptionsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4600
     * @tc.name      testSampleFormatOptions0046
     * @tc.desc      Verify sampleFormatOptionsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4700
     * @tc.name      testSampleFormatOptions0047
     * @tc.desc      Verify sampleFormatOptionsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4800
     * @tc.name      testSampleFormatOptions0048
     * @tc.desc      Verify sampleFormatOptionsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_4900
     * @tc.name      testSampleFormatOptions0049
     * @tc.desc      Verify sampleFormatOptionsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5000
     * @tc.name      testSampleFormatOptions0050
     * @tc.desc      Verify sampleFormatOptionsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5100
     * @tc.name      testSampleFormatOptions0051
     * @tc.desc      Verify sampleFormatOptionsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5200
     * @tc.name      testSampleFormatOptions0052
     * @tc.desc      Verify sampleFormatOptionsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5300
     * @tc.name      testSampleFormatOptions0053
     * @tc.desc      Verify sampleFormatOptionsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5400
     * @tc.name      testSampleFormatOptions0054
     * @tc.desc      Verify sampleFormatOptionsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5500
     * @tc.name      testSampleFormatOptions0055
     * @tc.desc      Verify sampleFormatOptionsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5600
     * @tc.name      testSampleFormatOptions0056
     * @tc.desc      Verify sampleFormatOptionsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5700
     * @tc.name      testSampleFormatOptions0057
     * @tc.desc      Verify sampleFormatOptionsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5800
     * @tc.name      testSampleFormatOptions0058
     * @tc.desc      Verify sampleFormatOptionsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_5900
     * @tc.name      testSampleFormatOptions0059
     * @tc.desc      Verify sampleFormatOptionsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6000
     * @tc.name      testSampleFormatOptions0060
     * @tc.desc      Verify sampleFormatOptionsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6100
     * @tc.name      testSampleFormatOptions0061
     * @tc.desc      Verify sampleFormatOptionsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6200
     * @tc.name      testSampleFormatOptions0062
     * @tc.desc      Verify sampleFormatOptionsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6300
     * @tc.name      testSampleFormatOptions0063
     * @tc.desc      Verify sampleFormatOptionsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6400
     * @tc.name      testSampleFormatOptions0064
     * @tc.desc      Verify sampleFormatOptionsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6500
     * @tc.name      testSampleFormatOptions0065
     * @tc.desc      Verify sampleFormatOptionsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6600
     * @tc.name      testSampleFormatOptions0066
     * @tc.desc      Verify sampleFormatOptionsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6700
     * @tc.name      testSampleFormatOptions0067
     * @tc.desc      Verify sampleFormatOptionsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6800
     * @tc.name      testSampleFormatOptions0068
     * @tc.desc      Verify sampleFormatOptionsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_6900
     * @tc.name      testSampleFormatOptions0069
     * @tc.desc      Verify sampleFormatOptionsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7000
     * @tc.name      testSampleFormatOptions0070
     * @tc.desc      Verify sampleFormatOptionsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7100
     * @tc.name      testSampleFormatOptions0071
     * @tc.desc      Verify sampleFormatOptionsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7200
     * @tc.name      testSampleFormatOptions0072
     * @tc.desc      Verify sampleFormatOptionsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7300
     * @tc.name      testSampleFormatOptions0073
     * @tc.desc      Verify sampleFormatOptionsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7400
     * @tc.name      testSampleFormatOptions0074
     * @tc.desc      Verify sampleFormatOptionsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7500
     * @tc.name      testSampleFormatOptions0075
     * @tc.desc      Verify sampleFormatOptionsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7600
     * @tc.name      testSampleFormatOptions0076
     * @tc.desc      Verify sampleFormatOptionsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7700
     * @tc.name      testSampleFormatOptions0077
     * @tc.desc      Verify sampleFormatOptionsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[1].value).assertEqual(keys[1]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7800
     * @tc.name      testSampleFormatOptions0078
     * @tc.desc      Verify sampleFormatOptionsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[2].value).assertEqual(keys[2]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_7900
     * @tc.name      testSampleFormatOptions0079
     * @tc.desc      Verify sampleFormatOptionsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[3].value).assertEqual(keys[3]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_8000
     * @tc.name      testSampleFormatOptions0080
     * @tc.desc      Verify sampleFormatOptionsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[4].value).assertEqual(keys[4]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_OPT_8100
     * @tc.name      testSampleFormatOptions0081
     * @tc.desc      Verify sampleFormatOptionsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatOptions0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      expect(SAMPLE_FORMAT_OPTIONS.length).assertEqual(5);
      expect(SAMPLE_FORMAT_OPTIONS[0].value).assertEqual(keys[0]);
      expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
    });

  });
}
