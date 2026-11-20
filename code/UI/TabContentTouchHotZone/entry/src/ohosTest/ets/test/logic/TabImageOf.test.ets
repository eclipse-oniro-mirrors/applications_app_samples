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
export default function tabImageOfTest(): void {
  describe('TabImageOfTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0001
     * @tc.name      TabContentTouchHotZone_TabImageOf_0001
     * @tc.desc      tabImageOf(index=0, selectedIndex=0) returns "app.media.tabcontentoverflow_homepage_filled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabImageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0001 begin`);
      const actual: string = tabImageOf(0, 0);
      logInfo(`tabImageOf(index=0, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage_filled');
      logInfo(`${BUNDLE}TabImageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0002
     * @tc.name      TabContentTouchHotZone_TabImageOf_0002
     * @tc.desc      tabImageOf(index=0, selectedIndex=1) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabImageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0002 begin`);
      const actual: string = tabImageOf(0, 1);
      logInfo(`tabImageOf(index=0, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0003
     * @tc.name      TabContentTouchHotZone_TabImageOf_0003
     * @tc.desc      tabImageOf(index=1, selectedIndex=0) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0003 begin`);
      const actual: string = tabImageOf(1, 0);
      logInfo(`tabImageOf(index=1, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0004
     * @tc.name      TabContentTouchHotZone_TabImageOf_0004
     * @tc.desc      tabImageOf(index=1, selectedIndex=1) returns "app.media.tabcontentoverflow_video_filled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0004 begin`);
      const actual: string = tabImageOf(1, 1);
      logInfo(`tabImageOf(index=1, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video_filled');
      logInfo(`${BUNDLE}TabImageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0005
     * @tc.name      TabContentTouchHotZone_TabImageOf_0005
     * @tc.desc      tabImageOf(index=-1, selectedIndex=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0005 begin`);
      const actual: string = tabImageOf(-1, 0);
      logInfo(`tabImageOf(index=-1, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0006
     * @tc.name      TabContentTouchHotZone_TabImageOf_0006
     * @tc.desc      tabImageOf(index=2, selectedIndex=0) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0006 begin`);
      const actual: string = tabImageOf(2, 0);
      logInfo(`tabImageOf(index=2, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0007
     * @tc.name      TabContentTouchHotZone_TabImageOf_0007
     * @tc.desc      tabImageOf(index=2, selectedIndex=2) returns "app.media.tabcontentoverflow_mall_filled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0007 begin`);
      const actual: string = tabImageOf(2, 2);
      logInfo(`tabImageOf(index=2, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall_filled');
      logInfo(`${BUNDLE}TabImageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0008
     * @tc.name      TabContentTouchHotZone_TabImageOf_0008
     * @tc.desc      tabImageOf(index=3, selectedIndex=0) returns "app.media.tabcontentoverflow_mine"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0008 begin`);
      const actual: string = tabImageOf(3, 0);
      logInfo(`tabImageOf(index=3, selectedIndex=0): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine');
      logInfo(`${BUNDLE}TabImageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0009
     * @tc.name      TabContentTouchHotZone_TabImageOf_0009
     * @tc.desc      tabImageOf(index=3, selectedIndex=3) returns "app.media.tabcontentoverflow_mine_filled"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0009 begin`);
      const actual: string = tabImageOf(3, 3);
      logInfo(`tabImageOf(index=3, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mine_filled');
      logInfo(`${BUNDLE}TabImageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0010
     * @tc.name      TabContentTouchHotZone_TabImageOf_0010
     * @tc.desc      tabImageOf(index=0, selectedIndex=-1) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0010 begin`);
      const actual: string = tabImageOf(0, -1);
      logInfo(`tabImageOf(index=0, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0011
     * @tc.name      TabContentTouchHotZone_TabImageOf_0011
     * @tc.desc      tabImageOf(index=0, selectedIndex=2) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0011 begin`);
      const actual: string = tabImageOf(0, 2);
      logInfo(`tabImageOf(index=0, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0012
     * @tc.name      TabContentTouchHotZone_TabImageOf_0012
     * @tc.desc      tabImageOf(index=0, selectedIndex=5) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0012 begin`);
      const actual: string = tabImageOf(0, 5);
      logInfo(`tabImageOf(index=0, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0013
     * @tc.name      TabContentTouchHotZone_TabImageOf_0013
     * @tc.desc      tabImageOf(index=0, selectedIndex=10) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0013 begin`);
      const actual: string = tabImageOf(0, 10);
      logInfo(`tabImageOf(index=0, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0014
     * @tc.name      TabContentTouchHotZone_TabImageOf_0014
     * @tc.desc      tabImageOf(index=0, selectedIndex=3) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0014 begin`);
      const actual: string = tabImageOf(0, 3);
      logInfo(`tabImageOf(index=0, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0015
     * @tc.name      TabContentTouchHotZone_TabImageOf_0015
     * @tc.desc      tabImageOf(index=0, selectedIndex=100) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0015 begin`);
      const actual: string = tabImageOf(0, 100);
      logInfo(`tabImageOf(index=0, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0016
     * @tc.name      TabContentTouchHotZone_TabImageOf_0016
     * @tc.desc      tabImageOf(index=0, selectedIndex=15) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0016 begin`);
      const actual: string = tabImageOf(0, 15);
      logInfo(`tabImageOf(index=0, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0017
     * @tc.name      TabContentTouchHotZone_TabImageOf_0017
     * @tc.desc      tabImageOf(index=0, selectedIndex=20) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0017 begin`);
      const actual: string = tabImageOf(0, 20);
      logInfo(`tabImageOf(index=0, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0018
     * @tc.name      TabContentTouchHotZone_TabImageOf_0018
     * @tc.desc      tabImageOf(index=0, selectedIndex=25) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0018 begin`);
      const actual: string = tabImageOf(0, 25);
      logInfo(`tabImageOf(index=0, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0019
     * @tc.name      TabContentTouchHotZone_TabImageOf_0019
     * @tc.desc      tabImageOf(index=0, selectedIndex=30) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0019 begin`);
      const actual: string = tabImageOf(0, 30);
      logInfo(`tabImageOf(index=0, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0020
     * @tc.name      TabContentTouchHotZone_TabImageOf_0020
     * @tc.desc      tabImageOf(index=0, selectedIndex=35) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0020 begin`);
      const actual: string = tabImageOf(0, 35);
      logInfo(`tabImageOf(index=0, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0021
     * @tc.name      TabContentTouchHotZone_TabImageOf_0021
     * @tc.desc      tabImageOf(index=0, selectedIndex=40) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0021 begin`);
      const actual: string = tabImageOf(0, 40);
      logInfo(`tabImageOf(index=0, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0022
     * @tc.name      TabContentTouchHotZone_TabImageOf_0022
     * @tc.desc      tabImageOf(index=0, selectedIndex=45) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0022 begin`);
      const actual: string = tabImageOf(0, 45);
      logInfo(`tabImageOf(index=0, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0023
     * @tc.name      TabContentTouchHotZone_TabImageOf_0023
     * @tc.desc      tabImageOf(index=0, selectedIndex=50) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0023 begin`);
      const actual: string = tabImageOf(0, 50);
      logInfo(`tabImageOf(index=0, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0024
     * @tc.name      TabContentTouchHotZone_TabImageOf_0024
     * @tc.desc      tabImageOf(index=0, selectedIndex=55) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0024 begin`);
      const actual: string = tabImageOf(0, 55);
      logInfo(`tabImageOf(index=0, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0025
     * @tc.name      TabContentTouchHotZone_TabImageOf_0025
     * @tc.desc      tabImageOf(index=0, selectedIndex=60) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0025 begin`);
      const actual: string = tabImageOf(0, 60);
      logInfo(`tabImageOf(index=0, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0026
     * @tc.name      TabContentTouchHotZone_TabImageOf_0026
     * @tc.desc      tabImageOf(index=0, selectedIndex=65) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0026 begin`);
      const actual: string = tabImageOf(0, 65);
      logInfo(`tabImageOf(index=0, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0027
     * @tc.name      TabContentTouchHotZone_TabImageOf_0027
     * @tc.desc      tabImageOf(index=0, selectedIndex=70) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0027 begin`);
      const actual: string = tabImageOf(0, 70);
      logInfo(`tabImageOf(index=0, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0028
     * @tc.name      TabContentTouchHotZone_TabImageOf_0028
     * @tc.desc      tabImageOf(index=0, selectedIndex=75) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0028 begin`);
      const actual: string = tabImageOf(0, 75);
      logInfo(`tabImageOf(index=0, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0029
     * @tc.name      TabContentTouchHotZone_TabImageOf_0029
     * @tc.desc      tabImageOf(index=0, selectedIndex=80) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0029 begin`);
      const actual: string = tabImageOf(0, 80);
      logInfo(`tabImageOf(index=0, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0030
     * @tc.name      TabContentTouchHotZone_TabImageOf_0030
     * @tc.desc      tabImageOf(index=0, selectedIndex=85) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0030 begin`);
      const actual: string = tabImageOf(0, 85);
      logInfo(`tabImageOf(index=0, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0031
     * @tc.name      TabContentTouchHotZone_TabImageOf_0031
     * @tc.desc      tabImageOf(index=0, selectedIndex=90) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0031 begin`);
      const actual: string = tabImageOf(0, 90);
      logInfo(`tabImageOf(index=0, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0032
     * @tc.name      TabContentTouchHotZone_TabImageOf_0032
     * @tc.desc      tabImageOf(index=0, selectedIndex=95) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0032 begin`);
      const actual: string = tabImageOf(0, 95);
      logInfo(`tabImageOf(index=0, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0033
     * @tc.name      TabContentTouchHotZone_TabImageOf_0033
     * @tc.desc      tabImageOf(index=0, selectedIndex=105) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0033 begin`);
      const actual: string = tabImageOf(0, 105);
      logInfo(`tabImageOf(index=0, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0034
     * @tc.name      TabContentTouchHotZone_TabImageOf_0034
     * @tc.desc      tabImageOf(index=0, selectedIndex=110) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0034 begin`);
      const actual: string = tabImageOf(0, 110);
      logInfo(`tabImageOf(index=0, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0035
     * @tc.name      TabContentTouchHotZone_TabImageOf_0035
     * @tc.desc      tabImageOf(index=0, selectedIndex=-48) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0035 begin`);
      const actual: string = tabImageOf(0, -48);
      logInfo(`tabImageOf(index=0, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0036
     * @tc.name      TabContentTouchHotZone_TabImageOf_0036
     * @tc.desc      tabImageOf(index=0, selectedIndex=97) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0036 begin`);
      const actual: string = tabImageOf(0, 97);
      logInfo(`tabImageOf(index=0, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0037
     * @tc.name      TabContentTouchHotZone_TabImageOf_0037
     * @tc.desc      tabImageOf(index=0, selectedIndex=121) returns "app.media.tabcontentoverflow_homepage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0037 begin`);
      const actual: string = tabImageOf(0, 121);
      logInfo(`tabImageOf(index=0, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_homepage');
      logInfo(`${BUNDLE}TabImageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0038
     * @tc.name      TabContentTouchHotZone_TabImageOf_0038
     * @tc.desc      tabImageOf(index=1, selectedIndex=-1) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0038 begin`);
      const actual: string = tabImageOf(1, -1);
      logInfo(`tabImageOf(index=1, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0039
     * @tc.name      TabContentTouchHotZone_TabImageOf_0039
     * @tc.desc      tabImageOf(index=1, selectedIndex=2) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0039 begin`);
      const actual: string = tabImageOf(1, 2);
      logInfo(`tabImageOf(index=1, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0040
     * @tc.name      TabContentTouchHotZone_TabImageOf_0040
     * @tc.desc      tabImageOf(index=1, selectedIndex=5) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0040 begin`);
      const actual: string = tabImageOf(1, 5);
      logInfo(`tabImageOf(index=1, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0041
     * @tc.name      TabContentTouchHotZone_TabImageOf_0041
     * @tc.desc      tabImageOf(index=1, selectedIndex=10) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0041 begin`);
      const actual: string = tabImageOf(1, 10);
      logInfo(`tabImageOf(index=1, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0042
     * @tc.name      TabContentTouchHotZone_TabImageOf_0042
     * @tc.desc      tabImageOf(index=1, selectedIndex=3) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0042 begin`);
      const actual: string = tabImageOf(1, 3);
      logInfo(`tabImageOf(index=1, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0043
     * @tc.name      TabContentTouchHotZone_TabImageOf_0043
     * @tc.desc      tabImageOf(index=1, selectedIndex=100) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0043 begin`);
      const actual: string = tabImageOf(1, 100);
      logInfo(`tabImageOf(index=1, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0044
     * @tc.name      TabContentTouchHotZone_TabImageOf_0044
     * @tc.desc      tabImageOf(index=1, selectedIndex=15) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0044 begin`);
      const actual: string = tabImageOf(1, 15);
      logInfo(`tabImageOf(index=1, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0045
     * @tc.name      TabContentTouchHotZone_TabImageOf_0045
     * @tc.desc      tabImageOf(index=1, selectedIndex=20) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0045 begin`);
      const actual: string = tabImageOf(1, 20);
      logInfo(`tabImageOf(index=1, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0046
     * @tc.name      TabContentTouchHotZone_TabImageOf_0046
     * @tc.desc      tabImageOf(index=1, selectedIndex=25) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0046 begin`);
      const actual: string = tabImageOf(1, 25);
      logInfo(`tabImageOf(index=1, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0047
     * @tc.name      TabContentTouchHotZone_TabImageOf_0047
     * @tc.desc      tabImageOf(index=1, selectedIndex=30) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0047 begin`);
      const actual: string = tabImageOf(1, 30);
      logInfo(`tabImageOf(index=1, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0048
     * @tc.name      TabContentTouchHotZone_TabImageOf_0048
     * @tc.desc      tabImageOf(index=1, selectedIndex=35) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0048 begin`);
      const actual: string = tabImageOf(1, 35);
      logInfo(`tabImageOf(index=1, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0049
     * @tc.name      TabContentTouchHotZone_TabImageOf_0049
     * @tc.desc      tabImageOf(index=1, selectedIndex=40) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0049 begin`);
      const actual: string = tabImageOf(1, 40);
      logInfo(`tabImageOf(index=1, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0050
     * @tc.name      TabContentTouchHotZone_TabImageOf_0050
     * @tc.desc      tabImageOf(index=1, selectedIndex=45) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0050 begin`);
      const actual: string = tabImageOf(1, 45);
      logInfo(`tabImageOf(index=1, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0051
     * @tc.name      TabContentTouchHotZone_TabImageOf_0051
     * @tc.desc      tabImageOf(index=1, selectedIndex=50) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0051 begin`);
      const actual: string = tabImageOf(1, 50);
      logInfo(`tabImageOf(index=1, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0052
     * @tc.name      TabContentTouchHotZone_TabImageOf_0052
     * @tc.desc      tabImageOf(index=1, selectedIndex=55) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0052 begin`);
      const actual: string = tabImageOf(1, 55);
      logInfo(`tabImageOf(index=1, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0053
     * @tc.name      TabContentTouchHotZone_TabImageOf_0053
     * @tc.desc      tabImageOf(index=1, selectedIndex=60) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0053 begin`);
      const actual: string = tabImageOf(1, 60);
      logInfo(`tabImageOf(index=1, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0054
     * @tc.name      TabContentTouchHotZone_TabImageOf_0054
     * @tc.desc      tabImageOf(index=1, selectedIndex=65) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0054 begin`);
      const actual: string = tabImageOf(1, 65);
      logInfo(`tabImageOf(index=1, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0055
     * @tc.name      TabContentTouchHotZone_TabImageOf_0055
     * @tc.desc      tabImageOf(index=1, selectedIndex=70) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0055 begin`);
      const actual: string = tabImageOf(1, 70);
      logInfo(`tabImageOf(index=1, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0056
     * @tc.name      TabContentTouchHotZone_TabImageOf_0056
     * @tc.desc      tabImageOf(index=1, selectedIndex=75) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0056 begin`);
      const actual: string = tabImageOf(1, 75);
      logInfo(`tabImageOf(index=1, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0057
     * @tc.name      TabContentTouchHotZone_TabImageOf_0057
     * @tc.desc      tabImageOf(index=1, selectedIndex=80) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0057 begin`);
      const actual: string = tabImageOf(1, 80);
      logInfo(`tabImageOf(index=1, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0058
     * @tc.name      TabContentTouchHotZone_TabImageOf_0058
     * @tc.desc      tabImageOf(index=1, selectedIndex=85) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0058 begin`);
      const actual: string = tabImageOf(1, 85);
      logInfo(`tabImageOf(index=1, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0059
     * @tc.name      TabContentTouchHotZone_TabImageOf_0059
     * @tc.desc      tabImageOf(index=1, selectedIndex=90) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0059 begin`);
      const actual: string = tabImageOf(1, 90);
      logInfo(`tabImageOf(index=1, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0060
     * @tc.name      TabContentTouchHotZone_TabImageOf_0060
     * @tc.desc      tabImageOf(index=1, selectedIndex=95) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0060 begin`);
      const actual: string = tabImageOf(1, 95);
      logInfo(`tabImageOf(index=1, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0061
     * @tc.name      TabContentTouchHotZone_TabImageOf_0061
     * @tc.desc      tabImageOf(index=1, selectedIndex=105) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0061 begin`);
      const actual: string = tabImageOf(1, 105);
      logInfo(`tabImageOf(index=1, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0062
     * @tc.name      TabContentTouchHotZone_TabImageOf_0062
     * @tc.desc      tabImageOf(index=1, selectedIndex=110) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0062 begin`);
      const actual: string = tabImageOf(1, 110);
      logInfo(`tabImageOf(index=1, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0063
     * @tc.name      TabContentTouchHotZone_TabImageOf_0063
     * @tc.desc      tabImageOf(index=1, selectedIndex=-48) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0063 begin`);
      const actual: string = tabImageOf(1, -48);
      logInfo(`tabImageOf(index=1, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0064
     * @tc.name      TabContentTouchHotZone_TabImageOf_0064
     * @tc.desc      tabImageOf(index=1, selectedIndex=97) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0064 begin`);
      const actual: string = tabImageOf(1, 97);
      logInfo(`tabImageOf(index=1, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0065
     * @tc.name      TabContentTouchHotZone_TabImageOf_0065
     * @tc.desc      tabImageOf(index=1, selectedIndex=121) returns "app.media.tabcontentoverflow_video"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0065 begin`);
      const actual: string = tabImageOf(1, 121);
      logInfo(`tabImageOf(index=1, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_video');
      logInfo(`${BUNDLE}TabImageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0066
     * @tc.name      TabContentTouchHotZone_TabImageOf_0066
     * @tc.desc      tabImageOf(index=-1, selectedIndex=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0066 begin`);
      const actual: string = tabImageOf(-1, 1);
      logInfo(`tabImageOf(index=-1, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0067
     * @tc.name      TabContentTouchHotZone_TabImageOf_0067
     * @tc.desc      tabImageOf(index=-1, selectedIndex=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0067 begin`);
      const actual: string = tabImageOf(-1, -1);
      logInfo(`tabImageOf(index=-1, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0068
     * @tc.name      TabContentTouchHotZone_TabImageOf_0068
     * @tc.desc      tabImageOf(index=-1, selectedIndex=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0068 begin`);
      const actual: string = tabImageOf(-1, 2);
      logInfo(`tabImageOf(index=-1, selectedIndex=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0069
     * @tc.name      TabContentTouchHotZone_TabImageOf_0069
     * @tc.desc      tabImageOf(index=-1, selectedIndex=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0069 begin`);
      const actual: string = tabImageOf(-1, 5);
      logInfo(`tabImageOf(index=-1, selectedIndex=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0070
     * @tc.name      TabContentTouchHotZone_TabImageOf_0070
     * @tc.desc      tabImageOf(index=-1, selectedIndex=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0070 begin`);
      const actual: string = tabImageOf(-1, 10);
      logInfo(`tabImageOf(index=-1, selectedIndex=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0071
     * @tc.name      TabContentTouchHotZone_TabImageOf_0071
     * @tc.desc      tabImageOf(index=-1, selectedIndex=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0071 begin`);
      const actual: string = tabImageOf(-1, 3);
      logInfo(`tabImageOf(index=-1, selectedIndex=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0072
     * @tc.name      TabContentTouchHotZone_TabImageOf_0072
     * @tc.desc      tabImageOf(index=-1, selectedIndex=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0072 begin`);
      const actual: string = tabImageOf(-1, 100);
      logInfo(`tabImageOf(index=-1, selectedIndex=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0073
     * @tc.name      TabContentTouchHotZone_TabImageOf_0073
     * @tc.desc      tabImageOf(index=-1, selectedIndex=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0073 begin`);
      const actual: string = tabImageOf(-1, 15);
      logInfo(`tabImageOf(index=-1, selectedIndex=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0074
     * @tc.name      TabContentTouchHotZone_TabImageOf_0074
     * @tc.desc      tabImageOf(index=-1, selectedIndex=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0074 begin`);
      const actual: string = tabImageOf(-1, 20);
      logInfo(`tabImageOf(index=-1, selectedIndex=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0075
     * @tc.name      TabContentTouchHotZone_TabImageOf_0075
     * @tc.desc      tabImageOf(index=-1, selectedIndex=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0075 begin`);
      const actual: string = tabImageOf(-1, 25);
      logInfo(`tabImageOf(index=-1, selectedIndex=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0076
     * @tc.name      TabContentTouchHotZone_TabImageOf_0076
     * @tc.desc      tabImageOf(index=-1, selectedIndex=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0076 begin`);
      const actual: string = tabImageOf(-1, 30);
      logInfo(`tabImageOf(index=-1, selectedIndex=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0077
     * @tc.name      TabContentTouchHotZone_TabImageOf_0077
     * @tc.desc      tabImageOf(index=-1, selectedIndex=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0077 begin`);
      const actual: string = tabImageOf(-1, 35);
      logInfo(`tabImageOf(index=-1, selectedIndex=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0078
     * @tc.name      TabContentTouchHotZone_TabImageOf_0078
     * @tc.desc      tabImageOf(index=-1, selectedIndex=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0078 begin`);
      const actual: string = tabImageOf(-1, 40);
      logInfo(`tabImageOf(index=-1, selectedIndex=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0079
     * @tc.name      TabContentTouchHotZone_TabImageOf_0079
     * @tc.desc      tabImageOf(index=-1, selectedIndex=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0079 begin`);
      const actual: string = tabImageOf(-1, 45);
      logInfo(`tabImageOf(index=-1, selectedIndex=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0080
     * @tc.name      TabContentTouchHotZone_TabImageOf_0080
     * @tc.desc      tabImageOf(index=-1, selectedIndex=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0080 begin`);
      const actual: string = tabImageOf(-1, 50);
      logInfo(`tabImageOf(index=-1, selectedIndex=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0081
     * @tc.name      TabContentTouchHotZone_TabImageOf_0081
     * @tc.desc      tabImageOf(index=-1, selectedIndex=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0081 begin`);
      const actual: string = tabImageOf(-1, 55);
      logInfo(`tabImageOf(index=-1, selectedIndex=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0082
     * @tc.name      TabContentTouchHotZone_TabImageOf_0082
     * @tc.desc      tabImageOf(index=-1, selectedIndex=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0082 begin`);
      const actual: string = tabImageOf(-1, 60);
      logInfo(`tabImageOf(index=-1, selectedIndex=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0083
     * @tc.name      TabContentTouchHotZone_TabImageOf_0083
     * @tc.desc      tabImageOf(index=-1, selectedIndex=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0083 begin`);
      const actual: string = tabImageOf(-1, 65);
      logInfo(`tabImageOf(index=-1, selectedIndex=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0084
     * @tc.name      TabContentTouchHotZone_TabImageOf_0084
     * @tc.desc      tabImageOf(index=-1, selectedIndex=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0084 begin`);
      const actual: string = tabImageOf(-1, 70);
      logInfo(`tabImageOf(index=-1, selectedIndex=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0085
     * @tc.name      TabContentTouchHotZone_TabImageOf_0085
     * @tc.desc      tabImageOf(index=-1, selectedIndex=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0085 begin`);
      const actual: string = tabImageOf(-1, 75);
      logInfo(`tabImageOf(index=-1, selectedIndex=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0086
     * @tc.name      TabContentTouchHotZone_TabImageOf_0086
     * @tc.desc      tabImageOf(index=-1, selectedIndex=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0086 begin`);
      const actual: string = tabImageOf(-1, 80);
      logInfo(`tabImageOf(index=-1, selectedIndex=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0087
     * @tc.name      TabContentTouchHotZone_TabImageOf_0087
     * @tc.desc      tabImageOf(index=-1, selectedIndex=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0087 begin`);
      const actual: string = tabImageOf(-1, 85);
      logInfo(`tabImageOf(index=-1, selectedIndex=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0088
     * @tc.name      TabContentTouchHotZone_TabImageOf_0088
     * @tc.desc      tabImageOf(index=-1, selectedIndex=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0088 begin`);
      const actual: string = tabImageOf(-1, 90);
      logInfo(`tabImageOf(index=-1, selectedIndex=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0089
     * @tc.name      TabContentTouchHotZone_TabImageOf_0089
     * @tc.desc      tabImageOf(index=-1, selectedIndex=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0089 begin`);
      const actual: string = tabImageOf(-1, 95);
      logInfo(`tabImageOf(index=-1, selectedIndex=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0090
     * @tc.name      TabContentTouchHotZone_TabImageOf_0090
     * @tc.desc      tabImageOf(index=-1, selectedIndex=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0090 begin`);
      const actual: string = tabImageOf(-1, 105);
      logInfo(`tabImageOf(index=-1, selectedIndex=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0091
     * @tc.name      TabContentTouchHotZone_TabImageOf_0091
     * @tc.desc      tabImageOf(index=-1, selectedIndex=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0091 begin`);
      const actual: string = tabImageOf(-1, 110);
      logInfo(`tabImageOf(index=-1, selectedIndex=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0092
     * @tc.name      TabContentTouchHotZone_TabImageOf_0092
     * @tc.desc      tabImageOf(index=-1, selectedIndex=-48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_TabImageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0092 begin`);
      const actual: string = tabImageOf(-1, -48);
      logInfo(`tabImageOf(index=-1, selectedIndex=-48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0093
     * @tc.name      TabContentTouchHotZone_TabImageOf_0093
     * @tc.desc      tabImageOf(index=-1, selectedIndex=97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0093 begin`);
      const actual: string = tabImageOf(-1, 97);
      logInfo(`tabImageOf(index=-1, selectedIndex=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0094
     * @tc.name      TabContentTouchHotZone_TabImageOf_0094
     * @tc.desc      tabImageOf(index=-1, selectedIndex=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0094 begin`);
      const actual: string = tabImageOf(-1, 121);
      logInfo(`tabImageOf(index=-1, selectedIndex=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}TabImageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0095
     * @tc.name      TabContentTouchHotZone_TabImageOf_0095
     * @tc.desc      tabImageOf(index=2, selectedIndex=1) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabImageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0095 begin`);
      const actual: string = tabImageOf(2, 1);
      logInfo(`tabImageOf(index=2, selectedIndex=1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_IMAGE_OF_0096
     * @tc.name      TabContentTouchHotZone_TabImageOf_0096
     * @tc.desc      tabImageOf(index=2, selectedIndex=-1) returns "app.media.tabcontentoverflow_mall"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TabContentTouchHotZone_TabImageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}TabImageOf_0096 begin`);
      const actual: string = tabImageOf(2, -1);
      logInfo(`tabImageOf(index=2, selectedIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('app.media.tabcontentoverflow_mall');
      logInfo(`${BUNDLE}TabImageOf_0096 end`);
    });
  });
}
