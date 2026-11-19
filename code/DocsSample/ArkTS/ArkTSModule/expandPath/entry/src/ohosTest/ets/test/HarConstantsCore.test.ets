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

const TAG: string = '[Sample_harConstantsCore]';
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

export default function harConstantsCoreTest(): void {
  describe('harConstantsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_CONST_0100
     * @tc.name      testConstants0001
     * @tc.desc      Verify harConstantsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0200
     * @tc.name      testConstants0002
     * @tc.desc      Verify harConstantsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0300
     * @tc.name      testConstants0003
     * @tc.desc      Verify harConstantsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0400
     * @tc.name      testConstants0004
     * @tc.desc      Verify harConstantsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0500
     * @tc.name      testConstants0005
     * @tc.desc      Verify harConstantsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0600
     * @tc.name      testConstants0006
     * @tc.desc      Verify harConstantsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0700
     * @tc.name      testConstants0007
     * @tc.desc      Verify harConstantsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0800
     * @tc.name      testConstants0008
     * @tc.desc      Verify harConstantsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_0900
     * @tc.name      testConstants0009
     * @tc.desc      Verify harConstantsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1000
     * @tc.name      testConstants0010
     * @tc.desc      Verify harConstantsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1100
     * @tc.name      testConstants0011
     * @tc.desc      Verify harConstantsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1200
     * @tc.name      testConstants0012
     * @tc.desc      Verify harConstantsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1300
     * @tc.name      testConstants0013
     * @tc.desc      Verify harConstantsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1400
     * @tc.name      testConstants0014
     * @tc.desc      Verify harConstantsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1500
     * @tc.name      testConstants0015
     * @tc.desc      Verify harConstantsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1600
     * @tc.name      testConstants0016
     * @tc.desc      Verify harConstantsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1700
     * @tc.name      testConstants0017
     * @tc.desc      Verify harConstantsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1800
     * @tc.name      testConstants0018
     * @tc.desc      Verify harConstantsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_1900
     * @tc.name      testConstants0019
     * @tc.desc      Verify harConstantsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2000
     * @tc.name      testConstants0020
     * @tc.desc      Verify harConstantsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2100
     * @tc.name      testConstants0021
     * @tc.desc      Verify harConstantsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2200
     * @tc.name      testConstants0022
     * @tc.desc      Verify harConstantsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2300
     * @tc.name      testConstants0023
     * @tc.desc      Verify harConstantsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2400
     * @tc.name      testConstants0024
     * @tc.desc      Verify harConstantsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2500
     * @tc.name      testConstants0025
     * @tc.desc      Verify harConstantsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2600
     * @tc.name      testConstants0026
     * @tc.desc      Verify harConstantsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2700
     * @tc.name      testConstants0027
     * @tc.desc      Verify harConstantsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2800
     * @tc.name      testConstants0028
     * @tc.desc      Verify harConstantsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_2900
     * @tc.name      testConstants0029
     * @tc.desc      Verify harConstantsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3000
     * @tc.name      testConstants0030
     * @tc.desc      Verify harConstantsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3100
     * @tc.name      testConstants0031
     * @tc.desc      Verify harConstantsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3200
     * @tc.name      testConstants0032
     * @tc.desc      Verify harConstantsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3300
     * @tc.name      testConstants0033
     * @tc.desc      Verify harConstantsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3400
     * @tc.name      testConstants0034
     * @tc.desc      Verify harConstantsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3500
     * @tc.name      testConstants0035
     * @tc.desc      Verify harConstantsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3600
     * @tc.name      testConstants0036
     * @tc.desc      Verify harConstantsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3700
     * @tc.name      testConstants0037
     * @tc.desc      Verify harConstantsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3800
     * @tc.name      testConstants0038
     * @tc.desc      Verify harConstantsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_3900
     * @tc.name      testConstants0039
     * @tc.desc      Verify harConstantsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4000
     * @tc.name      testConstants0040
     * @tc.desc      Verify harConstantsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4100
     * @tc.name      testConstants0041
     * @tc.desc      Verify harConstantsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4200
     * @tc.name      testConstants0042
     * @tc.desc      Verify harConstantsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4300
     * @tc.name      testConstants0043
     * @tc.desc      Verify harConstantsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4400
     * @tc.name      testConstants0044
     * @tc.desc      Verify harConstantsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4500
     * @tc.name      testConstants0045
     * @tc.desc      Verify harConstantsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4600
     * @tc.name      testConstants0046
     * @tc.desc      Verify harConstantsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4700
     * @tc.name      testConstants0047
     * @tc.desc      Verify harConstantsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4800
     * @tc.name      testConstants0048
     * @tc.desc      Verify harConstantsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_4900
     * @tc.name      testConstants0049
     * @tc.desc      Verify harConstantsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5000
     * @tc.name      testConstants0050
     * @tc.desc      Verify harConstantsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5100
     * @tc.name      testConstants0051
     * @tc.desc      Verify harConstantsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5200
     * @tc.name      testConstants0052
     * @tc.desc      Verify harConstantsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5300
     * @tc.name      testConstants0053
     * @tc.desc      Verify harConstantsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5400
     * @tc.name      testConstants0054
     * @tc.desc      Verify harConstantsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5500
     * @tc.name      testConstants0055
     * @tc.desc      Verify harConstantsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5600
     * @tc.name      testConstants0056
     * @tc.desc      Verify harConstantsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5700
     * @tc.name      testConstants0057
     * @tc.desc      Verify harConstantsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5800
     * @tc.name      testConstants0058
     * @tc.desc      Verify harConstantsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_5900
     * @tc.name      testConstants0059
     * @tc.desc      Verify harConstantsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6000
     * @tc.name      testConstants0060
     * @tc.desc      Verify harConstantsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6100
     * @tc.name      testConstants0061
     * @tc.desc      Verify harConstantsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6200
     * @tc.name      testConstants0062
     * @tc.desc      Verify harConstantsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6300
     * @tc.name      testConstants0063
     * @tc.desc      Verify harConstantsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6400
     * @tc.name      testConstants0064
     * @tc.desc      Verify harConstantsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6500
     * @tc.name      testConstants0065
     * @tc.desc      Verify harConstantsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6600
     * @tc.name      testConstants0066
     * @tc.desc      Verify harConstantsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6700
     * @tc.name      testConstants0067
     * @tc.desc      Verify harConstantsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6800
     * @tc.name      testConstants0068
     * @tc.desc      Verify harConstantsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_6900
     * @tc.name      testConstants0069
     * @tc.desc      Verify harConstantsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7000
     * @tc.name      testConstants0070
     * @tc.desc      Verify harConstantsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7100
     * @tc.name      testConstants0071
     * @tc.desc      Verify harConstantsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7200
     * @tc.name      testConstants0072
     * @tc.desc      Verify harConstantsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7300
     * @tc.name      testConstants0073
     * @tc.desc      Verify harConstantsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7400
     * @tc.name      testConstants0074
     * @tc.desc      Verify harConstantsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7500
     * @tc.name      testConstants0075
     * @tc.desc      Verify harConstantsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7600
     * @tc.name      testConstants0076
     * @tc.desc      Verify harConstantsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7700
     * @tc.name      testConstants0077
     * @tc.desc      Verify harConstantsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7800
     * @tc.name      testConstants0078
     * @tc.desc      Verify harConstantsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_7900
     * @tc.name      testConstants0079
     * @tc.desc      Verify harConstantsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_8000
     * @tc.name      testConstants0080
     * @tc.desc      Verify harConstantsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_EXPAND_CONST_8100
     * @tc.name      testConstants0081
     * @tc.desc      Verify harConstantsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstants0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(har.One).assertEqual('1');
      expect(har.module1).assertEqual('1');
      expect(har.module2).assertEqual('1');
      expect(har.module3).assertEqual('1');
      expect(har.module4).assertEqual('1');
      expect([har.One, har.module1, har.module2, har.module3, har.module4].length).assertEqual(5);
    });

  });
}
