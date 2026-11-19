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

const TAG: string = '[Sample_harConstantsBoundary]';
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

export default function harConstantsBoundaryTest(): void {
  describe('harConstantsBoundaryTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0100
     * @tc.name      testConstantsBoundary0001
     * @tc.desc      Verify harConstantsBoundary case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0200
     * @tc.name      testConstantsBoundary0002
     * @tc.desc      Verify harConstantsBoundary case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0300
     * @tc.name      testConstantsBoundary0003
     * @tc.desc      Verify harConstantsBoundary case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0400
     * @tc.name      testConstantsBoundary0004
     * @tc.desc      Verify harConstantsBoundary case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0500
     * @tc.name      testConstantsBoundary0005
     * @tc.desc      Verify harConstantsBoundary case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0600
     * @tc.name      testConstantsBoundary0006
     * @tc.desc      Verify harConstantsBoundary case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0700
     * @tc.name      testConstantsBoundary0007
     * @tc.desc      Verify harConstantsBoundary case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0800
     * @tc.name      testConstantsBoundary0008
     * @tc.desc      Verify harConstantsBoundary case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_0900
     * @tc.name      testConstantsBoundary0009
     * @tc.desc      Verify harConstantsBoundary case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1000
     * @tc.name      testConstantsBoundary0010
     * @tc.desc      Verify harConstantsBoundary case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1100
     * @tc.name      testConstantsBoundary0011
     * @tc.desc      Verify harConstantsBoundary case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1200
     * @tc.name      testConstantsBoundary0012
     * @tc.desc      Verify harConstantsBoundary case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1300
     * @tc.name      testConstantsBoundary0013
     * @tc.desc      Verify harConstantsBoundary case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1400
     * @tc.name      testConstantsBoundary0014
     * @tc.desc      Verify harConstantsBoundary case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1500
     * @tc.name      testConstantsBoundary0015
     * @tc.desc      Verify harConstantsBoundary case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1600
     * @tc.name      testConstantsBoundary0016
     * @tc.desc      Verify harConstantsBoundary case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1700
     * @tc.name      testConstantsBoundary0017
     * @tc.desc      Verify harConstantsBoundary case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1800
     * @tc.name      testConstantsBoundary0018
     * @tc.desc      Verify harConstantsBoundary case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_1900
     * @tc.name      testConstantsBoundary0019
     * @tc.desc      Verify harConstantsBoundary case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2000
     * @tc.name      testConstantsBoundary0020
     * @tc.desc      Verify harConstantsBoundary case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2100
     * @tc.name      testConstantsBoundary0021
     * @tc.desc      Verify harConstantsBoundary case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2200
     * @tc.name      testConstantsBoundary0022
     * @tc.desc      Verify harConstantsBoundary case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2300
     * @tc.name      testConstantsBoundary0023
     * @tc.desc      Verify harConstantsBoundary case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2400
     * @tc.name      testConstantsBoundary0024
     * @tc.desc      Verify harConstantsBoundary case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2500
     * @tc.name      testConstantsBoundary0025
     * @tc.desc      Verify harConstantsBoundary case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2600
     * @tc.name      testConstantsBoundary0026
     * @tc.desc      Verify harConstantsBoundary case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2700
     * @tc.name      testConstantsBoundary0027
     * @tc.desc      Verify harConstantsBoundary case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2800
     * @tc.name      testConstantsBoundary0028
     * @tc.desc      Verify harConstantsBoundary case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_2900
     * @tc.name      testConstantsBoundary0029
     * @tc.desc      Verify harConstantsBoundary case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3000
     * @tc.name      testConstantsBoundary0030
     * @tc.desc      Verify harConstantsBoundary case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3100
     * @tc.name      testConstantsBoundary0031
     * @tc.desc      Verify harConstantsBoundary case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3200
     * @tc.name      testConstantsBoundary0032
     * @tc.desc      Verify harConstantsBoundary case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3300
     * @tc.name      testConstantsBoundary0033
     * @tc.desc      Verify harConstantsBoundary case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3400
     * @tc.name      testConstantsBoundary0034
     * @tc.desc      Verify harConstantsBoundary case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3500
     * @tc.name      testConstantsBoundary0035
     * @tc.desc      Verify harConstantsBoundary case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3600
     * @tc.name      testConstantsBoundary0036
     * @tc.desc      Verify harConstantsBoundary case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3700
     * @tc.name      testConstantsBoundary0037
     * @tc.desc      Verify harConstantsBoundary case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3800
     * @tc.name      testConstantsBoundary0038
     * @tc.desc      Verify harConstantsBoundary case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_3900
     * @tc.name      testConstantsBoundary0039
     * @tc.desc      Verify harConstantsBoundary case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4000
     * @tc.name      testConstantsBoundary0040
     * @tc.desc      Verify harConstantsBoundary case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4100
     * @tc.name      testConstantsBoundary0041
     * @tc.desc      Verify harConstantsBoundary case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4200
     * @tc.name      testConstantsBoundary0042
     * @tc.desc      Verify harConstantsBoundary case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4300
     * @tc.name      testConstantsBoundary0043
     * @tc.desc      Verify harConstantsBoundary case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4400
     * @tc.name      testConstantsBoundary0044
     * @tc.desc      Verify harConstantsBoundary case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4500
     * @tc.name      testConstantsBoundary0045
     * @tc.desc      Verify harConstantsBoundary case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4600
     * @tc.name      testConstantsBoundary0046
     * @tc.desc      Verify harConstantsBoundary case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4700
     * @tc.name      testConstantsBoundary0047
     * @tc.desc      Verify harConstantsBoundary case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4800
     * @tc.name      testConstantsBoundary0048
     * @tc.desc      Verify harConstantsBoundary case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_4900
     * @tc.name      testConstantsBoundary0049
     * @tc.desc      Verify harConstantsBoundary case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5000
     * @tc.name      testConstantsBoundary0050
     * @tc.desc      Verify harConstantsBoundary case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5100
     * @tc.name      testConstantsBoundary0051
     * @tc.desc      Verify harConstantsBoundary case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5200
     * @tc.name      testConstantsBoundary0052
     * @tc.desc      Verify harConstantsBoundary case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5300
     * @tc.name      testConstantsBoundary0053
     * @tc.desc      Verify harConstantsBoundary case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5400
     * @tc.name      testConstantsBoundary0054
     * @tc.desc      Verify harConstantsBoundary case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5500
     * @tc.name      testConstantsBoundary0055
     * @tc.desc      Verify harConstantsBoundary case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5600
     * @tc.name      testConstantsBoundary0056
     * @tc.desc      Verify harConstantsBoundary case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5700
     * @tc.name      testConstantsBoundary0057
     * @tc.desc      Verify harConstantsBoundary case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5800
     * @tc.name      testConstantsBoundary0058
     * @tc.desc      Verify harConstantsBoundary case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_5900
     * @tc.name      testConstantsBoundary0059
     * @tc.desc      Verify harConstantsBoundary case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6000
     * @tc.name      testConstantsBoundary0060
     * @tc.desc      Verify harConstantsBoundary case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6100
     * @tc.name      testConstantsBoundary0061
     * @tc.desc      Verify harConstantsBoundary case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6200
     * @tc.name      testConstantsBoundary0062
     * @tc.desc      Verify harConstantsBoundary case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6300
     * @tc.name      testConstantsBoundary0063
     * @tc.desc      Verify harConstantsBoundary case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6400
     * @tc.name      testConstantsBoundary0064
     * @tc.desc      Verify harConstantsBoundary case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6500
     * @tc.name      testConstantsBoundary0065
     * @tc.desc      Verify harConstantsBoundary case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6600
     * @tc.name      testConstantsBoundary0066
     * @tc.desc      Verify harConstantsBoundary case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6700
     * @tc.name      testConstantsBoundary0067
     * @tc.desc      Verify harConstantsBoundary case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6800
     * @tc.name      testConstantsBoundary0068
     * @tc.desc      Verify harConstantsBoundary case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_6900
     * @tc.name      testConstantsBoundary0069
     * @tc.desc      Verify harConstantsBoundary case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7000
     * @tc.name      testConstantsBoundary0070
     * @tc.desc      Verify harConstantsBoundary case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7100
     * @tc.name      testConstantsBoundary0071
     * @tc.desc      Verify harConstantsBoundary case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7200
     * @tc.name      testConstantsBoundary0072
     * @tc.desc      Verify harConstantsBoundary case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7300
     * @tc.name      testConstantsBoundary0073
     * @tc.desc      Verify harConstantsBoundary case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7400
     * @tc.name      testConstantsBoundary0074
     * @tc.desc      Verify harConstantsBoundary case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7500
     * @tc.name      testConstantsBoundary0075
     * @tc.desc      Verify harConstantsBoundary case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7600
     * @tc.name      testConstantsBoundary0076
     * @tc.desc      Verify harConstantsBoundary case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7700
     * @tc.name      testConstantsBoundary0077
     * @tc.desc      Verify harConstantsBoundary case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual(values[0]);
      expect(values[1].toString()).assertEqual('1');
      expect(String(values[1])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7800
     * @tc.name      testConstantsBoundary0078
     * @tc.desc      Verify harConstantsBoundary case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual(values[0]);
      expect(values[2].toString()).assertEqual('1');
      expect(String(values[2])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_7900
     * @tc.name      testConstantsBoundary0079
     * @tc.desc      Verify harConstantsBoundary case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual(values[0]);
      expect(values[3].toString()).assertEqual('1');
      expect(String(values[3])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_8000
     * @tc.name      testConstantsBoundary0080
     * @tc.desc      Verify harConstantsBoundary case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual(values[0]);
      expect(values[4].toString()).assertEqual('1');
      expect(String(values[4])).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_BOUND_8100
     * @tc.name      testConstantsBoundary0081
     * @tc.desc      Verify harConstantsBoundary case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual(values[0]);
      expect(values[0].toString()).assertEqual('1');
      expect(String(values[0])).assertEqual('1');
    });

  });
}
