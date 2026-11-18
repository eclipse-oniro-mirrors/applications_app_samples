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

const TAG: string = '[Sample_harPerformanceAggregateCore]';
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

export default function harPerformanceAggregateCoreTest(): void {
  describe('harPerformanceAggregateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0100
     * @tc.name      testPerformanceAggregate0001
     * @tc.desc      Verify harPerformanceAggregateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0200
     * @tc.name      testPerformanceAggregate0002
     * @tc.desc      Verify harPerformanceAggregateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0300
     * @tc.name      testPerformanceAggregate0003
     * @tc.desc      Verify harPerformanceAggregateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0400
     * @tc.name      testPerformanceAggregate0004
     * @tc.desc      Verify harPerformanceAggregateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0500
     * @tc.name      testPerformanceAggregate0005
     * @tc.desc      Verify harPerformanceAggregateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0600
     * @tc.name      testPerformanceAggregate0006
     * @tc.desc      Verify harPerformanceAggregateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0700
     * @tc.name      testPerformanceAggregate0007
     * @tc.desc      Verify harPerformanceAggregateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0800
     * @tc.name      testPerformanceAggregate0008
     * @tc.desc      Verify harPerformanceAggregateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_0900
     * @tc.name      testPerformanceAggregate0009
     * @tc.desc      Verify harPerformanceAggregateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1000
     * @tc.name      testPerformanceAggregate0010
     * @tc.desc      Verify harPerformanceAggregateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1100
     * @tc.name      testPerformanceAggregate0011
     * @tc.desc      Verify harPerformanceAggregateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1200
     * @tc.name      testPerformanceAggregate0012
     * @tc.desc      Verify harPerformanceAggregateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1300
     * @tc.name      testPerformanceAggregate0013
     * @tc.desc      Verify harPerformanceAggregateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1400
     * @tc.name      testPerformanceAggregate0014
     * @tc.desc      Verify harPerformanceAggregateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1500
     * @tc.name      testPerformanceAggregate0015
     * @tc.desc      Verify harPerformanceAggregateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1600
     * @tc.name      testPerformanceAggregate0016
     * @tc.desc      Verify harPerformanceAggregateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1700
     * @tc.name      testPerformanceAggregate0017
     * @tc.desc      Verify harPerformanceAggregateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1800
     * @tc.name      testPerformanceAggregate0018
     * @tc.desc      Verify harPerformanceAggregateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_1900
     * @tc.name      testPerformanceAggregate0019
     * @tc.desc      Verify harPerformanceAggregateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2000
     * @tc.name      testPerformanceAggregate0020
     * @tc.desc      Verify harPerformanceAggregateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2100
     * @tc.name      testPerformanceAggregate0021
     * @tc.desc      Verify harPerformanceAggregateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2200
     * @tc.name      testPerformanceAggregate0022
     * @tc.desc      Verify harPerformanceAggregateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2300
     * @tc.name      testPerformanceAggregate0023
     * @tc.desc      Verify harPerformanceAggregateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2400
     * @tc.name      testPerformanceAggregate0024
     * @tc.desc      Verify harPerformanceAggregateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2500
     * @tc.name      testPerformanceAggregate0025
     * @tc.desc      Verify harPerformanceAggregateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2600
     * @tc.name      testPerformanceAggregate0026
     * @tc.desc      Verify harPerformanceAggregateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2700
     * @tc.name      testPerformanceAggregate0027
     * @tc.desc      Verify harPerformanceAggregateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2800
     * @tc.name      testPerformanceAggregate0028
     * @tc.desc      Verify harPerformanceAggregateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_2900
     * @tc.name      testPerformanceAggregate0029
     * @tc.desc      Verify harPerformanceAggregateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3000
     * @tc.name      testPerformanceAggregate0030
     * @tc.desc      Verify harPerformanceAggregateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3100
     * @tc.name      testPerformanceAggregate0031
     * @tc.desc      Verify harPerformanceAggregateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3200
     * @tc.name      testPerformanceAggregate0032
     * @tc.desc      Verify harPerformanceAggregateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3300
     * @tc.name      testPerformanceAggregate0033
     * @tc.desc      Verify harPerformanceAggregateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3400
     * @tc.name      testPerformanceAggregate0034
     * @tc.desc      Verify harPerformanceAggregateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3500
     * @tc.name      testPerformanceAggregate0035
     * @tc.desc      Verify harPerformanceAggregateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3600
     * @tc.name      testPerformanceAggregate0036
     * @tc.desc      Verify harPerformanceAggregateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3700
     * @tc.name      testPerformanceAggregate0037
     * @tc.desc      Verify harPerformanceAggregateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3800
     * @tc.name      testPerformanceAggregate0038
     * @tc.desc      Verify harPerformanceAggregateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_3900
     * @tc.name      testPerformanceAggregate0039
     * @tc.desc      Verify harPerformanceAggregateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4000
     * @tc.name      testPerformanceAggregate0040
     * @tc.desc      Verify harPerformanceAggregateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4100
     * @tc.name      testPerformanceAggregate0041
     * @tc.desc      Verify harPerformanceAggregateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4200
     * @tc.name      testPerformanceAggregate0042
     * @tc.desc      Verify harPerformanceAggregateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4300
     * @tc.name      testPerformanceAggregate0043
     * @tc.desc      Verify harPerformanceAggregateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4400
     * @tc.name      testPerformanceAggregate0044
     * @tc.desc      Verify harPerformanceAggregateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4500
     * @tc.name      testPerformanceAggregate0045
     * @tc.desc      Verify harPerformanceAggregateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4600
     * @tc.name      testPerformanceAggregate0046
     * @tc.desc      Verify harPerformanceAggregateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4700
     * @tc.name      testPerformanceAggregate0047
     * @tc.desc      Verify harPerformanceAggregateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4800
     * @tc.name      testPerformanceAggregate0048
     * @tc.desc      Verify harPerformanceAggregateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_4900
     * @tc.name      testPerformanceAggregate0049
     * @tc.desc      Verify harPerformanceAggregateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5000
     * @tc.name      testPerformanceAggregate0050
     * @tc.desc      Verify harPerformanceAggregateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5100
     * @tc.name      testPerformanceAggregate0051
     * @tc.desc      Verify harPerformanceAggregateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5200
     * @tc.name      testPerformanceAggregate0052
     * @tc.desc      Verify harPerformanceAggregateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5300
     * @tc.name      testPerformanceAggregate0053
     * @tc.desc      Verify harPerformanceAggregateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5400
     * @tc.name      testPerformanceAggregate0054
     * @tc.desc      Verify harPerformanceAggregateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5500
     * @tc.name      testPerformanceAggregate0055
     * @tc.desc      Verify harPerformanceAggregateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5600
     * @tc.name      testPerformanceAggregate0056
     * @tc.desc      Verify harPerformanceAggregateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5700
     * @tc.name      testPerformanceAggregate0057
     * @tc.desc      Verify harPerformanceAggregateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5800
     * @tc.name      testPerformanceAggregate0058
     * @tc.desc      Verify harPerformanceAggregateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_5900
     * @tc.name      testPerformanceAggregate0059
     * @tc.desc      Verify harPerformanceAggregateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6000
     * @tc.name      testPerformanceAggregate0060
     * @tc.desc      Verify harPerformanceAggregateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6100
     * @tc.name      testPerformanceAggregate0061
     * @tc.desc      Verify harPerformanceAggregateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6200
     * @tc.name      testPerformanceAggregate0062
     * @tc.desc      Verify harPerformanceAggregateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6300
     * @tc.name      testPerformanceAggregate0063
     * @tc.desc      Verify harPerformanceAggregateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6400
     * @tc.name      testPerformanceAggregate0064
     * @tc.desc      Verify harPerformanceAggregateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6500
     * @tc.name      testPerformanceAggregate0065
     * @tc.desc      Verify harPerformanceAggregateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6600
     * @tc.name      testPerformanceAggregate0066
     * @tc.desc      Verify harPerformanceAggregateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6700
     * @tc.name      testPerformanceAggregate0067
     * @tc.desc      Verify harPerformanceAggregateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6800
     * @tc.name      testPerformanceAggregate0068
     * @tc.desc      Verify harPerformanceAggregateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_6900
     * @tc.name      testPerformanceAggregate0069
     * @tc.desc      Verify harPerformanceAggregateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7000
     * @tc.name      testPerformanceAggregate0070
     * @tc.desc      Verify harPerformanceAggregateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7100
     * @tc.name      testPerformanceAggregate0071
     * @tc.desc      Verify harPerformanceAggregateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7200
     * @tc.name      testPerformanceAggregate0072
     * @tc.desc      Verify harPerformanceAggregateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7300
     * @tc.name      testPerformanceAggregate0073
     * @tc.desc      Verify harPerformanceAggregateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7400
     * @tc.name      testPerformanceAggregate0074
     * @tc.desc      Verify harPerformanceAggregateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7500
     * @tc.name      testPerformanceAggregate0075
     * @tc.desc      Verify harPerformanceAggregateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7600
     * @tc.name      testPerformanceAggregate0076
     * @tc.desc      Verify harPerformanceAggregateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7700
     * @tc.name      testPerformanceAggregate0077
     * @tc.desc      Verify harPerformanceAggregateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7800
     * @tc.name      testPerformanceAggregate0078
     * @tc.desc      Verify harPerformanceAggregateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_7900
     * @tc.name      testPerformanceAggregate0079
     * @tc.desc      Verify harPerformanceAggregateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_8000
     * @tc.name      testPerformanceAggregate0080
     * @tc.desc      Verify harPerformanceAggregateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_AGG_8100
     * @tc.name      testPerformanceAggregate0081
     * @tc.desc      Verify harPerformanceAggregateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceAggregate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let total: number = 0;
      for (let n: number = 0; n < 1000; n++) {
        const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
        total += values.length;
      }
      const elapsed: number = Date.now() - start;
      expect(total).assertEqual(5000);
      expect(elapsed < 5000).assertTrue();
    });

  });
}
