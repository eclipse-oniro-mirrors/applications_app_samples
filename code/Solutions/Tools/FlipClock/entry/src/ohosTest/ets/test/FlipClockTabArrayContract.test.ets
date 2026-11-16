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
import { testTabs as tabArray } from './FlipClockTestTabs';

export default function flipClockTabArrayContractTest() {
  describe('FlipClockTabArrayContractTest', () => {

    /**
     * @tc.name   testFlipClockTabArraySize001
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_001
     * @tc.desc   Verify the tab array size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArraySize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray.length).assertEqual(4);
      expect(tabArray[0].num).assertEqual(0);
      expect(tabArray[3].num).assertEqual(3);
    })

    /**
     * @tc.name   testFlipClockTabArrayIcons002
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_002
     * @tc.desc   Verify every tab has icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayIcons002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: number = 0; i < tabArray.length; i++) { expect(tabArray[i].icon !== undefined).assertTrue(); }
      expect(tabArray[0].icon !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArraySelectedIcons003
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_003
     * @tc.desc   Verify every tab has selected icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArraySelectedIcons003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: number = 0; i < tabArray.length; i++) { expect(tabArray[i].icon_after !== undefined).assertTrue(); }
      expect(tabArray[2].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArrayTexts004
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_004
     * @tc.desc   Verify every tab has a text resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayTexts004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i: number = 0; i < tabArray.length; i++) { expect(tabArray[i].text !== undefined).assertTrue(); }
      expect(tabArray[1].text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArrayNums005
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_005
     * @tc.desc   Verify tab numeric identifiers are unique.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayNums005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nums: Set<number> = new Set<number>(); for (let i: number = 0; i < tabArray.length; i++) { nums.add(tabArray[i].num); }
      expect(nums.size).assertEqual(4); expect(nums.has(0) && nums.has(3)).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArrayFirst006
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_006
     * @tc.desc   Verify the first tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayFirst006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[0].num).assertEqual(0); expect(tabArray[0].icon !== undefined).assertTrue(); expect(tabArray[0].text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArrayLast007
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_007
     * @tc.desc   Verify the last tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[3].num).assertEqual(3); expect(tabArray[3].icon !== undefined).assertTrue(); expect(tabArray[3].text !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabArrayMiddle008
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_008
     * @tc.desc   Verify the middle tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabArrayMiddle008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[1].num).assertEqual(1); expect(tabArray[2].num).assertEqual(2); expect(tabArray[1].icon !== undefined).assertTrue();
    })
  })
}
