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
import { TabType } from '../../../main/ets/common/DataSource';
import { testTabs as tabArray } from './FlipClockTestTabs';

export default function flipClockTabTypeFieldsMoreTest() {
  describe('FlipClockTabTypeFieldsMoreTest', () => {

    /**
     * @tc.name   testFlipClockTabFieldMore0000
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0000
     * @tc.desc   Verify TabType field variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 0); expect(item.num).assertEqual(0); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0001
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0001
     * @tc.desc   Verify TabType field variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 1); expect(item.num).assertEqual(1); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0002
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0002
     * @tc.desc   Verify TabType field variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 2); expect(item.num).assertEqual(2); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0003
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0003
     * @tc.desc   Verify TabType field variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 3); expect(item.num).assertEqual(3); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0004
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0004
     * @tc.desc   Verify TabType field variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 4); expect(item.num).assertEqual(4); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0005
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0005
     * @tc.desc   Verify TabType field variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 5); expect(item.num).assertEqual(5); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0006
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0006
     * @tc.desc   Verify TabType field variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 6); expect(item.num).assertEqual(6); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabFieldMore0007
     * @tc.number SUB_FLIP_CLOCK_MORE6_TABF_0007
     * @tc.desc   Verify TabType field variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabFieldMore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 7); expect(item.num).assertEqual(7); expect(item.icon !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })
  })
}
