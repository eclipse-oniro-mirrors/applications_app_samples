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
import Constants from '../../../main/ets/common/Constants';

const TAG: string = '[Sample_constantsWindowSizeCore]';
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


export default function constantsWindowSizeCoreTest(): void {
  describe('constantsWindowSizeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0100
     * @tc.name      testConstantsWindowSize0001
     * @tc.desc      Verify constantsWindowSizeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0200
     * @tc.name      testConstantsWindowSize0002
     * @tc.desc      Verify constantsWindowSizeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0300
     * @tc.name      testConstantsWindowSize0003
     * @tc.desc      Verify constantsWindowSizeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0400
     * @tc.name      testConstantsWindowSize0004
     * @tc.desc      Verify constantsWindowSizeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0500
     * @tc.name      testConstantsWindowSize0005
     * @tc.desc      Verify constantsWindowSizeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0600
     * @tc.name      testConstantsWindowSize0006
     * @tc.desc      Verify constantsWindowSizeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0700
     * @tc.name      testConstantsWindowSize0007
     * @tc.desc      Verify constantsWindowSizeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0800
     * @tc.name      testConstantsWindowSize0008
     * @tc.desc      Verify constantsWindowSizeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_0900
     * @tc.name      testConstantsWindowSize0009
     * @tc.desc      Verify constantsWindowSizeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1000
     * @tc.name      testConstantsWindowSize0010
     * @tc.desc      Verify constantsWindowSizeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1100
     * @tc.name      testConstantsWindowSize0011
     * @tc.desc      Verify constantsWindowSizeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1200
     * @tc.name      testConstantsWindowSize0012
     * @tc.desc      Verify constantsWindowSizeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1300
     * @tc.name      testConstantsWindowSize0013
     * @tc.desc      Verify constantsWindowSizeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1400
     * @tc.name      testConstantsWindowSize0014
     * @tc.desc      Verify constantsWindowSizeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1500
     * @tc.name      testConstantsWindowSize0015
     * @tc.desc      Verify constantsWindowSizeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1600
     * @tc.name      testConstantsWindowSize0016
     * @tc.desc      Verify constantsWindowSizeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1700
     * @tc.name      testConstantsWindowSize0017
     * @tc.desc      Verify constantsWindowSizeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1800
     * @tc.name      testConstantsWindowSize0018
     * @tc.desc      Verify constantsWindowSizeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_1900
     * @tc.name      testConstantsWindowSize0019
     * @tc.desc      Verify constantsWindowSizeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2000
     * @tc.name      testConstantsWindowSize0020
     * @tc.desc      Verify constantsWindowSizeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2100
     * @tc.name      testConstantsWindowSize0021
     * @tc.desc      Verify constantsWindowSizeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2200
     * @tc.name      testConstantsWindowSize0022
     * @tc.desc      Verify constantsWindowSizeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2300
     * @tc.name      testConstantsWindowSize0023
     * @tc.desc      Verify constantsWindowSizeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2400
     * @tc.name      testConstantsWindowSize0024
     * @tc.desc      Verify constantsWindowSizeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2500
     * @tc.name      testConstantsWindowSize0025
     * @tc.desc      Verify constantsWindowSizeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2600
     * @tc.name      testConstantsWindowSize0026
     * @tc.desc      Verify constantsWindowSizeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2700
     * @tc.name      testConstantsWindowSize0027
     * @tc.desc      Verify constantsWindowSizeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2800
     * @tc.name      testConstantsWindowSize0028
     * @tc.desc      Verify constantsWindowSizeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_2900
     * @tc.name      testConstantsWindowSize0029
     * @tc.desc      Verify constantsWindowSizeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3000
     * @tc.name      testConstantsWindowSize0030
     * @tc.desc      Verify constantsWindowSizeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3100
     * @tc.name      testConstantsWindowSize0031
     * @tc.desc      Verify constantsWindowSizeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3200
     * @tc.name      testConstantsWindowSize0032
     * @tc.desc      Verify constantsWindowSizeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3300
     * @tc.name      testConstantsWindowSize0033
     * @tc.desc      Verify constantsWindowSizeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3400
     * @tc.name      testConstantsWindowSize0034
     * @tc.desc      Verify constantsWindowSizeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3500
     * @tc.name      testConstantsWindowSize0035
     * @tc.desc      Verify constantsWindowSizeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3600
     * @tc.name      testConstantsWindowSize0036
     * @tc.desc      Verify constantsWindowSizeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3700
     * @tc.name      testConstantsWindowSize0037
     * @tc.desc      Verify constantsWindowSizeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3800
     * @tc.name      testConstantsWindowSize0038
     * @tc.desc      Verify constantsWindowSizeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_3900
     * @tc.name      testConstantsWindowSize0039
     * @tc.desc      Verify constantsWindowSizeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4000
     * @tc.name      testConstantsWindowSize0040
     * @tc.desc      Verify constantsWindowSizeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4100
     * @tc.name      testConstantsWindowSize0041
     * @tc.desc      Verify constantsWindowSizeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4200
     * @tc.name      testConstantsWindowSize0042
     * @tc.desc      Verify constantsWindowSizeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4300
     * @tc.name      testConstantsWindowSize0043
     * @tc.desc      Verify constantsWindowSizeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4400
     * @tc.name      testConstantsWindowSize0044
     * @tc.desc      Verify constantsWindowSizeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4500
     * @tc.name      testConstantsWindowSize0045
     * @tc.desc      Verify constantsWindowSizeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4600
     * @tc.name      testConstantsWindowSize0046
     * @tc.desc      Verify constantsWindowSizeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4700
     * @tc.name      testConstantsWindowSize0047
     * @tc.desc      Verify constantsWindowSizeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4800
     * @tc.name      testConstantsWindowSize0048
     * @tc.desc      Verify constantsWindowSizeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_4900
     * @tc.name      testConstantsWindowSize0049
     * @tc.desc      Verify constantsWindowSizeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5000
     * @tc.name      testConstantsWindowSize0050
     * @tc.desc      Verify constantsWindowSizeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5100
     * @tc.name      testConstantsWindowSize0051
     * @tc.desc      Verify constantsWindowSizeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5200
     * @tc.name      testConstantsWindowSize0052
     * @tc.desc      Verify constantsWindowSizeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5300
     * @tc.name      testConstantsWindowSize0053
     * @tc.desc      Verify constantsWindowSizeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5400
     * @tc.name      testConstantsWindowSize0054
     * @tc.desc      Verify constantsWindowSizeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5500
     * @tc.name      testConstantsWindowSize0055
     * @tc.desc      Verify constantsWindowSizeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5600
     * @tc.name      testConstantsWindowSize0056
     * @tc.desc      Verify constantsWindowSizeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5700
     * @tc.name      testConstantsWindowSize0057
     * @tc.desc      Verify constantsWindowSizeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5800
     * @tc.name      testConstantsWindowSize0058
     * @tc.desc      Verify constantsWindowSizeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_5900
     * @tc.name      testConstantsWindowSize0059
     * @tc.desc      Verify constantsWindowSizeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6000
     * @tc.name      testConstantsWindowSize0060
     * @tc.desc      Verify constantsWindowSizeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6100
     * @tc.name      testConstantsWindowSize0061
     * @tc.desc      Verify constantsWindowSizeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6200
     * @tc.name      testConstantsWindowSize0062
     * @tc.desc      Verify constantsWindowSizeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6300
     * @tc.name      testConstantsWindowSize0063
     * @tc.desc      Verify constantsWindowSizeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6400
     * @tc.name      testConstantsWindowSize0064
     * @tc.desc      Verify constantsWindowSizeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6500
     * @tc.name      testConstantsWindowSize0065
     * @tc.desc      Verify constantsWindowSizeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6600
     * @tc.name      testConstantsWindowSize0066
     * @tc.desc      Verify constantsWindowSizeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6700
     * @tc.name      testConstantsWindowSize0067
     * @tc.desc      Verify constantsWindowSizeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6800
     * @tc.name      testConstantsWindowSize0068
     * @tc.desc      Verify constantsWindowSizeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_6900
     * @tc.name      testConstantsWindowSize0069
     * @tc.desc      Verify constantsWindowSizeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7000
     * @tc.name      testConstantsWindowSize0070
     * @tc.desc      Verify constantsWindowSizeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7100
     * @tc.name      testConstantsWindowSize0071
     * @tc.desc      Verify constantsWindowSizeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7200
     * @tc.name      testConstantsWindowSize0072
     * @tc.desc      Verify constantsWindowSizeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7300
     * @tc.name      testConstantsWindowSize0073
     * @tc.desc      Verify constantsWindowSizeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7400
     * @tc.name      testConstantsWindowSize0074
     * @tc.desc      Verify constantsWindowSizeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7500
     * @tc.name      testConstantsWindowSize0075
     * @tc.desc      Verify constantsWindowSizeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7600
     * @tc.name      testConstantsWindowSize0076
     * @tc.desc      Verify constantsWindowSizeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7700
     * @tc.name      testConstantsWindowSize0077
     * @tc.desc      Verify constantsWindowSizeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7800
     * @tc.name      testConstantsWindowSize0078
     * @tc.desc      Verify constantsWindowSizeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_7900
     * @tc.name      testConstantsWindowSize0079
     * @tc.desc      Verify constantsWindowSizeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_8000
     * @tc.name      testConstantsWindowSize0080
     * @tc.desc      Verify constantsWindowSizeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINSIZE_8100
     * @tc.name      testConstantsWindowSize0081
     * @tc.desc      Verify constantsWindowSizeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowSize0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_WIDTH).assertEqual(402);
      expect(Constants.SUB_WINDOW_HEIGHT).assertEqual(536);
      expect(Constants.SUB_WINDOW_WIDTH).assertLess(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH > 0).assertTrue();
    });

  });
}
