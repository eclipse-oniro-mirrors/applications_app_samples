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
import { Logger } from '../../../main/ets/common/utils/Logger';

const TAG: string = '[Sample_loggerWarnCore]';
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


export default function loggerWarnCoreTest(): void {
  describe('loggerWarnCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0100
     * @tc.name      testLoggerWarn0001
     * @tc.desc      Verify loggerWarnCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_0', 'case_0');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0200
     * @tc.name      testLoggerWarn0002
     * @tc.desc      Verify loggerWarnCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_1', 'case_1');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0300
     * @tc.name      testLoggerWarn0003
     * @tc.desc      Verify loggerWarnCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_2', 'case_2');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0400
     * @tc.name      testLoggerWarn0004
     * @tc.desc      Verify loggerWarnCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_3', 'case_3');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0500
     * @tc.name      testLoggerWarn0005
     * @tc.desc      Verify loggerWarnCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_4', 'case_4');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0600
     * @tc.name      testLoggerWarn0006
     * @tc.desc      Verify loggerWarnCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_5', 'case_5');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0700
     * @tc.name      testLoggerWarn0007
     * @tc.desc      Verify loggerWarnCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_6', 'case_6');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0800
     * @tc.name      testLoggerWarn0008
     * @tc.desc      Verify loggerWarnCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_7', 'case_7');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_0900
     * @tc.name      testLoggerWarn0009
     * @tc.desc      Verify loggerWarnCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_8', 'case_8');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1000
     * @tc.name      testLoggerWarn0010
     * @tc.desc      Verify loggerWarnCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_9', 'case_9');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1100
     * @tc.name      testLoggerWarn0011
     * @tc.desc      Verify loggerWarnCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_10', 'case_10');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1200
     * @tc.name      testLoggerWarn0012
     * @tc.desc      Verify loggerWarnCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_11', 'case_11');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1300
     * @tc.name      testLoggerWarn0013
     * @tc.desc      Verify loggerWarnCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_12', 'case_12');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1400
     * @tc.name      testLoggerWarn0014
     * @tc.desc      Verify loggerWarnCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_13', 'case_13');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1500
     * @tc.name      testLoggerWarn0015
     * @tc.desc      Verify loggerWarnCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_14', 'case_14');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1600
     * @tc.name      testLoggerWarn0016
     * @tc.desc      Verify loggerWarnCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_15', 'case_15');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1700
     * @tc.name      testLoggerWarn0017
     * @tc.desc      Verify loggerWarnCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_16', 'case_16');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1800
     * @tc.name      testLoggerWarn0018
     * @tc.desc      Verify loggerWarnCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_17', 'case_17');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_1900
     * @tc.name      testLoggerWarn0019
     * @tc.desc      Verify loggerWarnCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_18', 'case_18');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2000
     * @tc.name      testLoggerWarn0020
     * @tc.desc      Verify loggerWarnCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_19', 'case_19');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2100
     * @tc.name      testLoggerWarn0021
     * @tc.desc      Verify loggerWarnCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_20', 'case_20');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2200
     * @tc.name      testLoggerWarn0022
     * @tc.desc      Verify loggerWarnCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_21', 'case_21');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2300
     * @tc.name      testLoggerWarn0023
     * @tc.desc      Verify loggerWarnCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_22', 'case_22');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2400
     * @tc.name      testLoggerWarn0024
     * @tc.desc      Verify loggerWarnCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_23', 'case_23');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2500
     * @tc.name      testLoggerWarn0025
     * @tc.desc      Verify loggerWarnCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_24', 'case_24');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2600
     * @tc.name      testLoggerWarn0026
     * @tc.desc      Verify loggerWarnCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_25', 'case_25');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2700
     * @tc.name      testLoggerWarn0027
     * @tc.desc      Verify loggerWarnCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_26', 'case_26');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2800
     * @tc.name      testLoggerWarn0028
     * @tc.desc      Verify loggerWarnCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_27', 'case_27');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_2900
     * @tc.name      testLoggerWarn0029
     * @tc.desc      Verify loggerWarnCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_28', 'case_28');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3000
     * @tc.name      testLoggerWarn0030
     * @tc.desc      Verify loggerWarnCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_29', 'case_29');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3100
     * @tc.name      testLoggerWarn0031
     * @tc.desc      Verify loggerWarnCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_30', 'case_30');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3200
     * @tc.name      testLoggerWarn0032
     * @tc.desc      Verify loggerWarnCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_31', 'case_31');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3300
     * @tc.name      testLoggerWarn0033
     * @tc.desc      Verify loggerWarnCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_32', 'case_32');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3400
     * @tc.name      testLoggerWarn0034
     * @tc.desc      Verify loggerWarnCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_33', 'case_33');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3500
     * @tc.name      testLoggerWarn0035
     * @tc.desc      Verify loggerWarnCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_34', 'case_34');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3600
     * @tc.name      testLoggerWarn0036
     * @tc.desc      Verify loggerWarnCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_35', 'case_35');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3700
     * @tc.name      testLoggerWarn0037
     * @tc.desc      Verify loggerWarnCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_36', 'case_36');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3800
     * @tc.name      testLoggerWarn0038
     * @tc.desc      Verify loggerWarnCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_37', 'case_37');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_3900
     * @tc.name      testLoggerWarn0039
     * @tc.desc      Verify loggerWarnCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_38', 'case_38');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4000
     * @tc.name      testLoggerWarn0040
     * @tc.desc      Verify loggerWarnCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_39', 'case_39');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4100
     * @tc.name      testLoggerWarn0041
     * @tc.desc      Verify loggerWarnCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_40', 'case_40');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4200
     * @tc.name      testLoggerWarn0042
     * @tc.desc      Verify loggerWarnCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_41', 'case_41');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4300
     * @tc.name      testLoggerWarn0043
     * @tc.desc      Verify loggerWarnCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_42', 'case_42');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4400
     * @tc.name      testLoggerWarn0044
     * @tc.desc      Verify loggerWarnCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_43', 'case_43');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4500
     * @tc.name      testLoggerWarn0045
     * @tc.desc      Verify loggerWarnCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_44', 'case_44');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4600
     * @tc.name      testLoggerWarn0046
     * @tc.desc      Verify loggerWarnCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_45', 'case_45');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4700
     * @tc.name      testLoggerWarn0047
     * @tc.desc      Verify loggerWarnCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_46', 'case_46');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4800
     * @tc.name      testLoggerWarn0048
     * @tc.desc      Verify loggerWarnCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_47', 'case_47');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_4900
     * @tc.name      testLoggerWarn0049
     * @tc.desc      Verify loggerWarnCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_48', 'case_48');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5000
     * @tc.name      testLoggerWarn0050
     * @tc.desc      Verify loggerWarnCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_49', 'case_49');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5100
     * @tc.name      testLoggerWarn0051
     * @tc.desc      Verify loggerWarnCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_50', 'case_50');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5200
     * @tc.name      testLoggerWarn0052
     * @tc.desc      Verify loggerWarnCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_51', 'case_51');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5300
     * @tc.name      testLoggerWarn0053
     * @tc.desc      Verify loggerWarnCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_52', 'case_52');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5400
     * @tc.name      testLoggerWarn0054
     * @tc.desc      Verify loggerWarnCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_53', 'case_53');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5500
     * @tc.name      testLoggerWarn0055
     * @tc.desc      Verify loggerWarnCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_54', 'case_54');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5600
     * @tc.name      testLoggerWarn0056
     * @tc.desc      Verify loggerWarnCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_55', 'case_55');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5700
     * @tc.name      testLoggerWarn0057
     * @tc.desc      Verify loggerWarnCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_56', 'case_56');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5800
     * @tc.name      testLoggerWarn0058
     * @tc.desc      Verify loggerWarnCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_57', 'case_57');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_5900
     * @tc.name      testLoggerWarn0059
     * @tc.desc      Verify loggerWarnCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_58', 'case_58');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6000
     * @tc.name      testLoggerWarn0060
     * @tc.desc      Verify loggerWarnCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_59', 'case_59');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6100
     * @tc.name      testLoggerWarn0061
     * @tc.desc      Verify loggerWarnCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_60', 'case_60');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6200
     * @tc.name      testLoggerWarn0062
     * @tc.desc      Verify loggerWarnCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_61', 'case_61');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6300
     * @tc.name      testLoggerWarn0063
     * @tc.desc      Verify loggerWarnCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_62', 'case_62');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6400
     * @tc.name      testLoggerWarn0064
     * @tc.desc      Verify loggerWarnCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_63', 'case_63');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6500
     * @tc.name      testLoggerWarn0065
     * @tc.desc      Verify loggerWarnCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_64', 'case_64');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6600
     * @tc.name      testLoggerWarn0066
     * @tc.desc      Verify loggerWarnCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_65', 'case_65');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6700
     * @tc.name      testLoggerWarn0067
     * @tc.desc      Verify loggerWarnCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_66', 'case_66');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6800
     * @tc.name      testLoggerWarn0068
     * @tc.desc      Verify loggerWarnCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_67', 'case_67');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_6900
     * @tc.name      testLoggerWarn0069
     * @tc.desc      Verify loggerWarnCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_68', 'case_68');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7000
     * @tc.name      testLoggerWarn0070
     * @tc.desc      Verify loggerWarnCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_69', 'case_69');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7100
     * @tc.name      testLoggerWarn0071
     * @tc.desc      Verify loggerWarnCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_70', 'case_70');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7200
     * @tc.name      testLoggerWarn0072
     * @tc.desc      Verify loggerWarnCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_71', 'case_71');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7300
     * @tc.name      testLoggerWarn0073
     * @tc.desc      Verify loggerWarnCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_72', 'case_72');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7400
     * @tc.name      testLoggerWarn0074
     * @tc.desc      Verify loggerWarnCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_73', 'case_73');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7500
     * @tc.name      testLoggerWarn0075
     * @tc.desc      Verify loggerWarnCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_74', 'case_74');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7600
     * @tc.name      testLoggerWarn0076
     * @tc.desc      Verify loggerWarnCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_75', 'case_75');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7700
     * @tc.name      testLoggerWarn0077
     * @tc.desc      Verify loggerWarnCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_76', 'case_76');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7800
     * @tc.name      testLoggerWarn0078
     * @tc.desc      Verify loggerWarnCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_77', 'case_77');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_7900
     * @tc.name      testLoggerWarn0079
     * @tc.desc      Verify loggerWarnCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_78', 'case_78');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_8000
     * @tc.name      testLoggerWarn0080
     * @tc.desc      Verify loggerWarnCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_79', 'case_79');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LOG_W_8100
     * @tc.name      testLoggerWarn0081
     * @tc.desc      Verify loggerWarnCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLoggerWarn0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        Logger.warn('warn_80', 'case_80');
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

  });
}
