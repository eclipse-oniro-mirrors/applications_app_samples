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

const TAG: string = '[Sample_sampleFormatKeyMapCore]';
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

export default function sampleFormatKeyMapCoreTest(): void {
  describe('sampleFormatKeyMapCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0100
     * @tc.name      testSampleFormatKeyMap0001
     * @tc.desc      Verify sampleFormatKeyMapCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0200
     * @tc.name      testSampleFormatKeyMap0002
     * @tc.desc      Verify sampleFormatKeyMapCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0300
     * @tc.name      testSampleFormatKeyMap0003
     * @tc.desc      Verify sampleFormatKeyMapCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0400
     * @tc.name      testSampleFormatKeyMap0004
     * @tc.desc      Verify sampleFormatKeyMapCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0500
     * @tc.name      testSampleFormatKeyMap0005
     * @tc.desc      Verify sampleFormatKeyMapCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0600
     * @tc.name      testSampleFormatKeyMap0006
     * @tc.desc      Verify sampleFormatKeyMapCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0700
     * @tc.name      testSampleFormatKeyMap0007
     * @tc.desc      Verify sampleFormatKeyMapCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0800
     * @tc.name      testSampleFormatKeyMap0008
     * @tc.desc      Verify sampleFormatKeyMapCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_0900
     * @tc.name      testSampleFormatKeyMap0009
     * @tc.desc      Verify sampleFormatKeyMapCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1000
     * @tc.name      testSampleFormatKeyMap0010
     * @tc.desc      Verify sampleFormatKeyMapCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1100
     * @tc.name      testSampleFormatKeyMap0011
     * @tc.desc      Verify sampleFormatKeyMapCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1200
     * @tc.name      testSampleFormatKeyMap0012
     * @tc.desc      Verify sampleFormatKeyMapCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1300
     * @tc.name      testSampleFormatKeyMap0013
     * @tc.desc      Verify sampleFormatKeyMapCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1400
     * @tc.name      testSampleFormatKeyMap0014
     * @tc.desc      Verify sampleFormatKeyMapCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1500
     * @tc.name      testSampleFormatKeyMap0015
     * @tc.desc      Verify sampleFormatKeyMapCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1600
     * @tc.name      testSampleFormatKeyMap0016
     * @tc.desc      Verify sampleFormatKeyMapCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1700
     * @tc.name      testSampleFormatKeyMap0017
     * @tc.desc      Verify sampleFormatKeyMapCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1800
     * @tc.name      testSampleFormatKeyMap0018
     * @tc.desc      Verify sampleFormatKeyMapCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_1900
     * @tc.name      testSampleFormatKeyMap0019
     * @tc.desc      Verify sampleFormatKeyMapCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2000
     * @tc.name      testSampleFormatKeyMap0020
     * @tc.desc      Verify sampleFormatKeyMapCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2100
     * @tc.name      testSampleFormatKeyMap0021
     * @tc.desc      Verify sampleFormatKeyMapCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2200
     * @tc.name      testSampleFormatKeyMap0022
     * @tc.desc      Verify sampleFormatKeyMapCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2300
     * @tc.name      testSampleFormatKeyMap0023
     * @tc.desc      Verify sampleFormatKeyMapCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2400
     * @tc.name      testSampleFormatKeyMap0024
     * @tc.desc      Verify sampleFormatKeyMapCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2500
     * @tc.name      testSampleFormatKeyMap0025
     * @tc.desc      Verify sampleFormatKeyMapCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2600
     * @tc.name      testSampleFormatKeyMap0026
     * @tc.desc      Verify sampleFormatKeyMapCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2700
     * @tc.name      testSampleFormatKeyMap0027
     * @tc.desc      Verify sampleFormatKeyMapCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2800
     * @tc.name      testSampleFormatKeyMap0028
     * @tc.desc      Verify sampleFormatKeyMapCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_2900
     * @tc.name      testSampleFormatKeyMap0029
     * @tc.desc      Verify sampleFormatKeyMapCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3000
     * @tc.name      testSampleFormatKeyMap0030
     * @tc.desc      Verify sampleFormatKeyMapCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3100
     * @tc.name      testSampleFormatKeyMap0031
     * @tc.desc      Verify sampleFormatKeyMapCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3200
     * @tc.name      testSampleFormatKeyMap0032
     * @tc.desc      Verify sampleFormatKeyMapCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3300
     * @tc.name      testSampleFormatKeyMap0033
     * @tc.desc      Verify sampleFormatKeyMapCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3400
     * @tc.name      testSampleFormatKeyMap0034
     * @tc.desc      Verify sampleFormatKeyMapCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3500
     * @tc.name      testSampleFormatKeyMap0035
     * @tc.desc      Verify sampleFormatKeyMapCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3600
     * @tc.name      testSampleFormatKeyMap0036
     * @tc.desc      Verify sampleFormatKeyMapCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3700
     * @tc.name      testSampleFormatKeyMap0037
     * @tc.desc      Verify sampleFormatKeyMapCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3800
     * @tc.name      testSampleFormatKeyMap0038
     * @tc.desc      Verify sampleFormatKeyMapCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_3900
     * @tc.name      testSampleFormatKeyMap0039
     * @tc.desc      Verify sampleFormatKeyMapCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4000
     * @tc.name      testSampleFormatKeyMap0040
     * @tc.desc      Verify sampleFormatKeyMapCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4100
     * @tc.name      testSampleFormatKeyMap0041
     * @tc.desc      Verify sampleFormatKeyMapCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4200
     * @tc.name      testSampleFormatKeyMap0042
     * @tc.desc      Verify sampleFormatKeyMapCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4300
     * @tc.name      testSampleFormatKeyMap0043
     * @tc.desc      Verify sampleFormatKeyMapCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4400
     * @tc.name      testSampleFormatKeyMap0044
     * @tc.desc      Verify sampleFormatKeyMapCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4500
     * @tc.name      testSampleFormatKeyMap0045
     * @tc.desc      Verify sampleFormatKeyMapCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4600
     * @tc.name      testSampleFormatKeyMap0046
     * @tc.desc      Verify sampleFormatKeyMapCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4700
     * @tc.name      testSampleFormatKeyMap0047
     * @tc.desc      Verify sampleFormatKeyMapCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4800
     * @tc.name      testSampleFormatKeyMap0048
     * @tc.desc      Verify sampleFormatKeyMapCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_4900
     * @tc.name      testSampleFormatKeyMap0049
     * @tc.desc      Verify sampleFormatKeyMapCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5000
     * @tc.name      testSampleFormatKeyMap0050
     * @tc.desc      Verify sampleFormatKeyMapCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5100
     * @tc.name      testSampleFormatKeyMap0051
     * @tc.desc      Verify sampleFormatKeyMapCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5200
     * @tc.name      testSampleFormatKeyMap0052
     * @tc.desc      Verify sampleFormatKeyMapCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5300
     * @tc.name      testSampleFormatKeyMap0053
     * @tc.desc      Verify sampleFormatKeyMapCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5400
     * @tc.name      testSampleFormatKeyMap0054
     * @tc.desc      Verify sampleFormatKeyMapCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5500
     * @tc.name      testSampleFormatKeyMap0055
     * @tc.desc      Verify sampleFormatKeyMapCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5600
     * @tc.name      testSampleFormatKeyMap0056
     * @tc.desc      Verify sampleFormatKeyMapCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5700
     * @tc.name      testSampleFormatKeyMap0057
     * @tc.desc      Verify sampleFormatKeyMapCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5800
     * @tc.name      testSampleFormatKeyMap0058
     * @tc.desc      Verify sampleFormatKeyMapCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_5900
     * @tc.name      testSampleFormatKeyMap0059
     * @tc.desc      Verify sampleFormatKeyMapCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6000
     * @tc.name      testSampleFormatKeyMap0060
     * @tc.desc      Verify sampleFormatKeyMapCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6100
     * @tc.name      testSampleFormatKeyMap0061
     * @tc.desc      Verify sampleFormatKeyMapCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6200
     * @tc.name      testSampleFormatKeyMap0062
     * @tc.desc      Verify sampleFormatKeyMapCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6300
     * @tc.name      testSampleFormatKeyMap0063
     * @tc.desc      Verify sampleFormatKeyMapCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6400
     * @tc.name      testSampleFormatKeyMap0064
     * @tc.desc      Verify sampleFormatKeyMapCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6500
     * @tc.name      testSampleFormatKeyMap0065
     * @tc.desc      Verify sampleFormatKeyMapCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6600
     * @tc.name      testSampleFormatKeyMap0066
     * @tc.desc      Verify sampleFormatKeyMapCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6700
     * @tc.name      testSampleFormatKeyMap0067
     * @tc.desc      Verify sampleFormatKeyMapCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6800
     * @tc.name      testSampleFormatKeyMap0068
     * @tc.desc      Verify sampleFormatKeyMapCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_6900
     * @tc.name      testSampleFormatKeyMap0069
     * @tc.desc      Verify sampleFormatKeyMapCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7000
     * @tc.name      testSampleFormatKeyMap0070
     * @tc.desc      Verify sampleFormatKeyMapCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7100
     * @tc.name      testSampleFormatKeyMap0071
     * @tc.desc      Verify sampleFormatKeyMapCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7200
     * @tc.name      testSampleFormatKeyMap0072
     * @tc.desc      Verify sampleFormatKeyMapCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7300
     * @tc.name      testSampleFormatKeyMap0073
     * @tc.desc      Verify sampleFormatKeyMapCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7400
     * @tc.name      testSampleFormatKeyMap0074
     * @tc.desc      Verify sampleFormatKeyMapCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7500
     * @tc.name      testSampleFormatKeyMap0075
     * @tc.desc      Verify sampleFormatKeyMapCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7600
     * @tc.name      testSampleFormatKeyMap0076
     * @tc.desc      Verify sampleFormatKeyMapCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7700
     * @tc.name      testSampleFormatKeyMap0077
     * @tc.desc      Verify sampleFormatKeyMapCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7800
     * @tc.name      testSampleFormatKeyMap0078
     * @tc.desc      Verify sampleFormatKeyMapCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_7900
     * @tc.name      testSampleFormatKeyMap0079
     * @tc.desc      Verify sampleFormatKeyMapCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_8000
     * @tc.name      testSampleFormatKeyMap0080
     * @tc.desc      Verify sampleFormatKeyMapCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CAPTURER_FORMAT_MAP_8100
     * @tc.name      testSampleFormatKeyMap0081
     * @tc.desc      Verify sampleFormatKeyMapCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSampleFormatKeyMap0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['U8', 'S16LE', 'S24LE', 'S32LE', 'F32LE'];
      const expected: number[] = [0, 1, 2, 3, 4];
      expect(SAMPLE_FORMAT_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(5);
    });

  });
}
