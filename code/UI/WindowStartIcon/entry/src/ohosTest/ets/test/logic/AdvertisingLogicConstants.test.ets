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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  ADVERTISING_PAGE, INDEX_PAGE, INTERVAL_MS, MAIN_PAGES, PAGE_COUNT_DOWN, START_WINDOW_BACKGROUND, START_WINDOW_ICON
} from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for AdvertisingLogic (7 cases). */
export default function advertisingLogicConstantsTest(): void {
  describe('AdvertisingLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0001
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0001
     * @tc.desc      PAGE_COUNT_DOWN keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0001 begin`);
      const actual: number = PAGE_COUNT_DOWN;
      logInfo(`PAGE_COUNT_DOWN: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0002
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0002
     * @tc.desc      INTERVAL_MS keeps value 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0002 begin`);
      const actual: number = INTERVAL_MS;
      logInfo(`INTERVAL_MS: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0003
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0003
     * @tc.desc      INDEX_PAGE keeps value "pages/Index"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0003 begin`);
      const actual: string = INDEX_PAGE;
      logInfo(`INDEX_PAGE: actual=${actual}`);
      expect(actual).assertEqual('pages/Index');
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0004
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0004
     * @tc.desc      ADVERTISING_PAGE keeps value "pages/AdvertisingPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0004 begin`);
      const actual: string = ADVERTISING_PAGE;
      logInfo(`ADVERTISING_PAGE: actual=${actual}`);
      expect(actual).assertEqual('pages/AdvertisingPage');
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0005
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0005
     * @tc.desc      MAIN_PAGES keeps value ["pages/Index","pages/AdvertisingPage"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0005 begin`);
      const actual: string[] = MAIN_PAGES;
      logInfo(`MAIN_PAGES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`MAIN_PAGES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["pages/Index","pages/AdvertisingPage"]');
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0006
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0006
     * @tc.desc      START_WINDOW_ICON keeps value "$media:icon_startwindow"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0006 begin`);
      const actual: string = START_WINDOW_ICON;
      logInfo(`START_WINDOW_ICON: actual=${actual}`);
      expect(actual).assertEqual('$media:icon_startwindow');
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ADVERTISING_LOGIC_CONSTANTS_0007
     * @tc.name      WindowStartIcon_AdvertisingLogicConstants_0007
     * @tc.desc      START_WINDOW_BACKGROUND keeps value "#FFFFFF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_AdvertisingLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0007 begin`);
      const actual: string = START_WINDOW_BACKGROUND;
      logInfo(`START_WINDOW_BACKGROUND: actual=${actual}`);
      expect(actual).assertEqual('#FFFFFF');
      logInfo(`${BUNDLE}AdvertisingLogicConstants_0007 end`);
    });
  });
}
