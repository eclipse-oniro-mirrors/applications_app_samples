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
import { CommonConstants } from '@ohos/base';

export default function launcherPlusConstantsTest() {
  describe('LauncherPlusConstantsTest', () => {

    /**
     * @tc.name   testLauncherPlusConstants0001
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0001
     * @tc.desc   Check launcher constants group 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0002
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0002
     * @tc.desc   Check launcher constants group 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0003
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0003
     * @tc.desc   Check launcher constants group 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0004
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0004
     * @tc.desc   Check launcher constants group 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0005
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0005
     * @tc.desc   Check launcher constants group 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0006
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0006
     * @tc.desc   Check launcher constants group 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0007
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0007
     * @tc.desc   Check launcher constants group 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0008
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0008
     * @tc.desc   Check launcher constants group 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0009
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0009
     * @tc.desc   Check launcher constants group 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0010
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0010
     * @tc.desc   Check launcher constants group 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0011
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0011
     * @tc.desc   Check launcher constants group 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0012
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0012
     * @tc.desc   Check launcher constants group 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0013
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0013
     * @tc.desc   Check launcher constants group 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0014
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0014
     * @tc.desc   Check launcher constants group 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0015
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0015
     * @tc.desc   Check launcher constants group 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0016
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0016
     * @tc.desc   Check launcher constants group 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0017
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0017
     * @tc.desc   Check launcher constants group 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0018
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0018
     * @tc.desc   Check launcher constants group 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0019
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0019
     * @tc.desc   Check launcher constants group 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0020
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0020
     * @tc.desc   Check launcher constants group 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0021
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0021
     * @tc.desc   Check launcher constants group 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0022
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0022
     * @tc.desc   Check launcher constants group 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0023
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0023
     * @tc.desc   Check launcher constants group 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0024
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0024
     * @tc.desc   Check launcher constants group 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0025
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0025
     * @tc.desc   Check launcher constants group 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0026
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0026
     * @tc.desc   Check launcher constants group 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0027
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0027
     * @tc.desc   Check launcher constants group 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0028
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0028
     * @tc.desc   Check launcher constants group 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0029
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0029
     * @tc.desc   Check launcher constants group 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0030
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0030
     * @tc.desc   Check launcher constants group 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0031
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0031
     * @tc.desc   Check launcher constants group 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0032
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0032
     * @tc.desc   Check launcher constants group 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0033
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0033
     * @tc.desc   Check launcher constants group 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0034
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0034
     * @tc.desc   Check launcher constants group 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0035
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0035
     * @tc.desc   Check launcher constants group 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0036
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0036
     * @tc.desc   Check launcher constants group 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0037
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0037
     * @tc.desc   Check launcher constants group 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0038
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0038
     * @tc.desc   Check launcher constants group 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0039
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0039
     * @tc.desc   Check launcher constants group 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0040
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0040
     * @tc.desc   Check launcher constants group 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0041
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0041
     * @tc.desc   Check launcher constants group 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0042
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0042
     * @tc.desc   Check launcher constants group 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0043
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0043
     * @tc.desc   Check launcher constants group 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0044
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0044
     * @tc.desc   Check launcher constants group 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0045
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0045
     * @tc.desc   Check launcher constants group 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0046
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0046
     * @tc.desc   Check launcher constants group 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0047
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0047
     * @tc.desc   Check launcher constants group 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0048
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0048
     * @tc.desc   Check launcher constants group 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0049
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0049
     * @tc.desc   Check launcher constants group 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0050
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0050
     * @tc.desc   Check launcher constants group 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0051
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0051
     * @tc.desc   Check launcher constants group 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0052
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0052
     * @tc.desc   Check launcher constants group 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0053
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0053
     * @tc.desc   Check launcher constants group 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_PAGE_COUNT).assertEqual(1);
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0054
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0054
     * @tc.desc   Check launcher constants group 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_ROW_COUNT).assertEqual(6);
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0055
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0055
     * @tc.desc   Check launcher constants group 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(5);
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0056
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0056
     * @tc.desc   Check launcher constants group 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.DEFAULT_CARD_RADIUS).assertEqual(16);
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0057
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0057
     * @tc.desc   Check launcher constants group 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_1x2).assertEqual(1);
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0058
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0058
     * @tc.desc   Check launcher constants group 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x2).assertEqual(2);
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.TYPE_CARD).assertEqual(1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0059
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0059
     * @tc.desc   Check launcher constants group 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_2x4).assertEqual(3);
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_IMAGE).assertEqual(256);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusConstants0060
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_0060
     * @tc.desc   Check launcher constants group 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstants0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.CARD_DIMENSION_4x4).assertEqual(4);
      expect(CommonConstants.TYPE_APP).assertEqual(0);
      expect(CommonConstants.INVALID_VALUE).assertEqual(-1);
      expect(CommonConstants.FORM_COMPONENT_WIDTH.length).assertEqual(4);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT.length).assertEqual(4);
    })
  })
}
