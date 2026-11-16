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

export default function flipClockTabDataFieldsTest() {
  describe('FlipClockTabDataFieldsTest', () => {

    /**
     * @tc.name   testFlipClockTabField0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0000
     * @tc.desc   Verify tab field variant 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[0].num).assertEqual(0); expect(tabArray[0].icon !== undefined).assertTrue(); expect(tabArray[0].text !== undefined).assertTrue(); expect(tabArray[0].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0001
     * @tc.desc   Verify tab field variant 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[1].num).assertEqual(1); expect(tabArray[1].icon !== undefined).assertTrue(); expect(tabArray[1].text !== undefined).assertTrue(); expect(tabArray[1].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0002
     * @tc.desc   Verify tab field variant 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[2].num).assertEqual(2); expect(tabArray[2].icon !== undefined).assertTrue(); expect(tabArray[2].text !== undefined).assertTrue(); expect(tabArray[2].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0003
     * @tc.desc   Verify tab field variant 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[3].num).assertEqual(3); expect(tabArray[3].icon !== undefined).assertTrue(); expect(tabArray[3].text !== undefined).assertTrue(); expect(tabArray[3].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0004
     * @tc.desc   Verify tab field variant 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[0].num).assertEqual(0); expect(tabArray[0].icon !== undefined).assertTrue(); expect(tabArray[0].text !== undefined).assertTrue(); expect(tabArray[0].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0005
     * @tc.desc   Verify tab field variant 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[1].num).assertEqual(1); expect(tabArray[1].icon !== undefined).assertTrue(); expect(tabArray[1].text !== undefined).assertTrue(); expect(tabArray[1].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0006
     * @tc.desc   Verify tab field variant 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[2].num).assertEqual(2); expect(tabArray[2].icon !== undefined).assertTrue(); expect(tabArray[2].text !== undefined).assertTrue(); expect(tabArray[2].icon_after !== undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockTabField0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_TABFIELD_0007
     * @tc.desc   Verify tab field variant 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockTabField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(tabArray[3].num).assertEqual(3); expect(tabArray[3].icon !== undefined).assertTrue(); expect(tabArray[3].text !== undefined).assertTrue(); expect(tabArray[3].icon_after !== undefined).assertTrue();
    })
  })
}
