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
  BAR_CONTENT_COLOR, MOVE_X, MOVE_Y, MOVE_Y2, NAVIGATION_BAR_COLOR, POINT_X, POINT_Y, STATUS_BAR_COLOR, SUB_HEIGHT,
  SUB_WIDTH, SUB_WINDOW_INNER_EVENT_ID, SUB_WINDOW_NAME, SUB_WINDOW_PAGE
} from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for WindowMoveLogic (13 cases). */
export default function windowMoveLogicConstantsTest(): void {
  describe('WindowMoveLogicConstantsTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0001
     * @tc.name      WindowManage_WindowMoveLogicConstants_0001
     * @tc.desc      POINT_X keeps value 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_WindowMoveLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0001 begin`);
      const actual: number = POINT_X;
      logInfo(`POINT_X: actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0002
     * @tc.name      WindowManage_WindowMoveLogicConstants_0002
     * @tc.desc      POINT_Y keeps value 250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_WindowMoveLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0002 begin`);
      const actual: number = POINT_Y;
      logInfo(`POINT_Y: actual=${actual}`);
      expect(actual).assertEqual(250);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0003
     * @tc.name      WindowManage_WindowMoveLogicConstants_0003
     * @tc.desc      SUB_WIDTH keeps value 320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0003 begin`);
      const actual: number = SUB_WIDTH;
      logInfo(`SUB_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(320);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0004
     * @tc.name      WindowManage_WindowMoveLogicConstants_0004
     * @tc.desc      SUB_HEIGHT keeps value 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0004 begin`);
      const actual: number = SUB_HEIGHT;
      logInfo(`SUB_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0005
     * @tc.name      WindowManage_WindowMoveLogicConstants_0005
     * @tc.desc      MOVE_X keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0005 begin`);
      const actual: number = MOVE_X;
      logInfo(`MOVE_X: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0006
     * @tc.name      WindowManage_WindowMoveLogicConstants_0006
     * @tc.desc      MOVE_Y keeps value 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0006 begin`);
      const actual: number = MOVE_Y;
      logInfo(`MOVE_Y: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0007
     * @tc.name      WindowManage_WindowMoveLogicConstants_0007
     * @tc.desc      MOVE_Y2 keeps value 300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0007 begin`);
      const actual: number = MOVE_Y2;
      logInfo(`MOVE_Y2: actual=${actual}`);
      expect(actual).assertEqual(300);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0008
     * @tc.name      WindowManage_WindowMoveLogicConstants_0008
     * @tc.desc      SUB_WINDOW_INNER_EVENT_ID keeps value 1001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0008 begin`);
      const actual: number = SUB_WINDOW_INNER_EVENT_ID;
      logInfo(`SUB_WINDOW_INNER_EVENT_ID: actual=${actual}`);
      expect(actual).assertEqual(1001);
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0009
     * @tc.name      WindowManage_WindowMoveLogicConstants_0009
     * @tc.desc      STATUS_BAR_COLOR keeps value "#ffffff"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0009 begin`);
      const actual: string = STATUS_BAR_COLOR;
      logInfo(`STATUS_BAR_COLOR: actual=${actual}`);
      expect(actual).assertEqual('#ffffff');
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0010
     * @tc.name      WindowManage_WindowMoveLogicConstants_0010
     * @tc.desc      BAR_CONTENT_COLOR keeps value "#000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0010 begin`);
      const actual: string = BAR_CONTENT_COLOR;
      logInfo(`BAR_CONTENT_COLOR: actual=${actual}`);
      expect(actual).assertEqual('#000000');
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0011
     * @tc.name      WindowManage_WindowMoveLogicConstants_0011
     * @tc.desc      SUB_WINDOW_NAME keeps value "mySubWindow"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0011 begin`);
      const actual: string = SUB_WINDOW_NAME;
      logInfo(`SUB_WINDOW_NAME: actual=${actual}`);
      expect(actual).assertEqual('mySubWindow');
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0012
     * @tc.name      WindowManage_WindowMoveLogicConstants_0012
     * @tc.desc      SUB_WINDOW_PAGE keeps value "pages/SubWindowPage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0012 begin`);
      const actual: string = SUB_WINDOW_PAGE;
      logInfo(`SUB_WINDOW_PAGE: actual=${actual}`);
      expect(actual).assertEqual('pages/SubWindowPage');
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_MOVE_LOGIC_CONSTANTS_0013
     * @tc.name      WindowManage_WindowMoveLogicConstants_0013
     * @tc.desc      NAVIGATION_BAR_COLOR keeps value "#ffffff"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowMoveLogicConstants_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0013 begin`);
      const actual: string = NAVIGATION_BAR_COLOR;
      logInfo(`NAVIGATION_BAR_COLOR: actual=${actual}`);
      expect(actual).assertEqual('#ffffff');
      logInfo(`${BUNDLE}WindowMoveLogicConstants_0013 end`);
    });
  });
}
