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

/** Logic checks for tabImageOf (13 cases). */
export default function tabImageOf3Test(): void {
  describe('TabImageOf3Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0193
     * @tc.name      TabContentTouchHotZone_TabImageOf_0193
     * @tc.desc      tabImageOf(index=3, selectedIndex=35) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0193 begin`);
      const actual: string = tabImageOf(3, 35);
      logInfo(`tabImageOf(index=3, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0194
     * @tc.name      TabContentTouchHotZone_TabImageOf_0194
     * @tc.desc      tabImageOf(index=3, selectedIndex=40) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0194 begin`);
      const actual: string = tabImageOf(3, 40);
      logInfo(`tabImageOf(index=3, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0195
     * @tc.name      TabContentTouchHotZone_TabImageOf_0195
     * @tc.desc      tabImageOf(index=3, selectedIndex=45) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0195 begin`);
      const actual: string = tabImageOf(3, 45);
      logInfo(`tabImageOf(index=3, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0196
     * @tc.name      TabContentTouchHotZone_TabImageOf_0196
     * @tc.desc      tabImageOf(index=3, selectedIndex=50) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0196 begin`);
      const actual: string = tabImageOf(3, 50);
      logInfo(`tabImageOf(index=3, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0197
     * @tc.name      TabContentTouchHotZone_TabImageOf_0197
     * @tc.desc      tabImageOf(index=3, selectedIndex=55) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0197 begin`);
      const actual: string = tabImageOf(3, 55);
      logInfo(`tabImageOf(index=3, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0198
     * @tc.name      TabContentTouchHotZone_TabImageOf_0198
     * @tc.desc      tabImageOf(index=3, selectedIndex=60) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0198 begin`);
      const actual: string = tabImageOf(3, 60);
      logInfo(`tabImageOf(index=3, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0199
     * @tc.name      TabContentTouchHotZone_TabImageOf_0199
     * @tc.desc      tabImageOf(index=3, selectedIndex=65) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0199 begin`);
      const actual: string = tabImageOf(3, 65);
      logInfo(`tabImageOf(index=3, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0200
     * @tc.name      TabContentTouchHotZone_TabImageOf_0200
     * @tc.desc      tabImageOf(index=3, selectedIndex=70) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0200 begin`);
      const actual: string = tabImageOf(3, 70);
      logInfo(`tabImageOf(index=3, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0201
     * @tc.name      TabContentTouchHotZone_TabImageOf_0201
     * @tc.desc      tabImageOf(index=3, selectedIndex=75) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0201 begin`);
      const actual: string = tabImageOf(3, 75);
      logInfo(`tabImageOf(index=3, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0202
     * @tc.name      TabContentTouchHotZone_TabImageOf_0202
     * @tc.desc      tabImageOf(index=3, selectedIndex=80) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0202 begin`);
      const actual: string = tabImageOf(3, 80);
      logInfo(`tabImageOf(index=3, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0203
     * @tc.name      TabContentTouchHotZone_TabImageOf_0203
     * @tc.desc      tabImageOf(index=3, selectedIndex=85) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0203 begin`);
      const actual: string = tabImageOf(3, 85);
      logInfo(`tabImageOf(index=3, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0204
     * @tc.name      TabContentTouchHotZone_TabImageOf_0204
     * @tc.desc      tabImageOf(index=3, selectedIndex=90) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0204 begin`);
      const actual: string = tabImageOf(3, 90);
      logInfo(`tabImageOf(index=3, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0205
     * @tc.name      TabContentTouchHotZone_TabImageOf_0205
     * @tc.desc      tabImageOf(index=3, selectedIndex=95) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0205 begin`);
      const actual: string = tabImageOf(3, 95);
      logInfo(`tabImageOf(index=3, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0205 end`);
    });
  });
}
