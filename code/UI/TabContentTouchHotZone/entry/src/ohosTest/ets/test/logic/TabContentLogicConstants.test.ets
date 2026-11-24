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
import {
  DEFAULT_COMMENT_COUNT, DEFAULT_FAVORITE_COUNT, DEFAULT_LIKE_COUNT, DEFAULT_TAB_INDEX, INTERVAL_NUMBER, TAB_NAMES,
  TEN, TIME_ZERO, ZERO
} from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TabContentLogic (9 cases). */
export default function tabContentLogicConstantsTest(): void {
  describe('TabContentLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0001
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0001
     * @tc.desc      INTERVAL_NUMBER keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0001 begin`);
      const actual: number = INTERVAL_NUMBER;
      logInfo(`INTERVAL_NUMBER: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TabContentLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0002
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0002
     * @tc.desc      ZERO keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0002 begin`);
      const actual: number = ZERO;
      logInfo(`ZERO: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TabContentLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0003
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0003
     * @tc.desc      TEN keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0003 begin`);
      const actual: number = TEN;
      logInfo(`TEN: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TabContentLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0004
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0004
     * @tc.desc      TIME_ZERO keeps value "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0004 begin`);
      const actual: string = TIME_ZERO;
      logInfo(`TIME_ZERO: actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}TabContentLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0005
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0005
     * @tc.desc      DEFAULT_LIKE_COUNT keeps value 1234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0005 begin`);
      const actual: number = DEFAULT_LIKE_COUNT;
      logInfo(`DEFAULT_LIKE_COUNT: actual=${actual}`);
      expect(actual).assertEqual(1234);
      logInfo(`${BUNDLE}TabContentLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0006
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0006
     * @tc.desc      DEFAULT_COMMENT_COUNT keeps value 2234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0006 begin`);
      const actual: number = DEFAULT_COMMENT_COUNT;
      logInfo(`DEFAULT_COMMENT_COUNT: actual=${actual}`);
      expect(actual).assertEqual(2234);
      logInfo(`${BUNDLE}TabContentLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0007
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0007
     * @tc.desc      DEFAULT_FAVORITE_COUNT keeps value 3234
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0007 begin`);
      const actual: number = DEFAULT_FAVORITE_COUNT;
      logInfo(`DEFAULT_FAVORITE_COUNT: actual=${actual}`);
      expect(actual).assertEqual(3234);
      logInfo(`${BUNDLE}TabContentLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0008
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0008
     * @tc.desc      TAB_NAMES keeps value ["homepage","video","mall","mine"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0008 begin`);
      const actual: string[] = TAB_NAMES;
      logInfo(`TAB_NAMES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`TAB_NAMES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["homepage","video","mall","mine"]');
      logInfo(`${BUNDLE}TabContentLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TAB_CONTENT_LOGIC_CONSTANTS_0009
     * @tc.name      TabContentTouchHotZone_TabContentLogicConstants_0009
     * @tc.desc      DEFAULT_TAB_INDEX keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_TabContentLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TabContentLogicConstants_0009 begin`);
      const actual: number = DEFAULT_TAB_INDEX;
      logInfo(`DEFAULT_TAB_INDEX: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TabContentLogicConstants_0009 end`);
    });
  });
}
