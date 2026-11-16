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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TabType } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockTabTypeNumBoundaryTest() {
  describe('FlipClockTabTypeNumBoundaryTest', () => {

    /**
     * @tc.name   testFlipClockTabNumBoundary0001
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0001
     * @tc.desc   Construct TabType with boundary number -9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0001 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, -9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(-9007199254740991);');
      expect(item.num).assertEqual(-9007199254740991);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0001 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0002
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0002
     * @tc.desc   Construct TabType with boundary number -2147483648.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0002 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, -2147483648);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(-2147483648);');
      expect(item.num).assertEqual(-2147483648);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0002 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0003
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0003
     * @tc.desc   Construct TabType with boundary number -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0003 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, -1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(-1);');
      expect(item.num).assertEqual(-1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0003 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0004
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0004
     * @tc.desc   Construct TabType with boundary number 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0004 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(0);');
      expect(item.num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0004 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0005
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0005
     * @tc.desc   Construct TabType with boundary number 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0005 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(1);');
      expect(item.num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0005 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0006
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0006
     * @tc.desc   Construct TabType with boundary number 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0006 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(4);');
      expect(item.num).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0006 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0007
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0007
     * @tc.desc   Construct TabType with boundary number 2147483647.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0007 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 2147483647);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(2147483647);');
      expect(item.num).assertEqual(2147483647);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0007 end');
    })

    /**
     * @tc.name   testFlipClockTabNumBoundary0008
     * @tc.number SUB_FLIP_CLOCK_BOUND_TABNUM_0008
     * @tc.desc   Construct TabType with boundary number 9007199254740991.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabNumBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0008 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 9007199254740991);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(9007199254740991);');
      expect(item.num).assertEqual(9007199254740991);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabNumBoundary0008 end');
    })
  })
}
