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
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_dateTimePerfCore]';
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
export default function dateTimePerfCoreTest(): void {
  describe('dateTimePerfCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0100
     * @tc.name      testDateTimePerf0001
     * @tc.desc      Verify dateTimePerfCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(0);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0200
     * @tc.name      testDateTimePerf0002
     * @tc.desc      Verify dateTimePerfCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(13);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0300
     * @tc.name      testDateTimePerf0003
     * @tc.desc      Verify dateTimePerfCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(26);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0400
     * @tc.name      testDateTimePerf0004
     * @tc.desc      Verify dateTimePerfCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(39);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0500
     * @tc.name      testDateTimePerf0005
     * @tc.desc      Verify dateTimePerfCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(52);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0600
     * @tc.name      testDateTimePerf0006
     * @tc.desc      Verify dateTimePerfCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(65);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0700
     * @tc.name      testDateTimePerf0007
     * @tc.desc      Verify dateTimePerfCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(78);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0800
     * @tc.name      testDateTimePerf0008
     * @tc.desc      Verify dateTimePerfCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(91);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_0900
     * @tc.name      testDateTimePerf0009
     * @tc.desc      Verify dateTimePerfCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(104);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1000
     * @tc.name      testDateTimePerf0010
     * @tc.desc      Verify dateTimePerfCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(117);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1100
     * @tc.name      testDateTimePerf0011
     * @tc.desc      Verify dateTimePerfCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(130);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1200
     * @tc.name      testDateTimePerf0012
     * @tc.desc      Verify dateTimePerfCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(143);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1300
     * @tc.name      testDateTimePerf0013
     * @tc.desc      Verify dateTimePerfCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(156);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1400
     * @tc.name      testDateTimePerf0014
     * @tc.desc      Verify dateTimePerfCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(169);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1500
     * @tc.name      testDateTimePerf0015
     * @tc.desc      Verify dateTimePerfCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(182);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1600
     * @tc.name      testDateTimePerf0016
     * @tc.desc      Verify dateTimePerfCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(195);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1700
     * @tc.name      testDateTimePerf0017
     * @tc.desc      Verify dateTimePerfCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(208);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1800
     * @tc.name      testDateTimePerf0018
     * @tc.desc      Verify dateTimePerfCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(221);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_1900
     * @tc.name      testDateTimePerf0019
     * @tc.desc      Verify dateTimePerfCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(234);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2000
     * @tc.name      testDateTimePerf0020
     * @tc.desc      Verify dateTimePerfCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(247);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2100
     * @tc.name      testDateTimePerf0021
     * @tc.desc      Verify dateTimePerfCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(260);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2200
     * @tc.name      testDateTimePerf0022
     * @tc.desc      Verify dateTimePerfCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(273);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2300
     * @tc.name      testDateTimePerf0023
     * @tc.desc      Verify dateTimePerfCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(286);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2400
     * @tc.name      testDateTimePerf0024
     * @tc.desc      Verify dateTimePerfCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(299);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2500
     * @tc.name      testDateTimePerf0025
     * @tc.desc      Verify dateTimePerfCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(312);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2600
     * @tc.name      testDateTimePerf0026
     * @tc.desc      Verify dateTimePerfCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(325);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2700
     * @tc.name      testDateTimePerf0027
     * @tc.desc      Verify dateTimePerfCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(338);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2800
     * @tc.name      testDateTimePerf0028
     * @tc.desc      Verify dateTimePerfCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(351);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_2900
     * @tc.name      testDateTimePerf0029
     * @tc.desc      Verify dateTimePerfCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(364);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3000
     * @tc.name      testDateTimePerf0030
     * @tc.desc      Verify dateTimePerfCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(377);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3100
     * @tc.name      testDateTimePerf0031
     * @tc.desc      Verify dateTimePerfCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(390);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3200
     * @tc.name      testDateTimePerf0032
     * @tc.desc      Verify dateTimePerfCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(403);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3300
     * @tc.name      testDateTimePerf0033
     * @tc.desc      Verify dateTimePerfCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(416);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3400
     * @tc.name      testDateTimePerf0034
     * @tc.desc      Verify dateTimePerfCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(429);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3500
     * @tc.name      testDateTimePerf0035
     * @tc.desc      Verify dateTimePerfCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(442);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3600
     * @tc.name      testDateTimePerf0036
     * @tc.desc      Verify dateTimePerfCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(455);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3700
     * @tc.name      testDateTimePerf0037
     * @tc.desc      Verify dateTimePerfCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(468);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3800
     * @tc.name      testDateTimePerf0038
     * @tc.desc      Verify dateTimePerfCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(481);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_3900
     * @tc.name      testDateTimePerf0039
     * @tc.desc      Verify dateTimePerfCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(494);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4000
     * @tc.name      testDateTimePerf0040
     * @tc.desc      Verify dateTimePerfCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(507);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4100
     * @tc.name      testDateTimePerf0041
     * @tc.desc      Verify dateTimePerfCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(520);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4200
     * @tc.name      testDateTimePerf0042
     * @tc.desc      Verify dateTimePerfCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(533);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4300
     * @tc.name      testDateTimePerf0043
     * @tc.desc      Verify dateTimePerfCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(546);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4400
     * @tc.name      testDateTimePerf0044
     * @tc.desc      Verify dateTimePerfCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(559);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4500
     * @tc.name      testDateTimePerf0045
     * @tc.desc      Verify dateTimePerfCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(572);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4600
     * @tc.name      testDateTimePerf0046
     * @tc.desc      Verify dateTimePerfCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(585);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4700
     * @tc.name      testDateTimePerf0047
     * @tc.desc      Verify dateTimePerfCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(598);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4800
     * @tc.name      testDateTimePerf0048
     * @tc.desc      Verify dateTimePerfCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(611);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_4900
     * @tc.name      testDateTimePerf0049
     * @tc.desc      Verify dateTimePerfCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(624);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5000
     * @tc.name      testDateTimePerf0050
     * @tc.desc      Verify dateTimePerfCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(637);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5100
     * @tc.name      testDateTimePerf0051
     * @tc.desc      Verify dateTimePerfCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(650);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5200
     * @tc.name      testDateTimePerf0052
     * @tc.desc      Verify dateTimePerfCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(663);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5300
     * @tc.name      testDateTimePerf0053
     * @tc.desc      Verify dateTimePerfCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(676);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5400
     * @tc.name      testDateTimePerf0054
     * @tc.desc      Verify dateTimePerfCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(689);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5500
     * @tc.name      testDateTimePerf0055
     * @tc.desc      Verify dateTimePerfCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(702);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5600
     * @tc.name      testDateTimePerf0056
     * @tc.desc      Verify dateTimePerfCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(715);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5700
     * @tc.name      testDateTimePerf0057
     * @tc.desc      Verify dateTimePerfCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(728);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5800
     * @tc.name      testDateTimePerf0058
     * @tc.desc      Verify dateTimePerfCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(741);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_5900
     * @tc.name      testDateTimePerf0059
     * @tc.desc      Verify dateTimePerfCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(754);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6000
     * @tc.name      testDateTimePerf0060
     * @tc.desc      Verify dateTimePerfCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(767);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6100
     * @tc.name      testDateTimePerf0061
     * @tc.desc      Verify dateTimePerfCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(780);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6200
     * @tc.name      testDateTimePerf0062
     * @tc.desc      Verify dateTimePerfCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(793);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6300
     * @tc.name      testDateTimePerf0063
     * @tc.desc      Verify dateTimePerfCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(806);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6400
     * @tc.name      testDateTimePerf0064
     * @tc.desc      Verify dateTimePerfCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(819);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6500
     * @tc.name      testDateTimePerf0065
     * @tc.desc      Verify dateTimePerfCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(832);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6600
     * @tc.name      testDateTimePerf0066
     * @tc.desc      Verify dateTimePerfCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(845);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6700
     * @tc.name      testDateTimePerf0067
     * @tc.desc      Verify dateTimePerfCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(858);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6800
     * @tc.name      testDateTimePerf0068
     * @tc.desc      Verify dateTimePerfCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(871);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_6900
     * @tc.name      testDateTimePerf0069
     * @tc.desc      Verify dateTimePerfCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(884);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7000
     * @tc.name      testDateTimePerf0070
     * @tc.desc      Verify dateTimePerfCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(897);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7100
     * @tc.name      testDateTimePerf0071
     * @tc.desc      Verify dateTimePerfCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(910);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7200
     * @tc.name      testDateTimePerf0072
     * @tc.desc      Verify dateTimePerfCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(923);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7300
     * @tc.name      testDateTimePerf0073
     * @tc.desc      Verify dateTimePerfCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(936);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7400
     * @tc.name      testDateTimePerf0074
     * @tc.desc      Verify dateTimePerfCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(949);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7500
     * @tc.name      testDateTimePerf0075
     * @tc.desc      Verify dateTimePerfCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(962);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7600
     * @tc.name      testDateTimePerf0076
     * @tc.desc      Verify dateTimePerfCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(975);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7700
     * @tc.name      testDateTimePerf0077
     * @tc.desc      Verify dateTimePerfCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(988);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7800
     * @tc.name      testDateTimePerf0078
     * @tc.desc      Verify dateTimePerfCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(1001);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_7900
     * @tc.name      testDateTimePerf0079
     * @tc.desc      Verify dateTimePerfCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(1014);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_8000
     * @tc.name      testDateTimePerf0080
     * @tc.desc      Verify dateTimePerfCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(1027);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_PERF_8100
     * @tc.name      testDateTimePerf0081
     * @tc.desc      Verify dateTimePerfCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimePerf0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      let last: string = '';
      for (let n: number = 0; n < 1000; n++) {
        last = dateTime(1040);
      }
      const elapsed: number = Date.now() - start;
      expect(last.length).assertEqual(5);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
    });

  });
}
