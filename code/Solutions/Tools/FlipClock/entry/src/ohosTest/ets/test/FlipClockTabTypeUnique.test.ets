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

export default function flipClockTabTypeUniqueTest() {
  describe('FlipClockTabTypeUniqueTest', () => {

    /**
     * @tc.name   testFlipClockTabUnique0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0000
     * @tc.desc   Construct unique TabType 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 100);
      expect(item.num).assertEqual(100); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0001
     * @tc.desc   Construct unique TabType 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 101);
      expect(item.num).assertEqual(101); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0002
     * @tc.desc   Construct unique TabType 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 102);
      expect(item.num).assertEqual(102); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0003
     * @tc.desc   Construct unique TabType 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 103);
      expect(item.num).assertEqual(103); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0004
     * @tc.desc   Construct unique TabType 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[0].icon, tabArray[0].icon_after, tabArray[0].text, 104);
      expect(item.num).assertEqual(104); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0005
     * @tc.desc   Construct unique TabType 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[1].icon, tabArray[1].icon_after, tabArray[1].text, 105);
      expect(item.num).assertEqual(105); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0006
     * @tc.desc   Construct unique TabType 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[2].icon, tabArray[2].icon_after, tabArray[2].text, 106);
      expect(item.num).assertEqual(106); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabUnique0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_TABU_0007
     * @tc.desc   Construct unique TabType 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabUnique0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: TabType = new TabType(tabArray[3].icon, tabArray[3].icon_after, tabArray[3].text, 107);
      expect(item.num).assertEqual(107); expect(item.icon !== undefined).assertTrue(); expect(item.icon_after !== undefined).assertTrue(); expect(item.text !== undefined).assertTrue();
    })
  })
}
