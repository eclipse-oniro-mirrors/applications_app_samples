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
import * as har from 'expandPathHar';

const TAG: string = '[Sample_harNumberBoundaryCore]';
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

export default function harNumberBoundaryCoreTest(): void {
  describe('harNumberBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0100
     * @tc.name      testNumberBoundary0001
     * @tc.desc      Verify harNumberBoundaryCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0200
     * @tc.name      testNumberBoundary0002
     * @tc.desc      Verify harNumberBoundaryCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0300
     * @tc.name      testNumberBoundary0003
     * @tc.desc      Verify harNumberBoundaryCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0400
     * @tc.name      testNumberBoundary0004
     * @tc.desc      Verify harNumberBoundaryCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0500
     * @tc.name      testNumberBoundary0005
     * @tc.desc      Verify harNumberBoundaryCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0600
     * @tc.name      testNumberBoundary0006
     * @tc.desc      Verify harNumberBoundaryCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0700
     * @tc.name      testNumberBoundary0007
     * @tc.desc      Verify harNumberBoundaryCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0800
     * @tc.name      testNumberBoundary0008
     * @tc.desc      Verify harNumberBoundaryCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_0900
     * @tc.name      testNumberBoundary0009
     * @tc.desc      Verify harNumberBoundaryCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1000
     * @tc.name      testNumberBoundary0010
     * @tc.desc      Verify harNumberBoundaryCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1100
     * @tc.name      testNumberBoundary0011
     * @tc.desc      Verify harNumberBoundaryCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1200
     * @tc.name      testNumberBoundary0012
     * @tc.desc      Verify harNumberBoundaryCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1300
     * @tc.name      testNumberBoundary0013
     * @tc.desc      Verify harNumberBoundaryCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1400
     * @tc.name      testNumberBoundary0014
     * @tc.desc      Verify harNumberBoundaryCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1500
     * @tc.name      testNumberBoundary0015
     * @tc.desc      Verify harNumberBoundaryCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1600
     * @tc.name      testNumberBoundary0016
     * @tc.desc      Verify harNumberBoundaryCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1700
     * @tc.name      testNumberBoundary0017
     * @tc.desc      Verify harNumberBoundaryCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1800
     * @tc.name      testNumberBoundary0018
     * @tc.desc      Verify harNumberBoundaryCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_1900
     * @tc.name      testNumberBoundary0019
     * @tc.desc      Verify harNumberBoundaryCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2000
     * @tc.name      testNumberBoundary0020
     * @tc.desc      Verify harNumberBoundaryCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2100
     * @tc.name      testNumberBoundary0021
     * @tc.desc      Verify harNumberBoundaryCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2200
     * @tc.name      testNumberBoundary0022
     * @tc.desc      Verify harNumberBoundaryCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2300
     * @tc.name      testNumberBoundary0023
     * @tc.desc      Verify harNumberBoundaryCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2400
     * @tc.name      testNumberBoundary0024
     * @tc.desc      Verify harNumberBoundaryCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2500
     * @tc.name      testNumberBoundary0025
     * @tc.desc      Verify harNumberBoundaryCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2600
     * @tc.name      testNumberBoundary0026
     * @tc.desc      Verify harNumberBoundaryCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2700
     * @tc.name      testNumberBoundary0027
     * @tc.desc      Verify harNumberBoundaryCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2800
     * @tc.name      testNumberBoundary0028
     * @tc.desc      Verify harNumberBoundaryCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_2900
     * @tc.name      testNumberBoundary0029
     * @tc.desc      Verify harNumberBoundaryCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3000
     * @tc.name      testNumberBoundary0030
     * @tc.desc      Verify harNumberBoundaryCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3100
     * @tc.name      testNumberBoundary0031
     * @tc.desc      Verify harNumberBoundaryCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3200
     * @tc.name      testNumberBoundary0032
     * @tc.desc      Verify harNumberBoundaryCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3300
     * @tc.name      testNumberBoundary0033
     * @tc.desc      Verify harNumberBoundaryCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3400
     * @tc.name      testNumberBoundary0034
     * @tc.desc      Verify harNumberBoundaryCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3500
     * @tc.name      testNumberBoundary0035
     * @tc.desc      Verify harNumberBoundaryCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3600
     * @tc.name      testNumberBoundary0036
     * @tc.desc      Verify harNumberBoundaryCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3700
     * @tc.name      testNumberBoundary0037
     * @tc.desc      Verify harNumberBoundaryCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3800
     * @tc.name      testNumberBoundary0038
     * @tc.desc      Verify harNumberBoundaryCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_3900
     * @tc.name      testNumberBoundary0039
     * @tc.desc      Verify harNumberBoundaryCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4000
     * @tc.name      testNumberBoundary0040
     * @tc.desc      Verify harNumberBoundaryCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4100
     * @tc.name      testNumberBoundary0041
     * @tc.desc      Verify harNumberBoundaryCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4200
     * @tc.name      testNumberBoundary0042
     * @tc.desc      Verify harNumberBoundaryCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4300
     * @tc.name      testNumberBoundary0043
     * @tc.desc      Verify harNumberBoundaryCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4400
     * @tc.name      testNumberBoundary0044
     * @tc.desc      Verify harNumberBoundaryCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4500
     * @tc.name      testNumberBoundary0045
     * @tc.desc      Verify harNumberBoundaryCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4600
     * @tc.name      testNumberBoundary0046
     * @tc.desc      Verify harNumberBoundaryCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4700
     * @tc.name      testNumberBoundary0047
     * @tc.desc      Verify harNumberBoundaryCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4800
     * @tc.name      testNumberBoundary0048
     * @tc.desc      Verify harNumberBoundaryCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_4900
     * @tc.name      testNumberBoundary0049
     * @tc.desc      Verify harNumberBoundaryCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5000
     * @tc.name      testNumberBoundary0050
     * @tc.desc      Verify harNumberBoundaryCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5100
     * @tc.name      testNumberBoundary0051
     * @tc.desc      Verify harNumberBoundaryCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5200
     * @tc.name      testNumberBoundary0052
     * @tc.desc      Verify harNumberBoundaryCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5300
     * @tc.name      testNumberBoundary0053
     * @tc.desc      Verify harNumberBoundaryCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5400
     * @tc.name      testNumberBoundary0054
     * @tc.desc      Verify harNumberBoundaryCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5500
     * @tc.name      testNumberBoundary0055
     * @tc.desc      Verify harNumberBoundaryCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5600
     * @tc.name      testNumberBoundary0056
     * @tc.desc      Verify harNumberBoundaryCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5700
     * @tc.name      testNumberBoundary0057
     * @tc.desc      Verify harNumberBoundaryCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5800
     * @tc.name      testNumberBoundary0058
     * @tc.desc      Verify harNumberBoundaryCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_5900
     * @tc.name      testNumberBoundary0059
     * @tc.desc      Verify harNumberBoundaryCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6000
     * @tc.name      testNumberBoundary0060
     * @tc.desc      Verify harNumberBoundaryCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6100
     * @tc.name      testNumberBoundary0061
     * @tc.desc      Verify harNumberBoundaryCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6200
     * @tc.name      testNumberBoundary0062
     * @tc.desc      Verify harNumberBoundaryCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6300
     * @tc.name      testNumberBoundary0063
     * @tc.desc      Verify harNumberBoundaryCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6400
     * @tc.name      testNumberBoundary0064
     * @tc.desc      Verify harNumberBoundaryCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6500
     * @tc.name      testNumberBoundary0065
     * @tc.desc      Verify harNumberBoundaryCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6600
     * @tc.name      testNumberBoundary0066
     * @tc.desc      Verify harNumberBoundaryCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6700
     * @tc.name      testNumberBoundary0067
     * @tc.desc      Verify harNumberBoundaryCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6800
     * @tc.name      testNumberBoundary0068
     * @tc.desc      Verify harNumberBoundaryCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_6900
     * @tc.name      testNumberBoundary0069
     * @tc.desc      Verify harNumberBoundaryCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7000
     * @tc.name      testNumberBoundary0070
     * @tc.desc      Verify harNumberBoundaryCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7100
     * @tc.name      testNumberBoundary0071
     * @tc.desc      Verify harNumberBoundaryCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7200
     * @tc.name      testNumberBoundary0072
     * @tc.desc      Verify harNumberBoundaryCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7300
     * @tc.name      testNumberBoundary0073
     * @tc.desc      Verify harNumberBoundaryCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7400
     * @tc.name      testNumberBoundary0074
     * @tc.desc      Verify harNumberBoundaryCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7500
     * @tc.name      testNumberBoundary0075
     * @tc.desc      Verify harNumberBoundaryCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7600
     * @tc.name      testNumberBoundary0076
     * @tc.desc      Verify harNumberBoundaryCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7700
     * @tc.name      testNumberBoundary0077
     * @tc.desc      Verify harNumberBoundaryCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7800
     * @tc.name      testNumberBoundary0078
     * @tc.desc      Verify harNumberBoundaryCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_7900
     * @tc.name      testNumberBoundary0079
     * @tc.desc      Verify harNumberBoundaryCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_8000
     * @tc.name      testNumberBoundary0080
     * @tc.desc      Verify harNumberBoundaryCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_NUM_BOUND_8100
     * @tc.name      testNumberBoundary0081
     * @tc.desc      Verify harNumberBoundaryCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(Number(value)).assertEqual(1);
      expect(parseInt(value, 10)).assertEqual(1);
      expect(String(Number(value))).assertEqual('1');
    });

  });
}
