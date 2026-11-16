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

export default function flipClockTabTypeMoreTest() {
  describe('FlipClockTabTypeMoreTest', () => {

    /**
     * @tc.name   testFlipClockTabTypeMore0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0000
     * @tc.desc   Construct TabType variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0000 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(10);');
      expect(item.num).assertEqual(10);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0000 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0001
     * @tc.desc   Construct TabType variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0001 begin');
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(11);');
      expect(item.num).assertEqual(11);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0001 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0002
     * @tc.desc   Construct TabType variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0002 begin');
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(12);');
      expect(item.num).assertEqual(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0002 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0003
     * @tc.desc   Construct TabType variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0003 begin');
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(13);');
      expect(item.num).assertEqual(13);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0003 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0004
     * @tc.desc   Construct TabType variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0004 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 14);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(14);');
      expect(item.num).assertEqual(14);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0004 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0005
     * @tc.desc   Construct TabType variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0005 begin');
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(15);');
      expect(item.num).assertEqual(15);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0005 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0006
     * @tc.desc   Construct TabType variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0006 begin');
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(16);');
      expect(item.num).assertEqual(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0006 end');
    })

    /**
     * @tc.name   testFlipClockTabTypeMore0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_TAB_0007
     * @tc.desc   Construct TabType variant 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabTypeMore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0007 begin');
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 17);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.num).assertEqual(17);');
      expect(item.num).assertEqual(17);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.icon !== undefined).assertTrue();');
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(item.text !== undefined).assertTrue();');
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabTypeMore0007 end');
    })
  })
}
