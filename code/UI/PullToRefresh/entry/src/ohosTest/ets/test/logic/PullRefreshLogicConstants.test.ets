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
  CHANGE_PAGE_STATE, CURRENT_DATA_RESOLVE_SUCCESS, CURRENT_DATA_TIP, DEFAULT_ANIM_DURATION, DEFAULT_LOAD_IMG_HEIGHT,
  DEFAULT_MAX_TRANSLATE, DEFAULT_REFRESH_ANIM_DURATION, DEFAULT_REFRESH_HEIGHT, DEFAULT_SENSITIVITY, IS_FREE,
  IS_LOADING, IS_PULL_DOWN_1, IS_PULL_DOWN_2, IS_PULL_UP_1, IS_PULL_UP_2, IS_REFRESHED, IS_REFRESHING,
  LOAD_DEFAULT_TEXT, LOAD_PULL_STATE_CHANGE, LOAD_STOP_TEXT, LOAD_TEXT_PULL_UP_1, LOAD_TEXT_PULL_UP_2,
  MOCK_DATA_FILE_ONE_DIR, MOCK_DATA_FILE_TWO_DIR, NEWS_MAX_LIST, NEWS_MOCK_DATA_COUNT, NEWS_REFRESH_TIME,
  NEW_DATA_RESOLVE_SUCCESS, NEW_DATA_TIP
} from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for PullRefreshLogic (29 cases). */
export default function pullRefreshLogicConstantsTest(): void {
  describe('PullRefreshLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0001
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0001
     * @tc.desc      IS_FREE keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullRefreshLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0001 begin`);
      const actual: number = IS_FREE;
      logInfo(`IS_FREE: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0002
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0002
     * @tc.desc      IS_PULL_DOWN_1 keeps value 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullRefreshLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0002 begin`);
      const actual: number = IS_PULL_DOWN_1;
      logInfo(`IS_PULL_DOWN_1: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0003
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0003
     * @tc.desc      IS_PULL_DOWN_2 keeps value 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0003 begin`);
      const actual: number = IS_PULL_DOWN_2;
      logInfo(`IS_PULL_DOWN_2: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0004
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0004
     * @tc.desc      IS_REFRESHING keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0004 begin`);
      const actual: number = IS_REFRESHING;
      logInfo(`IS_REFRESHING: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0005
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0005
     * @tc.desc      IS_REFRESHED keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0005 begin`);
      const actual: number = IS_REFRESHED;
      logInfo(`IS_REFRESHED: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0006
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0006
     * @tc.desc      IS_PULL_UP_1 keeps value 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0006 begin`);
      const actual: number = IS_PULL_UP_1;
      logInfo(`IS_PULL_UP_1: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0007
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0007
     * @tc.desc      IS_PULL_UP_2 keeps value 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0007 begin`);
      const actual: number = IS_PULL_UP_2;
      logInfo(`IS_PULL_UP_2: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0008
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0008
     * @tc.desc      IS_LOADING keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0008 begin`);
      const actual: number = IS_LOADING;
      logInfo(`IS_LOADING: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0009
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0009
     * @tc.desc      DEFAULT_MAX_TRANSLATE keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0009 begin`);
      const actual: number = DEFAULT_MAX_TRANSLATE;
      logInfo(`DEFAULT_MAX_TRANSLATE: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0010
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0010
     * @tc.desc      DEFAULT_SENSITIVITY keeps value 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0010 begin`);
      const actual: number = DEFAULT_SENSITIVITY;
      logInfo(`DEFAULT_SENSITIVITY: actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0011
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0011
     * @tc.desc      DEFAULT_ANIM_DURATION keeps value 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0011 begin`);
      const actual: number = DEFAULT_ANIM_DURATION;
      logInfo(`DEFAULT_ANIM_DURATION: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0012
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0012
     * @tc.desc      DEFAULT_REFRESH_HEIGHT keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0012 begin`);
      const actual: number = DEFAULT_REFRESH_HEIGHT;
      logInfo(`DEFAULT_REFRESH_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0013
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0013
     * @tc.desc      DEFAULT_REFRESH_ANIM_DURATION keeps value 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0013 begin`);
      const actual: number = DEFAULT_REFRESH_ANIM_DURATION;
      logInfo(`DEFAULT_REFRESH_ANIM_DURATION: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0014
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0014
     * @tc.desc      NEWS_MOCK_DATA_COUNT keeps value 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0014 begin`);
      const actual: number = NEWS_MOCK_DATA_COUNT;
      logInfo(`NEWS_MOCK_DATA_COUNT: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0015
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0015
     * @tc.desc      NEWS_MAX_LIST keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0015 begin`);
      const actual: number = NEWS_MAX_LIST;
      logInfo(`NEWS_MAX_LIST: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0016
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0016
     * @tc.desc      NEWS_REFRESH_TIME keeps value 1500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0016 begin`);
      const actual: number = NEWS_REFRESH_TIME;
      logInfo(`NEWS_REFRESH_TIME: actual=${actual}`);
      expect(actual).assertEqual(1500);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0017
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0017
     * @tc.desc      LOAD_PULL_STATE_CHANGE keeps value 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0017 begin`);
      const actual: number = LOAD_PULL_STATE_CHANGE;
      logInfo(`LOAD_PULL_STATE_CHANGE: actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0018
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0018
     * @tc.desc      CHANGE_PAGE_STATE keeps value 0.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0018 begin`);
      const actual: number = CHANGE_PAGE_STATE;
      logInfo(`CHANGE_PAGE_STATE: actual=${actual}`);
      expect(actual).assertClose(0.99, PRECISION);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0019
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0019
     * @tc.desc      MOCK_DATA_FILE_ONE_DIR keeps value "mockDataOne.json"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0019 begin`);
      const actual: string = MOCK_DATA_FILE_ONE_DIR;
      logInfo(`MOCK_DATA_FILE_ONE_DIR: actual=${actual}`);
      expect(actual).assertEqual('mockDataOne.json');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0020
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0020
     * @tc.desc      MOCK_DATA_FILE_TWO_DIR keeps value "mockDataTwo.json"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0020 begin`);
      const actual: string = MOCK_DATA_FILE_TWO_DIR;
      logInfo(`MOCK_DATA_FILE_TWO_DIR: actual=${actual}`);
      expect(actual).assertEqual('mockDataTwo.json');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0021
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0021
     * @tc.desc      CURRENT_DATA_RESOLVE_SUCCESS keeps value "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0021 begin`);
      const actual: string = CURRENT_DATA_RESOLVE_SUCCESS;
      logInfo(`CURRENT_DATA_RESOLVE_SUCCESS: actual=${actual}`);
      expect(actual).assertEqual('\u5237\u65b0\u5f53\u524d\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0022
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0022
     * @tc.desc      NEW_DATA_RESOLVE_SUCCESS keeps value "??????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0022 begin`);
      const actual: string = NEW_DATA_RESOLVE_SUCCESS;
      logInfo(`NEW_DATA_RESOLVE_SUCCESS: actual=${actual}`);
      expect(actual).assertEqual('\u66f4\u65b0\u6570\u636e\u6210\u529f');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0023
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0023
     * @tc.desc      CURRENT_DATA_TIP keeps value "??????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0023 begin`);
      const actual: string = CURRENT_DATA_TIP;
      logInfo(`CURRENT_DATA_TIP: actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0024
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0024
     * @tc.desc      NEW_DATA_TIP keeps value "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0024 begin`);
      const actual: string = NEW_DATA_TIP;
      logInfo(`NEW_DATA_TIP: actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0025
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0025
     * @tc.desc      LOAD_DEFAULT_TEXT keeps value "???????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0025 begin`);
      const actual: string = LOAD_DEFAULT_TEXT;
      logInfo(`LOAD_DEFAULT_TEXT: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u73a9\u547d\u52a0\u8f7d\u4e2d...');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0026
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0026
     * @tc.desc      LOAD_STOP_TEXT keeps value "?????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0026 begin`);
      const actual: string = LOAD_STOP_TEXT;
      logInfo(`LOAD_STOP_TEXT: actual=${actual}`);
      expect(actual).assertEqual('\u5df2\u7ecf\u5230\u5e95\u5566');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0027
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0027
     * @tc.desc      LOAD_TEXT_PULL_UP_1 keeps value "??????..."
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0027 begin`);
      const actual: string = LOAD_TEXT_PULL_UP_1;
      logInfo(`LOAD_TEXT_PULL_UP_1: actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u5728\u4e0a\u62c9\u5237\u65b0...');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0028
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0028
     * @tc.desc      LOAD_TEXT_PULL_UP_2 keeps value "????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0028 begin`);
      const actual: string = LOAD_TEXT_PULL_UP_2;
      logInfo(`LOAD_TEXT_PULL_UP_2: actual=${actual}`);
      expect(actual).assertEqual('\u653e\u5f00\u5237\u65b0');
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_REFRESH_LOGIC_CONSTANTS_0029
     * @tc.name      PullToRefresh_PullRefreshLogicConstants_0029
     * @tc.desc      DEFAULT_LOAD_IMG_HEIGHT keeps value 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_PullRefreshLogicConstants_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0029 begin`);
      const actual: number = DEFAULT_LOAD_IMG_HEIGHT;
      logInfo(`DEFAULT_LOAD_IMG_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}PullRefreshLogicConstants_0029 end`);
    });
  });
}
