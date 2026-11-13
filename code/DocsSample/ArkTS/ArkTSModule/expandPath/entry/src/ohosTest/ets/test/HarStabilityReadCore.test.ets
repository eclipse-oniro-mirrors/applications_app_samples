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

const TAG: string = '[Sample_harStabilityReadCore]';
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

export default function harStabilityReadCoreTest(): void {
  describe('harStabilityReadCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0100
     * @tc.name      testStabilityRead0001
     * @tc.desc      Verify harStabilityReadCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0200
     * @tc.name      testStabilityRead0002
     * @tc.desc      Verify harStabilityReadCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0300
     * @tc.name      testStabilityRead0003
     * @tc.desc      Verify harStabilityReadCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0400
     * @tc.name      testStabilityRead0004
     * @tc.desc      Verify harStabilityReadCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0500
     * @tc.name      testStabilityRead0005
     * @tc.desc      Verify harStabilityReadCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0600
     * @tc.name      testStabilityRead0006
     * @tc.desc      Verify harStabilityReadCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0700
     * @tc.name      testStabilityRead0007
     * @tc.desc      Verify harStabilityReadCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0800
     * @tc.name      testStabilityRead0008
     * @tc.desc      Verify harStabilityReadCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_0900
     * @tc.name      testStabilityRead0009
     * @tc.desc      Verify harStabilityReadCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1000
     * @tc.name      testStabilityRead0010
     * @tc.desc      Verify harStabilityReadCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1100
     * @tc.name      testStabilityRead0011
     * @tc.desc      Verify harStabilityReadCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1200
     * @tc.name      testStabilityRead0012
     * @tc.desc      Verify harStabilityReadCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1300
     * @tc.name      testStabilityRead0013
     * @tc.desc      Verify harStabilityReadCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1400
     * @tc.name      testStabilityRead0014
     * @tc.desc      Verify harStabilityReadCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1500
     * @tc.name      testStabilityRead0015
     * @tc.desc      Verify harStabilityReadCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1600
     * @tc.name      testStabilityRead0016
     * @tc.desc      Verify harStabilityReadCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1700
     * @tc.name      testStabilityRead0017
     * @tc.desc      Verify harStabilityReadCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1800
     * @tc.name      testStabilityRead0018
     * @tc.desc      Verify harStabilityReadCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_1900
     * @tc.name      testStabilityRead0019
     * @tc.desc      Verify harStabilityReadCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2000
     * @tc.name      testStabilityRead0020
     * @tc.desc      Verify harStabilityReadCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2100
     * @tc.name      testStabilityRead0021
     * @tc.desc      Verify harStabilityReadCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2200
     * @tc.name      testStabilityRead0022
     * @tc.desc      Verify harStabilityReadCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2300
     * @tc.name      testStabilityRead0023
     * @tc.desc      Verify harStabilityReadCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2400
     * @tc.name      testStabilityRead0024
     * @tc.desc      Verify harStabilityReadCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2500
     * @tc.name      testStabilityRead0025
     * @tc.desc      Verify harStabilityReadCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2600
     * @tc.name      testStabilityRead0026
     * @tc.desc      Verify harStabilityReadCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2700
     * @tc.name      testStabilityRead0027
     * @tc.desc      Verify harStabilityReadCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2800
     * @tc.name      testStabilityRead0028
     * @tc.desc      Verify harStabilityReadCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_2900
     * @tc.name      testStabilityRead0029
     * @tc.desc      Verify harStabilityReadCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3000
     * @tc.name      testStabilityRead0030
     * @tc.desc      Verify harStabilityReadCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3100
     * @tc.name      testStabilityRead0031
     * @tc.desc      Verify harStabilityReadCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3200
     * @tc.name      testStabilityRead0032
     * @tc.desc      Verify harStabilityReadCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3300
     * @tc.name      testStabilityRead0033
     * @tc.desc      Verify harStabilityReadCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3400
     * @tc.name      testStabilityRead0034
     * @tc.desc      Verify harStabilityReadCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3500
     * @tc.name      testStabilityRead0035
     * @tc.desc      Verify harStabilityReadCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3600
     * @tc.name      testStabilityRead0036
     * @tc.desc      Verify harStabilityReadCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3700
     * @tc.name      testStabilityRead0037
     * @tc.desc      Verify harStabilityReadCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3800
     * @tc.name      testStabilityRead0038
     * @tc.desc      Verify harStabilityReadCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_3900
     * @tc.name      testStabilityRead0039
     * @tc.desc      Verify harStabilityReadCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4000
     * @tc.name      testStabilityRead0040
     * @tc.desc      Verify harStabilityReadCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4100
     * @tc.name      testStabilityRead0041
     * @tc.desc      Verify harStabilityReadCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4200
     * @tc.name      testStabilityRead0042
     * @tc.desc      Verify harStabilityReadCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4300
     * @tc.name      testStabilityRead0043
     * @tc.desc      Verify harStabilityReadCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4400
     * @tc.name      testStabilityRead0044
     * @tc.desc      Verify harStabilityReadCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4500
     * @tc.name      testStabilityRead0045
     * @tc.desc      Verify harStabilityReadCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4600
     * @tc.name      testStabilityRead0046
     * @tc.desc      Verify harStabilityReadCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4700
     * @tc.name      testStabilityRead0047
     * @tc.desc      Verify harStabilityReadCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4800
     * @tc.name      testStabilityRead0048
     * @tc.desc      Verify harStabilityReadCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_4900
     * @tc.name      testStabilityRead0049
     * @tc.desc      Verify harStabilityReadCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5000
     * @tc.name      testStabilityRead0050
     * @tc.desc      Verify harStabilityReadCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5100
     * @tc.name      testStabilityRead0051
     * @tc.desc      Verify harStabilityReadCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5200
     * @tc.name      testStabilityRead0052
     * @tc.desc      Verify harStabilityReadCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5300
     * @tc.name      testStabilityRead0053
     * @tc.desc      Verify harStabilityReadCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5400
     * @tc.name      testStabilityRead0054
     * @tc.desc      Verify harStabilityReadCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5500
     * @tc.name      testStabilityRead0055
     * @tc.desc      Verify harStabilityReadCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5600
     * @tc.name      testStabilityRead0056
     * @tc.desc      Verify harStabilityReadCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5700
     * @tc.name      testStabilityRead0057
     * @tc.desc      Verify harStabilityReadCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5800
     * @tc.name      testStabilityRead0058
     * @tc.desc      Verify harStabilityReadCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_5900
     * @tc.name      testStabilityRead0059
     * @tc.desc      Verify harStabilityReadCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6000
     * @tc.name      testStabilityRead0060
     * @tc.desc      Verify harStabilityReadCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6100
     * @tc.name      testStabilityRead0061
     * @tc.desc      Verify harStabilityReadCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6200
     * @tc.name      testStabilityRead0062
     * @tc.desc      Verify harStabilityReadCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6300
     * @tc.name      testStabilityRead0063
     * @tc.desc      Verify harStabilityReadCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6400
     * @tc.name      testStabilityRead0064
     * @tc.desc      Verify harStabilityReadCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6500
     * @tc.name      testStabilityRead0065
     * @tc.desc      Verify harStabilityReadCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6600
     * @tc.name      testStabilityRead0066
     * @tc.desc      Verify harStabilityReadCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6700
     * @tc.name      testStabilityRead0067
     * @tc.desc      Verify harStabilityReadCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6800
     * @tc.name      testStabilityRead0068
     * @tc.desc      Verify harStabilityReadCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_6900
     * @tc.name      testStabilityRead0069
     * @tc.desc      Verify harStabilityReadCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7000
     * @tc.name      testStabilityRead0070
     * @tc.desc      Verify harStabilityReadCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7100
     * @tc.name      testStabilityRead0071
     * @tc.desc      Verify harStabilityReadCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7200
     * @tc.name      testStabilityRead0072
     * @tc.desc      Verify harStabilityReadCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7300
     * @tc.name      testStabilityRead0073
     * @tc.desc      Verify harStabilityReadCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7400
     * @tc.name      testStabilityRead0074
     * @tc.desc      Verify harStabilityReadCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7500
     * @tc.name      testStabilityRead0075
     * @tc.desc      Verify harStabilityReadCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7600
     * @tc.name      testStabilityRead0076
     * @tc.desc      Verify harStabilityReadCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7700
     * @tc.name      testStabilityRead0077
     * @tc.desc      Verify harStabilityReadCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7800
     * @tc.name      testStabilityRead0078
     * @tc.desc      Verify harStabilityReadCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module2).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_7900
     * @tc.name      testStabilityRead0079
     * @tc.desc      Verify harStabilityReadCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module3).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_8000
     * @tc.name      testStabilityRead0080
     * @tc.desc      Verify harStabilityReadCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module4).assertEqual('1');
    });

    /**
     * @tc.number    SUB_EXPAND_STAB_READ_8100
     * @tc.name      testStabilityRead0081
     * @tc.desc      Verify harStabilityReadCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStabilityRead0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let last: string = '';
      for (let n: number = 0; n < 100; n++) {
        last = har.One;
      }
      expect(last).assertEqual('1');
      expect(har.module1).assertEqual('1');
    });

  });
}
