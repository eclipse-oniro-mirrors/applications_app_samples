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

const TAG: string = '[Sample_constantsWindowLayoutCore]';
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


export default function constantsWindowLayoutCoreTest(): void {
  describe('constantsWindowLayoutCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0100
     * @tc.name      testConstantsWindowLayout0001
     * @tc.desc      Verify constantsWindowLayoutCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0200
     * @tc.name      testConstantsWindowLayout0002
     * @tc.desc      Verify constantsWindowLayoutCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0300
     * @tc.name      testConstantsWindowLayout0003
     * @tc.desc      Verify constantsWindowLayoutCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0400
     * @tc.name      testConstantsWindowLayout0004
     * @tc.desc      Verify constantsWindowLayoutCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0500
     * @tc.name      testConstantsWindowLayout0005
     * @tc.desc      Verify constantsWindowLayoutCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0600
     * @tc.name      testConstantsWindowLayout0006
     * @tc.desc      Verify constantsWindowLayoutCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0700
     * @tc.name      testConstantsWindowLayout0007
     * @tc.desc      Verify constantsWindowLayoutCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0800
     * @tc.name      testConstantsWindowLayout0008
     * @tc.desc      Verify constantsWindowLayoutCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_0900
     * @tc.name      testConstantsWindowLayout0009
     * @tc.desc      Verify constantsWindowLayoutCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1000
     * @tc.name      testConstantsWindowLayout0010
     * @tc.desc      Verify constantsWindowLayoutCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1100
     * @tc.name      testConstantsWindowLayout0011
     * @tc.desc      Verify constantsWindowLayoutCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1200
     * @tc.name      testConstantsWindowLayout0012
     * @tc.desc      Verify constantsWindowLayoutCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1300
     * @tc.name      testConstantsWindowLayout0013
     * @tc.desc      Verify constantsWindowLayoutCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1400
     * @tc.name      testConstantsWindowLayout0014
     * @tc.desc      Verify constantsWindowLayoutCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1500
     * @tc.name      testConstantsWindowLayout0015
     * @tc.desc      Verify constantsWindowLayoutCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1600
     * @tc.name      testConstantsWindowLayout0016
     * @tc.desc      Verify constantsWindowLayoutCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1700
     * @tc.name      testConstantsWindowLayout0017
     * @tc.desc      Verify constantsWindowLayoutCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1800
     * @tc.name      testConstantsWindowLayout0018
     * @tc.desc      Verify constantsWindowLayoutCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_1900
     * @tc.name      testConstantsWindowLayout0019
     * @tc.desc      Verify constantsWindowLayoutCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2000
     * @tc.name      testConstantsWindowLayout0020
     * @tc.desc      Verify constantsWindowLayoutCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2100
     * @tc.name      testConstantsWindowLayout0021
     * @tc.desc      Verify constantsWindowLayoutCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2200
     * @tc.name      testConstantsWindowLayout0022
     * @tc.desc      Verify constantsWindowLayoutCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2300
     * @tc.name      testConstantsWindowLayout0023
     * @tc.desc      Verify constantsWindowLayoutCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2400
     * @tc.name      testConstantsWindowLayout0024
     * @tc.desc      Verify constantsWindowLayoutCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2500
     * @tc.name      testConstantsWindowLayout0025
     * @tc.desc      Verify constantsWindowLayoutCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2600
     * @tc.name      testConstantsWindowLayout0026
     * @tc.desc      Verify constantsWindowLayoutCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2700
     * @tc.name      testConstantsWindowLayout0027
     * @tc.desc      Verify constantsWindowLayoutCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2800
     * @tc.name      testConstantsWindowLayout0028
     * @tc.desc      Verify constantsWindowLayoutCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_2900
     * @tc.name      testConstantsWindowLayout0029
     * @tc.desc      Verify constantsWindowLayoutCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3000
     * @tc.name      testConstantsWindowLayout0030
     * @tc.desc      Verify constantsWindowLayoutCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3100
     * @tc.name      testConstantsWindowLayout0031
     * @tc.desc      Verify constantsWindowLayoutCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3200
     * @tc.name      testConstantsWindowLayout0032
     * @tc.desc      Verify constantsWindowLayoutCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3300
     * @tc.name      testConstantsWindowLayout0033
     * @tc.desc      Verify constantsWindowLayoutCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3400
     * @tc.name      testConstantsWindowLayout0034
     * @tc.desc      Verify constantsWindowLayoutCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3500
     * @tc.name      testConstantsWindowLayout0035
     * @tc.desc      Verify constantsWindowLayoutCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3600
     * @tc.name      testConstantsWindowLayout0036
     * @tc.desc      Verify constantsWindowLayoutCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3700
     * @tc.name      testConstantsWindowLayout0037
     * @tc.desc      Verify constantsWindowLayoutCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3800
     * @tc.name      testConstantsWindowLayout0038
     * @tc.desc      Verify constantsWindowLayoutCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_3900
     * @tc.name      testConstantsWindowLayout0039
     * @tc.desc      Verify constantsWindowLayoutCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4000
     * @tc.name      testConstantsWindowLayout0040
     * @tc.desc      Verify constantsWindowLayoutCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4100
     * @tc.name      testConstantsWindowLayout0041
     * @tc.desc      Verify constantsWindowLayoutCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4200
     * @tc.name      testConstantsWindowLayout0042
     * @tc.desc      Verify constantsWindowLayoutCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4300
     * @tc.name      testConstantsWindowLayout0043
     * @tc.desc      Verify constantsWindowLayoutCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4400
     * @tc.name      testConstantsWindowLayout0044
     * @tc.desc      Verify constantsWindowLayoutCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4500
     * @tc.name      testConstantsWindowLayout0045
     * @tc.desc      Verify constantsWindowLayoutCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4600
     * @tc.name      testConstantsWindowLayout0046
     * @tc.desc      Verify constantsWindowLayoutCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4700
     * @tc.name      testConstantsWindowLayout0047
     * @tc.desc      Verify constantsWindowLayoutCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4800
     * @tc.name      testConstantsWindowLayout0048
     * @tc.desc      Verify constantsWindowLayoutCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_4900
     * @tc.name      testConstantsWindowLayout0049
     * @tc.desc      Verify constantsWindowLayoutCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5000
     * @tc.name      testConstantsWindowLayout0050
     * @tc.desc      Verify constantsWindowLayoutCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5100
     * @tc.name      testConstantsWindowLayout0051
     * @tc.desc      Verify constantsWindowLayoutCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5200
     * @tc.name      testConstantsWindowLayout0052
     * @tc.desc      Verify constantsWindowLayoutCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5300
     * @tc.name      testConstantsWindowLayout0053
     * @tc.desc      Verify constantsWindowLayoutCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5400
     * @tc.name      testConstantsWindowLayout0054
     * @tc.desc      Verify constantsWindowLayoutCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5500
     * @tc.name      testConstantsWindowLayout0055
     * @tc.desc      Verify constantsWindowLayoutCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5600
     * @tc.name      testConstantsWindowLayout0056
     * @tc.desc      Verify constantsWindowLayoutCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5700
     * @tc.name      testConstantsWindowLayout0057
     * @tc.desc      Verify constantsWindowLayoutCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5800
     * @tc.name      testConstantsWindowLayout0058
     * @tc.desc      Verify constantsWindowLayoutCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_5900
     * @tc.name      testConstantsWindowLayout0059
     * @tc.desc      Verify constantsWindowLayoutCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6000
     * @tc.name      testConstantsWindowLayout0060
     * @tc.desc      Verify constantsWindowLayoutCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6100
     * @tc.name      testConstantsWindowLayout0061
     * @tc.desc      Verify constantsWindowLayoutCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6200
     * @tc.name      testConstantsWindowLayout0062
     * @tc.desc      Verify constantsWindowLayoutCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6300
     * @tc.name      testConstantsWindowLayout0063
     * @tc.desc      Verify constantsWindowLayoutCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6400
     * @tc.name      testConstantsWindowLayout0064
     * @tc.desc      Verify constantsWindowLayoutCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6500
     * @tc.name      testConstantsWindowLayout0065
     * @tc.desc      Verify constantsWindowLayoutCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6600
     * @tc.name      testConstantsWindowLayout0066
     * @tc.desc      Verify constantsWindowLayoutCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6700
     * @tc.name      testConstantsWindowLayout0067
     * @tc.desc      Verify constantsWindowLayoutCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6800
     * @tc.name      testConstantsWindowLayout0068
     * @tc.desc      Verify constantsWindowLayoutCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_6900
     * @tc.name      testConstantsWindowLayout0069
     * @tc.desc      Verify constantsWindowLayoutCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7000
     * @tc.name      testConstantsWindowLayout0070
     * @tc.desc      Verify constantsWindowLayoutCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7100
     * @tc.name      testConstantsWindowLayout0071
     * @tc.desc      Verify constantsWindowLayoutCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7200
     * @tc.name      testConstantsWindowLayout0072
     * @tc.desc      Verify constantsWindowLayoutCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7300
     * @tc.name      testConstantsWindowLayout0073
     * @tc.desc      Verify constantsWindowLayoutCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7400
     * @tc.name      testConstantsWindowLayout0074
     * @tc.desc      Verify constantsWindowLayoutCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7500
     * @tc.name      testConstantsWindowLayout0075
     * @tc.desc      Verify constantsWindowLayoutCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7600
     * @tc.name      testConstantsWindowLayout0076
     * @tc.desc      Verify constantsWindowLayoutCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7700
     * @tc.name      testConstantsWindowLayout0077
     * @tc.desc      Verify constantsWindowLayoutCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7800
     * @tc.name      testConstantsWindowLayout0078
     * @tc.desc      Verify constantsWindowLayoutCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_7900
     * @tc.name      testConstantsWindowLayout0079
     * @tc.desc      Verify constantsWindowLayoutCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_8000
     * @tc.name      testConstantsWindowLayout0080
     * @tc.desc      Verify constantsWindowLayoutCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_LAYOUT_8100
     * @tc.name      testConstantsWindowLayout0081
     * @tc.desc      Verify constantsWindowLayoutCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsWindowLayout0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const area: number = Constants.SUB_WINDOW_WIDTH * Constants.SUB_WINDOW_HEIGHT;
      expect(area).assertEqual(215472);
      expect(area / Constants.SUB_WINDOW_WIDTH).assertEqual(Constants.SUB_WINDOW_HEIGHT);
      expect(Constants.SUB_WINDOW_WIDTH + Constants.SUB_WINDOW_HEIGHT).assertEqual(938);
    });

  });
}
