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
import { CheckEmptyUtils, CommonConstants } from '@ohos/base';

const SAMPLE_APP_NAME: string = 'SampleApp';

export default function baseLogicTest() {
  describe('LauncherBaseLogicTest', () => {

    /**
     * @tc.name   testIsEmptyWithUndefined0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0100
     * @tc.desc   Test that CheckEmptyUtils.isEmpty treats an undefined value as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyWithUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const undefinedValue: Object | undefined = undefined;
      const nullValue: Object | null = null;
      expect(CheckEmptyUtils.isEmpty(undefinedValue)).assertTrue();
      expect(CheckEmptyUtils.isEmpty(nullValue)).assertTrue();
    })

    /**
     * @tc.name   testIsEmptyWithBlank0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0200
     * @tc.desc   Test that CheckEmptyUtils.isEmpty treats an empty string as empty but a non-empty string as not empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyWithBlank0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CheckEmptyUtils.isEmpty('')).assertTrue();
      expect(CheckEmptyUtils.isEmpty(SAMPLE_APP_NAME)).assertFalse();
    })

    /**
     * @tc.name   testCheckStrIsEmpty0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0300
     * @tc.desc   Test that CheckEmptyUtils.checkStrIsEmpty treats a whitespace only string as empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckStrIsEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CheckEmptyUtils.checkStrIsEmpty('   ')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty('')).assertTrue();
      expect(CheckEmptyUtils.checkStrIsEmpty(' a ')).assertFalse();
      expect(CheckEmptyUtils.checkStrIsEmpty(SAMPLE_APP_NAME)).assertFalse();
    })

    /**
     * @tc.name   testIsEmptyArr0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0400
     * @tc.desc   Test that CheckEmptyUtils.isEmptyArr distinguishes an empty array from a non-empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyArr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const emptyArray: Array<string> = [];
      const filledArray: Array<string> = [SAMPLE_APP_NAME];
      expect(CheckEmptyUtils.isEmptyArr(emptyArray)).assertTrue();
      expect(CheckEmptyUtils.isEmptyArr(filledArray)).assertFalse();
    })

    /**
     * @tc.name   testItemTypeConstants0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0500
     * @tc.desc   Test that the grid item type and invalid value constants keep their documented values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testItemTypeConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
    })

    /**
     * @tc.name   testLayoutConstants0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0600
     * @tc.desc   Test the default page, row and column constants and the card dimension constants of the launcher grid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLayoutConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
    })

    /**
     * @tc.name   testFormComponentSizeConstants0001
     * @tc.number SUB_LAUNCHER_ENTRY_BASELOGIC_0700
     * @tc.desc   Test the form component width and height tables, which are derived from the 80vp card size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFormComponentSizeConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const widths: Array<number> = CommonConstants.FORM_COMPONENT_WIDTH;
      const heights: Array<number> = CommonConstants.FORM_COMPONENT_HEIGHT;
      expect(widths.length).assertEqual(4);
      expect(heights.length).assertEqual(4);
      expect(widths[0]).assertEqual(160);
      expect(widths[2]).assertEqual(320);
      expect(heights[0]).assertEqual(80);
      expect(heights[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
    })

  })
}
