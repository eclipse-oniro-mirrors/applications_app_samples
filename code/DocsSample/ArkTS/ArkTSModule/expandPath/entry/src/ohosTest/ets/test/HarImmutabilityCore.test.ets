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

const TAG: string = '[Sample_harImmutabilityCore]';
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

export default function harImmutabilityCoreTest(): void {
  describe('harImmutabilityCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0100
     * @tc.name      testImmutability0001
     * @tc.desc      Verify harImmutabilityCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0200
     * @tc.name      testImmutability0002
     * @tc.desc      Verify harImmutabilityCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0300
     * @tc.name      testImmutability0003
     * @tc.desc      Verify harImmutabilityCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0400
     * @tc.name      testImmutability0004
     * @tc.desc      Verify harImmutabilityCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0500
     * @tc.name      testImmutability0005
     * @tc.desc      Verify harImmutabilityCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0600
     * @tc.name      testImmutability0006
     * @tc.desc      Verify harImmutabilityCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0700
     * @tc.name      testImmutability0007
     * @tc.desc      Verify harImmutabilityCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0800
     * @tc.name      testImmutability0008
     * @tc.desc      Verify harImmutabilityCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_0900
     * @tc.name      testImmutability0009
     * @tc.desc      Verify harImmutabilityCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1000
     * @tc.name      testImmutability0010
     * @tc.desc      Verify harImmutabilityCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1100
     * @tc.name      testImmutability0011
     * @tc.desc      Verify harImmutabilityCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1200
     * @tc.name      testImmutability0012
     * @tc.desc      Verify harImmutabilityCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1300
     * @tc.name      testImmutability0013
     * @tc.desc      Verify harImmutabilityCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1400
     * @tc.name      testImmutability0014
     * @tc.desc      Verify harImmutabilityCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1500
     * @tc.name      testImmutability0015
     * @tc.desc      Verify harImmutabilityCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1600
     * @tc.name      testImmutability0016
     * @tc.desc      Verify harImmutabilityCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1700
     * @tc.name      testImmutability0017
     * @tc.desc      Verify harImmutabilityCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1800
     * @tc.name      testImmutability0018
     * @tc.desc      Verify harImmutabilityCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_1900
     * @tc.name      testImmutability0019
     * @tc.desc      Verify harImmutabilityCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2000
     * @tc.name      testImmutability0020
     * @tc.desc      Verify harImmutabilityCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2100
     * @tc.name      testImmutability0021
     * @tc.desc      Verify harImmutabilityCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2200
     * @tc.name      testImmutability0022
     * @tc.desc      Verify harImmutabilityCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2300
     * @tc.name      testImmutability0023
     * @tc.desc      Verify harImmutabilityCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2400
     * @tc.name      testImmutability0024
     * @tc.desc      Verify harImmutabilityCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2500
     * @tc.name      testImmutability0025
     * @tc.desc      Verify harImmutabilityCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2600
     * @tc.name      testImmutability0026
     * @tc.desc      Verify harImmutabilityCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2700
     * @tc.name      testImmutability0027
     * @tc.desc      Verify harImmutabilityCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2800
     * @tc.name      testImmutability0028
     * @tc.desc      Verify harImmutabilityCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_2900
     * @tc.name      testImmutability0029
     * @tc.desc      Verify harImmutabilityCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3000
     * @tc.name      testImmutability0030
     * @tc.desc      Verify harImmutabilityCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3100
     * @tc.name      testImmutability0031
     * @tc.desc      Verify harImmutabilityCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3200
     * @tc.name      testImmutability0032
     * @tc.desc      Verify harImmutabilityCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3300
     * @tc.name      testImmutability0033
     * @tc.desc      Verify harImmutabilityCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3400
     * @tc.name      testImmutability0034
     * @tc.desc      Verify harImmutabilityCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3500
     * @tc.name      testImmutability0035
     * @tc.desc      Verify harImmutabilityCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3600
     * @tc.name      testImmutability0036
     * @tc.desc      Verify harImmutabilityCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3700
     * @tc.name      testImmutability0037
     * @tc.desc      Verify harImmutabilityCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3800
     * @tc.name      testImmutability0038
     * @tc.desc      Verify harImmutabilityCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_3900
     * @tc.name      testImmutability0039
     * @tc.desc      Verify harImmutabilityCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4000
     * @tc.name      testImmutability0040
     * @tc.desc      Verify harImmutabilityCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4100
     * @tc.name      testImmutability0041
     * @tc.desc      Verify harImmutabilityCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4200
     * @tc.name      testImmutability0042
     * @tc.desc      Verify harImmutabilityCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4300
     * @tc.name      testImmutability0043
     * @tc.desc      Verify harImmutabilityCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4400
     * @tc.name      testImmutability0044
     * @tc.desc      Verify harImmutabilityCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4500
     * @tc.name      testImmutability0045
     * @tc.desc      Verify harImmutabilityCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4600
     * @tc.name      testImmutability0046
     * @tc.desc      Verify harImmutabilityCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4700
     * @tc.name      testImmutability0047
     * @tc.desc      Verify harImmutabilityCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4800
     * @tc.name      testImmutability0048
     * @tc.desc      Verify harImmutabilityCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_4900
     * @tc.name      testImmutability0049
     * @tc.desc      Verify harImmutabilityCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5000
     * @tc.name      testImmutability0050
     * @tc.desc      Verify harImmutabilityCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5100
     * @tc.name      testImmutability0051
     * @tc.desc      Verify harImmutabilityCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5200
     * @tc.name      testImmutability0052
     * @tc.desc      Verify harImmutabilityCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5300
     * @tc.name      testImmutability0053
     * @tc.desc      Verify harImmutabilityCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5400
     * @tc.name      testImmutability0054
     * @tc.desc      Verify harImmutabilityCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5500
     * @tc.name      testImmutability0055
     * @tc.desc      Verify harImmutabilityCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5600
     * @tc.name      testImmutability0056
     * @tc.desc      Verify harImmutabilityCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5700
     * @tc.name      testImmutability0057
     * @tc.desc      Verify harImmutabilityCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5800
     * @tc.name      testImmutability0058
     * @tc.desc      Verify harImmutabilityCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_5900
     * @tc.name      testImmutability0059
     * @tc.desc      Verify harImmutabilityCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6000
     * @tc.name      testImmutability0060
     * @tc.desc      Verify harImmutabilityCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6100
     * @tc.name      testImmutability0061
     * @tc.desc      Verify harImmutabilityCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6200
     * @tc.name      testImmutability0062
     * @tc.desc      Verify harImmutabilityCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6300
     * @tc.name      testImmutability0063
     * @tc.desc      Verify harImmutabilityCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6400
     * @tc.name      testImmutability0064
     * @tc.desc      Verify harImmutabilityCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6500
     * @tc.name      testImmutability0065
     * @tc.desc      Verify harImmutabilityCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6600
     * @tc.name      testImmutability0066
     * @tc.desc      Verify harImmutabilityCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6700
     * @tc.name      testImmutability0067
     * @tc.desc      Verify harImmutabilityCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6800
     * @tc.name      testImmutability0068
     * @tc.desc      Verify harImmutabilityCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_6900
     * @tc.name      testImmutability0069
     * @tc.desc      Verify harImmutabilityCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7000
     * @tc.name      testImmutability0070
     * @tc.desc      Verify harImmutabilityCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7100
     * @tc.name      testImmutability0071
     * @tc.desc      Verify harImmutabilityCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7200
     * @tc.name      testImmutability0072
     * @tc.desc      Verify harImmutabilityCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7300
     * @tc.name      testImmutability0073
     * @tc.desc      Verify harImmutabilityCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7400
     * @tc.name      testImmutability0074
     * @tc.desc      Verify harImmutabilityCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7500
     * @tc.name      testImmutability0075
     * @tc.desc      Verify harImmutabilityCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7600
     * @tc.name      testImmutability0076
     * @tc.desc      Verify harImmutabilityCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7700
     * @tc.name      testImmutability0077
     * @tc.desc      Verify harImmutabilityCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7800
     * @tc.name      testImmutability0078
     * @tc.desc      Verify harImmutabilityCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_7900
     * @tc.name      testImmutability0079
     * @tc.desc      Verify harImmutabilityCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_8000
     * @tc.name      testImmutability0080
     * @tc.desc      Verify harImmutabilityCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_IMMUT_8100
     * @tc.name      testImmutability0081
     * @tc.desc      Verify harImmutabilityCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testImmutability0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const first: string = har.One;
      const second: string = har.One;
      expect(first === second).assertTrue();
      expect(first).assertEqual(second);
      expect(har.module1).assertEqual('1');
    });

  });
}
