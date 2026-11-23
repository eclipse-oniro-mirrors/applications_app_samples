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
import { tabImageOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for tabImageOf (96 cases). */
export default function tabImageOf2Test(): void {
  describe('TabImageOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0097
     * @tc.name      TabContentTouchHotZone_TabImageOf_0097
     * @tc.desc      tabImageOf(index=2, selectedIndex=5) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0097 begin`);
      const actual: string = tabImageOf(2, 5);
      logInfo(`tabImageOf(index=2, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0098
     * @tc.name      TabContentTouchHotZone_TabImageOf_0098
     * @tc.desc      tabImageOf(index=2, selectedIndex=10) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0098 begin`);
      const actual: string = tabImageOf(2, 10);
      logInfo(`tabImageOf(index=2, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0099
     * @tc.name      TabContentTouchHotZone_TabImageOf_0099
     * @tc.desc      tabImageOf(index=2, selectedIndex=3) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0099 begin`);
      const actual: string = tabImageOf(2, 3);
      logInfo(`tabImageOf(index=2, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0100
     * @tc.name      TabContentTouchHotZone_TabImageOf_0100
     * @tc.desc      tabImageOf(index=2, selectedIndex=100) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0100 begin`);
      const actual: string = tabImageOf(2, 100);
      logInfo(`tabImageOf(index=2, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0101
     * @tc.name      TabContentTouchHotZone_TabImageOf_0101
     * @tc.desc      tabImageOf(index=2, selectedIndex=15) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0101 begin`);
      const actual: string = tabImageOf(2, 15);
      logInfo(`tabImageOf(index=2, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0102
     * @tc.name      TabContentTouchHotZone_TabImageOf_0102
     * @tc.desc      tabImageOf(index=2, selectedIndex=20) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0102 begin`);
      const actual: string = tabImageOf(2, 20);
      logInfo(`tabImageOf(index=2, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0103
     * @tc.name      TabContentTouchHotZone_TabImageOf_0103
     * @tc.desc      tabImageOf(index=2, selectedIndex=25) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0103 begin`);
      const actual: string = tabImageOf(2, 25);
      logInfo(`tabImageOf(index=2, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0104
     * @tc.name      TabContentTouchHotZone_TabImageOf_0104
     * @tc.desc      tabImageOf(index=2, selectedIndex=30) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0104 begin`);
      const actual: string = tabImageOf(2, 30);
      logInfo(`tabImageOf(index=2, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0105
     * @tc.name      TabContentTouchHotZone_TabImageOf_0105
     * @tc.desc      tabImageOf(index=2, selectedIndex=35) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0105 begin`);
      const actual: string = tabImageOf(2, 35);
      logInfo(`tabImageOf(index=2, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0106
     * @tc.name      TabContentTouchHotZone_TabImageOf_0106
     * @tc.desc      tabImageOf(index=2, selectedIndex=40) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0106 begin`);
      const actual: string = tabImageOf(2, 40);
      logInfo(`tabImageOf(index=2, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0107
     * @tc.name      TabContentTouchHotZone_TabImageOf_0107
     * @tc.desc      tabImageOf(index=2, selectedIndex=45) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0107 begin`);
      const actual: string = tabImageOf(2, 45);
      logInfo(`tabImageOf(index=2, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0108
     * @tc.name      TabContentTouchHotZone_TabImageOf_0108
     * @tc.desc      tabImageOf(index=2, selectedIndex=50) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0108 begin`);
      const actual: string = tabImageOf(2, 50);
      logInfo(`tabImageOf(index=2, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0109
     * @tc.name      TabContentTouchHotZone_TabImageOf_0109
     * @tc.desc      tabImageOf(index=2, selectedIndex=55) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0109 begin`);
      const actual: string = tabImageOf(2, 55);
      logInfo(`tabImageOf(index=2, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0110
     * @tc.name      TabContentTouchHotZone_TabImageOf_0110
     * @tc.desc      tabImageOf(index=2, selectedIndex=60) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0110 begin`);
      const actual: string = tabImageOf(2, 60);
      logInfo(`tabImageOf(index=2, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0111
     * @tc.name      TabContentTouchHotZone_TabImageOf_0111
     * @tc.desc      tabImageOf(index=2, selectedIndex=65) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0111 begin`);
      const actual: string = tabImageOf(2, 65);
      logInfo(`tabImageOf(index=2, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0112
     * @tc.name      TabContentTouchHotZone_TabImageOf_0112
     * @tc.desc      tabImageOf(index=2, selectedIndex=70) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0112 begin`);
      const actual: string = tabImageOf(2, 70);
      logInfo(`tabImageOf(index=2, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0113
     * @tc.name      TabContentTouchHotZone_TabImageOf_0113
     * @tc.desc      tabImageOf(index=2, selectedIndex=75) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0113 begin`);
      const actual: string = tabImageOf(2, 75);
      logInfo(`tabImageOf(index=2, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0114
     * @tc.name      TabContentTouchHotZone_TabImageOf_0114
     * @tc.desc      tabImageOf(index=2, selectedIndex=80) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0114 begin`);
      const actual: string = tabImageOf(2, 80);
      logInfo(`tabImageOf(index=2, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0115
     * @tc.name      TabContentTouchHotZone_TabImageOf_0115
     * @tc.desc      tabImageOf(index=2, selectedIndex=85) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0115 begin`);
      const actual: string = tabImageOf(2, 85);
      logInfo(`tabImageOf(index=2, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0116
     * @tc.name      TabContentTouchHotZone_TabImageOf_0116
     * @tc.desc      tabImageOf(index=2, selectedIndex=90) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0116 begin`);
      const actual: string = tabImageOf(2, 90);
      logInfo(`tabImageOf(index=2, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0117
     * @tc.name      TabContentTouchHotZone_TabImageOf_0117
     * @tc.desc      tabImageOf(index=2, selectedIndex=95) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0117 begin`);
      const actual: string = tabImageOf(2, 95);
      logInfo(`tabImageOf(index=2, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0118
     * @tc.name      TabContentTouchHotZone_TabImageOf_0118
     * @tc.desc      tabImageOf(index=2, selectedIndex=105) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0118 begin`);
      const actual: string = tabImageOf(2, 105);
      logInfo(`tabImageOf(index=2, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0119
     * @tc.name      TabContentTouchHotZone_TabImageOf_0119
     * @tc.desc      tabImageOf(index=2, selectedIndex=110) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0119 begin`);
      const actual: string = tabImageOf(2, 110);
      logInfo(`tabImageOf(index=2, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0120
     * @tc.name      TabContentTouchHotZone_TabImageOf_0120
     * @tc.desc      tabImageOf(index=2, selectedIndex=-48) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0120 begin`);
      const actual: string = tabImageOf(2, -48);
      logInfo(`tabImageOf(index=2, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0121
     * @tc.name      TabContentTouchHotZone_TabImageOf_0121
     * @tc.desc      tabImageOf(index=2, selectedIndex=97) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0121 begin`);
      const actual: string = tabImageOf(2, 97);
      logInfo(`tabImageOf(index=2, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0122
     * @tc.name      TabContentTouchHotZone_TabImageOf_0122
     * @tc.desc      tabImageOf(index=2, selectedIndex=121) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0122 begin`);
      const actual: string = tabImageOf(2, 121);
      logInfo(`tabImageOf(index=2, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0123
     * @tc.name      TabContentTouchHotZone_TabImageOf_0123
     * @tc.desc      tabImageOf(index=5, selectedIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0123 begin`);
      const actual: string = tabImageOf(5, 0);
      logInfo(`tabImageOf(index=5, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0124
     * @tc.name      TabContentTouchHotZone_TabImageOf_0124
     * @tc.desc      tabImageOf(index=5, selectedIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0124 begin`);
      const actual: string = tabImageOf(5, 1);
      logInfo(`tabImageOf(index=5, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0125
     * @tc.name      TabContentTouchHotZone_TabImageOf_0125
     * @tc.desc      tabImageOf(index=5, selectedIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0125 begin`);
      const actual: string = tabImageOf(5, -1);
      logInfo(`tabImageOf(index=5, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0126
     * @tc.name      TabContentTouchHotZone_TabImageOf_0126
     * @tc.desc      tabImageOf(index=5, selectedIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0126 begin`);
      const actual: string = tabImageOf(5, 2);
      logInfo(`tabImageOf(index=5, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0127
     * @tc.name      TabContentTouchHotZone_TabImageOf_0127
     * @tc.desc      tabImageOf(index=5, selectedIndex=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0127 begin`);
      const actual: string = tabImageOf(5, 5);
      logInfo(`tabImageOf(index=5, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0128
     * @tc.name      TabContentTouchHotZone_TabImageOf_0128
     * @tc.desc      tabImageOf(index=5, selectedIndex=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0128 begin`);
      const actual: string = tabImageOf(5, 10);
      logInfo(`tabImageOf(index=5, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0129
     * @tc.name      TabContentTouchHotZone_TabImageOf_0129
     * @tc.desc      tabImageOf(index=5, selectedIndex=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0129 begin`);
      const actual: string = tabImageOf(5, 3);
      logInfo(`tabImageOf(index=5, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0130
     * @tc.name      TabContentTouchHotZone_TabImageOf_0130
     * @tc.desc      tabImageOf(index=5, selectedIndex=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0130 begin`);
      const actual: string = tabImageOf(5, 100);
      logInfo(`tabImageOf(index=5, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0131
     * @tc.name      TabContentTouchHotZone_TabImageOf_0131
     * @tc.desc      tabImageOf(index=5, selectedIndex=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0131 begin`);
      const actual: string = tabImageOf(5, 15);
      logInfo(`tabImageOf(index=5, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0132
     * @tc.name      TabContentTouchHotZone_TabImageOf_0132
     * @tc.desc      tabImageOf(index=5, selectedIndex=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0132 begin`);
      const actual: string = tabImageOf(5, 20);
      logInfo(`tabImageOf(index=5, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0133
     * @tc.name      TabContentTouchHotZone_TabImageOf_0133
     * @tc.desc      tabImageOf(index=5, selectedIndex=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0133 begin`);
      const actual: string = tabImageOf(5, 25);
      logInfo(`tabImageOf(index=5, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0134
     * @tc.name      TabContentTouchHotZone_TabImageOf_0134
     * @tc.desc      tabImageOf(index=5, selectedIndex=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0134 begin`);
      const actual: string = tabImageOf(5, 30);
      logInfo(`tabImageOf(index=5, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0135
     * @tc.name      TabContentTouchHotZone_TabImageOf_0135
     * @tc.desc      tabImageOf(index=5, selectedIndex=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0135 begin`);
      const actual: string = tabImageOf(5, 35);
      logInfo(`tabImageOf(index=5, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0136
     * @tc.name      TabContentTouchHotZone_TabImageOf_0136
     * @tc.desc      tabImageOf(index=5, selectedIndex=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0136 begin`);
      const actual: string = tabImageOf(5, 40);
      logInfo(`tabImageOf(index=5, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0137
     * @tc.name      TabContentTouchHotZone_TabImageOf_0137
     * @tc.desc      tabImageOf(index=5, selectedIndex=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0137 begin`);
      const actual: string = tabImageOf(5, 45);
      logInfo(`tabImageOf(index=5, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0138
     * @tc.name      TabContentTouchHotZone_TabImageOf_0138
     * @tc.desc      tabImageOf(index=5, selectedIndex=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0138 begin`);
      const actual: string = tabImageOf(5, 50);
      logInfo(`tabImageOf(index=5, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0139
     * @tc.name      TabContentTouchHotZone_TabImageOf_0139
     * @tc.desc      tabImageOf(index=5, selectedIndex=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0139 begin`);
      const actual: string = tabImageOf(5, 55);
      logInfo(`tabImageOf(index=5, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0140
     * @tc.name      TabContentTouchHotZone_TabImageOf_0140
     * @tc.desc      tabImageOf(index=5, selectedIndex=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0140 begin`);
      const actual: string = tabImageOf(5, 60);
      logInfo(`tabImageOf(index=5, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0141
     * @tc.name      TabContentTouchHotZone_TabImageOf_0141
     * @tc.desc      tabImageOf(index=5, selectedIndex=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0141 begin`);
      const actual: string = tabImageOf(5, 65);
      logInfo(`tabImageOf(index=5, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0142
     * @tc.name      TabContentTouchHotZone_TabImageOf_0142
     * @tc.desc      tabImageOf(index=5, selectedIndex=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0142 begin`);
      const actual: string = tabImageOf(5, 70);
      logInfo(`tabImageOf(index=5, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0143
     * @tc.name      TabContentTouchHotZone_TabImageOf_0143
     * @tc.desc      tabImageOf(index=5, selectedIndex=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0143 begin`);
      const actual: string = tabImageOf(5, 75);
      logInfo(`tabImageOf(index=5, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0144
     * @tc.name      TabContentTouchHotZone_TabImageOf_0144
     * @tc.desc      tabImageOf(index=5, selectedIndex=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0144 begin`);
      const actual: string = tabImageOf(5, 80);
      logInfo(`tabImageOf(index=5, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0145
     * @tc.name      TabContentTouchHotZone_TabImageOf_0145
     * @tc.desc      tabImageOf(index=5, selectedIndex=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0145 begin`);
      const actual: string = tabImageOf(5, 85);
      logInfo(`tabImageOf(index=5, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0146
     * @tc.name      TabContentTouchHotZone_TabImageOf_0146
     * @tc.desc      tabImageOf(index=5, selectedIndex=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0146 begin`);
      const actual: string = tabImageOf(5, 90);
      logInfo(`tabImageOf(index=5, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0147
     * @tc.name      TabContentTouchHotZone_TabImageOf_0147
     * @tc.desc      tabImageOf(index=5, selectedIndex=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0147 begin`);
      const actual: string = tabImageOf(5, 95);
      logInfo(`tabImageOf(index=5, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0148
     * @tc.name      TabContentTouchHotZone_TabImageOf_0148
     * @tc.desc      tabImageOf(index=5, selectedIndex=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0148 begin`);
      const actual: string = tabImageOf(5, 105);
      logInfo(`tabImageOf(index=5, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0149
     * @tc.name      TabContentTouchHotZone_TabImageOf_0149
     * @tc.desc      tabImageOf(index=5, selectedIndex=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0149 begin`);
      const actual: string = tabImageOf(5, 110);
      logInfo(`tabImageOf(index=5, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0150
     * @tc.name      TabContentTouchHotZone_TabImageOf_0150
     * @tc.desc      tabImageOf(index=5, selectedIndex=-48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0150 begin`);
      const actual: string = tabImageOf(5, -48);
      logInfo(`tabImageOf(index=5, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0151
     * @tc.name      TabContentTouchHotZone_TabImageOf_0151
     * @tc.desc      tabImageOf(index=5, selectedIndex=97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0151 begin`);
      const actual: string = tabImageOf(5, 97);
      logInfo(`tabImageOf(index=5, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0152
     * @tc.name      TabContentTouchHotZone_TabImageOf_0152
     * @tc.desc      tabImageOf(index=5, selectedIndex=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0152 begin`);
      const actual: string = tabImageOf(5, 121);
      logInfo(`tabImageOf(index=5, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0153
     * @tc.name      TabContentTouchHotZone_TabImageOf_0153
     * @tc.desc      tabImageOf(index=10, selectedIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0153 begin`);
      const actual: string = tabImageOf(10, 0);
      logInfo(`tabImageOf(index=10, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0154
     * @tc.name      TabContentTouchHotZone_TabImageOf_0154
     * @tc.desc      tabImageOf(index=10, selectedIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0154 begin`);
      const actual: string = tabImageOf(10, 1);
      logInfo(`tabImageOf(index=10, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0155
     * @tc.name      TabContentTouchHotZone_TabImageOf_0155
     * @tc.desc      tabImageOf(index=10, selectedIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0155 begin`);
      const actual: string = tabImageOf(10, -1);
      logInfo(`tabImageOf(index=10, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0156
     * @tc.name      TabContentTouchHotZone_TabImageOf_0156
     * @tc.desc      tabImageOf(index=10, selectedIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0156 begin`);
      const actual: string = tabImageOf(10, 2);
      logInfo(`tabImageOf(index=10, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0157
     * @tc.name      TabContentTouchHotZone_TabImageOf_0157
     * @tc.desc      tabImageOf(index=10, selectedIndex=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0157 begin`);
      const actual: string = tabImageOf(10, 5);
      logInfo(`tabImageOf(index=10, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0158
     * @tc.name      TabContentTouchHotZone_TabImageOf_0158
     * @tc.desc      tabImageOf(index=10, selectedIndex=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0158 begin`);
      const actual: string = tabImageOf(10, 10);
      logInfo(`tabImageOf(index=10, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0159
     * @tc.name      TabContentTouchHotZone_TabImageOf_0159
     * @tc.desc      tabImageOf(index=10, selectedIndex=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0159 begin`);
      const actual: string = tabImageOf(10, 3);
      logInfo(`tabImageOf(index=10, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0160
     * @tc.name      TabContentTouchHotZone_TabImageOf_0160
     * @tc.desc      tabImageOf(index=10, selectedIndex=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0160 begin`);
      const actual: string = tabImageOf(10, 100);
      logInfo(`tabImageOf(index=10, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0161
     * @tc.name      TabContentTouchHotZone_TabImageOf_0161
     * @tc.desc      tabImageOf(index=10, selectedIndex=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0161 begin`);
      const actual: string = tabImageOf(10, 15);
      logInfo(`tabImageOf(index=10, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0162
     * @tc.name      TabContentTouchHotZone_TabImageOf_0162
     * @tc.desc      tabImageOf(index=10, selectedIndex=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0162 begin`);
      const actual: string = tabImageOf(10, 20);
      logInfo(`tabImageOf(index=10, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0163
     * @tc.name      TabContentTouchHotZone_TabImageOf_0163
     * @tc.desc      tabImageOf(index=10, selectedIndex=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0163 begin`);
      const actual: string = tabImageOf(10, 25);
      logInfo(`tabImageOf(index=10, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0164
     * @tc.name      TabContentTouchHotZone_TabImageOf_0164
     * @tc.desc      tabImageOf(index=10, selectedIndex=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0164 begin`);
      const actual: string = tabImageOf(10, 30);
      logInfo(`tabImageOf(index=10, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0165
     * @tc.name      TabContentTouchHotZone_TabImageOf_0165
     * @tc.desc      tabImageOf(index=10, selectedIndex=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0165 begin`);
      const actual: string = tabImageOf(10, 35);
      logInfo(`tabImageOf(index=10, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0166
     * @tc.name      TabContentTouchHotZone_TabImageOf_0166
     * @tc.desc      tabImageOf(index=10, selectedIndex=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0166 begin`);
      const actual: string = tabImageOf(10, 40);
      logInfo(`tabImageOf(index=10, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0167
     * @tc.name      TabContentTouchHotZone_TabImageOf_0167
     * @tc.desc      tabImageOf(index=10, selectedIndex=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0167 begin`);
      const actual: string = tabImageOf(10, 45);
      logInfo(`tabImageOf(index=10, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0168
     * @tc.name      TabContentTouchHotZone_TabImageOf_0168
     * @tc.desc      tabImageOf(index=10, selectedIndex=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0168 begin`);
      const actual: string = tabImageOf(10, 50);
      logInfo(`tabImageOf(index=10, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0169
     * @tc.name      TabContentTouchHotZone_TabImageOf_0169
     * @tc.desc      tabImageOf(index=10, selectedIndex=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0169 begin`);
      const actual: string = tabImageOf(10, 55);
      logInfo(`tabImageOf(index=10, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0170
     * @tc.name      TabContentTouchHotZone_TabImageOf_0170
     * @tc.desc      tabImageOf(index=10, selectedIndex=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0170 begin`);
      const actual: string = tabImageOf(10, 60);
      logInfo(`tabImageOf(index=10, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0171
     * @tc.name      TabContentTouchHotZone_TabImageOf_0171
     * @tc.desc      tabImageOf(index=10, selectedIndex=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0171 begin`);
      const actual: string = tabImageOf(10, 65);
      logInfo(`tabImageOf(index=10, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0172
     * @tc.name      TabContentTouchHotZone_TabImageOf_0172
     * @tc.desc      tabImageOf(index=10, selectedIndex=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0172 begin`);
      const actual: string = tabImageOf(10, 70);
      logInfo(`tabImageOf(index=10, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0173
     * @tc.name      TabContentTouchHotZone_TabImageOf_0173
     * @tc.desc      tabImageOf(index=10, selectedIndex=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0173 begin`);
      const actual: string = tabImageOf(10, 75);
      logInfo(`tabImageOf(index=10, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0174
     * @tc.name      TabContentTouchHotZone_TabImageOf_0174
     * @tc.desc      tabImageOf(index=10, selectedIndex=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0174 begin`);
      const actual: string = tabImageOf(10, 80);
      logInfo(`tabImageOf(index=10, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0175
     * @tc.name      TabContentTouchHotZone_TabImageOf_0175
     * @tc.desc      tabImageOf(index=10, selectedIndex=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0175 begin`);
      const actual: string = tabImageOf(10, 85);
      logInfo(`tabImageOf(index=10, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0176
     * @tc.name      TabContentTouchHotZone_TabImageOf_0176
     * @tc.desc      tabImageOf(index=10, selectedIndex=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0176 begin`);
      const actual: string = tabImageOf(10, 90);
      logInfo(`tabImageOf(index=10, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0177
     * @tc.name      TabContentTouchHotZone_TabImageOf_0177
     * @tc.desc      tabImageOf(index=10, selectedIndex=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0177 begin`);
      const actual: string = tabImageOf(10, 95);
      logInfo(`tabImageOf(index=10, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0178
     * @tc.name      TabContentTouchHotZone_TabImageOf_0178
     * @tc.desc      tabImageOf(index=10, selectedIndex=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0178 begin`);
      const actual: string = tabImageOf(10, 105);
      logInfo(`tabImageOf(index=10, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0179
     * @tc.name      TabContentTouchHotZone_TabImageOf_0179
     * @tc.desc      tabImageOf(index=10, selectedIndex=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0179 begin`);
      const actual: string = tabImageOf(10, 110);
      logInfo(`tabImageOf(index=10, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0180
     * @tc.name      TabContentTouchHotZone_TabImageOf_0180
     * @tc.desc      tabImageOf(index=10, selectedIndex=-48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0180 begin`);
      const actual: string = tabImageOf(10, -48);
      logInfo(`tabImageOf(index=10, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0181
     * @tc.name      TabContentTouchHotZone_TabImageOf_0181
     * @tc.desc      tabImageOf(index=10, selectedIndex=97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0181 begin`);
      const actual: string = tabImageOf(10, 97);
      logInfo(`tabImageOf(index=10, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0182
     * @tc.name      TabContentTouchHotZone_TabImageOf_0182
     * @tc.desc      tabImageOf(index=10, selectedIndex=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0182 begin`);
      const actual: string = tabImageOf(10, 121);
      logInfo(`tabImageOf(index=10, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0183
     * @tc.name      TabContentTouchHotZone_TabImageOf_0183
     * @tc.desc      tabImageOf(index=3, selectedIndex=1) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0183 begin`);
      const actual: string = tabImageOf(3, 1);
      logInfo(`tabImageOf(index=3, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0184
     * @tc.name      TabContentTouchHotZone_TabImageOf_0184
     * @tc.desc      tabImageOf(index=3, selectedIndex=-1) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0184 begin`);
      const actual: string = tabImageOf(3, -1);
      logInfo(`tabImageOf(index=3, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0185
     * @tc.name      TabContentTouchHotZone_TabImageOf_0185
     * @tc.desc      tabImageOf(index=3, selectedIndex=2) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0185 begin`);
      const actual: string = tabImageOf(3, 2);
      logInfo(`tabImageOf(index=3, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0186
     * @tc.name      TabContentTouchHotZone_TabImageOf_0186
     * @tc.desc      tabImageOf(index=3, selectedIndex=5) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0186 begin`);
      const actual: string = tabImageOf(3, 5);
      logInfo(`tabImageOf(index=3, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0187
     * @tc.name      TabContentTouchHotZone_TabImageOf_0187
     * @tc.desc      tabImageOf(index=3, selectedIndex=10) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0187 begin`);
      const actual: string = tabImageOf(3, 10);
      logInfo(`tabImageOf(index=3, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0188
     * @tc.name      TabContentTouchHotZone_TabImageOf_0188
     * @tc.desc      tabImageOf(index=3, selectedIndex=100) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0188 begin`);
      const actual: string = tabImageOf(3, 100);
      logInfo(`tabImageOf(index=3, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0189
     * @tc.name      TabContentTouchHotZone_TabImageOf_0189
     * @tc.desc      tabImageOf(index=3, selectedIndex=15) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0189 begin`);
      const actual: string = tabImageOf(3, 15);
      logInfo(`tabImageOf(index=3, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0190
     * @tc.name      TabContentTouchHotZone_TabImageOf_0190
     * @tc.desc      tabImageOf(index=3, selectedIndex=20) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0190 begin`);
      const actual: string = tabImageOf(3, 20);
      logInfo(`tabImageOf(index=3, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0191
     * @tc.name      TabContentTouchHotZone_TabImageOf_0191
     * @tc.desc      tabImageOf(index=3, selectedIndex=25) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0191 begin`);
      const actual: string = tabImageOf(3, 25);
      logInfo(`tabImageOf(index=3, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0192
     * @tc.name      TabContentTouchHotZone_TabImageOf_0192
     * @tc.desc      tabImageOf(index=3, selectedIndex=30) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0192 begin`);
      const actual: string = tabImageOf(3, 30);
      logInfo(`tabImageOf(index=3, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0192 end`);
    });
  });
}
