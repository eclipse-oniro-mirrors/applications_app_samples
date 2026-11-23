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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { tabTitleOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for tabTitleOf (96 cases). */
export default function tabTitleOfTest(): void {
  describe('TabTitleOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0001
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0001
     * @tc.desc      tabTitleOf(index=0) returns "app.string.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabTitleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0001 begin`);
      const actual: string = tabTitleOf(0);
      logInfo(`tabTitleOf(index=0): actual=${actual}`);
      expect(actual).assertEqual('app.string.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabTitleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0002
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0002
     * @tc.desc      tabTitleOf(index=1) returns "app.string.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabTitleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0002 begin`);
      const actual: string = tabTitleOf(1);
      logInfo(`tabTitleOf(index=1): actual=${actual}`);
      expect(actual).assertEqual('app.string.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabTitleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0003
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0003
     * @tc.desc      tabTitleOf(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabTitleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0003 begin`);
      const actual: string = tabTitleOf(-1);
      logInfo(`tabTitleOf(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0004
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0004
     * @tc.desc      tabTitleOf(index=2) returns "app.string.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0004 begin`);
      const actual: string = tabTitleOf(2);
      logInfo(`tabTitleOf(index=2): actual=${actual}`);
      expect(actual).assertEqual('app.string.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabTitleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0005
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0005
     * @tc.desc      tabTitleOf(index=3) returns "app.string.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0005 begin`);
      const actual: string = tabTitleOf(3);
      logInfo(`tabTitleOf(index=3): actual=${actual}`);
      expect(actual).assertEqual('app.string.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabTitleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0006
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0006
     * @tc.desc      tabTitleOf(index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0006 begin`);
      const actual: string = tabTitleOf(5);
      logInfo(`tabTitleOf(index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0007
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0007
     * @tc.desc      tabTitleOf(index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0007 begin`);
      const actual: string = tabTitleOf(10);
      logInfo(`tabTitleOf(index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0008
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0008
     * @tc.desc      tabTitleOf(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0008 begin`);
      const actual: string = tabTitleOf(100);
      logInfo(`tabTitleOf(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0009
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0009
     * @tc.desc      tabTitleOf(index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0009 begin`);
      const actual: string = tabTitleOf(15);
      logInfo(`tabTitleOf(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0010
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0010
     * @tc.desc      tabTitleOf(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0010 begin`);
      const actual: string = tabTitleOf(20);
      logInfo(`tabTitleOf(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0011
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0011
     * @tc.desc      tabTitleOf(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0011 begin`);
      const actual: string = tabTitleOf(25);
      logInfo(`tabTitleOf(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0012
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0012
     * @tc.desc      tabTitleOf(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0012 begin`);
      const actual: string = tabTitleOf(30);
      logInfo(`tabTitleOf(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0013
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0013
     * @tc.desc      tabTitleOf(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0013 begin`);
      const actual: string = tabTitleOf(35);
      logInfo(`tabTitleOf(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0014
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0014
     * @tc.desc      tabTitleOf(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0014 begin`);
      const actual: string = tabTitleOf(40);
      logInfo(`tabTitleOf(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0015
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0015
     * @tc.desc      tabTitleOf(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0015 begin`);
      const actual: string = tabTitleOf(45);
      logInfo(`tabTitleOf(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0016
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0016
     * @tc.desc      tabTitleOf(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0016 begin`);
      const actual: string = tabTitleOf(50);
      logInfo(`tabTitleOf(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0017
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0017
     * @tc.desc      tabTitleOf(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0017 begin`);
      const actual: string = tabTitleOf(55);
      logInfo(`tabTitleOf(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0018
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0018
     * @tc.desc      tabTitleOf(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0018 begin`);
      const actual: string = tabTitleOf(60);
      logInfo(`tabTitleOf(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0019
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0019
     * @tc.desc      tabTitleOf(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0019 begin`);
      const actual: string = tabTitleOf(65);
      logInfo(`tabTitleOf(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0020
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0020
     * @tc.desc      tabTitleOf(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0020 begin`);
      const actual: string = tabTitleOf(70);
      logInfo(`tabTitleOf(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0021
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0021
     * @tc.desc      tabTitleOf(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0021 begin`);
      const actual: string = tabTitleOf(75);
      logInfo(`tabTitleOf(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0022
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0022
     * @tc.desc      tabTitleOf(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0022 begin`);
      const actual: string = tabTitleOf(80);
      logInfo(`tabTitleOf(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0023
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0023
     * @tc.desc      tabTitleOf(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0023 begin`);
      const actual: string = tabTitleOf(85);
      logInfo(`tabTitleOf(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0024
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0024
     * @tc.desc      tabTitleOf(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0024 begin`);
      const actual: string = tabTitleOf(90);
      logInfo(`tabTitleOf(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0025
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0025
     * @tc.desc      tabTitleOf(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0025 begin`);
      const actual: string = tabTitleOf(95);
      logInfo(`tabTitleOf(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0026
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0026
     * @tc.desc      tabTitleOf(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0026 begin`);
      const actual: string = tabTitleOf(105);
      logInfo(`tabTitleOf(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0027
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0027
     * @tc.desc      tabTitleOf(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0027 begin`);
      const actual: string = tabTitleOf(110);
      logInfo(`tabTitleOf(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0028
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0028
     * @tc.desc      tabTitleOf(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0028 begin`);
      const actual: string = tabTitleOf(115);
      logInfo(`tabTitleOf(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0029
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0029
     * @tc.desc      tabTitleOf(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0029 begin`);
      const actual: string = tabTitleOf(120);
      logInfo(`tabTitleOf(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0030
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0030
     * @tc.desc      tabTitleOf(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0030 begin`);
      const actual: string = tabTitleOf(125);
      logInfo(`tabTitleOf(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0031
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0031
     * @tc.desc      tabTitleOf(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0031 begin`);
      const actual: string = tabTitleOf(130);
      logInfo(`tabTitleOf(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0032
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0032
     * @tc.desc      tabTitleOf(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0032 begin`);
      const actual: string = tabTitleOf(135);
      logInfo(`tabTitleOf(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0033
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0033
     * @tc.desc      tabTitleOf(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0033 begin`);
      const actual: string = tabTitleOf(140);
      logInfo(`tabTitleOf(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0034
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0034
     * @tc.desc      tabTitleOf(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0034 begin`);
      const actual: string = tabTitleOf(145);
      logInfo(`tabTitleOf(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0035
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0035
     * @tc.desc      tabTitleOf(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0035 begin`);
      const actual: string = tabTitleOf(150);
      logInfo(`tabTitleOf(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0036
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0036
     * @tc.desc      tabTitleOf(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0036 begin`);
      const actual: string = tabTitleOf(155);
      logInfo(`tabTitleOf(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0037
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0037
     * @tc.desc      tabTitleOf(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0037 begin`);
      const actual: string = tabTitleOf(160);
      logInfo(`tabTitleOf(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0038
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0038
     * @tc.desc      tabTitleOf(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0038 begin`);
      const actual: string = tabTitleOf(165);
      logInfo(`tabTitleOf(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0039
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0039
     * @tc.desc      tabTitleOf(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0039 begin`);
      const actual: string = tabTitleOf(170);
      logInfo(`tabTitleOf(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0040
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0040
     * @tc.desc      tabTitleOf(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0040 begin`);
      const actual: string = tabTitleOf(175);
      logInfo(`tabTitleOf(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0041
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0041
     * @tc.desc      tabTitleOf(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0041 begin`);
      const actual: string = tabTitleOf(180);
      logInfo(`tabTitleOf(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0042
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0042
     * @tc.desc      tabTitleOf(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0042 begin`);
      const actual: string = tabTitleOf(185);
      logInfo(`tabTitleOf(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0043
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0043
     * @tc.desc      tabTitleOf(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0043 begin`);
      const actual: string = tabTitleOf(190);
      logInfo(`tabTitleOf(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0044
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0044
     * @tc.desc      tabTitleOf(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0044 begin`);
      const actual: string = tabTitleOf(195);
      logInfo(`tabTitleOf(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0045
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0045
     * @tc.desc      tabTitleOf(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0045 begin`);
      const actual: string = tabTitleOf(200);
      logInfo(`tabTitleOf(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0046
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0046
     * @tc.desc      tabTitleOf(index=132) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0046 begin`);
      const actual: string = tabTitleOf(132);
      logInfo(`tabTitleOf(index=132): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0047
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0047
     * @tc.desc      tabTitleOf(index=-38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0047 begin`);
      const actual: string = tabTitleOf(-38);
      logInfo(`tabTitleOf(index=-38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0048
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0048
     * @tc.desc      tabTitleOf(index=77.99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0048 begin`);
      const actual: string = tabTitleOf(77.99);
      logInfo(`tabTitleOf(index=77.99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0049
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0049
     * @tc.desc      tabTitleOf(index=107) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0049 begin`);
      const actual: string = tabTitleOf(107);
      logInfo(`tabTitleOf(index=107): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0050
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0050
     * @tc.desc      tabTitleOf(index=-74) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0050 begin`);
      const actual: string = tabTitleOf(-74);
      logInfo(`tabTitleOf(index=-74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0051
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0051
     * @tc.desc      tabTitleOf(index=144) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0051 begin`);
      const actual: string = tabTitleOf(144);
      logInfo(`tabTitleOf(index=144): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0052
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0052
     * @tc.desc      tabTitleOf(index=-64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0052 begin`);
      const actual: string = tabTitleOf(-64);
      logInfo(`tabTitleOf(index=-64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0053
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0053
     * @tc.desc      tabTitleOf(index=53.13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0053 begin`);
      const actual: string = tabTitleOf(53.13);
      logInfo(`tabTitleOf(index=53.13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0054
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0054
     * @tc.desc      tabTitleOf(index=-9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0054 begin`);
      const actual: string = tabTitleOf(-9);
      logInfo(`tabTitleOf(index=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0055
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0055
     * @tc.desc      tabTitleOf(index=-96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0055 begin`);
      const actual: string = tabTitleOf(-96);
      logInfo(`tabTitleOf(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0056
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0056
     * @tc.desc      tabTitleOf(index=10.33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0056 begin`);
      const actual: string = tabTitleOf(10.33);
      logInfo(`tabTitleOf(index=10.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0057
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0057
     * @tc.desc      tabTitleOf(index=96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0057 begin`);
      const actual: string = tabTitleOf(96);
      logInfo(`tabTitleOf(index=96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0058
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0058
     * @tc.desc      tabTitleOf(index=11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0058 begin`);
      const actual: string = tabTitleOf(11);
      logInfo(`tabTitleOf(index=11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0059
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0059
     * @tc.desc      tabTitleOf(index=-71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0059 begin`);
      const actual: string = tabTitleOf(-71);
      logInfo(`tabTitleOf(index=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0060
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0060
     * @tc.desc      tabTitleOf(index=109) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0060 begin`);
      const actual: string = tabTitleOf(109);
      logInfo(`tabTitleOf(index=109): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0061
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0061
     * @tc.desc      tabTitleOf(index=45.09) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0061 begin`);
      const actual: string = tabTitleOf(45.09);
      logInfo(`tabTitleOf(index=45.09): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0062
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0062
     * @tc.desc      tabTitleOf(index=43.22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0062 begin`);
      const actual: string = tabTitleOf(43.22);
      logInfo(`tabTitleOf(index=43.22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0063
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0063
     * @tc.desc      tabTitleOf(index=-5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0063 begin`);
      const actual: string = tabTitleOf(-5);
      logInfo(`tabTitleOf(index=-5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0064
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0064
     * @tc.desc      tabTitleOf(index=-31) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0064 begin`);
      const actual: string = tabTitleOf(-31);
      logInfo(`tabTitleOf(index=-31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0065
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0065
     * @tc.desc      tabTitleOf(index=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0065 begin`);
      const actual: string = tabTitleOf(-15);
      logInfo(`tabTitleOf(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0066
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0066
     * @tc.desc      tabTitleOf(index=44.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0066 begin`);
      const actual: string = tabTitleOf(44.98);
      logInfo(`tabTitleOf(index=44.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0067
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0067
     * @tc.desc      tabTitleOf(index=176) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0067 begin`);
      const actual: string = tabTitleOf(176);
      logInfo(`tabTitleOf(index=176): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0068
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0068
     * @tc.desc      tabTitleOf(index=-11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0068 begin`);
      const actual: string = tabTitleOf(-11);
      logInfo(`tabTitleOf(index=-11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0069
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0069
     * @tc.desc      tabTitleOf(index=-18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0069 begin`);
      const actual: string = tabTitleOf(-18);
      logInfo(`tabTitleOf(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0070
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0070
     * @tc.desc      tabTitleOf(index=-8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0070 begin`);
      const actual: string = tabTitleOf(-8);
      logInfo(`tabTitleOf(index=-8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0071
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0071
     * @tc.desc      tabTitleOf(index=28.99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0071 begin`);
      const actual: string = tabTitleOf(28.99);
      logInfo(`tabTitleOf(index=28.99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0072
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0072
     * @tc.desc      tabTitleOf(index=89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0072 begin`);
      const actual: string = tabTitleOf(89);
      logInfo(`tabTitleOf(index=89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0073
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0073
     * @tc.desc      tabTitleOf(index=73.17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0073 begin`);
      const actual: string = tabTitleOf(73.17);
      logInfo(`tabTitleOf(index=73.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0074
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0074
     * @tc.desc      tabTitleOf(index=81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0074 begin`);
      const actual: string = tabTitleOf(81);
      logInfo(`tabTitleOf(index=81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0075
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0075
     * @tc.desc      tabTitleOf(index=-63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0075 begin`);
      const actual: string = tabTitleOf(-63);
      logInfo(`tabTitleOf(index=-63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0076
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0076
     * @tc.desc      tabTitleOf(index=-16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0076 begin`);
      const actual: string = tabTitleOf(-16);
      logInfo(`tabTitleOf(index=-16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0077
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0077
     * @tc.desc      tabTitleOf(index=42.16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0077 begin`);
      const actual: string = tabTitleOf(42.16);
      logInfo(`tabTitleOf(index=42.16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0078
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0078
     * @tc.desc      tabTitleOf(index=171) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0078 begin`);
      const actual: string = tabTitleOf(171);
      logInfo(`tabTitleOf(index=171): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0079
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0079
     * @tc.desc      tabTitleOf(index=-39) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0079 begin`);
      const actual: string = tabTitleOf(-39);
      logInfo(`tabTitleOf(index=-39): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0080
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0080
     * @tc.desc      tabTitleOf(index=62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0080 begin`);
      const actual: string = tabTitleOf(62);
      logInfo(`tabTitleOf(index=62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0081
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0081
     * @tc.desc      tabTitleOf(index=-79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0081 begin`);
      const actual: string = tabTitleOf(-79);
      logInfo(`tabTitleOf(index=-79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0082
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0082
     * @tc.desc      tabTitleOf(index=13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0082 begin`);
      const actual: string = tabTitleOf(13);
      logInfo(`tabTitleOf(index=13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0083
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0083
     * @tc.desc      tabTitleOf(index=94.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0083 begin`);
      const actual: string = tabTitleOf(94.89);
      logInfo(`tabTitleOf(index=94.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0084
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0084
     * @tc.desc      tabTitleOf(index=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0084 begin`);
      const actual: string = tabTitleOf(-12);
      logInfo(`tabTitleOf(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0085
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0085
     * @tc.desc      tabTitleOf(index=48.18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0085 begin`);
      const actual: string = tabTitleOf(48.18);
      logInfo(`tabTitleOf(index=48.18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0086
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0086
     * @tc.desc      tabTitleOf(index=-61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0086 begin`);
      const actual: string = tabTitleOf(-61);
      logInfo(`tabTitleOf(index=-61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0087
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0087
     * @tc.desc      tabTitleOf(index=2.86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0087 begin`);
      const actual: string = tabTitleOf(2.86);
      logInfo(`tabTitleOf(index=2.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0088
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0088
     * @tc.desc      tabTitleOf(index=122) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0088 begin`);
      const actual: string = tabTitleOf(122);
      logInfo(`tabTitleOf(index=122): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0089
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0089
     * @tc.desc      tabTitleOf(index=92) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0089 begin`);
      const actual: string = tabTitleOf(92);
      logInfo(`tabTitleOf(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0090
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0090
     * @tc.desc      tabTitleOf(index=47.86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0090 begin`);
      const actual: string = tabTitleOf(47.86);
      logInfo(`tabTitleOf(index=47.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0091
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0091
     * @tc.desc      tabTitleOf(index=-19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0091 begin`);
      const actual: string = tabTitleOf(-19);
      logInfo(`tabTitleOf(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0092
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0092
     * @tc.desc      tabTitleOf(index=93) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0092 begin`);
      const actual: string = tabTitleOf(93);
      logInfo(`tabTitleOf(index=93): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0093
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0093
     * @tc.desc      tabTitleOf(index=191) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0093 begin`);
      const actual: string = tabTitleOf(191);
      logInfo(`tabTitleOf(index=191): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0094
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0094
     * @tc.desc      tabTitleOf(index=-66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0094 begin`);
      const actual: string = tabTitleOf(-66);
      logInfo(`tabTitleOf(index=-66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0095
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0095
     * @tc.desc      tabTitleOf(index=-88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0095 begin`);
      const actual: string = tabTitleOf(-88);
      logInfo(`tabTitleOf(index=-88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0096
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0096
     * @tc.desc      tabTitleOf(index=17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0096 begin`);
      const actual: string = tabTitleOf(17);
      logInfo(`tabTitleOf(index=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0096 end`);
    });
  });
}
