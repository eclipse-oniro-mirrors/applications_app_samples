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

const TAG: string = '[Sample_harExportValueCore]';
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

export default function harExportValueCoreTest(): void {
  describe('harExportValueCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_VALUE_0100
     * @tc.name      testExportValue0001
     * @tc.desc      Verify harExportValueCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0200
     * @tc.name      testExportValue0002
     * @tc.desc      Verify harExportValueCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0300
     * @tc.name      testExportValue0003
     * @tc.desc      Verify harExportValueCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0400
     * @tc.name      testExportValue0004
     * @tc.desc      Verify harExportValueCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0500
     * @tc.name      testExportValue0005
     * @tc.desc      Verify harExportValueCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0600
     * @tc.name      testExportValue0006
     * @tc.desc      Verify harExportValueCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0700
     * @tc.name      testExportValue0007
     * @tc.desc      Verify harExportValueCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0800
     * @tc.name      testExportValue0008
     * @tc.desc      Verify harExportValueCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_0900
     * @tc.name      testExportValue0009
     * @tc.desc      Verify harExportValueCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1000
     * @tc.name      testExportValue0010
     * @tc.desc      Verify harExportValueCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1100
     * @tc.name      testExportValue0011
     * @tc.desc      Verify harExportValueCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1200
     * @tc.name      testExportValue0012
     * @tc.desc      Verify harExportValueCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1300
     * @tc.name      testExportValue0013
     * @tc.desc      Verify harExportValueCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1400
     * @tc.name      testExportValue0014
     * @tc.desc      Verify harExportValueCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1500
     * @tc.name      testExportValue0015
     * @tc.desc      Verify harExportValueCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1600
     * @tc.name      testExportValue0016
     * @tc.desc      Verify harExportValueCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1700
     * @tc.name      testExportValue0017
     * @tc.desc      Verify harExportValueCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1800
     * @tc.name      testExportValue0018
     * @tc.desc      Verify harExportValueCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_1900
     * @tc.name      testExportValue0019
     * @tc.desc      Verify harExportValueCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2000
     * @tc.name      testExportValue0020
     * @tc.desc      Verify harExportValueCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2100
     * @tc.name      testExportValue0021
     * @tc.desc      Verify harExportValueCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2200
     * @tc.name      testExportValue0022
     * @tc.desc      Verify harExportValueCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2300
     * @tc.name      testExportValue0023
     * @tc.desc      Verify harExportValueCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2400
     * @tc.name      testExportValue0024
     * @tc.desc      Verify harExportValueCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2500
     * @tc.name      testExportValue0025
     * @tc.desc      Verify harExportValueCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2600
     * @tc.name      testExportValue0026
     * @tc.desc      Verify harExportValueCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2700
     * @tc.name      testExportValue0027
     * @tc.desc      Verify harExportValueCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2800
     * @tc.name      testExportValue0028
     * @tc.desc      Verify harExportValueCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_2900
     * @tc.name      testExportValue0029
     * @tc.desc      Verify harExportValueCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3000
     * @tc.name      testExportValue0030
     * @tc.desc      Verify harExportValueCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3100
     * @tc.name      testExportValue0031
     * @tc.desc      Verify harExportValueCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3200
     * @tc.name      testExportValue0032
     * @tc.desc      Verify harExportValueCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3300
     * @tc.name      testExportValue0033
     * @tc.desc      Verify harExportValueCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3400
     * @tc.name      testExportValue0034
     * @tc.desc      Verify harExportValueCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3500
     * @tc.name      testExportValue0035
     * @tc.desc      Verify harExportValueCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3600
     * @tc.name      testExportValue0036
     * @tc.desc      Verify harExportValueCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3700
     * @tc.name      testExportValue0037
     * @tc.desc      Verify harExportValueCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3800
     * @tc.name      testExportValue0038
     * @tc.desc      Verify harExportValueCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_3900
     * @tc.name      testExportValue0039
     * @tc.desc      Verify harExportValueCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4000
     * @tc.name      testExportValue0040
     * @tc.desc      Verify harExportValueCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4100
     * @tc.name      testExportValue0041
     * @tc.desc      Verify harExportValueCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4200
     * @tc.name      testExportValue0042
     * @tc.desc      Verify harExportValueCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4300
     * @tc.name      testExportValue0043
     * @tc.desc      Verify harExportValueCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4400
     * @tc.name      testExportValue0044
     * @tc.desc      Verify harExportValueCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4500
     * @tc.name      testExportValue0045
     * @tc.desc      Verify harExportValueCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4600
     * @tc.name      testExportValue0046
     * @tc.desc      Verify harExportValueCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4700
     * @tc.name      testExportValue0047
     * @tc.desc      Verify harExportValueCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4800
     * @tc.name      testExportValue0048
     * @tc.desc      Verify harExportValueCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_4900
     * @tc.name      testExportValue0049
     * @tc.desc      Verify harExportValueCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5000
     * @tc.name      testExportValue0050
     * @tc.desc      Verify harExportValueCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5100
     * @tc.name      testExportValue0051
     * @tc.desc      Verify harExportValueCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5200
     * @tc.name      testExportValue0052
     * @tc.desc      Verify harExportValueCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5300
     * @tc.name      testExportValue0053
     * @tc.desc      Verify harExportValueCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5400
     * @tc.name      testExportValue0054
     * @tc.desc      Verify harExportValueCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5500
     * @tc.name      testExportValue0055
     * @tc.desc      Verify harExportValueCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5600
     * @tc.name      testExportValue0056
     * @tc.desc      Verify harExportValueCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5700
     * @tc.name      testExportValue0057
     * @tc.desc      Verify harExportValueCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5800
     * @tc.name      testExportValue0058
     * @tc.desc      Verify harExportValueCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_5900
     * @tc.name      testExportValue0059
     * @tc.desc      Verify harExportValueCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6000
     * @tc.name      testExportValue0060
     * @tc.desc      Verify harExportValueCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6100
     * @tc.name      testExportValue0061
     * @tc.desc      Verify harExportValueCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6200
     * @tc.name      testExportValue0062
     * @tc.desc      Verify harExportValueCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6300
     * @tc.name      testExportValue0063
     * @tc.desc      Verify harExportValueCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6400
     * @tc.name      testExportValue0064
     * @tc.desc      Verify harExportValueCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6500
     * @tc.name      testExportValue0065
     * @tc.desc      Verify harExportValueCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6600
     * @tc.name      testExportValue0066
     * @tc.desc      Verify harExportValueCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6700
     * @tc.name      testExportValue0067
     * @tc.desc      Verify harExportValueCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6800
     * @tc.name      testExportValue0068
     * @tc.desc      Verify harExportValueCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_6900
     * @tc.name      testExportValue0069
     * @tc.desc      Verify harExportValueCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7000
     * @tc.name      testExportValue0070
     * @tc.desc      Verify harExportValueCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7100
     * @tc.name      testExportValue0071
     * @tc.desc      Verify harExportValueCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7200
     * @tc.name      testExportValue0072
     * @tc.desc      Verify harExportValueCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7300
     * @tc.name      testExportValue0073
     * @tc.desc      Verify harExportValueCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7400
     * @tc.name      testExportValue0074
     * @tc.desc      Verify harExportValueCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7500
     * @tc.name      testExportValue0075
     * @tc.desc      Verify harExportValueCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7600
     * @tc.name      testExportValue0076
     * @tc.desc      Verify harExportValueCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7700
     * @tc.name      testExportValue0077
     * @tc.desc      Verify harExportValueCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[1]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7800
     * @tc.name      testExportValue0078
     * @tc.desc      Verify harExportValueCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[2]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_7900
     * @tc.name      testExportValue0079
     * @tc.desc      Verify harExportValueCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[3]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_8000
     * @tc.name      testExportValue0080
     * @tc.desc      Verify harExportValueCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[4]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_VALUE_8100
     * @tc.name      testExportValue0081
     * @tc.desc      Verify harExportValueCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportValue0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(values[0]).assertEqual('1');
      expect(values.length).assertEqual(5);
      expect(har.One).assertEqual('1');
    });

  });
}
