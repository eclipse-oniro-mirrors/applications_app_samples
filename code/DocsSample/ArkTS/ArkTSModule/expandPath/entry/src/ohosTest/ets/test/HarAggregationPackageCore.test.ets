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

const TAG: string = '[Sample_harAggregationPackageCore]';
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

export default function harAggregationPackageCoreTest(): void {
  describe('harAggregationPackageCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0100
     * @tc.name      testAggregationPackage0001
     * @tc.desc      Verify harAggregationPackageCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0200
     * @tc.name      testAggregationPackage0002
     * @tc.desc      Verify harAggregationPackageCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0300
     * @tc.name      testAggregationPackage0003
     * @tc.desc      Verify harAggregationPackageCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0400
     * @tc.name      testAggregationPackage0004
     * @tc.desc      Verify harAggregationPackageCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0500
     * @tc.name      testAggregationPackage0005
     * @tc.desc      Verify harAggregationPackageCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0600
     * @tc.name      testAggregationPackage0006
     * @tc.desc      Verify harAggregationPackageCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0700
     * @tc.name      testAggregationPackage0007
     * @tc.desc      Verify harAggregationPackageCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0800
     * @tc.name      testAggregationPackage0008
     * @tc.desc      Verify harAggregationPackageCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_0900
     * @tc.name      testAggregationPackage0009
     * @tc.desc      Verify harAggregationPackageCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1000
     * @tc.name      testAggregationPackage0010
     * @tc.desc      Verify harAggregationPackageCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1100
     * @tc.name      testAggregationPackage0011
     * @tc.desc      Verify harAggregationPackageCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1200
     * @tc.name      testAggregationPackage0012
     * @tc.desc      Verify harAggregationPackageCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1300
     * @tc.name      testAggregationPackage0013
     * @tc.desc      Verify harAggregationPackageCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1400
     * @tc.name      testAggregationPackage0014
     * @tc.desc      Verify harAggregationPackageCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1500
     * @tc.name      testAggregationPackage0015
     * @tc.desc      Verify harAggregationPackageCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1600
     * @tc.name      testAggregationPackage0016
     * @tc.desc      Verify harAggregationPackageCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1700
     * @tc.name      testAggregationPackage0017
     * @tc.desc      Verify harAggregationPackageCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1800
     * @tc.name      testAggregationPackage0018
     * @tc.desc      Verify harAggregationPackageCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_1900
     * @tc.name      testAggregationPackage0019
     * @tc.desc      Verify harAggregationPackageCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2000
     * @tc.name      testAggregationPackage0020
     * @tc.desc      Verify harAggregationPackageCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2100
     * @tc.name      testAggregationPackage0021
     * @tc.desc      Verify harAggregationPackageCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2200
     * @tc.name      testAggregationPackage0022
     * @tc.desc      Verify harAggregationPackageCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2300
     * @tc.name      testAggregationPackage0023
     * @tc.desc      Verify harAggregationPackageCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2400
     * @tc.name      testAggregationPackage0024
     * @tc.desc      Verify harAggregationPackageCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2500
     * @tc.name      testAggregationPackage0025
     * @tc.desc      Verify harAggregationPackageCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2600
     * @tc.name      testAggregationPackage0026
     * @tc.desc      Verify harAggregationPackageCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2700
     * @tc.name      testAggregationPackage0027
     * @tc.desc      Verify harAggregationPackageCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2800
     * @tc.name      testAggregationPackage0028
     * @tc.desc      Verify harAggregationPackageCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_2900
     * @tc.name      testAggregationPackage0029
     * @tc.desc      Verify harAggregationPackageCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3000
     * @tc.name      testAggregationPackage0030
     * @tc.desc      Verify harAggregationPackageCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3100
     * @tc.name      testAggregationPackage0031
     * @tc.desc      Verify harAggregationPackageCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3200
     * @tc.name      testAggregationPackage0032
     * @tc.desc      Verify harAggregationPackageCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3300
     * @tc.name      testAggregationPackage0033
     * @tc.desc      Verify harAggregationPackageCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3400
     * @tc.name      testAggregationPackage0034
     * @tc.desc      Verify harAggregationPackageCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3500
     * @tc.name      testAggregationPackage0035
     * @tc.desc      Verify harAggregationPackageCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3600
     * @tc.name      testAggregationPackage0036
     * @tc.desc      Verify harAggregationPackageCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3700
     * @tc.name      testAggregationPackage0037
     * @tc.desc      Verify harAggregationPackageCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3800
     * @tc.name      testAggregationPackage0038
     * @tc.desc      Verify harAggregationPackageCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_3900
     * @tc.name      testAggregationPackage0039
     * @tc.desc      Verify harAggregationPackageCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4000
     * @tc.name      testAggregationPackage0040
     * @tc.desc      Verify harAggregationPackageCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4100
     * @tc.name      testAggregationPackage0041
     * @tc.desc      Verify harAggregationPackageCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4200
     * @tc.name      testAggregationPackage0042
     * @tc.desc      Verify harAggregationPackageCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4300
     * @tc.name      testAggregationPackage0043
     * @tc.desc      Verify harAggregationPackageCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4400
     * @tc.name      testAggregationPackage0044
     * @tc.desc      Verify harAggregationPackageCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4500
     * @tc.name      testAggregationPackage0045
     * @tc.desc      Verify harAggregationPackageCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4600
     * @tc.name      testAggregationPackage0046
     * @tc.desc      Verify harAggregationPackageCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4700
     * @tc.name      testAggregationPackage0047
     * @tc.desc      Verify harAggregationPackageCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4800
     * @tc.name      testAggregationPackage0048
     * @tc.desc      Verify harAggregationPackageCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_4900
     * @tc.name      testAggregationPackage0049
     * @tc.desc      Verify harAggregationPackageCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5000
     * @tc.name      testAggregationPackage0050
     * @tc.desc      Verify harAggregationPackageCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5100
     * @tc.name      testAggregationPackage0051
     * @tc.desc      Verify harAggregationPackageCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5200
     * @tc.name      testAggregationPackage0052
     * @tc.desc      Verify harAggregationPackageCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5300
     * @tc.name      testAggregationPackage0053
     * @tc.desc      Verify harAggregationPackageCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5400
     * @tc.name      testAggregationPackage0054
     * @tc.desc      Verify harAggregationPackageCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5500
     * @tc.name      testAggregationPackage0055
     * @tc.desc      Verify harAggregationPackageCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5600
     * @tc.name      testAggregationPackage0056
     * @tc.desc      Verify harAggregationPackageCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5700
     * @tc.name      testAggregationPackage0057
     * @tc.desc      Verify harAggregationPackageCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5800
     * @tc.name      testAggregationPackage0058
     * @tc.desc      Verify harAggregationPackageCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_5900
     * @tc.name      testAggregationPackage0059
     * @tc.desc      Verify harAggregationPackageCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6000
     * @tc.name      testAggregationPackage0060
     * @tc.desc      Verify harAggregationPackageCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6100
     * @tc.name      testAggregationPackage0061
     * @tc.desc      Verify harAggregationPackageCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6200
     * @tc.name      testAggregationPackage0062
     * @tc.desc      Verify harAggregationPackageCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6300
     * @tc.name      testAggregationPackage0063
     * @tc.desc      Verify harAggregationPackageCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6400
     * @tc.name      testAggregationPackage0064
     * @tc.desc      Verify harAggregationPackageCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6500
     * @tc.name      testAggregationPackage0065
     * @tc.desc      Verify harAggregationPackageCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6600
     * @tc.name      testAggregationPackage0066
     * @tc.desc      Verify harAggregationPackageCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6700
     * @tc.name      testAggregationPackage0067
     * @tc.desc      Verify harAggregationPackageCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6800
     * @tc.name      testAggregationPackage0068
     * @tc.desc      Verify harAggregationPackageCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_6900
     * @tc.name      testAggregationPackage0069
     * @tc.desc      Verify harAggregationPackageCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7000
     * @tc.name      testAggregationPackage0070
     * @tc.desc      Verify harAggregationPackageCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7100
     * @tc.name      testAggregationPackage0071
     * @tc.desc      Verify harAggregationPackageCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7200
     * @tc.name      testAggregationPackage0072
     * @tc.desc      Verify harAggregationPackageCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7300
     * @tc.name      testAggregationPackage0073
     * @tc.desc      Verify harAggregationPackageCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7400
     * @tc.name      testAggregationPackage0074
     * @tc.desc      Verify harAggregationPackageCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7500
     * @tc.name      testAggregationPackage0075
     * @tc.desc      Verify harAggregationPackageCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7600
     * @tc.name      testAggregationPackage0076
     * @tc.desc      Verify harAggregationPackageCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7700
     * @tc.name      testAggregationPackage0077
     * @tc.desc      Verify harAggregationPackageCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7800
     * @tc.name      testAggregationPackage0078
     * @tc.desc      Verify harAggregationPackageCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_7900
     * @tc.name      testAggregationPackage0079
     * @tc.desc      Verify harAggregationPackageCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_8000
     * @tc.name      testAggregationPackage0080
     * @tc.desc      Verify harAggregationPackageCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_AGG_PKG_8100
     * @tc.name      testAggregationPackage0081
     * @tc.desc      Verify harAggregationPackageCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAggregationPackage0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(har.One).assertEqual(DeepOne);
      } else if (variant === 1) {
        expect(har.One).assertEqual(UtilsOne);
      } else {
        expect(DeepOne).assertEqual(UtilsOne);
      }
      expect(har.One).assertEqual('1');
    });

  });
}
