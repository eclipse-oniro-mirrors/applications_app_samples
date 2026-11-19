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

const TAG: string = '[Sample_harPerformanceReadCore]';
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

export default function harPerformanceReadCoreTest(): void {
  describe('harPerformanceReadCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0100
     * @tc.name      testPerformanceRead0001
     * @tc.desc      Verify harPerformanceReadCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0200
     * @tc.name      testPerformanceRead0002
     * @tc.desc      Verify harPerformanceReadCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0300
     * @tc.name      testPerformanceRead0003
     * @tc.desc      Verify harPerformanceReadCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0400
     * @tc.name      testPerformanceRead0004
     * @tc.desc      Verify harPerformanceReadCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0500
     * @tc.name      testPerformanceRead0005
     * @tc.desc      Verify harPerformanceReadCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0600
     * @tc.name      testPerformanceRead0006
     * @tc.desc      Verify harPerformanceReadCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0700
     * @tc.name      testPerformanceRead0007
     * @tc.desc      Verify harPerformanceReadCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0800
     * @tc.name      testPerformanceRead0008
     * @tc.desc      Verify harPerformanceReadCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_0900
     * @tc.name      testPerformanceRead0009
     * @tc.desc      Verify harPerformanceReadCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1000
     * @tc.name      testPerformanceRead0010
     * @tc.desc      Verify harPerformanceReadCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1100
     * @tc.name      testPerformanceRead0011
     * @tc.desc      Verify harPerformanceReadCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1200
     * @tc.name      testPerformanceRead0012
     * @tc.desc      Verify harPerformanceReadCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1300
     * @tc.name      testPerformanceRead0013
     * @tc.desc      Verify harPerformanceReadCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1400
     * @tc.name      testPerformanceRead0014
     * @tc.desc      Verify harPerformanceReadCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1500
     * @tc.name      testPerformanceRead0015
     * @tc.desc      Verify harPerformanceReadCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1600
     * @tc.name      testPerformanceRead0016
     * @tc.desc      Verify harPerformanceReadCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1700
     * @tc.name      testPerformanceRead0017
     * @tc.desc      Verify harPerformanceReadCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1800
     * @tc.name      testPerformanceRead0018
     * @tc.desc      Verify harPerformanceReadCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_1900
     * @tc.name      testPerformanceRead0019
     * @tc.desc      Verify harPerformanceReadCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2000
     * @tc.name      testPerformanceRead0020
     * @tc.desc      Verify harPerformanceReadCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2100
     * @tc.name      testPerformanceRead0021
     * @tc.desc      Verify harPerformanceReadCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2200
     * @tc.name      testPerformanceRead0022
     * @tc.desc      Verify harPerformanceReadCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2300
     * @tc.name      testPerformanceRead0023
     * @tc.desc      Verify harPerformanceReadCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2400
     * @tc.name      testPerformanceRead0024
     * @tc.desc      Verify harPerformanceReadCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2500
     * @tc.name      testPerformanceRead0025
     * @tc.desc      Verify harPerformanceReadCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2600
     * @tc.name      testPerformanceRead0026
     * @tc.desc      Verify harPerformanceReadCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2700
     * @tc.name      testPerformanceRead0027
     * @tc.desc      Verify harPerformanceReadCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2800
     * @tc.name      testPerformanceRead0028
     * @tc.desc      Verify harPerformanceReadCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_2900
     * @tc.name      testPerformanceRead0029
     * @tc.desc      Verify harPerformanceReadCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3000
     * @tc.name      testPerformanceRead0030
     * @tc.desc      Verify harPerformanceReadCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3100
     * @tc.name      testPerformanceRead0031
     * @tc.desc      Verify harPerformanceReadCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3200
     * @tc.name      testPerformanceRead0032
     * @tc.desc      Verify harPerformanceReadCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3300
     * @tc.name      testPerformanceRead0033
     * @tc.desc      Verify harPerformanceReadCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3400
     * @tc.name      testPerformanceRead0034
     * @tc.desc      Verify harPerformanceReadCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3500
     * @tc.name      testPerformanceRead0035
     * @tc.desc      Verify harPerformanceReadCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3600
     * @tc.name      testPerformanceRead0036
     * @tc.desc      Verify harPerformanceReadCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3700
     * @tc.name      testPerformanceRead0037
     * @tc.desc      Verify harPerformanceReadCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3800
     * @tc.name      testPerformanceRead0038
     * @tc.desc      Verify harPerformanceReadCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_3900
     * @tc.name      testPerformanceRead0039
     * @tc.desc      Verify harPerformanceReadCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4000
     * @tc.name      testPerformanceRead0040
     * @tc.desc      Verify harPerformanceReadCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4100
     * @tc.name      testPerformanceRead0041
     * @tc.desc      Verify harPerformanceReadCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4200
     * @tc.name      testPerformanceRead0042
     * @tc.desc      Verify harPerformanceReadCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4300
     * @tc.name      testPerformanceRead0043
     * @tc.desc      Verify harPerformanceReadCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4400
     * @tc.name      testPerformanceRead0044
     * @tc.desc      Verify harPerformanceReadCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4500
     * @tc.name      testPerformanceRead0045
     * @tc.desc      Verify harPerformanceReadCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4600
     * @tc.name      testPerformanceRead0046
     * @tc.desc      Verify harPerformanceReadCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4700
     * @tc.name      testPerformanceRead0047
     * @tc.desc      Verify harPerformanceReadCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4800
     * @tc.name      testPerformanceRead0048
     * @tc.desc      Verify harPerformanceReadCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_4900
     * @tc.name      testPerformanceRead0049
     * @tc.desc      Verify harPerformanceReadCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5000
     * @tc.name      testPerformanceRead0050
     * @tc.desc      Verify harPerformanceReadCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5100
     * @tc.name      testPerformanceRead0051
     * @tc.desc      Verify harPerformanceReadCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5200
     * @tc.name      testPerformanceRead0052
     * @tc.desc      Verify harPerformanceReadCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5300
     * @tc.name      testPerformanceRead0053
     * @tc.desc      Verify harPerformanceReadCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5400
     * @tc.name      testPerformanceRead0054
     * @tc.desc      Verify harPerformanceReadCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5500
     * @tc.name      testPerformanceRead0055
     * @tc.desc      Verify harPerformanceReadCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5600
     * @tc.name      testPerformanceRead0056
     * @tc.desc      Verify harPerformanceReadCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5700
     * @tc.name      testPerformanceRead0057
     * @tc.desc      Verify harPerformanceReadCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5800
     * @tc.name      testPerformanceRead0058
     * @tc.desc      Verify harPerformanceReadCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_5900
     * @tc.name      testPerformanceRead0059
     * @tc.desc      Verify harPerformanceReadCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6000
     * @tc.name      testPerformanceRead0060
     * @tc.desc      Verify harPerformanceReadCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6100
     * @tc.name      testPerformanceRead0061
     * @tc.desc      Verify harPerformanceReadCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6200
     * @tc.name      testPerformanceRead0062
     * @tc.desc      Verify harPerformanceReadCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6300
     * @tc.name      testPerformanceRead0063
     * @tc.desc      Verify harPerformanceReadCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6400
     * @tc.name      testPerformanceRead0064
     * @tc.desc      Verify harPerformanceReadCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6500
     * @tc.name      testPerformanceRead0065
     * @tc.desc      Verify harPerformanceReadCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6600
     * @tc.name      testPerformanceRead0066
     * @tc.desc      Verify harPerformanceReadCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6700
     * @tc.name      testPerformanceRead0067
     * @tc.desc      Verify harPerformanceReadCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6800
     * @tc.name      testPerformanceRead0068
     * @tc.desc      Verify harPerformanceReadCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_6900
     * @tc.name      testPerformanceRead0069
     * @tc.desc      Verify harPerformanceReadCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7000
     * @tc.name      testPerformanceRead0070
     * @tc.desc      Verify harPerformanceReadCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7100
     * @tc.name      testPerformanceRead0071
     * @tc.desc      Verify harPerformanceReadCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7200
     * @tc.name      testPerformanceRead0072
     * @tc.desc      Verify harPerformanceReadCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7300
     * @tc.name      testPerformanceRead0073
     * @tc.desc      Verify harPerformanceReadCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7400
     * @tc.name      testPerformanceRead0074
     * @tc.desc      Verify harPerformanceReadCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7500
     * @tc.name      testPerformanceRead0075
     * @tc.desc      Verify harPerformanceReadCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7600
     * @tc.name      testPerformanceRead0076
     * @tc.desc      Verify harPerformanceReadCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7700
     * @tc.name      testPerformanceRead0077
     * @tc.desc      Verify harPerformanceReadCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7800
     * @tc.name      testPerformanceRead0078
     * @tc.desc      Verify harPerformanceReadCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_7900
     * @tc.name      testPerformanceRead0079
     * @tc.desc      Verify harPerformanceReadCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_8000
     * @tc.name      testPerformanceRead0080
     * @tc.desc      Verify harPerformanceReadCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_PERF_READ_8100
     * @tc.name      testPerformanceRead0081
     * @tc.desc      Verify harPerformanceReadCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPerformanceRead0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = har.One;
      }
      const elapsed: number = Date.now() - start;
      expect(last).assertEqual('1');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

  });
}
