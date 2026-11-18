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
import { One as DeepOne } from 'expandPathHar/src/main/ets/NumberString';
import { One as UtilsOne } from 'expandPathHar/src/main/ets/Utils';
import { module1 as DeepModule1 } from 'expandPathHar/src/main/ets/OtherModule1';

const TAG: string = '[Sample_harAggregationValueCore]';
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

export default function harAggregationValueCoreTest(): void {
  describe('harAggregationValueCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0100
     * @tc.name      testAggregationValue0001
     * @tc.desc      Verify harAggregationValueCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0200
     * @tc.name      testAggregationValue0002
     * @tc.desc      Verify harAggregationValueCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0300
     * @tc.name      testAggregationValue0003
     * @tc.desc      Verify harAggregationValueCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0400
     * @tc.name      testAggregationValue0004
     * @tc.desc      Verify harAggregationValueCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0500
     * @tc.name      testAggregationValue0005
     * @tc.desc      Verify harAggregationValueCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0600
     * @tc.name      testAggregationValue0006
     * @tc.desc      Verify harAggregationValueCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0700
     * @tc.name      testAggregationValue0007
     * @tc.desc      Verify harAggregationValueCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0800
     * @tc.name      testAggregationValue0008
     * @tc.desc      Verify harAggregationValueCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_0900
     * @tc.name      testAggregationValue0009
     * @tc.desc      Verify harAggregationValueCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1000
     * @tc.name      testAggregationValue0010
     * @tc.desc      Verify harAggregationValueCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1100
     * @tc.name      testAggregationValue0011
     * @tc.desc      Verify harAggregationValueCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1200
     * @tc.name      testAggregationValue0012
     * @tc.desc      Verify harAggregationValueCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1300
     * @tc.name      testAggregationValue0013
     * @tc.desc      Verify harAggregationValueCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1400
     * @tc.name      testAggregationValue0014
     * @tc.desc      Verify harAggregationValueCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1500
     * @tc.name      testAggregationValue0015
     * @tc.desc      Verify harAggregationValueCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1600
     * @tc.name      testAggregationValue0016
     * @tc.desc      Verify harAggregationValueCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1700
     * @tc.name      testAggregationValue0017
     * @tc.desc      Verify harAggregationValueCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1800
     * @tc.name      testAggregationValue0018
     * @tc.desc      Verify harAggregationValueCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_1900
     * @tc.name      testAggregationValue0019
     * @tc.desc      Verify harAggregationValueCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2000
     * @tc.name      testAggregationValue0020
     * @tc.desc      Verify harAggregationValueCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2100
     * @tc.name      testAggregationValue0021
     * @tc.desc      Verify harAggregationValueCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2200
     * @tc.name      testAggregationValue0022
     * @tc.desc      Verify harAggregationValueCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2300
     * @tc.name      testAggregationValue0023
     * @tc.desc      Verify harAggregationValueCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2400
     * @tc.name      testAggregationValue0024
     * @tc.desc      Verify harAggregationValueCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2500
     * @tc.name      testAggregationValue0025
     * @tc.desc      Verify harAggregationValueCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2600
     * @tc.name      testAggregationValue0026
     * @tc.desc      Verify harAggregationValueCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2700
     * @tc.name      testAggregationValue0027
     * @tc.desc      Verify harAggregationValueCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2800
     * @tc.name      testAggregationValue0028
     * @tc.desc      Verify harAggregationValueCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_2900
     * @tc.name      testAggregationValue0029
     * @tc.desc      Verify harAggregationValueCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3000
     * @tc.name      testAggregationValue0030
     * @tc.desc      Verify harAggregationValueCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3100
     * @tc.name      testAggregationValue0031
     * @tc.desc      Verify harAggregationValueCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3200
     * @tc.name      testAggregationValue0032
     * @tc.desc      Verify harAggregationValueCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3300
     * @tc.name      testAggregationValue0033
     * @tc.desc      Verify harAggregationValueCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3400
     * @tc.name      testAggregationValue0034
     * @tc.desc      Verify harAggregationValueCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3500
     * @tc.name      testAggregationValue0035
     * @tc.desc      Verify harAggregationValueCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3600
     * @tc.name      testAggregationValue0036
     * @tc.desc      Verify harAggregationValueCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3700
     * @tc.name      testAggregationValue0037
     * @tc.desc      Verify harAggregationValueCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3800
     * @tc.name      testAggregationValue0038
     * @tc.desc      Verify harAggregationValueCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_3900
     * @tc.name      testAggregationValue0039
     * @tc.desc      Verify harAggregationValueCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4000
     * @tc.name      testAggregationValue0040
     * @tc.desc      Verify harAggregationValueCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4100
     * @tc.name      testAggregationValue0041
     * @tc.desc      Verify harAggregationValueCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4200
     * @tc.name      testAggregationValue0042
     * @tc.desc      Verify harAggregationValueCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4300
     * @tc.name      testAggregationValue0043
     * @tc.desc      Verify harAggregationValueCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4400
     * @tc.name      testAggregationValue0044
     * @tc.desc      Verify harAggregationValueCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4500
     * @tc.name      testAggregationValue0045
     * @tc.desc      Verify harAggregationValueCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4600
     * @tc.name      testAggregationValue0046
     * @tc.desc      Verify harAggregationValueCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4700
     * @tc.name      testAggregationValue0047
     * @tc.desc      Verify harAggregationValueCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4800
     * @tc.name      testAggregationValue0048
     * @tc.desc      Verify harAggregationValueCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_4900
     * @tc.name      testAggregationValue0049
     * @tc.desc      Verify harAggregationValueCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5000
     * @tc.name      testAggregationValue0050
     * @tc.desc      Verify harAggregationValueCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5100
     * @tc.name      testAggregationValue0051
     * @tc.desc      Verify harAggregationValueCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5200
     * @tc.name      testAggregationValue0052
     * @tc.desc      Verify harAggregationValueCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5300
     * @tc.name      testAggregationValue0053
     * @tc.desc      Verify harAggregationValueCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5400
     * @tc.name      testAggregationValue0054
     * @tc.desc      Verify harAggregationValueCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5500
     * @tc.name      testAggregationValue0055
     * @tc.desc      Verify harAggregationValueCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5600
     * @tc.name      testAggregationValue0056
     * @tc.desc      Verify harAggregationValueCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5700
     * @tc.name      testAggregationValue0057
     * @tc.desc      Verify harAggregationValueCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5800
     * @tc.name      testAggregationValue0058
     * @tc.desc      Verify harAggregationValueCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_5900
     * @tc.name      testAggregationValue0059
     * @tc.desc      Verify harAggregationValueCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6000
     * @tc.name      testAggregationValue0060
     * @tc.desc      Verify harAggregationValueCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6100
     * @tc.name      testAggregationValue0061
     * @tc.desc      Verify harAggregationValueCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6200
     * @tc.name      testAggregationValue0062
     * @tc.desc      Verify harAggregationValueCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6300
     * @tc.name      testAggregationValue0063
     * @tc.desc      Verify harAggregationValueCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6400
     * @tc.name      testAggregationValue0064
     * @tc.desc      Verify harAggregationValueCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6500
     * @tc.name      testAggregationValue0065
     * @tc.desc      Verify harAggregationValueCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6600
     * @tc.name      testAggregationValue0066
     * @tc.desc      Verify harAggregationValueCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6700
     * @tc.name      testAggregationValue0067
     * @tc.desc      Verify harAggregationValueCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6800
     * @tc.name      testAggregationValue0068
     * @tc.desc      Verify harAggregationValueCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_6900
     * @tc.name      testAggregationValue0069
     * @tc.desc      Verify harAggregationValueCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7000
     * @tc.name      testAggregationValue0070
     * @tc.desc      Verify harAggregationValueCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7100
     * @tc.name      testAggregationValue0071
     * @tc.desc      Verify harAggregationValueCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7200
     * @tc.name      testAggregationValue0072
     * @tc.desc      Verify harAggregationValueCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7300
     * @tc.name      testAggregationValue0073
     * @tc.desc      Verify harAggregationValueCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7400
     * @tc.name      testAggregationValue0074
     * @tc.desc      Verify harAggregationValueCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[1]).assertEqual('1');
      expect(values[0]).assertEqual(values[1]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7500
     * @tc.name      testAggregationValue0075
     * @tc.desc      Verify harAggregationValueCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[2]).assertEqual('1');
      expect(values[0]).assertEqual(values[2]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7600
     * @tc.name      testAggregationValue0076
     * @tc.desc      Verify harAggregationValueCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[3]).assertEqual('1');
      expect(values[0]).assertEqual(values[3]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7700
     * @tc.name      testAggregationValue0077
     * @tc.desc      Verify harAggregationValueCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[4]).assertEqual('1');
      expect(values[0]).assertEqual(values[4]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7800
     * @tc.name      testAggregationValue0078
     * @tc.desc      Verify harAggregationValueCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[5]).assertEqual('1');
      expect(values[0]).assertEqual(values[5]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_7900
     * @tc.name      testAggregationValue0079
     * @tc.desc      Verify harAggregationValueCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[6]).assertEqual('1');
      expect(values[0]).assertEqual(values[6]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_8000
     * @tc.name      testAggregationValue0080
     * @tc.desc      Verify harAggregationValueCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[7]).assertEqual('1');
      expect(values[0]).assertEqual(values[7]);
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_VALUE_8100
     * @tc.name      testAggregationValue0081
     * @tc.desc      Verify harAggregationValueCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationValue0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4,
        DeepOne, UtilsOne, DeepModule1];
      expect(values.length).assertEqual(8);
      expect(values[0]).assertEqual('1');
      expect(values[0]).assertEqual(values[0]);
    });

  });
}
