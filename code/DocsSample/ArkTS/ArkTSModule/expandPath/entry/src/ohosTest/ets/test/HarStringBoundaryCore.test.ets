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

const TAG: string = '[Sample_harStringBoundaryCore]';
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

export default function harStringBoundaryCoreTest(): void {
  describe('harStringBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0100
     * @tc.name      testStringBoundary0001
     * @tc.desc      Verify harStringBoundaryCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0200
     * @tc.name      testStringBoundary0002
     * @tc.desc      Verify harStringBoundaryCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0300
     * @tc.name      testStringBoundary0003
     * @tc.desc      Verify harStringBoundaryCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0400
     * @tc.name      testStringBoundary0004
     * @tc.desc      Verify harStringBoundaryCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0500
     * @tc.name      testStringBoundary0005
     * @tc.desc      Verify harStringBoundaryCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0600
     * @tc.name      testStringBoundary0006
     * @tc.desc      Verify harStringBoundaryCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0700
     * @tc.name      testStringBoundary0007
     * @tc.desc      Verify harStringBoundaryCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0800
     * @tc.name      testStringBoundary0008
     * @tc.desc      Verify harStringBoundaryCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_0900
     * @tc.name      testStringBoundary0009
     * @tc.desc      Verify harStringBoundaryCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1000
     * @tc.name      testStringBoundary0010
     * @tc.desc      Verify harStringBoundaryCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1100
     * @tc.name      testStringBoundary0011
     * @tc.desc      Verify harStringBoundaryCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1200
     * @tc.name      testStringBoundary0012
     * @tc.desc      Verify harStringBoundaryCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1300
     * @tc.name      testStringBoundary0013
     * @tc.desc      Verify harStringBoundaryCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1400
     * @tc.name      testStringBoundary0014
     * @tc.desc      Verify harStringBoundaryCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1500
     * @tc.name      testStringBoundary0015
     * @tc.desc      Verify harStringBoundaryCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1600
     * @tc.name      testStringBoundary0016
     * @tc.desc      Verify harStringBoundaryCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1700
     * @tc.name      testStringBoundary0017
     * @tc.desc      Verify harStringBoundaryCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1800
     * @tc.name      testStringBoundary0018
     * @tc.desc      Verify harStringBoundaryCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_1900
     * @tc.name      testStringBoundary0019
     * @tc.desc      Verify harStringBoundaryCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2000
     * @tc.name      testStringBoundary0020
     * @tc.desc      Verify harStringBoundaryCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2100
     * @tc.name      testStringBoundary0021
     * @tc.desc      Verify harStringBoundaryCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2200
     * @tc.name      testStringBoundary0022
     * @tc.desc      Verify harStringBoundaryCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2300
     * @tc.name      testStringBoundary0023
     * @tc.desc      Verify harStringBoundaryCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2400
     * @tc.name      testStringBoundary0024
     * @tc.desc      Verify harStringBoundaryCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2500
     * @tc.name      testStringBoundary0025
     * @tc.desc      Verify harStringBoundaryCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2600
     * @tc.name      testStringBoundary0026
     * @tc.desc      Verify harStringBoundaryCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2700
     * @tc.name      testStringBoundary0027
     * @tc.desc      Verify harStringBoundaryCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2800
     * @tc.name      testStringBoundary0028
     * @tc.desc      Verify harStringBoundaryCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_2900
     * @tc.name      testStringBoundary0029
     * @tc.desc      Verify harStringBoundaryCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3000
     * @tc.name      testStringBoundary0030
     * @tc.desc      Verify harStringBoundaryCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3100
     * @tc.name      testStringBoundary0031
     * @tc.desc      Verify harStringBoundaryCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3200
     * @tc.name      testStringBoundary0032
     * @tc.desc      Verify harStringBoundaryCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3300
     * @tc.name      testStringBoundary0033
     * @tc.desc      Verify harStringBoundaryCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3400
     * @tc.name      testStringBoundary0034
     * @tc.desc      Verify harStringBoundaryCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3500
     * @tc.name      testStringBoundary0035
     * @tc.desc      Verify harStringBoundaryCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3600
     * @tc.name      testStringBoundary0036
     * @tc.desc      Verify harStringBoundaryCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3700
     * @tc.name      testStringBoundary0037
     * @tc.desc      Verify harStringBoundaryCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3800
     * @tc.name      testStringBoundary0038
     * @tc.desc      Verify harStringBoundaryCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_3900
     * @tc.name      testStringBoundary0039
     * @tc.desc      Verify harStringBoundaryCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4000
     * @tc.name      testStringBoundary0040
     * @tc.desc      Verify harStringBoundaryCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4100
     * @tc.name      testStringBoundary0041
     * @tc.desc      Verify harStringBoundaryCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4200
     * @tc.name      testStringBoundary0042
     * @tc.desc      Verify harStringBoundaryCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4300
     * @tc.name      testStringBoundary0043
     * @tc.desc      Verify harStringBoundaryCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4400
     * @tc.name      testStringBoundary0044
     * @tc.desc      Verify harStringBoundaryCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4500
     * @tc.name      testStringBoundary0045
     * @tc.desc      Verify harStringBoundaryCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4600
     * @tc.name      testStringBoundary0046
     * @tc.desc      Verify harStringBoundaryCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4700
     * @tc.name      testStringBoundary0047
     * @tc.desc      Verify harStringBoundaryCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4800
     * @tc.name      testStringBoundary0048
     * @tc.desc      Verify harStringBoundaryCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_4900
     * @tc.name      testStringBoundary0049
     * @tc.desc      Verify harStringBoundaryCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5000
     * @tc.name      testStringBoundary0050
     * @tc.desc      Verify harStringBoundaryCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5100
     * @tc.name      testStringBoundary0051
     * @tc.desc      Verify harStringBoundaryCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5200
     * @tc.name      testStringBoundary0052
     * @tc.desc      Verify harStringBoundaryCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5300
     * @tc.name      testStringBoundary0053
     * @tc.desc      Verify harStringBoundaryCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5400
     * @tc.name      testStringBoundary0054
     * @tc.desc      Verify harStringBoundaryCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5500
     * @tc.name      testStringBoundary0055
     * @tc.desc      Verify harStringBoundaryCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5600
     * @tc.name      testStringBoundary0056
     * @tc.desc      Verify harStringBoundaryCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5700
     * @tc.name      testStringBoundary0057
     * @tc.desc      Verify harStringBoundaryCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5800
     * @tc.name      testStringBoundary0058
     * @tc.desc      Verify harStringBoundaryCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_5900
     * @tc.name      testStringBoundary0059
     * @tc.desc      Verify harStringBoundaryCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6000
     * @tc.name      testStringBoundary0060
     * @tc.desc      Verify harStringBoundaryCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6100
     * @tc.name      testStringBoundary0061
     * @tc.desc      Verify harStringBoundaryCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6200
     * @tc.name      testStringBoundary0062
     * @tc.desc      Verify harStringBoundaryCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6300
     * @tc.name      testStringBoundary0063
     * @tc.desc      Verify harStringBoundaryCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6400
     * @tc.name      testStringBoundary0064
     * @tc.desc      Verify harStringBoundaryCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6500
     * @tc.name      testStringBoundary0065
     * @tc.desc      Verify harStringBoundaryCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6600
     * @tc.name      testStringBoundary0066
     * @tc.desc      Verify harStringBoundaryCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6700
     * @tc.name      testStringBoundary0067
     * @tc.desc      Verify harStringBoundaryCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6800
     * @tc.name      testStringBoundary0068
     * @tc.desc      Verify harStringBoundaryCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_6900
     * @tc.name      testStringBoundary0069
     * @tc.desc      Verify harStringBoundaryCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7000
     * @tc.name      testStringBoundary0070
     * @tc.desc      Verify harStringBoundaryCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7100
     * @tc.name      testStringBoundary0071
     * @tc.desc      Verify harStringBoundaryCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7200
     * @tc.name      testStringBoundary0072
     * @tc.desc      Verify harStringBoundaryCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7300
     * @tc.name      testStringBoundary0073
     * @tc.desc      Verify harStringBoundaryCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7400
     * @tc.name      testStringBoundary0074
     * @tc.desc      Verify harStringBoundaryCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7500
     * @tc.name      testStringBoundary0075
     * @tc.desc      Verify harStringBoundaryCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7600
     * @tc.name      testStringBoundary0076
     * @tc.desc      Verify harStringBoundaryCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7700
     * @tc.name      testStringBoundary0077
     * @tc.desc      Verify harStringBoundaryCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7800
     * @tc.name      testStringBoundary0078
     * @tc.desc      Verify harStringBoundaryCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_7900
     * @tc.name      testStringBoundary0079
     * @tc.desc      Verify harStringBoundaryCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_8000
     * @tc.name      testStringBoundary0080
     * @tc.desc      Verify harStringBoundaryCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_STR_BOUND_8100
     * @tc.name      testStringBoundary0081
     * @tc.desc      Verify harStringBoundaryCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.indexOf(' ')).assertEqual(-1);
      expect(value.indexOf('\n')).assertEqual(-1);
      expect(value.indexOf('\t')).assertEqual(-1);
      expect(value.length).assertEqual(1);
    });

  });
}
