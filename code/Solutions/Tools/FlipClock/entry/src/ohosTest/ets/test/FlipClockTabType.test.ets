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

export default function flipClockTabTypeTest() {
  describe('FlipClockTabTypeTest', () => {

    /**
     * @tc.name   testFlipClockTabType0000
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0000
     * @tc.desc   Construct TabType with tab resource 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0000 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(0));
      expect(item.num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0000 end');
    })

    /**
     * @tc.name   testFlipClockTabType0001
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0001
     * @tc.desc   Construct TabType with tab resource 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0001 begin');
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(1));
      expect(item.num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0001 end');
    })

    /**
     * @tc.name   testFlipClockTabType0002
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0002
     * @tc.desc   Construct TabType with tab resource 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0002 begin');
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(2));
      expect(item.num).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0002 end');
    })

    /**
     * @tc.name   testFlipClockTabType0003
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0003
     * @tc.desc   Construct TabType with tab resource 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0003 begin');
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(3));
      expect(item.num).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0003 end');
    })

    /**
     * @tc.name   testFlipClockTabType0004
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0004
     * @tc.desc   Construct TabType with tab resource 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0004 begin');
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(4));
      expect(item.num).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0004 end');
    })

    /**
     * @tc.name   testFlipClockTabType0005
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0005
     * @tc.desc   Construct TabType with tab resource 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0005 begin');
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(5));
      expect(item.num).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0005 end');
    })

    /**
     * @tc.name   testFlipClockTabType0006
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0006
     * @tc.desc   Construct TabType with tab resource 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0006 begin');
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(6));
      expect(item.num).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0006 end');
    })

    /**
     * @tc.name   testFlipClockTabType0007
     * @tc.number SUB_FLIP_CLOCK_MORE2_TABTYPE_0007
     * @tc.desc   Construct TabType with tab resource 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0007 begin');
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(item.num), String(7));
      expect(item.num).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon !== undefined));
        expect(item.icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.icon_after !== undefined));
        expect(item.icon_after !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(item.text !== undefined));
        expect(item.text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockTabType0007 end');
    })
  })
}
