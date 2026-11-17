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
import { module1 as DeepModule1 } from 'expandPathHar/src/main/ets/OtherModule1';
import { module3 as DeepModule3 } from 'expandPathHar/src/main/ets/OtherModule3';
import { module4 as DeepModule4 } from 'expandPathHar/src/main/ets/OtherModule4';

const TAG: string = '[Sample_harAggregationDeepCore]';
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

export default function harAggregationDeepCoreTest(): void {
  describe('harAggregationDeepCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0100
     * @tc.name      testAggregationDeep0001
     * @tc.desc      Verify harAggregationDeepCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0200
     * @tc.name      testAggregationDeep0002
     * @tc.desc      Verify harAggregationDeepCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0300
     * @tc.name      testAggregationDeep0003
     * @tc.desc      Verify harAggregationDeepCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0400
     * @tc.name      testAggregationDeep0004
     * @tc.desc      Verify harAggregationDeepCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0500
     * @tc.name      testAggregationDeep0005
     * @tc.desc      Verify harAggregationDeepCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0600
     * @tc.name      testAggregationDeep0006
     * @tc.desc      Verify harAggregationDeepCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0700
     * @tc.name      testAggregationDeep0007
     * @tc.desc      Verify harAggregationDeepCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0800
     * @tc.name      testAggregationDeep0008
     * @tc.desc      Verify harAggregationDeepCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_0900
     * @tc.name      testAggregationDeep0009
     * @tc.desc      Verify harAggregationDeepCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1000
     * @tc.name      testAggregationDeep0010
     * @tc.desc      Verify harAggregationDeepCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1100
     * @tc.name      testAggregationDeep0011
     * @tc.desc      Verify harAggregationDeepCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1200
     * @tc.name      testAggregationDeep0012
     * @tc.desc      Verify harAggregationDeepCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1300
     * @tc.name      testAggregationDeep0013
     * @tc.desc      Verify harAggregationDeepCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1400
     * @tc.name      testAggregationDeep0014
     * @tc.desc      Verify harAggregationDeepCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1500
     * @tc.name      testAggregationDeep0015
     * @tc.desc      Verify harAggregationDeepCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1600
     * @tc.name      testAggregationDeep0016
     * @tc.desc      Verify harAggregationDeepCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1700
     * @tc.name      testAggregationDeep0017
     * @tc.desc      Verify harAggregationDeepCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1800
     * @tc.name      testAggregationDeep0018
     * @tc.desc      Verify harAggregationDeepCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_1900
     * @tc.name      testAggregationDeep0019
     * @tc.desc      Verify harAggregationDeepCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2000
     * @tc.name      testAggregationDeep0020
     * @tc.desc      Verify harAggregationDeepCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2100
     * @tc.name      testAggregationDeep0021
     * @tc.desc      Verify harAggregationDeepCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2200
     * @tc.name      testAggregationDeep0022
     * @tc.desc      Verify harAggregationDeepCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2300
     * @tc.name      testAggregationDeep0023
     * @tc.desc      Verify harAggregationDeepCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2400
     * @tc.name      testAggregationDeep0024
     * @tc.desc      Verify harAggregationDeepCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2500
     * @tc.name      testAggregationDeep0025
     * @tc.desc      Verify harAggregationDeepCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2600
     * @tc.name      testAggregationDeep0026
     * @tc.desc      Verify harAggregationDeepCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2700
     * @tc.name      testAggregationDeep0027
     * @tc.desc      Verify harAggregationDeepCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2800
     * @tc.name      testAggregationDeep0028
     * @tc.desc      Verify harAggregationDeepCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_2900
     * @tc.name      testAggregationDeep0029
     * @tc.desc      Verify harAggregationDeepCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3000
     * @tc.name      testAggregationDeep0030
     * @tc.desc      Verify harAggregationDeepCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3100
     * @tc.name      testAggregationDeep0031
     * @tc.desc      Verify harAggregationDeepCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3200
     * @tc.name      testAggregationDeep0032
     * @tc.desc      Verify harAggregationDeepCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3300
     * @tc.name      testAggregationDeep0033
     * @tc.desc      Verify harAggregationDeepCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3400
     * @tc.name      testAggregationDeep0034
     * @tc.desc      Verify harAggregationDeepCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3500
     * @tc.name      testAggregationDeep0035
     * @tc.desc      Verify harAggregationDeepCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3600
     * @tc.name      testAggregationDeep0036
     * @tc.desc      Verify harAggregationDeepCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3700
     * @tc.name      testAggregationDeep0037
     * @tc.desc      Verify harAggregationDeepCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3800
     * @tc.name      testAggregationDeep0038
     * @tc.desc      Verify harAggregationDeepCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_3900
     * @tc.name      testAggregationDeep0039
     * @tc.desc      Verify harAggregationDeepCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4000
     * @tc.name      testAggregationDeep0040
     * @tc.desc      Verify harAggregationDeepCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4100
     * @tc.name      testAggregationDeep0041
     * @tc.desc      Verify harAggregationDeepCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4200
     * @tc.name      testAggregationDeep0042
     * @tc.desc      Verify harAggregationDeepCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4300
     * @tc.name      testAggregationDeep0043
     * @tc.desc      Verify harAggregationDeepCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4400
     * @tc.name      testAggregationDeep0044
     * @tc.desc      Verify harAggregationDeepCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4500
     * @tc.name      testAggregationDeep0045
     * @tc.desc      Verify harAggregationDeepCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4600
     * @tc.name      testAggregationDeep0046
     * @tc.desc      Verify harAggregationDeepCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4700
     * @tc.name      testAggregationDeep0047
     * @tc.desc      Verify harAggregationDeepCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4800
     * @tc.name      testAggregationDeep0048
     * @tc.desc      Verify harAggregationDeepCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_4900
     * @tc.name      testAggregationDeep0049
     * @tc.desc      Verify harAggregationDeepCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5000
     * @tc.name      testAggregationDeep0050
     * @tc.desc      Verify harAggregationDeepCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5100
     * @tc.name      testAggregationDeep0051
     * @tc.desc      Verify harAggregationDeepCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5200
     * @tc.name      testAggregationDeep0052
     * @tc.desc      Verify harAggregationDeepCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5300
     * @tc.name      testAggregationDeep0053
     * @tc.desc      Verify harAggregationDeepCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5400
     * @tc.name      testAggregationDeep0054
     * @tc.desc      Verify harAggregationDeepCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5500
     * @tc.name      testAggregationDeep0055
     * @tc.desc      Verify harAggregationDeepCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5600
     * @tc.name      testAggregationDeep0056
     * @tc.desc      Verify harAggregationDeepCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5700
     * @tc.name      testAggregationDeep0057
     * @tc.desc      Verify harAggregationDeepCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5800
     * @tc.name      testAggregationDeep0058
     * @tc.desc      Verify harAggregationDeepCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_5900
     * @tc.name      testAggregationDeep0059
     * @tc.desc      Verify harAggregationDeepCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6000
     * @tc.name      testAggregationDeep0060
     * @tc.desc      Verify harAggregationDeepCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6100
     * @tc.name      testAggregationDeep0061
     * @tc.desc      Verify harAggregationDeepCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6200
     * @tc.name      testAggregationDeep0062
     * @tc.desc      Verify harAggregationDeepCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6300
     * @tc.name      testAggregationDeep0063
     * @tc.desc      Verify harAggregationDeepCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6400
     * @tc.name      testAggregationDeep0064
     * @tc.desc      Verify harAggregationDeepCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6500
     * @tc.name      testAggregationDeep0065
     * @tc.desc      Verify harAggregationDeepCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6600
     * @tc.name      testAggregationDeep0066
     * @tc.desc      Verify harAggregationDeepCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6700
     * @tc.name      testAggregationDeep0067
     * @tc.desc      Verify harAggregationDeepCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6800
     * @tc.name      testAggregationDeep0068
     * @tc.desc      Verify harAggregationDeepCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_6900
     * @tc.name      testAggregationDeep0069
     * @tc.desc      Verify harAggregationDeepCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7000
     * @tc.name      testAggregationDeep0070
     * @tc.desc      Verify harAggregationDeepCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7100
     * @tc.name      testAggregationDeep0071
     * @tc.desc      Verify harAggregationDeepCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7200
     * @tc.name      testAggregationDeep0072
     * @tc.desc      Verify harAggregationDeepCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7300
     * @tc.name      testAggregationDeep0073
     * @tc.desc      Verify harAggregationDeepCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7400
     * @tc.name      testAggregationDeep0074
     * @tc.desc      Verify harAggregationDeepCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7500
     * @tc.name      testAggregationDeep0075
     * @tc.desc      Verify harAggregationDeepCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7600
     * @tc.name      testAggregationDeep0076
     * @tc.desc      Verify harAggregationDeepCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7700
     * @tc.name      testAggregationDeep0077
     * @tc.desc      Verify harAggregationDeepCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7800
     * @tc.name      testAggregationDeep0078
     * @tc.desc      Verify harAggregationDeepCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_7900
     * @tc.name      testAggregationDeep0079
     * @tc.desc      Verify harAggregationDeepCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_8000
     * @tc.name      testAggregationDeep0080
     * @tc.desc      Verify harAggregationDeepCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_DEEP_8100
     * @tc.name      testAggregationDeep0081
     * @tc.desc      Verify harAggregationDeepCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationDeep0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(DeepOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(DeepModule1).assertEqual(har.module1);
      } else if (variant === 2) {
        expect(DeepModule3).assertEqual(har.module3);
      } else {
        expect(DeepModule4).assertEqual(har.module4);
      }
    });

  });
}
