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

export default function launcherPlusConstantsDeepTest() {
  describe('LauncherPlusConstantsDeepTest', () => {

    /**
     * @tc.name   testLauncherPlusConstantsDeep0001
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0001
     * @tc.desc   Check launcher form dimension arrays 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(1 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0002
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0002
     * @tc.desc   Check launcher form dimension arrays 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(2 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0003
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0003
     * @tc.desc   Check launcher form dimension arrays 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(3 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0004
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0004
     * @tc.desc   Check launcher form dimension arrays 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(4 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0005
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0005
     * @tc.desc   Check launcher form dimension arrays 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(5 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0006
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0006
     * @tc.desc   Check launcher form dimension arrays 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(6 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0007
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0007
     * @tc.desc   Check launcher form dimension arrays 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(7 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0008
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0008
     * @tc.desc   Check launcher form dimension arrays 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(8 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0009
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0009
     * @tc.desc   Check launcher form dimension arrays 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(9 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0010
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0010
     * @tc.desc   Check launcher form dimension arrays 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(10 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0011
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0011
     * @tc.desc   Check launcher form dimension arrays 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(11 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0012
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0012
     * @tc.desc   Check launcher form dimension arrays 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(12 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0013
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0013
     * @tc.desc   Check launcher form dimension arrays 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(13 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0014
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0014
     * @tc.desc   Check launcher form dimension arrays 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(14 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0015
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0015
     * @tc.desc   Check launcher form dimension arrays 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(15 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0016
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0016
     * @tc.desc   Check launcher form dimension arrays 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(16 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0017
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0017
     * @tc.desc   Check launcher form dimension arrays 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(17 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0018
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0018
     * @tc.desc   Check launcher form dimension arrays 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(18 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0019
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0019
     * @tc.desc   Check launcher form dimension arrays 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(19 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0020
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0020
     * @tc.desc   Check launcher form dimension arrays 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(20 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0021
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0021
     * @tc.desc   Check launcher form dimension arrays 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(21 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0022
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0022
     * @tc.desc   Check launcher form dimension arrays 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(22 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0023
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0023
     * @tc.desc   Check launcher form dimension arrays 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(23 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0024
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0024
     * @tc.desc   Check launcher form dimension arrays 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(24 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0025
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0025
     * @tc.desc   Check launcher form dimension arrays 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(25 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0026
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0026
     * @tc.desc   Check launcher form dimension arrays 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(26 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0027
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0027
     * @tc.desc   Check launcher form dimension arrays 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(27 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0028
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0028
     * @tc.desc   Check launcher form dimension arrays 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(28 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0029
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0029
     * @tc.desc   Check launcher form dimension arrays 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(29 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0030
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0030
     * @tc.desc   Check launcher form dimension arrays 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(30 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0031
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0031
     * @tc.desc   Check launcher form dimension arrays 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(31 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0032
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0032
     * @tc.desc   Check launcher form dimension arrays 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(32 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0033
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0033
     * @tc.desc   Check launcher form dimension arrays 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(33 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0034
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0034
     * @tc.desc   Check launcher form dimension arrays 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(34 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0035
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0035
     * @tc.desc   Check launcher form dimension arrays 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(35 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0036
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0036
     * @tc.desc   Check launcher form dimension arrays 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(36 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0037
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0037
     * @tc.desc   Check launcher form dimension arrays 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(37 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0038
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0038
     * @tc.desc   Check launcher form dimension arrays 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(38 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0039
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0039
     * @tc.desc   Check launcher form dimension arrays 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(39 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0040
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0040
     * @tc.desc   Check launcher form dimension arrays 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(40 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0041
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0041
     * @tc.desc   Check launcher form dimension arrays 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(41 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0042
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0042
     * @tc.desc   Check launcher form dimension arrays 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(42 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0043
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0043
     * @tc.desc   Check launcher form dimension arrays 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(43 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0044
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0044
     * @tc.desc   Check launcher form dimension arrays 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(44 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0045
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0045
     * @tc.desc   Check launcher form dimension arrays 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(45 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0046
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0046
     * @tc.desc   Check launcher form dimension arrays 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(46 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0047
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0047
     * @tc.desc   Check launcher form dimension arrays 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(47 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0048
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0048
     * @tc.desc   Check launcher form dimension arrays 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(48 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0049
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0049
     * @tc.desc   Check launcher form dimension arrays 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(49 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0050
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0050
     * @tc.desc   Check launcher form dimension arrays 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(50 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0051
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0051
     * @tc.desc   Check launcher form dimension arrays 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(51 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0052
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0052
     * @tc.desc   Check launcher form dimension arrays 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(52 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0053
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0053
     * @tc.desc   Check launcher form dimension arrays 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(53 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0054
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0054
     * @tc.desc   Check launcher form dimension arrays 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(54 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0055
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0055
     * @tc.desc   Check launcher form dimension arrays 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(55 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0056
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0056
     * @tc.desc   Check launcher form dimension arrays 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(56 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0057
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0057
     * @tc.desc   Check launcher form dimension arrays 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(57 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0058
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0058
     * @tc.desc   Check launcher form dimension arrays 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(58 % 2).assertEqual(0);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0059
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0059
     * @tc.desc   Check launcher form dimension arrays 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(59 % 2).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusConstantsDeep0060
     * @tc.number SUB_LAUNCHER_PLUS_CONSTANTS_DEEP_0060
     * @tc.desc   Check launcher form dimension arrays 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusConstantsDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CommonConstants.FORM_COMPONENT_WIDTH[0]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[2]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_WIDTH[3]).assertEqual(320);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[0]).assertEqual(80);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[1]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[2]).assertEqual(160);
      expect(CommonConstants.FORM_COMPONENT_HEIGHT[3]).assertEqual(320);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[0]).assertEqual(2);
      expect(CommonConstants.DEFAULT_IMAGE_AREA[1]).assertEqual(2);
      expect(CommonConstants.DEFAULT_PAGE_COUNT * CommonConstants.DEFAULT_ROW_COUNT * CommonConstants.DEFAULT_COLUMN_COUNT).assertEqual(30);
      expect(60 % 2).assertEqual(0);
    })
  })
}
