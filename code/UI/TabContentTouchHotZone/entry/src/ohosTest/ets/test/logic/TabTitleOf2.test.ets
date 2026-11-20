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

/** Logic checks for tabTitleOf (24 cases). */
export default function tabTitleOf2Test(): void {
  describe('TabTitleOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0097
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0097
     * @tc.desc      tabTitleOf(index=106) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0097 begin`);
      const actual: string = tabTitleOf(106);
      logInfo(`tabTitleOf(index=106): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0098
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0098
     * @tc.desc      tabTitleOf(index=4) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0098 begin`);
      const actual: string = tabTitleOf(4);
      logInfo(`tabTitleOf(index=4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0099
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0099
     * @tc.desc      tabTitleOf(index=85.18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0099 begin`);
      const actual: string = tabTitleOf(85.18);
      logInfo(`tabTitleOf(index=85.18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0100
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0100
     * @tc.desc      tabTitleOf(index=32.25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0100 begin`);
      const actual: string = tabTitleOf(32.25);
      logInfo(`tabTitleOf(index=32.25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0101
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0101
     * @tc.desc      tabTitleOf(index=103) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0101 begin`);
      const actual: string = tabTitleOf(103);
      logInfo(`tabTitleOf(index=103): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0102
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0102
     * @tc.desc      tabTitleOf(index=11.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0102 begin`);
      const actual: string = tabTitleOf(11.98);
      logInfo(`tabTitleOf(index=11.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0103
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0103
     * @tc.desc      tabTitleOf(index=-94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0103 begin`);
      const actual: string = tabTitleOf(-94);
      logInfo(`tabTitleOf(index=-94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0104
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0104
     * @tc.desc      tabTitleOf(index=126) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0104 begin`);
      const actual: string = tabTitleOf(126);
      logInfo(`tabTitleOf(index=126): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0105
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0105
     * @tc.desc      tabTitleOf(index=-22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0105 begin`);
      const actual: string = tabTitleOf(-22);
      logInfo(`tabTitleOf(index=-22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0106
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0106
     * @tc.desc      tabTitleOf(index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0106 begin`);
      const actual: string = tabTitleOf(186);
      logInfo(`tabTitleOf(index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0107
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0107
     * @tc.desc      tabTitleOf(index=8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0107 begin`);
      const actual: string = tabTitleOf(8);
      logInfo(`tabTitleOf(index=8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0108
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0108
     * @tc.desc      tabTitleOf(index=-76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0108 begin`);
      const actual: string = tabTitleOf(-76);
      logInfo(`tabTitleOf(index=-76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0109
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0109
     * @tc.desc      tabTitleOf(index=52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0109 begin`);
      const actual: string = tabTitleOf(52);
      logInfo(`tabTitleOf(index=52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0110
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0110
     * @tc.desc      tabTitleOf(index=49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0110 begin`);
      const actual: string = tabTitleOf(49);
      logInfo(`tabTitleOf(index=49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0111
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0111
     * @tc.desc      tabTitleOf(index=93.42) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0111 begin`);
      const actual: string = tabTitleOf(93.42);
      logInfo(`tabTitleOf(index=93.42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0112
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0112
     * @tc.desc      tabTitleOf(index=-49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0112 begin`);
      const actual: string = tabTitleOf(-49);
      logInfo(`tabTitleOf(index=-49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0113
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0113
     * @tc.desc      tabTitleOf(index=-83) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0113 begin`);
      const actual: string = tabTitleOf(-83);
      logInfo(`tabTitleOf(index=-83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0114
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0114
     * @tc.desc      tabTitleOf(index=164) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0114 begin`);
      const actual: string = tabTitleOf(164);
      logInfo(`tabTitleOf(index=164): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0115
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0115
     * @tc.desc      tabTitleOf(index=154) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0115 begin`);
      const actual: string = tabTitleOf(154);
      logInfo(`tabTitleOf(index=154): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0116
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0116
     * @tc.desc      tabTitleOf(index=-84) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0116 begin`);
      const actual: string = tabTitleOf(-84);
      logInfo(`tabTitleOf(index=-84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0117
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0117
     * @tc.desc      tabTitleOf(index=-85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0117 begin`);
      const actual: string = tabTitleOf(-85);
      logInfo(`tabTitleOf(index=-85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0118
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0118
     * @tc.desc      tabTitleOf(index=141) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0118 begin`);
      const actual: string = tabTitleOf(141);
      logInfo(`tabTitleOf(index=141): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0119
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0119
     * @tc.desc      tabTitleOf(index=55.94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabTitleOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0119 begin`);
      const actual: string = tabTitleOf(55.94);
      logInfo(`tabTitleOf(index=55.94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_TITLE_OF_0120
     * @tc.name      TabContentTouchHotZone_TabTitleOf_0120
     * @tc.desc      tabTitleOf(index=-45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabTitleOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabTitleOf_0120 begin`);
      const actual: string = tabTitleOf(-45);
      logInfo(`tabTitleOf(index=-45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabTitleOf_0120 end`);
    });
  });
}
