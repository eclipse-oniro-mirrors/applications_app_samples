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

const TAG: string = '[Sample_loggerDebugCore]';
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
export default function loggerDebugCoreTest(): void {
  describe('loggerDebugCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0100
     * @tc.name      testLoggerDebug0001
     * @tc.desc      Verify loggerDebugCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_0', 'case_0');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0200
     * @tc.name      testLoggerDebug0002
     * @tc.desc      Verify loggerDebugCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_1', 'case_1');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0300
     * @tc.name      testLoggerDebug0003
     * @tc.desc      Verify loggerDebugCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_2', 'case_2');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0400
     * @tc.name      testLoggerDebug0004
     * @tc.desc      Verify loggerDebugCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_3', 'case_3');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0500
     * @tc.name      testLoggerDebug0005
     * @tc.desc      Verify loggerDebugCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_4', 'case_4');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0600
     * @tc.name      testLoggerDebug0006
     * @tc.desc      Verify loggerDebugCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_5', 'case_5');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0700
     * @tc.name      testLoggerDebug0007
     * @tc.desc      Verify loggerDebugCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_6', 'case_6');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0800
     * @tc.name      testLoggerDebug0008
     * @tc.desc      Verify loggerDebugCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_7', 'case_7');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_0900
     * @tc.name      testLoggerDebug0009
     * @tc.desc      Verify loggerDebugCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_8', 'case_8');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1000
     * @tc.name      testLoggerDebug0010
     * @tc.desc      Verify loggerDebugCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_9', 'case_9');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1100
     * @tc.name      testLoggerDebug0011
     * @tc.desc      Verify loggerDebugCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_10', 'case_10');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1200
     * @tc.name      testLoggerDebug0012
     * @tc.desc      Verify loggerDebugCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_11', 'case_11');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1300
     * @tc.name      testLoggerDebug0013
     * @tc.desc      Verify loggerDebugCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_12', 'case_12');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1400
     * @tc.name      testLoggerDebug0014
     * @tc.desc      Verify loggerDebugCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_13', 'case_13');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1500
     * @tc.name      testLoggerDebug0015
     * @tc.desc      Verify loggerDebugCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_14', 'case_14');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1600
     * @tc.name      testLoggerDebug0016
     * @tc.desc      Verify loggerDebugCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_15', 'case_15');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1700
     * @tc.name      testLoggerDebug0017
     * @tc.desc      Verify loggerDebugCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_16', 'case_16');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1800
     * @tc.name      testLoggerDebug0018
     * @tc.desc      Verify loggerDebugCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_17', 'case_17');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_1900
     * @tc.name      testLoggerDebug0019
     * @tc.desc      Verify loggerDebugCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_18', 'case_18');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2000
     * @tc.name      testLoggerDebug0020
     * @tc.desc      Verify loggerDebugCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_19', 'case_19');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2100
     * @tc.name      testLoggerDebug0021
     * @tc.desc      Verify loggerDebugCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_20', 'case_20');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2200
     * @tc.name      testLoggerDebug0022
     * @tc.desc      Verify loggerDebugCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_21', 'case_21');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2300
     * @tc.name      testLoggerDebug0023
     * @tc.desc      Verify loggerDebugCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_22', 'case_22');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2400
     * @tc.name      testLoggerDebug0024
     * @tc.desc      Verify loggerDebugCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_23', 'case_23');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2500
     * @tc.name      testLoggerDebug0025
     * @tc.desc      Verify loggerDebugCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_24', 'case_24');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2600
     * @tc.name      testLoggerDebug0026
     * @tc.desc      Verify loggerDebugCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_25', 'case_25');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2700
     * @tc.name      testLoggerDebug0027
     * @tc.desc      Verify loggerDebugCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_26', 'case_26');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2800
     * @tc.name      testLoggerDebug0028
     * @tc.desc      Verify loggerDebugCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_27', 'case_27');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_2900
     * @tc.name      testLoggerDebug0029
     * @tc.desc      Verify loggerDebugCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_28', 'case_28');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3000
     * @tc.name      testLoggerDebug0030
     * @tc.desc      Verify loggerDebugCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_29', 'case_29');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3100
     * @tc.name      testLoggerDebug0031
     * @tc.desc      Verify loggerDebugCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_30', 'case_30');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3200
     * @tc.name      testLoggerDebug0032
     * @tc.desc      Verify loggerDebugCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_31', 'case_31');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3300
     * @tc.name      testLoggerDebug0033
     * @tc.desc      Verify loggerDebugCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_32', 'case_32');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3400
     * @tc.name      testLoggerDebug0034
     * @tc.desc      Verify loggerDebugCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_33', 'case_33');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3500
     * @tc.name      testLoggerDebug0035
     * @tc.desc      Verify loggerDebugCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_34', 'case_34');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3600
     * @tc.name      testLoggerDebug0036
     * @tc.desc      Verify loggerDebugCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_35', 'case_35');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3700
     * @tc.name      testLoggerDebug0037
     * @tc.desc      Verify loggerDebugCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_36', 'case_36');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3800
     * @tc.name      testLoggerDebug0038
     * @tc.desc      Verify loggerDebugCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_37', 'case_37');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_3900
     * @tc.name      testLoggerDebug0039
     * @tc.desc      Verify loggerDebugCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_38', 'case_38');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4000
     * @tc.name      testLoggerDebug0040
     * @tc.desc      Verify loggerDebugCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_39', 'case_39');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4100
     * @tc.name      testLoggerDebug0041
     * @tc.desc      Verify loggerDebugCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_40', 'case_40');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4200
     * @tc.name      testLoggerDebug0042
     * @tc.desc      Verify loggerDebugCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_41', 'case_41');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4300
     * @tc.name      testLoggerDebug0043
     * @tc.desc      Verify loggerDebugCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_42', 'case_42');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4400
     * @tc.name      testLoggerDebug0044
     * @tc.desc      Verify loggerDebugCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_43', 'case_43');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4500
     * @tc.name      testLoggerDebug0045
     * @tc.desc      Verify loggerDebugCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_44', 'case_44');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4600
     * @tc.name      testLoggerDebug0046
     * @tc.desc      Verify loggerDebugCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_45', 'case_45');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4700
     * @tc.name      testLoggerDebug0047
     * @tc.desc      Verify loggerDebugCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_46', 'case_46');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4800
     * @tc.name      testLoggerDebug0048
     * @tc.desc      Verify loggerDebugCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_47', 'case_47');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_4900
     * @tc.name      testLoggerDebug0049
     * @tc.desc      Verify loggerDebugCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_48', 'case_48');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5000
     * @tc.name      testLoggerDebug0050
     * @tc.desc      Verify loggerDebugCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_49', 'case_49');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5100
     * @tc.name      testLoggerDebug0051
     * @tc.desc      Verify loggerDebugCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_50', 'case_50');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5200
     * @tc.name      testLoggerDebug0052
     * @tc.desc      Verify loggerDebugCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_51', 'case_51');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5300
     * @tc.name      testLoggerDebug0053
     * @tc.desc      Verify loggerDebugCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_52', 'case_52');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5400
     * @tc.name      testLoggerDebug0054
     * @tc.desc      Verify loggerDebugCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_53', 'case_53');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5500
     * @tc.name      testLoggerDebug0055
     * @tc.desc      Verify loggerDebugCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_54', 'case_54');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5600
     * @tc.name      testLoggerDebug0056
     * @tc.desc      Verify loggerDebugCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_55', 'case_55');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5700
     * @tc.name      testLoggerDebug0057
     * @tc.desc      Verify loggerDebugCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_56', 'case_56');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5800
     * @tc.name      testLoggerDebug0058
     * @tc.desc      Verify loggerDebugCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_57', 'case_57');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_5900
     * @tc.name      testLoggerDebug0059
     * @tc.desc      Verify loggerDebugCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_58', 'case_58');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6000
     * @tc.name      testLoggerDebug0060
     * @tc.desc      Verify loggerDebugCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_59', 'case_59');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6100
     * @tc.name      testLoggerDebug0061
     * @tc.desc      Verify loggerDebugCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_60', 'case_60');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6200
     * @tc.name      testLoggerDebug0062
     * @tc.desc      Verify loggerDebugCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_61', 'case_61');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6300
     * @tc.name      testLoggerDebug0063
     * @tc.desc      Verify loggerDebugCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_62', 'case_62');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6400
     * @tc.name      testLoggerDebug0064
     * @tc.desc      Verify loggerDebugCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_63', 'case_63');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6500
     * @tc.name      testLoggerDebug0065
     * @tc.desc      Verify loggerDebugCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_64', 'case_64');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6600
     * @tc.name      testLoggerDebug0066
     * @tc.desc      Verify loggerDebugCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_65', 'case_65');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6700
     * @tc.name      testLoggerDebug0067
     * @tc.desc      Verify loggerDebugCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_66', 'case_66');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6800
     * @tc.name      testLoggerDebug0068
     * @tc.desc      Verify loggerDebugCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_67', 'case_67');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_6900
     * @tc.name      testLoggerDebug0069
     * @tc.desc      Verify loggerDebugCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_68', 'case_68');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7000
     * @tc.name      testLoggerDebug0070
     * @tc.desc      Verify loggerDebugCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_69', 'case_69');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7100
     * @tc.name      testLoggerDebug0071
     * @tc.desc      Verify loggerDebugCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_70', 'case_70');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7200
     * @tc.name      testLoggerDebug0072
     * @tc.desc      Verify loggerDebugCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_71', 'case_71');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7300
     * @tc.name      testLoggerDebug0073
     * @tc.desc      Verify loggerDebugCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_72', 'case_72');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7400
     * @tc.name      testLoggerDebug0074
     * @tc.desc      Verify loggerDebugCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_73', 'case_73');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7500
     * @tc.name      testLoggerDebug0075
     * @tc.desc      Verify loggerDebugCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_74', 'case_74');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7600
     * @tc.name      testLoggerDebug0076
     * @tc.desc      Verify loggerDebugCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_75', 'case_75');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7700
     * @tc.name      testLoggerDebug0077
     * @tc.desc      Verify loggerDebugCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_76', 'case_76');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7800
     * @tc.name      testLoggerDebug0078
     * @tc.desc      Verify loggerDebugCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_77', 'case_77');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_7900
     * @tc.name      testLoggerDebug0079
     * @tc.desc      Verify loggerDebugCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_78', 'case_78');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_8000
     * @tc.name      testLoggerDebug0080
     * @tc.desc      Verify loggerDebugCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_79', 'case_79');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_D_8100
     * @tc.name      testLoggerDebug0081
     * @tc.desc      Verify loggerDebugCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerDebug0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.debug('debug_80', 'case_80');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

  });
}
