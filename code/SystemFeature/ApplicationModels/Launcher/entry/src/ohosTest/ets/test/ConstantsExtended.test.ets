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
import { CommonConstants, EventConstants, GridLayoutInfoColumns } from '@ohos/base';

export default function constantsExtendedTest() {
  describe('LauncherConstantsExtendedTest', () => {

    /**
     * @tc.name   testItemTypeValues0001
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0100
     * @tc.desc   Test the grid item type constants and the invalid sentinel value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testItemTypeValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
    })

    /**
     * @tc.name   testCardDimensionValues0002
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0200
     * @tc.desc   Test the four supported card dimension identifiers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardDimensionValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
    })

    /**
     * @tc.name   testMenuAndUninstallValues0003
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0300
     * @tc.desc   Test menu type and uninstall result constants.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMenuAndUninstallValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.MENU_TYPE_DYNAMIC).assertEqual(1);
      expect(CommonConstants.UNINSTALL_SUCCESS).assertEqual(0);
      expect(CommonConstants.UNINSTALL_FORBID).assertEqual(1);
    })

    /**
     * @tc.name   testGridLayoutCounts0004
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0400
     * @tc.desc   Test the default page, row and column counts of the launcher grid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridLayoutCounts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT *
        CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
    })

    /**
     * @tc.name   testCardRadius0005
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0500
     * @tc.desc   Test the default card radius.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardRadius0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.DEFAULT_CARD_RADIUS * 2).assertEqual(32);
    })

    /**
     * @tc.name   testFormWidthTable0006
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0600
     * @tc.desc   Test the form width table derived from the 80vp card size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormWidthTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
    })

    /**
     * @tc.name   testFormHeightTable0007
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0700
     * @tc.desc   Test the form height table derived from the 80vp card size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormHeightTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
    })

    /**
     * @tc.name   testDefaultImageArea0008
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0800
     * @tc.desc   Test the default image area of a 2x2 card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDefaultImageArea0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_IMAGE_AREA.length).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
    })

    /**
     * @tc.name   testEventNames0009
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_0900
     * @tc.desc   Test the system and launcher event names.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNames0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(EventConstants.EVENT_PACKAGE_ADDED).assertEqual('usual.event.PACKAGE_ADDED');
      expect(EventConstants.EVENT_PACKAGE_REMOVED).assertEqual('usual.event.PACKAGE_REMOVED');
      expect(EventConstants.EVENT_BADGE_UPDATE).assertEqual('launcher.event.EVENT_BADGE_UPDATE');
      expect(EventConstants.EVENT_ENTER_HOME).assertEqual('launcher.event.EVENT_ENTER_HOME');
      expect(EventConstants.EVENT_ENTER_RECENTS).assertEqual('launcher.event.EVENT_ENTER_RECENTS');
      expect(EventConstants.EVENT_CLEAR_RECENTS).assertEqual('launcher.event.EVENT_CLEAR_RECENTS');
      expect(EventConstants.EVENT_ENTER_FORM_MANAGER).assertEqual('launcher.event.EVENT_ENTER_FORM_MANAGER');
    })

    /**
     * @tc.name   testGridLayoutColumnNames0010
     * @tc.number SUB_LAUNCHER_ENTRY_CONSTANTS_1000
     * @tc.desc   Test all database column names used by the launcher grid layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridLayoutColumnNames0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(GridLayoutInfoColumns.ID).assertEqual('id');
      expect(GridLayoutInfoColumns.APP_NAME).assertEqual('app_name');
      expect(GridLayoutInfoColumns.CONTAINER).assertEqual('container');
      expect(GridLayoutInfoColumns.IS_UNINSTALLABLE).assertEqual('is_uninstallAble');
      expect(GridLayoutInfoColumns.APPICON_ID).assertEqual('appIcon_id');
      expect(GridLayoutInfoColumns.TYPE_ID).assertEqual('type_id');
      expect(GridLayoutInfoColumns.CARD_ID).assertEqual('card_id');
      expect(GridLayoutInfoColumns.CARD_NAME).assertEqual('card_name');
      expect(GridLayoutInfoColumns.BUNDLE_NAME).assertEqual('bundle_name');
      expect(GridLayoutInfoColumns.MODEL_NAME).assertEqual('module_name');
      expect(GridLayoutInfoColumns.ABILITY_NAME).assertEqual('ability_name');
      expect(GridLayoutInfoColumns.BADGE_NUMBER).assertEqual('badge_number');
      expect(GridLayoutInfoColumns.AREA).assertEqual('area');
      expect(GridLayoutInfoColumns.PAGE).assertEqual('page');
      expect(GridLayoutInfoColumns.COLUMN).assertEqual('column');
      expect(GridLayoutInfoColumns.ROW).assertEqual('row');
    })

  })
}
