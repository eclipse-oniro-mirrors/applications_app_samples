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
import Logger from '../../../main/ets/utils/Logger';

const TAG: string = '[Sample_loggerEmptyCore]';
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
export default function loggerEmptyCoreTest(): void {
  describe('loggerEmptyCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0100
     * @tc.name      testLoggerEmpty0001
     * @tc.desc      Verify loggerEmptyCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0200
     * @tc.name      testLoggerEmpty0002
     * @tc.desc      Verify loggerEmptyCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0300
     * @tc.name      testLoggerEmpty0003
     * @tc.desc      Verify loggerEmptyCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0400
     * @tc.name      testLoggerEmpty0004
     * @tc.desc      Verify loggerEmptyCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0500
     * @tc.name      testLoggerEmpty0005
     * @tc.desc      Verify loggerEmptyCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0600
     * @tc.name      testLoggerEmpty0006
     * @tc.desc      Verify loggerEmptyCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0700
     * @tc.name      testLoggerEmpty0007
     * @tc.desc      Verify loggerEmptyCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0800
     * @tc.name      testLoggerEmpty0008
     * @tc.desc      Verify loggerEmptyCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_0900
     * @tc.name      testLoggerEmpty0009
     * @tc.desc      Verify loggerEmptyCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1000
     * @tc.name      testLoggerEmpty0010
     * @tc.desc      Verify loggerEmptyCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1100
     * @tc.name      testLoggerEmpty0011
     * @tc.desc      Verify loggerEmptyCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1200
     * @tc.name      testLoggerEmpty0012
     * @tc.desc      Verify loggerEmptyCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1300
     * @tc.name      testLoggerEmpty0013
     * @tc.desc      Verify loggerEmptyCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1400
     * @tc.name      testLoggerEmpty0014
     * @tc.desc      Verify loggerEmptyCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1500
     * @tc.name      testLoggerEmpty0015
     * @tc.desc      Verify loggerEmptyCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1600
     * @tc.name      testLoggerEmpty0016
     * @tc.desc      Verify loggerEmptyCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1700
     * @tc.name      testLoggerEmpty0017
     * @tc.desc      Verify loggerEmptyCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1800
     * @tc.name      testLoggerEmpty0018
     * @tc.desc      Verify loggerEmptyCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_1900
     * @tc.name      testLoggerEmpty0019
     * @tc.desc      Verify loggerEmptyCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2000
     * @tc.name      testLoggerEmpty0020
     * @tc.desc      Verify loggerEmptyCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2100
     * @tc.name      testLoggerEmpty0021
     * @tc.desc      Verify loggerEmptyCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2200
     * @tc.name      testLoggerEmpty0022
     * @tc.desc      Verify loggerEmptyCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2300
     * @tc.name      testLoggerEmpty0023
     * @tc.desc      Verify loggerEmptyCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2400
     * @tc.name      testLoggerEmpty0024
     * @tc.desc      Verify loggerEmptyCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2500
     * @tc.name      testLoggerEmpty0025
     * @tc.desc      Verify loggerEmptyCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2600
     * @tc.name      testLoggerEmpty0026
     * @tc.desc      Verify loggerEmptyCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2700
     * @tc.name      testLoggerEmpty0027
     * @tc.desc      Verify loggerEmptyCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2800
     * @tc.name      testLoggerEmpty0028
     * @tc.desc      Verify loggerEmptyCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_2900
     * @tc.name      testLoggerEmpty0029
     * @tc.desc      Verify loggerEmptyCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3000
     * @tc.name      testLoggerEmpty0030
     * @tc.desc      Verify loggerEmptyCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3100
     * @tc.name      testLoggerEmpty0031
     * @tc.desc      Verify loggerEmptyCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3200
     * @tc.name      testLoggerEmpty0032
     * @tc.desc      Verify loggerEmptyCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3300
     * @tc.name      testLoggerEmpty0033
     * @tc.desc      Verify loggerEmptyCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3400
     * @tc.name      testLoggerEmpty0034
     * @tc.desc      Verify loggerEmptyCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3500
     * @tc.name      testLoggerEmpty0035
     * @tc.desc      Verify loggerEmptyCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3600
     * @tc.name      testLoggerEmpty0036
     * @tc.desc      Verify loggerEmptyCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3700
     * @tc.name      testLoggerEmpty0037
     * @tc.desc      Verify loggerEmptyCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3800
     * @tc.name      testLoggerEmpty0038
     * @tc.desc      Verify loggerEmptyCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_3900
     * @tc.name      testLoggerEmpty0039
     * @tc.desc      Verify loggerEmptyCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4000
     * @tc.name      testLoggerEmpty0040
     * @tc.desc      Verify loggerEmptyCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4100
     * @tc.name      testLoggerEmpty0041
     * @tc.desc      Verify loggerEmptyCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4200
     * @tc.name      testLoggerEmpty0042
     * @tc.desc      Verify loggerEmptyCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4300
     * @tc.name      testLoggerEmpty0043
     * @tc.desc      Verify loggerEmptyCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4400
     * @tc.name      testLoggerEmpty0044
     * @tc.desc      Verify loggerEmptyCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4500
     * @tc.name      testLoggerEmpty0045
     * @tc.desc      Verify loggerEmptyCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4600
     * @tc.name      testLoggerEmpty0046
     * @tc.desc      Verify loggerEmptyCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4700
     * @tc.name      testLoggerEmpty0047
     * @tc.desc      Verify loggerEmptyCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4800
     * @tc.name      testLoggerEmpty0048
     * @tc.desc      Verify loggerEmptyCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_4900
     * @tc.name      testLoggerEmpty0049
     * @tc.desc      Verify loggerEmptyCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5000
     * @tc.name      testLoggerEmpty0050
     * @tc.desc      Verify loggerEmptyCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5100
     * @tc.name      testLoggerEmpty0051
     * @tc.desc      Verify loggerEmptyCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5200
     * @tc.name      testLoggerEmpty0052
     * @tc.desc      Verify loggerEmptyCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5300
     * @tc.name      testLoggerEmpty0053
     * @tc.desc      Verify loggerEmptyCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5400
     * @tc.name      testLoggerEmpty0054
     * @tc.desc      Verify loggerEmptyCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5500
     * @tc.name      testLoggerEmpty0055
     * @tc.desc      Verify loggerEmptyCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5600
     * @tc.name      testLoggerEmpty0056
     * @tc.desc      Verify loggerEmptyCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5700
     * @tc.name      testLoggerEmpty0057
     * @tc.desc      Verify loggerEmptyCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5800
     * @tc.name      testLoggerEmpty0058
     * @tc.desc      Verify loggerEmptyCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_5900
     * @tc.name      testLoggerEmpty0059
     * @tc.desc      Verify loggerEmptyCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6000
     * @tc.name      testLoggerEmpty0060
     * @tc.desc      Verify loggerEmptyCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6100
     * @tc.name      testLoggerEmpty0061
     * @tc.desc      Verify loggerEmptyCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6200
     * @tc.name      testLoggerEmpty0062
     * @tc.desc      Verify loggerEmptyCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6300
     * @tc.name      testLoggerEmpty0063
     * @tc.desc      Verify loggerEmptyCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6400
     * @tc.name      testLoggerEmpty0064
     * @tc.desc      Verify loggerEmptyCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6500
     * @tc.name      testLoggerEmpty0065
     * @tc.desc      Verify loggerEmptyCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6600
     * @tc.name      testLoggerEmpty0066
     * @tc.desc      Verify loggerEmptyCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6700
     * @tc.name      testLoggerEmpty0067
     * @tc.desc      Verify loggerEmptyCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6800
     * @tc.name      testLoggerEmpty0068
     * @tc.desc      Verify loggerEmptyCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_6900
     * @tc.name      testLoggerEmpty0069
     * @tc.desc      Verify loggerEmptyCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7000
     * @tc.name      testLoggerEmpty0070
     * @tc.desc      Verify loggerEmptyCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7100
     * @tc.name      testLoggerEmpty0071
     * @tc.desc      Verify loggerEmptyCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7200
     * @tc.name      testLoggerEmpty0072
     * @tc.desc      Verify loggerEmptyCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7300
     * @tc.name      testLoggerEmpty0073
     * @tc.desc      Verify loggerEmptyCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7400
     * @tc.name      testLoggerEmpty0074
     * @tc.desc      Verify loggerEmptyCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7500
     * @tc.name      testLoggerEmpty0075
     * @tc.desc      Verify loggerEmptyCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7600
     * @tc.name      testLoggerEmpty0076
     * @tc.desc      Verify loggerEmptyCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7700
     * @tc.name      testLoggerEmpty0077
     * @tc.desc      Verify loggerEmptyCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7800
     * @tc.name      testLoggerEmpty0078
     * @tc.desc      Verify loggerEmptyCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_7900
     * @tc.name      testLoggerEmpty0079
     * @tc.desc      Verify loggerEmptyCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_8000
     * @tc.name      testLoggerEmpty0080
     * @tc.desc      Verify loggerEmptyCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_EMPTY_8100
     * @tc.name      testLoggerEmpty0081
     * @tc.desc      Verify loggerEmptyCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerEmpty0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('', '');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

  });
}
