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
import { MediaTools } from '../../../main/ets/common/utils/mediaUtils/MediaTools';

const TAG: string = '[Sample_mediaToolsOffsetCore]';
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

export default function mediaToolsOffsetCoreTest(): void {
  describe('mediaToolsOffsetCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0100
     * @tc.name      testMediaToolsOffset0001
     * @tc.desc      Verify mediaToolsOffsetCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0200
     * @tc.name      testMediaToolsOffset0002
     * @tc.desc      Verify mediaToolsOffsetCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0300
     * @tc.name      testMediaToolsOffset0003
     * @tc.desc      Verify mediaToolsOffsetCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0400
     * @tc.name      testMediaToolsOffset0004
     * @tc.desc      Verify mediaToolsOffsetCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0500
     * @tc.name      testMediaToolsOffset0005
     * @tc.desc      Verify mediaToolsOffsetCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0600
     * @tc.name      testMediaToolsOffset0006
     * @tc.desc      Verify mediaToolsOffsetCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0700
     * @tc.name      testMediaToolsOffset0007
     * @tc.desc      Verify mediaToolsOffsetCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0800
     * @tc.name      testMediaToolsOffset0008
     * @tc.desc      Verify mediaToolsOffsetCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_0900
     * @tc.name      testMediaToolsOffset0009
     * @tc.desc      Verify mediaToolsOffsetCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1000
     * @tc.name      testMediaToolsOffset0010
     * @tc.desc      Verify mediaToolsOffsetCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1100
     * @tc.name      testMediaToolsOffset0011
     * @tc.desc      Verify mediaToolsOffsetCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1200
     * @tc.name      testMediaToolsOffset0012
     * @tc.desc      Verify mediaToolsOffsetCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1300
     * @tc.name      testMediaToolsOffset0013
     * @tc.desc      Verify mediaToolsOffsetCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1400
     * @tc.name      testMediaToolsOffset0014
     * @tc.desc      Verify mediaToolsOffsetCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1500
     * @tc.name      testMediaToolsOffset0015
     * @tc.desc      Verify mediaToolsOffsetCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1600
     * @tc.name      testMediaToolsOffset0016
     * @tc.desc      Verify mediaToolsOffsetCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1700
     * @tc.name      testMediaToolsOffset0017
     * @tc.desc      Verify mediaToolsOffsetCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1800
     * @tc.name      testMediaToolsOffset0018
     * @tc.desc      Verify mediaToolsOffsetCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_1900
     * @tc.name      testMediaToolsOffset0019
     * @tc.desc      Verify mediaToolsOffsetCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2000
     * @tc.name      testMediaToolsOffset0020
     * @tc.desc      Verify mediaToolsOffsetCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2100
     * @tc.name      testMediaToolsOffset0021
     * @tc.desc      Verify mediaToolsOffsetCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2200
     * @tc.name      testMediaToolsOffset0022
     * @tc.desc      Verify mediaToolsOffsetCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2300
     * @tc.name      testMediaToolsOffset0023
     * @tc.desc      Verify mediaToolsOffsetCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2400
     * @tc.name      testMediaToolsOffset0024
     * @tc.desc      Verify mediaToolsOffsetCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2500
     * @tc.name      testMediaToolsOffset0025
     * @tc.desc      Verify mediaToolsOffsetCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2600
     * @tc.name      testMediaToolsOffset0026
     * @tc.desc      Verify mediaToolsOffsetCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2700
     * @tc.name      testMediaToolsOffset0027
     * @tc.desc      Verify mediaToolsOffsetCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2800
     * @tc.name      testMediaToolsOffset0028
     * @tc.desc      Verify mediaToolsOffsetCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_2900
     * @tc.name      testMediaToolsOffset0029
     * @tc.desc      Verify mediaToolsOffsetCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3000
     * @tc.name      testMediaToolsOffset0030
     * @tc.desc      Verify mediaToolsOffsetCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3100
     * @tc.name      testMediaToolsOffset0031
     * @tc.desc      Verify mediaToolsOffsetCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3200
     * @tc.name      testMediaToolsOffset0032
     * @tc.desc      Verify mediaToolsOffsetCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3300
     * @tc.name      testMediaToolsOffset0033
     * @tc.desc      Verify mediaToolsOffsetCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3400
     * @tc.name      testMediaToolsOffset0034
     * @tc.desc      Verify mediaToolsOffsetCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3500
     * @tc.name      testMediaToolsOffset0035
     * @tc.desc      Verify mediaToolsOffsetCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3600
     * @tc.name      testMediaToolsOffset0036
     * @tc.desc      Verify mediaToolsOffsetCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3700
     * @tc.name      testMediaToolsOffset0037
     * @tc.desc      Verify mediaToolsOffsetCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3800
     * @tc.name      testMediaToolsOffset0038
     * @tc.desc      Verify mediaToolsOffsetCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_3900
     * @tc.name      testMediaToolsOffset0039
     * @tc.desc      Verify mediaToolsOffsetCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4000
     * @tc.name      testMediaToolsOffset0040
     * @tc.desc      Verify mediaToolsOffsetCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4100
     * @tc.name      testMediaToolsOffset0041
     * @tc.desc      Verify mediaToolsOffsetCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4200
     * @tc.name      testMediaToolsOffset0042
     * @tc.desc      Verify mediaToolsOffsetCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4300
     * @tc.name      testMediaToolsOffset0043
     * @tc.desc      Verify mediaToolsOffsetCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4400
     * @tc.name      testMediaToolsOffset0044
     * @tc.desc      Verify mediaToolsOffsetCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4500
     * @tc.name      testMediaToolsOffset0045
     * @tc.desc      Verify mediaToolsOffsetCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4600
     * @tc.name      testMediaToolsOffset0046
     * @tc.desc      Verify mediaToolsOffsetCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4700
     * @tc.name      testMediaToolsOffset0047
     * @tc.desc      Verify mediaToolsOffsetCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4800
     * @tc.name      testMediaToolsOffset0048
     * @tc.desc      Verify mediaToolsOffsetCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_4900
     * @tc.name      testMediaToolsOffset0049
     * @tc.desc      Verify mediaToolsOffsetCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5000
     * @tc.name      testMediaToolsOffset0050
     * @tc.desc      Verify mediaToolsOffsetCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5100
     * @tc.name      testMediaToolsOffset0051
     * @tc.desc      Verify mediaToolsOffsetCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5200
     * @tc.name      testMediaToolsOffset0052
     * @tc.desc      Verify mediaToolsOffsetCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5300
     * @tc.name      testMediaToolsOffset0053
     * @tc.desc      Verify mediaToolsOffsetCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5400
     * @tc.name      testMediaToolsOffset0054
     * @tc.desc      Verify mediaToolsOffsetCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5500
     * @tc.name      testMediaToolsOffset0055
     * @tc.desc      Verify mediaToolsOffsetCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5600
     * @tc.name      testMediaToolsOffset0056
     * @tc.desc      Verify mediaToolsOffsetCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5700
     * @tc.name      testMediaToolsOffset0057
     * @tc.desc      Verify mediaToolsOffsetCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5800
     * @tc.name      testMediaToolsOffset0058
     * @tc.desc      Verify mediaToolsOffsetCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_5900
     * @tc.name      testMediaToolsOffset0059
     * @tc.desc      Verify mediaToolsOffsetCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6000
     * @tc.name      testMediaToolsOffset0060
     * @tc.desc      Verify mediaToolsOffsetCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6100
     * @tc.name      testMediaToolsOffset0061
     * @tc.desc      Verify mediaToolsOffsetCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6200
     * @tc.name      testMediaToolsOffset0062
     * @tc.desc      Verify mediaToolsOffsetCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6300
     * @tc.name      testMediaToolsOffset0063
     * @tc.desc      Verify mediaToolsOffsetCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6400
     * @tc.name      testMediaToolsOffset0064
     * @tc.desc      Verify mediaToolsOffsetCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6500
     * @tc.name      testMediaToolsOffset0065
     * @tc.desc      Verify mediaToolsOffsetCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6600
     * @tc.name      testMediaToolsOffset0066
     * @tc.desc      Verify mediaToolsOffsetCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6700
     * @tc.name      testMediaToolsOffset0067
     * @tc.desc      Verify mediaToolsOffsetCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6800
     * @tc.name      testMediaToolsOffset0068
     * @tc.desc      Verify mediaToolsOffsetCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_6900
     * @tc.name      testMediaToolsOffset0069
     * @tc.desc      Verify mediaToolsOffsetCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7000
     * @tc.name      testMediaToolsOffset0070
     * @tc.desc      Verify mediaToolsOffsetCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7100
     * @tc.name      testMediaToolsOffset0071
     * @tc.desc      Verify mediaToolsOffsetCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7200
     * @tc.name      testMediaToolsOffset0072
     * @tc.desc      Verify mediaToolsOffsetCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7300
     * @tc.name      testMediaToolsOffset0073
     * @tc.desc      Verify mediaToolsOffsetCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7400
     * @tc.name      testMediaToolsOffset0074
     * @tc.desc      Verify mediaToolsOffsetCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7500
     * @tc.name      testMediaToolsOffset0075
     * @tc.desc      Verify mediaToolsOffsetCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7600
     * @tc.name      testMediaToolsOffset0076
     * @tc.desc      Verify mediaToolsOffsetCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7700
     * @tc.name      testMediaToolsOffset0077
     * @tc.desc      Verify mediaToolsOffsetCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7800
     * @tc.name      testMediaToolsOffset0078
     * @tc.desc      Verify mediaToolsOffsetCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_7900
     * @tc.name      testMediaToolsOffset0079
     * @tc.desc      Verify mediaToolsOffsetCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_8000
     * @tc.name      testMediaToolsOffset0080
     * @tc.desc      Verify mediaToolsOffsetCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

    /**
     * @tc.number    SUB_CAPTURER_OFFSET_8100
     * @tc.name      testMediaToolsOffset0081
     * @tc.desc      Verify mediaToolsOffsetCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsOffset0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 500, 1000, 1500];
      const expected: number[] = [0, 96000, 192000, 288000];
      expect(MediaTools.getOffsetFromTime(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getOffsetFromTime(1000)).assertEqual(192000);
    });

  });
}
