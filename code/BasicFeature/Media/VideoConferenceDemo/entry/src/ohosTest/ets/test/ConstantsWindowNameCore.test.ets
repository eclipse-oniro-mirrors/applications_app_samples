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

const TAG: string = '[Sample_constantsWindowNameCore]';
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


export default function constantsWindowNameCoreTest(): void {
  describe('constantsWindowNameCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0100
     * @tc.name      testConstantsWindowName0001
     * @tc.desc      Verify constantsWindowNameCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0200
     * @tc.name      testConstantsWindowName0002
     * @tc.desc      Verify constantsWindowNameCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0300
     * @tc.name      testConstantsWindowName0003
     * @tc.desc      Verify constantsWindowNameCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0400
     * @tc.name      testConstantsWindowName0004
     * @tc.desc      Verify constantsWindowNameCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0500
     * @tc.name      testConstantsWindowName0005
     * @tc.desc      Verify constantsWindowNameCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0600
     * @tc.name      testConstantsWindowName0006
     * @tc.desc      Verify constantsWindowNameCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0700
     * @tc.name      testConstantsWindowName0007
     * @tc.desc      Verify constantsWindowNameCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0800
     * @tc.name      testConstantsWindowName0008
     * @tc.desc      Verify constantsWindowNameCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_0900
     * @tc.name      testConstantsWindowName0009
     * @tc.desc      Verify constantsWindowNameCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1000
     * @tc.name      testConstantsWindowName0010
     * @tc.desc      Verify constantsWindowNameCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1100
     * @tc.name      testConstantsWindowName0011
     * @tc.desc      Verify constantsWindowNameCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1200
     * @tc.name      testConstantsWindowName0012
     * @tc.desc      Verify constantsWindowNameCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1300
     * @tc.name      testConstantsWindowName0013
     * @tc.desc      Verify constantsWindowNameCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1400
     * @tc.name      testConstantsWindowName0014
     * @tc.desc      Verify constantsWindowNameCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1500
     * @tc.name      testConstantsWindowName0015
     * @tc.desc      Verify constantsWindowNameCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1600
     * @tc.name      testConstantsWindowName0016
     * @tc.desc      Verify constantsWindowNameCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1700
     * @tc.name      testConstantsWindowName0017
     * @tc.desc      Verify constantsWindowNameCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1800
     * @tc.name      testConstantsWindowName0018
     * @tc.desc      Verify constantsWindowNameCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_1900
     * @tc.name      testConstantsWindowName0019
     * @tc.desc      Verify constantsWindowNameCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2000
     * @tc.name      testConstantsWindowName0020
     * @tc.desc      Verify constantsWindowNameCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2100
     * @tc.name      testConstantsWindowName0021
     * @tc.desc      Verify constantsWindowNameCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2200
     * @tc.name      testConstantsWindowName0022
     * @tc.desc      Verify constantsWindowNameCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2300
     * @tc.name      testConstantsWindowName0023
     * @tc.desc      Verify constantsWindowNameCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2400
     * @tc.name      testConstantsWindowName0024
     * @tc.desc      Verify constantsWindowNameCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2500
     * @tc.name      testConstantsWindowName0025
     * @tc.desc      Verify constantsWindowNameCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2600
     * @tc.name      testConstantsWindowName0026
     * @tc.desc      Verify constantsWindowNameCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2700
     * @tc.name      testConstantsWindowName0027
     * @tc.desc      Verify constantsWindowNameCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2800
     * @tc.name      testConstantsWindowName0028
     * @tc.desc      Verify constantsWindowNameCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_2900
     * @tc.name      testConstantsWindowName0029
     * @tc.desc      Verify constantsWindowNameCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3000
     * @tc.name      testConstantsWindowName0030
     * @tc.desc      Verify constantsWindowNameCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3100
     * @tc.name      testConstantsWindowName0031
     * @tc.desc      Verify constantsWindowNameCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3200
     * @tc.name      testConstantsWindowName0032
     * @tc.desc      Verify constantsWindowNameCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3300
     * @tc.name      testConstantsWindowName0033
     * @tc.desc      Verify constantsWindowNameCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3400
     * @tc.name      testConstantsWindowName0034
     * @tc.desc      Verify constantsWindowNameCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3500
     * @tc.name      testConstantsWindowName0035
     * @tc.desc      Verify constantsWindowNameCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3600
     * @tc.name      testConstantsWindowName0036
     * @tc.desc      Verify constantsWindowNameCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3700
     * @tc.name      testConstantsWindowName0037
     * @tc.desc      Verify constantsWindowNameCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3800
     * @tc.name      testConstantsWindowName0038
     * @tc.desc      Verify constantsWindowNameCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_3900
     * @tc.name      testConstantsWindowName0039
     * @tc.desc      Verify constantsWindowNameCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4000
     * @tc.name      testConstantsWindowName0040
     * @tc.desc      Verify constantsWindowNameCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4100
     * @tc.name      testConstantsWindowName0041
     * @tc.desc      Verify constantsWindowNameCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4200
     * @tc.name      testConstantsWindowName0042
     * @tc.desc      Verify constantsWindowNameCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4300
     * @tc.name      testConstantsWindowName0043
     * @tc.desc      Verify constantsWindowNameCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4400
     * @tc.name      testConstantsWindowName0044
     * @tc.desc      Verify constantsWindowNameCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4500
     * @tc.name      testConstantsWindowName0045
     * @tc.desc      Verify constantsWindowNameCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4600
     * @tc.name      testConstantsWindowName0046
     * @tc.desc      Verify constantsWindowNameCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4700
     * @tc.name      testConstantsWindowName0047
     * @tc.desc      Verify constantsWindowNameCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4800
     * @tc.name      testConstantsWindowName0048
     * @tc.desc      Verify constantsWindowNameCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_4900
     * @tc.name      testConstantsWindowName0049
     * @tc.desc      Verify constantsWindowNameCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5000
     * @tc.name      testConstantsWindowName0050
     * @tc.desc      Verify constantsWindowNameCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5100
     * @tc.name      testConstantsWindowName0051
     * @tc.desc      Verify constantsWindowNameCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5200
     * @tc.name      testConstantsWindowName0052
     * @tc.desc      Verify constantsWindowNameCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5300
     * @tc.name      testConstantsWindowName0053
     * @tc.desc      Verify constantsWindowNameCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5400
     * @tc.name      testConstantsWindowName0054
     * @tc.desc      Verify constantsWindowNameCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5500
     * @tc.name      testConstantsWindowName0055
     * @tc.desc      Verify constantsWindowNameCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5600
     * @tc.name      testConstantsWindowName0056
     * @tc.desc      Verify constantsWindowNameCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5700
     * @tc.name      testConstantsWindowName0057
     * @tc.desc      Verify constantsWindowNameCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5800
     * @tc.name      testConstantsWindowName0058
     * @tc.desc      Verify constantsWindowNameCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_5900
     * @tc.name      testConstantsWindowName0059
     * @tc.desc      Verify constantsWindowNameCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6000
     * @tc.name      testConstantsWindowName0060
     * @tc.desc      Verify constantsWindowNameCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6100
     * @tc.name      testConstantsWindowName0061
     * @tc.desc      Verify constantsWindowNameCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6200
     * @tc.name      testConstantsWindowName0062
     * @tc.desc      Verify constantsWindowNameCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6300
     * @tc.name      testConstantsWindowName0063
     * @tc.desc      Verify constantsWindowNameCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6400
     * @tc.name      testConstantsWindowName0064
     * @tc.desc      Verify constantsWindowNameCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6500
     * @tc.name      testConstantsWindowName0065
     * @tc.desc      Verify constantsWindowNameCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6600
     * @tc.name      testConstantsWindowName0066
     * @tc.desc      Verify constantsWindowNameCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6700
     * @tc.name      testConstantsWindowName0067
     * @tc.desc      Verify constantsWindowNameCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6800
     * @tc.name      testConstantsWindowName0068
     * @tc.desc      Verify constantsWindowNameCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_6900
     * @tc.name      testConstantsWindowName0069
     * @tc.desc      Verify constantsWindowNameCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7000
     * @tc.name      testConstantsWindowName0070
     * @tc.desc      Verify constantsWindowNameCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7100
     * @tc.name      testConstantsWindowName0071
     * @tc.desc      Verify constantsWindowNameCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7200
     * @tc.name      testConstantsWindowName0072
     * @tc.desc      Verify constantsWindowNameCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7300
     * @tc.name      testConstantsWindowName0073
     * @tc.desc      Verify constantsWindowNameCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7400
     * @tc.name      testConstantsWindowName0074
     * @tc.desc      Verify constantsWindowNameCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7500
     * @tc.name      testConstantsWindowName0075
     * @tc.desc      Verify constantsWindowNameCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7600
     * @tc.name      testConstantsWindowName0076
     * @tc.desc      Verify constantsWindowNameCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7700
     * @tc.name      testConstantsWindowName0077
     * @tc.desc      Verify constantsWindowNameCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7800
     * @tc.name      testConstantsWindowName0078
     * @tc.desc      Verify constantsWindowNameCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_7900
     * @tc.name      testConstantsWindowName0079
     * @tc.desc      Verify constantsWindowNameCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_8000
     * @tc.name      testConstantsWindowName0080
     * @tc.desc      Verify constantsWindowNameCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_WINNAME_8100
     * @tc.name      testConstantsWindowName0081
     * @tc.desc      Verify constantsWindowNameCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowName0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.SUB_WINDOW_NAME).assertEqual('subwindow');
      expect(Constants.SUB_WINDOW_NAME.length).assertLarger(0);
      expect(Constants.SUB_WINDOW_NAME).assertEqual(Constants.SUB_WINDOW_NAME.toLowerCase());
    });

  });
}
