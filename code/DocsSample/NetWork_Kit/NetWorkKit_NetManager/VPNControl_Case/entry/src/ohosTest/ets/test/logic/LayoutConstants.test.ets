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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/VPNTestSupport';
import {
  TITLE_FONT_SIZE,
  BUTTON_FONT_SIZE,
  BUTTON_MARGIN,
  LABEL_FONT_SIZE,
  INPUT_MARGIN,
  BACK_ICON_SIZE,
  TITLE_BAR_HEIGHT,
  BACK_ICON_MARGIN,
} from '../model/VPNLogic';

/** LayoutConstantsTest logic checks (44 cases). */
export default function layoutConstantsTest(): void {
  describe('LayoutConstantsTest', (): void => {
    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0001
     * @tc.name      VPN_Layout_0001
     * @tc.desc      layout constant 0 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Layout_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Layout_0001 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0001 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0002
     * @tc.name      VPN_Layout_0002
     * @tc.desc      layout constant 1 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0002 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Layout_0002 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0003
     * @tc.name      VPN_Layout_0003
     * @tc.desc      layout constant 2 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0003 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Layout_0003 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0004
     * @tc.name      VPN_Layout_0004
     * @tc.desc      layout constant 3 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0004 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0004 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0005
     * @tc.name      VPN_Layout_0005
     * @tc.desc      layout constant 4 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0005 begin`);
      logInfo("INPUT_MARGIN");
      const actual: number = INPUT_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Layout_0005 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0006
     * @tc.name      VPN_Layout_0006
     * @tc.desc      layout constant 5 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0006 begin`);
      logInfo("BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}Layout_0006 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0007
     * @tc.name      VPN_Layout_0007
     * @tc.desc      layout constant 6 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0007 begin`);
      logInfo("TITLE_BAR_HEIGHT");
      const actual: number = TITLE_BAR_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0007 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0008
     * @tc.name      VPN_Layout_0008
     * @tc.desc      layout constant 7 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0008 begin`);
      logInfo("BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}Layout_0008 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0009
     * @tc.name      VPN_Layout_0009
     * @tc.desc      layout constant 8 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0009 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Layout_0009 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0010
     * @tc.name      VPN_Layout_0010
     * @tc.desc      layout constant 9 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0010 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0010 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0011
     * @tc.name      VPN_Layout_0011
     * @tc.desc      layout constant 10 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0011 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Layout_0011 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0012
     * @tc.name      VPN_Layout_0012
     * @tc.desc      layout constant 11 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Layout_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Layout_0012 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Layout_0012 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0013
     * @tc.name      VPN_Layout_0013
     * @tc.desc      layout constant 12 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0013 begin`);
      logInfo("INPUT_MARGIN");
      const actual: number = INPUT_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0013 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0014
     * @tc.name      VPN_Layout_0014
     * @tc.desc      layout constant 13 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0014 begin`);
      logInfo("BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}Layout_0014 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0015
     * @tc.name      VPN_Layout_0015
     * @tc.desc      layout constant 14 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0015 begin`);
      logInfo("TITLE_BAR_HEIGHT");
      const actual: number = TITLE_BAR_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}Layout_0015 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0016
     * @tc.name      VPN_Layout_0016
     * @tc.desc      layout constant 15 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0016 begin`);
      logInfo("BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0016 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0017
     * @tc.name      VPN_Layout_0017
     * @tc.desc      layout constant 16 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0017 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Layout_0017 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0018
     * @tc.name      VPN_Layout_0018
     * @tc.desc      layout constant 17 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Layout_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Layout_0018 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Layout_0018 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0019
     * @tc.name      VPN_Layout_0019
     * @tc.desc      layout constant 18 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0019 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0019 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0020
     * @tc.name      VPN_Layout_0020
     * @tc.desc      layout constant 19 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0020 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Layout_0020 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0021
     * @tc.name      VPN_Layout_0021
     * @tc.desc      layout constant 20 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0021 begin`);
      logInfo("INPUT_MARGIN");
      const actual: number = INPUT_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Layout_0021 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0022
     * @tc.name      VPN_Layout_0022
     * @tc.desc      layout constant 21 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0022 begin`);
      logInfo("BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0022 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0023
     * @tc.name      VPN_Layout_0023
     * @tc.desc      layout constant 22 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Layout_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Layout_0023 begin`);
      logInfo("TITLE_BAR_HEIGHT");
      const actual: number = TITLE_BAR_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}Layout_0023 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0024
     * @tc.name      VPN_Layout_0024
     * @tc.desc      layout constant 23 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0024 begin`);
      logInfo("BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}Layout_0024 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0025
     * @tc.name      VPN_Layout_0025
     * @tc.desc      layout constant 24 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0025 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0025 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0026
     * @tc.name      VPN_Layout_0026
     * @tc.desc      layout constant 25 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0026 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Layout_0026 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0027
     * @tc.name      VPN_Layout_0027
     * @tc.desc      layout constant 26 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0027 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Layout_0027 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0028
     * @tc.name      VPN_Layout_0028
     * @tc.desc      layout constant 27 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0028 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0028 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0029
     * @tc.name      VPN_Layout_0029
     * @tc.desc      layout constant 28 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0029 begin`);
      logInfo("INPUT_MARGIN");
      const actual: number = INPUT_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}Layout_0029 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0030
     * @tc.name      VPN_Layout_0030
     * @tc.desc      layout constant 29 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0030 begin`);
      logInfo("BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}Layout_0030 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0031
     * @tc.name      VPN_Layout_0031
     * @tc.desc      layout constant 30 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0031 begin`);
      logInfo("TITLE_BAR_HEIGHT");
      const actual: number = TITLE_BAR_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0031 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0032
     * @tc.name      VPN_Layout_0032
     * @tc.desc      layout constant 31 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0032 begin`);
      logInfo("BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}Layout_0032 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0033
     * @tc.name      VPN_Layout_0033
     * @tc.desc      layout constant 32 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0033 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Layout_0033 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0034
     * @tc.name      VPN_Layout_0034
     * @tc.desc      layout constant 33 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VPN_Layout_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Layout_0034 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0034 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0035
     * @tc.name      VPN_Layout_0035
     * @tc.desc      layout constant 34 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VPN_Layout_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Layout_0035 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}Layout_0035 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0036
     * @tc.name      VPN_Layout_0036
     * @tc.desc      layout constant 35 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0036 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Layout_0036 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0037
     * @tc.name      VPN_Layout_0037
     * @tc.desc      layout constant 36 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0037 begin`);
      logInfo("INPUT_MARGIN");
      const actual: number = INPUT_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "2");
      expect(actual).assertEqual(2);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0037 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0038
     * @tc.name      VPN_Layout_0038
     * @tc.desc      layout constant 37 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0038 begin`);
      logInfo("BACK_ICON_SIZE");
      const actual: number = BACK_ICON_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "12");
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}Layout_0038 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0039
     * @tc.name      VPN_Layout_0039
     * @tc.desc      layout constant 38 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0039 begin`);
      logInfo("TITLE_BAR_HEIGHT");
      const actual: number = TITLE_BAR_HEIGHT;
      logInfo('actual=' + String(actual) + ', expected=' + "56");
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}Layout_0039 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0040
     * @tc.name      VPN_Layout_0040
     * @tc.desc      layout constant 39 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0040 begin`);
      logInfo("BACK_ICON_MARGIN");
      const actual: number = BACK_ICON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "24");
      expect(actual).assertEqual(24);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0040 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0041
     * @tc.name      VPN_Layout_0041
     * @tc.desc      layout constant 40 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0041 begin`);
      logInfo("TITLE_FONT_SIZE");
      const actual: number = TITLE_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "35");
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}Layout_0041 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0042
     * @tc.name      VPN_Layout_0042
     * @tc.desc      layout constant 41 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0042 begin`);
      logInfo("BUTTON_FONT_SIZE");
      const actual: number = BUTTON_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "25");
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}Layout_0042 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0043
     * @tc.name      VPN_Layout_0043
     * @tc.desc      layout constant 42 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0043 begin`);
      logInfo("BUTTON_MARGIN");
      const actual: number = BUTTON_MARGIN;
      logInfo('actual=' + String(actual) + ', expected=' + "16");
      expect(actual).assertEqual(16);
      logInfo('typeof actual=' + typeof actual);
      expect(typeof actual).assertEqual('number');
      logInfo(`${BUNDLE}Layout_0043 end`);
    });

    /**
     * @tc.number    SUB_VPN_CONTROL_LAYOUT_0044
     * @tc.name      VPN_Layout_0044
     * @tc.desc      layout constant 43 keeps the page contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VPN_Layout_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Layout_0044 begin`);
      logInfo("LABEL_FONT_SIZE");
      const actual: number = LABEL_FONT_SIZE;
      logInfo('actual=' + String(actual) + ', expected=' + "20");
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}Layout_0044 end`);
    });
  });
}
