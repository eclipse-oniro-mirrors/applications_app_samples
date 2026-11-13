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

const TAG: string = '[Sample_mediaToolsByteLengthCore]';
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

export default function mediaToolsByteLengthCoreTest(): void {
  describe('mediaToolsByteLengthCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0100
     * @tc.name      testMediaToolsByteLength0001
     * @tc.desc      Verify mediaToolsByteLengthCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0200
     * @tc.name      testMediaToolsByteLength0002
     * @tc.desc      Verify mediaToolsByteLengthCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0300
     * @tc.name      testMediaToolsByteLength0003
     * @tc.desc      Verify mediaToolsByteLengthCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0400
     * @tc.name      testMediaToolsByteLength0004
     * @tc.desc      Verify mediaToolsByteLengthCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0500
     * @tc.name      testMediaToolsByteLength0005
     * @tc.desc      Verify mediaToolsByteLengthCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0600
     * @tc.name      testMediaToolsByteLength0006
     * @tc.desc      Verify mediaToolsByteLengthCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0700
     * @tc.name      testMediaToolsByteLength0007
     * @tc.desc      Verify mediaToolsByteLengthCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0800
     * @tc.name      testMediaToolsByteLength0008
     * @tc.desc      Verify mediaToolsByteLengthCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_0900
     * @tc.name      testMediaToolsByteLength0009
     * @tc.desc      Verify mediaToolsByteLengthCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1000
     * @tc.name      testMediaToolsByteLength0010
     * @tc.desc      Verify mediaToolsByteLengthCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1100
     * @tc.name      testMediaToolsByteLength0011
     * @tc.desc      Verify mediaToolsByteLengthCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1200
     * @tc.name      testMediaToolsByteLength0012
     * @tc.desc      Verify mediaToolsByteLengthCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1300
     * @tc.name      testMediaToolsByteLength0013
     * @tc.desc      Verify mediaToolsByteLengthCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1400
     * @tc.name      testMediaToolsByteLength0014
     * @tc.desc      Verify mediaToolsByteLengthCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1500
     * @tc.name      testMediaToolsByteLength0015
     * @tc.desc      Verify mediaToolsByteLengthCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1600
     * @tc.name      testMediaToolsByteLength0016
     * @tc.desc      Verify mediaToolsByteLengthCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1700
     * @tc.name      testMediaToolsByteLength0017
     * @tc.desc      Verify mediaToolsByteLengthCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1800
     * @tc.name      testMediaToolsByteLength0018
     * @tc.desc      Verify mediaToolsByteLengthCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_1900
     * @tc.name      testMediaToolsByteLength0019
     * @tc.desc      Verify mediaToolsByteLengthCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2000
     * @tc.name      testMediaToolsByteLength0020
     * @tc.desc      Verify mediaToolsByteLengthCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2100
     * @tc.name      testMediaToolsByteLength0021
     * @tc.desc      Verify mediaToolsByteLengthCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2200
     * @tc.name      testMediaToolsByteLength0022
     * @tc.desc      Verify mediaToolsByteLengthCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2300
     * @tc.name      testMediaToolsByteLength0023
     * @tc.desc      Verify mediaToolsByteLengthCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2400
     * @tc.name      testMediaToolsByteLength0024
     * @tc.desc      Verify mediaToolsByteLengthCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2500
     * @tc.name      testMediaToolsByteLength0025
     * @tc.desc      Verify mediaToolsByteLengthCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2600
     * @tc.name      testMediaToolsByteLength0026
     * @tc.desc      Verify mediaToolsByteLengthCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2700
     * @tc.name      testMediaToolsByteLength0027
     * @tc.desc      Verify mediaToolsByteLengthCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2800
     * @tc.name      testMediaToolsByteLength0028
     * @tc.desc      Verify mediaToolsByteLengthCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_2900
     * @tc.name      testMediaToolsByteLength0029
     * @tc.desc      Verify mediaToolsByteLengthCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3000
     * @tc.name      testMediaToolsByteLength0030
     * @tc.desc      Verify mediaToolsByteLengthCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3100
     * @tc.name      testMediaToolsByteLength0031
     * @tc.desc      Verify mediaToolsByteLengthCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3200
     * @tc.name      testMediaToolsByteLength0032
     * @tc.desc      Verify mediaToolsByteLengthCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3300
     * @tc.name      testMediaToolsByteLength0033
     * @tc.desc      Verify mediaToolsByteLengthCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3400
     * @tc.name      testMediaToolsByteLength0034
     * @tc.desc      Verify mediaToolsByteLengthCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3500
     * @tc.name      testMediaToolsByteLength0035
     * @tc.desc      Verify mediaToolsByteLengthCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3600
     * @tc.name      testMediaToolsByteLength0036
     * @tc.desc      Verify mediaToolsByteLengthCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3700
     * @tc.name      testMediaToolsByteLength0037
     * @tc.desc      Verify mediaToolsByteLengthCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3800
     * @tc.name      testMediaToolsByteLength0038
     * @tc.desc      Verify mediaToolsByteLengthCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_3900
     * @tc.name      testMediaToolsByteLength0039
     * @tc.desc      Verify mediaToolsByteLengthCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4000
     * @tc.name      testMediaToolsByteLength0040
     * @tc.desc      Verify mediaToolsByteLengthCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4100
     * @tc.name      testMediaToolsByteLength0041
     * @tc.desc      Verify mediaToolsByteLengthCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4200
     * @tc.name      testMediaToolsByteLength0042
     * @tc.desc      Verify mediaToolsByteLengthCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4300
     * @tc.name      testMediaToolsByteLength0043
     * @tc.desc      Verify mediaToolsByteLengthCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4400
     * @tc.name      testMediaToolsByteLength0044
     * @tc.desc      Verify mediaToolsByteLengthCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4500
     * @tc.name      testMediaToolsByteLength0045
     * @tc.desc      Verify mediaToolsByteLengthCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4600
     * @tc.name      testMediaToolsByteLength0046
     * @tc.desc      Verify mediaToolsByteLengthCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4700
     * @tc.name      testMediaToolsByteLength0047
     * @tc.desc      Verify mediaToolsByteLengthCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4800
     * @tc.name      testMediaToolsByteLength0048
     * @tc.desc      Verify mediaToolsByteLengthCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_4900
     * @tc.name      testMediaToolsByteLength0049
     * @tc.desc      Verify mediaToolsByteLengthCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5000
     * @tc.name      testMediaToolsByteLength0050
     * @tc.desc      Verify mediaToolsByteLengthCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5100
     * @tc.name      testMediaToolsByteLength0051
     * @tc.desc      Verify mediaToolsByteLengthCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5200
     * @tc.name      testMediaToolsByteLength0052
     * @tc.desc      Verify mediaToolsByteLengthCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5300
     * @tc.name      testMediaToolsByteLength0053
     * @tc.desc      Verify mediaToolsByteLengthCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5400
     * @tc.name      testMediaToolsByteLength0054
     * @tc.desc      Verify mediaToolsByteLengthCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5500
     * @tc.name      testMediaToolsByteLength0055
     * @tc.desc      Verify mediaToolsByteLengthCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5600
     * @tc.name      testMediaToolsByteLength0056
     * @tc.desc      Verify mediaToolsByteLengthCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5700
     * @tc.name      testMediaToolsByteLength0057
     * @tc.desc      Verify mediaToolsByteLengthCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5800
     * @tc.name      testMediaToolsByteLength0058
     * @tc.desc      Verify mediaToolsByteLengthCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_5900
     * @tc.name      testMediaToolsByteLength0059
     * @tc.desc      Verify mediaToolsByteLengthCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6000
     * @tc.name      testMediaToolsByteLength0060
     * @tc.desc      Verify mediaToolsByteLengthCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6100
     * @tc.name      testMediaToolsByteLength0061
     * @tc.desc      Verify mediaToolsByteLengthCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6200
     * @tc.name      testMediaToolsByteLength0062
     * @tc.desc      Verify mediaToolsByteLengthCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6300
     * @tc.name      testMediaToolsByteLength0063
     * @tc.desc      Verify mediaToolsByteLengthCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6400
     * @tc.name      testMediaToolsByteLength0064
     * @tc.desc      Verify mediaToolsByteLengthCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6500
     * @tc.name      testMediaToolsByteLength0065
     * @tc.desc      Verify mediaToolsByteLengthCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6600
     * @tc.name      testMediaToolsByteLength0066
     * @tc.desc      Verify mediaToolsByteLengthCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6700
     * @tc.name      testMediaToolsByteLength0067
     * @tc.desc      Verify mediaToolsByteLengthCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6800
     * @tc.name      testMediaToolsByteLength0068
     * @tc.desc      Verify mediaToolsByteLengthCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_6900
     * @tc.name      testMediaToolsByteLength0069
     * @tc.desc      Verify mediaToolsByteLengthCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7000
     * @tc.name      testMediaToolsByteLength0070
     * @tc.desc      Verify mediaToolsByteLengthCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7100
     * @tc.name      testMediaToolsByteLength0071
     * @tc.desc      Verify mediaToolsByteLengthCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7200
     * @tc.name      testMediaToolsByteLength0072
     * @tc.desc      Verify mediaToolsByteLengthCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7300
     * @tc.name      testMediaToolsByteLength0073
     * @tc.desc      Verify mediaToolsByteLengthCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7400
     * @tc.name      testMediaToolsByteLength0074
     * @tc.desc      Verify mediaToolsByteLengthCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7500
     * @tc.name      testMediaToolsByteLength0075
     * @tc.desc      Verify mediaToolsByteLengthCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7600
     * @tc.name      testMediaToolsByteLength0076
     * @tc.desc      Verify mediaToolsByteLengthCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7700
     * @tc.name      testMediaToolsByteLength0077
     * @tc.desc      Verify mediaToolsByteLengthCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7800
     * @tc.name      testMediaToolsByteLength0078
     * @tc.desc      Verify mediaToolsByteLengthCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[1])).assertEqual(expected[1]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_7900
     * @tc.name      testMediaToolsByteLength0079
     * @tc.desc      Verify mediaToolsByteLengthCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[2])).assertEqual(expected[2]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_8000
     * @tc.name      testMediaToolsByteLength0080
     * @tc.desc      Verify mediaToolsByteLengthCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[3])).assertEqual(expected[3]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_CAPTURER_BYTELEN_8100
     * @tc.name      testMediaToolsByteLength0081
     * @tc.desc      Verify mediaToolsByteLengthCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaToolsByteLength0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const inputs: number[] = [0, 96000, 192000, 384000];
      const expected: number[] = [0, 500, 1000, 2000];
      expect(MediaTools.getMsFromByteLength(inputs[0])).assertEqual(expected[0]);
      expect(MediaTools.getMsFromByteLength(192000)).assertEqual(1000);
    });

  });
}
