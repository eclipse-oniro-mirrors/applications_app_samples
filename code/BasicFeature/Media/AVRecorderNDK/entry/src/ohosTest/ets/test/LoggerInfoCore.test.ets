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

const TAG: string = '[Sample_loggerInfoCore]';
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
export default function loggerInfoCoreTest(): void {
  describe('loggerInfoCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0100
     * @tc.name      testLoggerInfo0001
     * @tc.desc      Verify loggerInfoCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_0', 'case_0');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0200
     * @tc.name      testLoggerInfo0002
     * @tc.desc      Verify loggerInfoCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_1', 'case_1');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0300
     * @tc.name      testLoggerInfo0003
     * @tc.desc      Verify loggerInfoCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_2', 'case_2');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0400
     * @tc.name      testLoggerInfo0004
     * @tc.desc      Verify loggerInfoCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_3', 'case_3');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0500
     * @tc.name      testLoggerInfo0005
     * @tc.desc      Verify loggerInfoCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_4', 'case_4');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0600
     * @tc.name      testLoggerInfo0006
     * @tc.desc      Verify loggerInfoCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_5', 'case_5');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0700
     * @tc.name      testLoggerInfo0007
     * @tc.desc      Verify loggerInfoCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_6', 'case_6');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0800
     * @tc.name      testLoggerInfo0008
     * @tc.desc      Verify loggerInfoCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_7', 'case_7');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_0900
     * @tc.name      testLoggerInfo0009
     * @tc.desc      Verify loggerInfoCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_8', 'case_8');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1000
     * @tc.name      testLoggerInfo0010
     * @tc.desc      Verify loggerInfoCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_9', 'case_9');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1100
     * @tc.name      testLoggerInfo0011
     * @tc.desc      Verify loggerInfoCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_10', 'case_10');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1200
     * @tc.name      testLoggerInfo0012
     * @tc.desc      Verify loggerInfoCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_11', 'case_11');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1300
     * @tc.name      testLoggerInfo0013
     * @tc.desc      Verify loggerInfoCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_12', 'case_12');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1400
     * @tc.name      testLoggerInfo0014
     * @tc.desc      Verify loggerInfoCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_13', 'case_13');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1500
     * @tc.name      testLoggerInfo0015
     * @tc.desc      Verify loggerInfoCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_14', 'case_14');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1600
     * @tc.name      testLoggerInfo0016
     * @tc.desc      Verify loggerInfoCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_15', 'case_15');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1700
     * @tc.name      testLoggerInfo0017
     * @tc.desc      Verify loggerInfoCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_16', 'case_16');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1800
     * @tc.name      testLoggerInfo0018
     * @tc.desc      Verify loggerInfoCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_17', 'case_17');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_1900
     * @tc.name      testLoggerInfo0019
     * @tc.desc      Verify loggerInfoCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_18', 'case_18');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2000
     * @tc.name      testLoggerInfo0020
     * @tc.desc      Verify loggerInfoCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_19', 'case_19');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2100
     * @tc.name      testLoggerInfo0021
     * @tc.desc      Verify loggerInfoCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_20', 'case_20');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2200
     * @tc.name      testLoggerInfo0022
     * @tc.desc      Verify loggerInfoCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_21', 'case_21');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2300
     * @tc.name      testLoggerInfo0023
     * @tc.desc      Verify loggerInfoCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_22', 'case_22');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2400
     * @tc.name      testLoggerInfo0024
     * @tc.desc      Verify loggerInfoCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_23', 'case_23');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2500
     * @tc.name      testLoggerInfo0025
     * @tc.desc      Verify loggerInfoCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_24', 'case_24');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2600
     * @tc.name      testLoggerInfo0026
     * @tc.desc      Verify loggerInfoCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_25', 'case_25');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2700
     * @tc.name      testLoggerInfo0027
     * @tc.desc      Verify loggerInfoCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_26', 'case_26');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2800
     * @tc.name      testLoggerInfo0028
     * @tc.desc      Verify loggerInfoCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_27', 'case_27');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_2900
     * @tc.name      testLoggerInfo0029
     * @tc.desc      Verify loggerInfoCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_28', 'case_28');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3000
     * @tc.name      testLoggerInfo0030
     * @tc.desc      Verify loggerInfoCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_29', 'case_29');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3100
     * @tc.name      testLoggerInfo0031
     * @tc.desc      Verify loggerInfoCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_30', 'case_30');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3200
     * @tc.name      testLoggerInfo0032
     * @tc.desc      Verify loggerInfoCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_31', 'case_31');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3300
     * @tc.name      testLoggerInfo0033
     * @tc.desc      Verify loggerInfoCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_32', 'case_32');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3400
     * @tc.name      testLoggerInfo0034
     * @tc.desc      Verify loggerInfoCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_33', 'case_33');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3500
     * @tc.name      testLoggerInfo0035
     * @tc.desc      Verify loggerInfoCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_34', 'case_34');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3600
     * @tc.name      testLoggerInfo0036
     * @tc.desc      Verify loggerInfoCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_35', 'case_35');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3700
     * @tc.name      testLoggerInfo0037
     * @tc.desc      Verify loggerInfoCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_36', 'case_36');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3800
     * @tc.name      testLoggerInfo0038
     * @tc.desc      Verify loggerInfoCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_37', 'case_37');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_3900
     * @tc.name      testLoggerInfo0039
     * @tc.desc      Verify loggerInfoCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_38', 'case_38');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4000
     * @tc.name      testLoggerInfo0040
     * @tc.desc      Verify loggerInfoCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_39', 'case_39');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4100
     * @tc.name      testLoggerInfo0041
     * @tc.desc      Verify loggerInfoCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_40', 'case_40');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4200
     * @tc.name      testLoggerInfo0042
     * @tc.desc      Verify loggerInfoCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_41', 'case_41');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4300
     * @tc.name      testLoggerInfo0043
     * @tc.desc      Verify loggerInfoCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_42', 'case_42');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4400
     * @tc.name      testLoggerInfo0044
     * @tc.desc      Verify loggerInfoCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_43', 'case_43');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4500
     * @tc.name      testLoggerInfo0045
     * @tc.desc      Verify loggerInfoCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_44', 'case_44');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4600
     * @tc.name      testLoggerInfo0046
     * @tc.desc      Verify loggerInfoCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_45', 'case_45');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4700
     * @tc.name      testLoggerInfo0047
     * @tc.desc      Verify loggerInfoCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_46', 'case_46');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4800
     * @tc.name      testLoggerInfo0048
     * @tc.desc      Verify loggerInfoCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_47', 'case_47');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_4900
     * @tc.name      testLoggerInfo0049
     * @tc.desc      Verify loggerInfoCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_48', 'case_48');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5000
     * @tc.name      testLoggerInfo0050
     * @tc.desc      Verify loggerInfoCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_49', 'case_49');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5100
     * @tc.name      testLoggerInfo0051
     * @tc.desc      Verify loggerInfoCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_50', 'case_50');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5200
     * @tc.name      testLoggerInfo0052
     * @tc.desc      Verify loggerInfoCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_51', 'case_51');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5300
     * @tc.name      testLoggerInfo0053
     * @tc.desc      Verify loggerInfoCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_52', 'case_52');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5400
     * @tc.name      testLoggerInfo0054
     * @tc.desc      Verify loggerInfoCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_53', 'case_53');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5500
     * @tc.name      testLoggerInfo0055
     * @tc.desc      Verify loggerInfoCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_54', 'case_54');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5600
     * @tc.name      testLoggerInfo0056
     * @tc.desc      Verify loggerInfoCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_55', 'case_55');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5700
     * @tc.name      testLoggerInfo0057
     * @tc.desc      Verify loggerInfoCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_56', 'case_56');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5800
     * @tc.name      testLoggerInfo0058
     * @tc.desc      Verify loggerInfoCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_57', 'case_57');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_5900
     * @tc.name      testLoggerInfo0059
     * @tc.desc      Verify loggerInfoCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_58', 'case_58');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6000
     * @tc.name      testLoggerInfo0060
     * @tc.desc      Verify loggerInfoCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_59', 'case_59');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6100
     * @tc.name      testLoggerInfo0061
     * @tc.desc      Verify loggerInfoCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_60', 'case_60');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6200
     * @tc.name      testLoggerInfo0062
     * @tc.desc      Verify loggerInfoCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_61', 'case_61');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6300
     * @tc.name      testLoggerInfo0063
     * @tc.desc      Verify loggerInfoCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_62', 'case_62');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6400
     * @tc.name      testLoggerInfo0064
     * @tc.desc      Verify loggerInfoCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_63', 'case_63');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6500
     * @tc.name      testLoggerInfo0065
     * @tc.desc      Verify loggerInfoCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_64', 'case_64');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6600
     * @tc.name      testLoggerInfo0066
     * @tc.desc      Verify loggerInfoCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_65', 'case_65');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6700
     * @tc.name      testLoggerInfo0067
     * @tc.desc      Verify loggerInfoCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_66', 'case_66');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6800
     * @tc.name      testLoggerInfo0068
     * @tc.desc      Verify loggerInfoCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_67', 'case_67');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_6900
     * @tc.name      testLoggerInfo0069
     * @tc.desc      Verify loggerInfoCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_68', 'case_68');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7000
     * @tc.name      testLoggerInfo0070
     * @tc.desc      Verify loggerInfoCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_69', 'case_69');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7100
     * @tc.name      testLoggerInfo0071
     * @tc.desc      Verify loggerInfoCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_70', 'case_70');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7200
     * @tc.name      testLoggerInfo0072
     * @tc.desc      Verify loggerInfoCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_71', 'case_71');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7300
     * @tc.name      testLoggerInfo0073
     * @tc.desc      Verify loggerInfoCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_72', 'case_72');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7400
     * @tc.name      testLoggerInfo0074
     * @tc.desc      Verify loggerInfoCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_73', 'case_73');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7500
     * @tc.name      testLoggerInfo0075
     * @tc.desc      Verify loggerInfoCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_74', 'case_74');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7600
     * @tc.name      testLoggerInfo0076
     * @tc.desc      Verify loggerInfoCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_75', 'case_75');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7700
     * @tc.name      testLoggerInfo0077
     * @tc.desc      Verify loggerInfoCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_76', 'case_76');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7800
     * @tc.name      testLoggerInfo0078
     * @tc.desc      Verify loggerInfoCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_77', 'case_77');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_7900
     * @tc.name      testLoggerInfo0079
     * @tc.desc      Verify loggerInfoCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_78', 'case_78');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_8000
     * @tc.name      testLoggerInfo0080
     * @tc.desc      Verify loggerInfoCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_79', 'case_79');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_AVREC_NDK_LOG_I_8100
     * @tc.name      testLoggerInfo0081
     * @tc.desc      Verify loggerInfoCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerInfo0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.info('info_80', 'case_80');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

  });
}
