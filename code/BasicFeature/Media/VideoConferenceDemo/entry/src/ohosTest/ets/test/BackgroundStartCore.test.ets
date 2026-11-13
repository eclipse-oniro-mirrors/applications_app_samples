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
import { startContinuousTask, stopContinuousTask } from '../../../main/ets/common/utils/BackgroundUtil';

const TAG: string = '[Sample_backgroundStartCore]';
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


export default function backgroundStartCoreTest(): void {
  describe('backgroundStartCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0100
     * @tc.name      testBackgroundStart0001
     * @tc.desc      Verify backgroundStartCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0200
     * @tc.name      testBackgroundStart0002
     * @tc.desc      Verify backgroundStartCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0300
     * @tc.name      testBackgroundStart0003
     * @tc.desc      Verify backgroundStartCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0400
     * @tc.name      testBackgroundStart0004
     * @tc.desc      Verify backgroundStartCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0500
     * @tc.name      testBackgroundStart0005
     * @tc.desc      Verify backgroundStartCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0600
     * @tc.name      testBackgroundStart0006
     * @tc.desc      Verify backgroundStartCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0700
     * @tc.name      testBackgroundStart0007
     * @tc.desc      Verify backgroundStartCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0800
     * @tc.name      testBackgroundStart0008
     * @tc.desc      Verify backgroundStartCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_0900
     * @tc.name      testBackgroundStart0009
     * @tc.desc      Verify backgroundStartCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1000
     * @tc.name      testBackgroundStart0010
     * @tc.desc      Verify backgroundStartCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1100
     * @tc.name      testBackgroundStart0011
     * @tc.desc      Verify backgroundStartCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1200
     * @tc.name      testBackgroundStart0012
     * @tc.desc      Verify backgroundStartCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1300
     * @tc.name      testBackgroundStart0013
     * @tc.desc      Verify backgroundStartCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1400
     * @tc.name      testBackgroundStart0014
     * @tc.desc      Verify backgroundStartCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1500
     * @tc.name      testBackgroundStart0015
     * @tc.desc      Verify backgroundStartCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1600
     * @tc.name      testBackgroundStart0016
     * @tc.desc      Verify backgroundStartCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1700
     * @tc.name      testBackgroundStart0017
     * @tc.desc      Verify backgroundStartCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1800
     * @tc.name      testBackgroundStart0018
     * @tc.desc      Verify backgroundStartCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_1900
     * @tc.name      testBackgroundStart0019
     * @tc.desc      Verify backgroundStartCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2000
     * @tc.name      testBackgroundStart0020
     * @tc.desc      Verify backgroundStartCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2100
     * @tc.name      testBackgroundStart0021
     * @tc.desc      Verify backgroundStartCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2200
     * @tc.name      testBackgroundStart0022
     * @tc.desc      Verify backgroundStartCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2300
     * @tc.name      testBackgroundStart0023
     * @tc.desc      Verify backgroundStartCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2400
     * @tc.name      testBackgroundStart0024
     * @tc.desc      Verify backgroundStartCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2500
     * @tc.name      testBackgroundStart0025
     * @tc.desc      Verify backgroundStartCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2600
     * @tc.name      testBackgroundStart0026
     * @tc.desc      Verify backgroundStartCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2700
     * @tc.name      testBackgroundStart0027
     * @tc.desc      Verify backgroundStartCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2800
     * @tc.name      testBackgroundStart0028
     * @tc.desc      Verify backgroundStartCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_2900
     * @tc.name      testBackgroundStart0029
     * @tc.desc      Verify backgroundStartCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3000
     * @tc.name      testBackgroundStart0030
     * @tc.desc      Verify backgroundStartCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3100
     * @tc.name      testBackgroundStart0031
     * @tc.desc      Verify backgroundStartCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3200
     * @tc.name      testBackgroundStart0032
     * @tc.desc      Verify backgroundStartCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3300
     * @tc.name      testBackgroundStart0033
     * @tc.desc      Verify backgroundStartCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3400
     * @tc.name      testBackgroundStart0034
     * @tc.desc      Verify backgroundStartCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3500
     * @tc.name      testBackgroundStart0035
     * @tc.desc      Verify backgroundStartCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3600
     * @tc.name      testBackgroundStart0036
     * @tc.desc      Verify backgroundStartCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3700
     * @tc.name      testBackgroundStart0037
     * @tc.desc      Verify backgroundStartCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3800
     * @tc.name      testBackgroundStart0038
     * @tc.desc      Verify backgroundStartCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_3900
     * @tc.name      testBackgroundStart0039
     * @tc.desc      Verify backgroundStartCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4000
     * @tc.name      testBackgroundStart0040
     * @tc.desc      Verify backgroundStartCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4100
     * @tc.name      testBackgroundStart0041
     * @tc.desc      Verify backgroundStartCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4200
     * @tc.name      testBackgroundStart0042
     * @tc.desc      Verify backgroundStartCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4300
     * @tc.name      testBackgroundStart0043
     * @tc.desc      Verify backgroundStartCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4400
     * @tc.name      testBackgroundStart0044
     * @tc.desc      Verify backgroundStartCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4500
     * @tc.name      testBackgroundStart0045
     * @tc.desc      Verify backgroundStartCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4600
     * @tc.name      testBackgroundStart0046
     * @tc.desc      Verify backgroundStartCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4700
     * @tc.name      testBackgroundStart0047
     * @tc.desc      Verify backgroundStartCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4800
     * @tc.name      testBackgroundStart0048
     * @tc.desc      Verify backgroundStartCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_4900
     * @tc.name      testBackgroundStart0049
     * @tc.desc      Verify backgroundStartCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5000
     * @tc.name      testBackgroundStart0050
     * @tc.desc      Verify backgroundStartCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5100
     * @tc.name      testBackgroundStart0051
     * @tc.desc      Verify backgroundStartCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5200
     * @tc.name      testBackgroundStart0052
     * @tc.desc      Verify backgroundStartCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5300
     * @tc.name      testBackgroundStart0053
     * @tc.desc      Verify backgroundStartCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5400
     * @tc.name      testBackgroundStart0054
     * @tc.desc      Verify backgroundStartCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5500
     * @tc.name      testBackgroundStart0055
     * @tc.desc      Verify backgroundStartCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5600
     * @tc.name      testBackgroundStart0056
     * @tc.desc      Verify backgroundStartCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5700
     * @tc.name      testBackgroundStart0057
     * @tc.desc      Verify backgroundStartCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5800
     * @tc.name      testBackgroundStart0058
     * @tc.desc      Verify backgroundStartCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_5900
     * @tc.name      testBackgroundStart0059
     * @tc.desc      Verify backgroundStartCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6000
     * @tc.name      testBackgroundStart0060
     * @tc.desc      Verify backgroundStartCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6100
     * @tc.name      testBackgroundStart0061
     * @tc.desc      Verify backgroundStartCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6200
     * @tc.name      testBackgroundStart0062
     * @tc.desc      Verify backgroundStartCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6300
     * @tc.name      testBackgroundStart0063
     * @tc.desc      Verify backgroundStartCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6400
     * @tc.name      testBackgroundStart0064
     * @tc.desc      Verify backgroundStartCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6500
     * @tc.name      testBackgroundStart0065
     * @tc.desc      Verify backgroundStartCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6600
     * @tc.name      testBackgroundStart0066
     * @tc.desc      Verify backgroundStartCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6700
     * @tc.name      testBackgroundStart0067
     * @tc.desc      Verify backgroundStartCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6800
     * @tc.name      testBackgroundStart0068
     * @tc.desc      Verify backgroundStartCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_6900
     * @tc.name      testBackgroundStart0069
     * @tc.desc      Verify backgroundStartCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7000
     * @tc.name      testBackgroundStart0070
     * @tc.desc      Verify backgroundStartCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7100
     * @tc.name      testBackgroundStart0071
     * @tc.desc      Verify backgroundStartCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7200
     * @tc.name      testBackgroundStart0072
     * @tc.desc      Verify backgroundStartCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7300
     * @tc.name      testBackgroundStart0073
     * @tc.desc      Verify backgroundStartCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7400
     * @tc.name      testBackgroundStart0074
     * @tc.desc      Verify backgroundStartCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7500
     * @tc.name      testBackgroundStart0075
     * @tc.desc      Verify backgroundStartCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7600
     * @tc.name      testBackgroundStart0076
     * @tc.desc      Verify backgroundStartCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7700
     * @tc.name      testBackgroundStart0077
     * @tc.desc      Verify backgroundStartCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7800
     * @tc.name      testBackgroundStart0078
     * @tc.desc      Verify backgroundStartCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_7900
     * @tc.name      testBackgroundStart0079
     * @tc.desc      Verify backgroundStartCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_8000
     * @tc.name      testBackgroundStart0080
     * @tc.desc      Verify backgroundStartCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_BG_START_8100
     * @tc.name      testBackgroundStart0081
     * @tc.desc      Verify backgroundStartCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundStart0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let failed: boolean = false;
      try {
        startContinuousTask(undefined);
      } catch (error) {
        failed = true;
      }
      expect(failed).assertFalse();
    });

  });
}
