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
import { One as UtilsOne } from 'expandPathHar/src/main/ets/Utils';
import { module3 as UtilsModule3 } from 'expandPathHar/src/main/ets/Utils';
import { module4 as UtilsModule4 } from 'expandPathHar/src/main/ets/Utils';

const TAG: string = '[Sample_harAggregationChainCore]';
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

export default function harAggregationChainCoreTest(): void {
  describe('harAggregationChainCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0100
     * @tc.name      testAggregationChain0001
     * @tc.desc      Verify harAggregationChainCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0200
     * @tc.name      testAggregationChain0002
     * @tc.desc      Verify harAggregationChainCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0300
     * @tc.name      testAggregationChain0003
     * @tc.desc      Verify harAggregationChainCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0400
     * @tc.name      testAggregationChain0004
     * @tc.desc      Verify harAggregationChainCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0500
     * @tc.name      testAggregationChain0005
     * @tc.desc      Verify harAggregationChainCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0600
     * @tc.name      testAggregationChain0006
     * @tc.desc      Verify harAggregationChainCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0700
     * @tc.name      testAggregationChain0007
     * @tc.desc      Verify harAggregationChainCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0800
     * @tc.name      testAggregationChain0008
     * @tc.desc      Verify harAggregationChainCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_0900
     * @tc.name      testAggregationChain0009
     * @tc.desc      Verify harAggregationChainCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1000
     * @tc.name      testAggregationChain0010
     * @tc.desc      Verify harAggregationChainCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1100
     * @tc.name      testAggregationChain0011
     * @tc.desc      Verify harAggregationChainCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1200
     * @tc.name      testAggregationChain0012
     * @tc.desc      Verify harAggregationChainCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1300
     * @tc.name      testAggregationChain0013
     * @tc.desc      Verify harAggregationChainCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1400
     * @tc.name      testAggregationChain0014
     * @tc.desc      Verify harAggregationChainCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1500
     * @tc.name      testAggregationChain0015
     * @tc.desc      Verify harAggregationChainCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1600
     * @tc.name      testAggregationChain0016
     * @tc.desc      Verify harAggregationChainCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1700
     * @tc.name      testAggregationChain0017
     * @tc.desc      Verify harAggregationChainCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1800
     * @tc.name      testAggregationChain0018
     * @tc.desc      Verify harAggregationChainCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_1900
     * @tc.name      testAggregationChain0019
     * @tc.desc      Verify harAggregationChainCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2000
     * @tc.name      testAggregationChain0020
     * @tc.desc      Verify harAggregationChainCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2100
     * @tc.name      testAggregationChain0021
     * @tc.desc      Verify harAggregationChainCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2200
     * @tc.name      testAggregationChain0022
     * @tc.desc      Verify harAggregationChainCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2300
     * @tc.name      testAggregationChain0023
     * @tc.desc      Verify harAggregationChainCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2400
     * @tc.name      testAggregationChain0024
     * @tc.desc      Verify harAggregationChainCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2500
     * @tc.name      testAggregationChain0025
     * @tc.desc      Verify harAggregationChainCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2600
     * @tc.name      testAggregationChain0026
     * @tc.desc      Verify harAggregationChainCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2700
     * @tc.name      testAggregationChain0027
     * @tc.desc      Verify harAggregationChainCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2800
     * @tc.name      testAggregationChain0028
     * @tc.desc      Verify harAggregationChainCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_2900
     * @tc.name      testAggregationChain0029
     * @tc.desc      Verify harAggregationChainCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3000
     * @tc.name      testAggregationChain0030
     * @tc.desc      Verify harAggregationChainCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3100
     * @tc.name      testAggregationChain0031
     * @tc.desc      Verify harAggregationChainCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3200
     * @tc.name      testAggregationChain0032
     * @tc.desc      Verify harAggregationChainCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3300
     * @tc.name      testAggregationChain0033
     * @tc.desc      Verify harAggregationChainCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3400
     * @tc.name      testAggregationChain0034
     * @tc.desc      Verify harAggregationChainCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3500
     * @tc.name      testAggregationChain0035
     * @tc.desc      Verify harAggregationChainCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3600
     * @tc.name      testAggregationChain0036
     * @tc.desc      Verify harAggregationChainCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3700
     * @tc.name      testAggregationChain0037
     * @tc.desc      Verify harAggregationChainCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3800
     * @tc.name      testAggregationChain0038
     * @tc.desc      Verify harAggregationChainCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_3900
     * @tc.name      testAggregationChain0039
     * @tc.desc      Verify harAggregationChainCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4000
     * @tc.name      testAggregationChain0040
     * @tc.desc      Verify harAggregationChainCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4100
     * @tc.name      testAggregationChain0041
     * @tc.desc      Verify harAggregationChainCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4200
     * @tc.name      testAggregationChain0042
     * @tc.desc      Verify harAggregationChainCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4300
     * @tc.name      testAggregationChain0043
     * @tc.desc      Verify harAggregationChainCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4400
     * @tc.name      testAggregationChain0044
     * @tc.desc      Verify harAggregationChainCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4500
     * @tc.name      testAggregationChain0045
     * @tc.desc      Verify harAggregationChainCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4600
     * @tc.name      testAggregationChain0046
     * @tc.desc      Verify harAggregationChainCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4700
     * @tc.name      testAggregationChain0047
     * @tc.desc      Verify harAggregationChainCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4800
     * @tc.name      testAggregationChain0048
     * @tc.desc      Verify harAggregationChainCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_4900
     * @tc.name      testAggregationChain0049
     * @tc.desc      Verify harAggregationChainCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5000
     * @tc.name      testAggregationChain0050
     * @tc.desc      Verify harAggregationChainCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5100
     * @tc.name      testAggregationChain0051
     * @tc.desc      Verify harAggregationChainCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5200
     * @tc.name      testAggregationChain0052
     * @tc.desc      Verify harAggregationChainCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5300
     * @tc.name      testAggregationChain0053
     * @tc.desc      Verify harAggregationChainCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5400
     * @tc.name      testAggregationChain0054
     * @tc.desc      Verify harAggregationChainCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5500
     * @tc.name      testAggregationChain0055
     * @tc.desc      Verify harAggregationChainCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5600
     * @tc.name      testAggregationChain0056
     * @tc.desc      Verify harAggregationChainCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5700
     * @tc.name      testAggregationChain0057
     * @tc.desc      Verify harAggregationChainCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5800
     * @tc.name      testAggregationChain0058
     * @tc.desc      Verify harAggregationChainCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_5900
     * @tc.name      testAggregationChain0059
     * @tc.desc      Verify harAggregationChainCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6000
     * @tc.name      testAggregationChain0060
     * @tc.desc      Verify harAggregationChainCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6100
     * @tc.name      testAggregationChain0061
     * @tc.desc      Verify harAggregationChainCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6200
     * @tc.name      testAggregationChain0062
     * @tc.desc      Verify harAggregationChainCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6300
     * @tc.name      testAggregationChain0063
     * @tc.desc      Verify harAggregationChainCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6400
     * @tc.name      testAggregationChain0064
     * @tc.desc      Verify harAggregationChainCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6500
     * @tc.name      testAggregationChain0065
     * @tc.desc      Verify harAggregationChainCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6600
     * @tc.name      testAggregationChain0066
     * @tc.desc      Verify harAggregationChainCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6700
     * @tc.name      testAggregationChain0067
     * @tc.desc      Verify harAggregationChainCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6800
     * @tc.name      testAggregationChain0068
     * @tc.desc      Verify harAggregationChainCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_6900
     * @tc.name      testAggregationChain0069
     * @tc.desc      Verify harAggregationChainCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7000
     * @tc.name      testAggregationChain0070
     * @tc.desc      Verify harAggregationChainCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7100
     * @tc.name      testAggregationChain0071
     * @tc.desc      Verify harAggregationChainCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7200
     * @tc.name      testAggregationChain0072
     * @tc.desc      Verify harAggregationChainCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7300
     * @tc.name      testAggregationChain0073
     * @tc.desc      Verify harAggregationChainCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7400
     * @tc.name      testAggregationChain0074
     * @tc.desc      Verify harAggregationChainCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7500
     * @tc.name      testAggregationChain0075
     * @tc.desc      Verify harAggregationChainCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7600
     * @tc.name      testAggregationChain0076
     * @tc.desc      Verify harAggregationChainCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7700
     * @tc.name      testAggregationChain0077
     * @tc.desc      Verify harAggregationChainCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7800
     * @tc.name      testAggregationChain0078
     * @tc.desc      Verify harAggregationChainCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_7900
     * @tc.name      testAggregationChain0079
     * @tc.desc      Verify harAggregationChainCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_8000
     * @tc.name      testAggregationChain0080
     * @tc.desc      Verify harAggregationChainCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_CHAIN_8100
     * @tc.name      testAggregationChain0081
     * @tc.desc      Verify harAggregationChainCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationChain0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(UtilsOne).assertEqual(har.One);
      } else if (variant === 1) {
        expect(UtilsModule3).assertEqual(har.module3);
      } else {
        expect(UtilsModule4).assertEqual(har.module4);
      }
      expect(har.module3).assertEqual('1');
    });

  });
}
