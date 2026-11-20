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
import { windowEventMessageOf } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for windowEventMessageOf (90 cases). */
export default function windowEventMessageOfTest(): void {
  describe('WindowEventMessageOfTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0001
     * @tc.name      WindowManage_WindowEventMessageOf_0001
     * @tc.desc      windowEventMessageOf(eventCode="1") returns "foreground"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_WindowEventMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0001 begin`);
      const actual: string = windowEventMessageOf('1');
      logInfo(`windowEventMessageOf(eventCode="1"): actual=${actual}`);
      expect(actual).assertEqual('foreground');
      logInfo(`${BUNDLE}WindowEventMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0002
     * @tc.name      WindowManage_WindowEventMessageOf_0002
     * @tc.desc      windowEventMessageOf(eventCode="foreground") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_WindowEventMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0002 begin`);
      const actual: string = windowEventMessageOf('foreground');
      logInfo(`windowEventMessageOf(eventCode="foreground"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0003
     * @tc.name      WindowManage_WindowEventMessageOf_0003
     * @tc.desc      windowEventMessageOf(eventCode="2") returns "get_focus"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0003 begin`);
      const actual: string = windowEventMessageOf('2');
      logInfo(`windowEventMessageOf(eventCode="2"): actual=${actual}`);
      expect(actual).assertEqual('get_focus');
      logInfo(`${BUNDLE}WindowEventMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0004
     * @tc.name      WindowManage_WindowEventMessageOf_0004
     * @tc.desc      windowEventMessageOf(eventCode="3") returns "lose_focus"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0004 begin`);
      const actual: string = windowEventMessageOf('3');
      logInfo(`windowEventMessageOf(eventCode="3"): actual=${actual}`);
      expect(actual).assertEqual('lose_focus');
      logInfo(`${BUNDLE}WindowEventMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0005
     * @tc.name      WindowManage_WindowEventMessageOf_0005
     * @tc.desc      windowEventMessageOf(eventCode="4") returns "background"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0005 begin`);
      const actual: string = windowEventMessageOf('4');
      logInfo(`windowEventMessageOf(eventCode="4"): actual=${actual}`);
      expect(actual).assertEqual('background');
      logInfo(`${BUNDLE}WindowEventMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0006
     * @tc.name      WindowManage_WindowEventMessageOf_0006
     * @tc.desc      windowEventMessageOf(eventCode="get_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0006 begin`);
      const actual: string = windowEventMessageOf('get_focus');
      logInfo(`windowEventMessageOf(eventCode="get_focus"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0007
     * @tc.name      WindowManage_WindowEventMessageOf_0007
     * @tc.desc      windowEventMessageOf(eventCode="lose_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0007 begin`);
      const actual: string = windowEventMessageOf('lose_focus');
      logInfo(`windowEventMessageOf(eventCode="lose_focus"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0008
     * @tc.name      WindowManage_WindowEventMessageOf_0008
     * @tc.desc      windowEventMessageOf(eventCode="background") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0008 begin`);
      const actual: string = windowEventMessageOf('background');
      logInfo(`windowEventMessageOf(eventCode="background"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0009
     * @tc.name      WindowManage_WindowEventMessageOf_0009
     * @tc.desc      windowEventMessageOf(eventCode="unknown") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_WindowEventMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0009 begin`);
      const actual: string = windowEventMessageOf('unknown');
      logInfo(`windowEventMessageOf(eventCode="unknown"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0010
     * @tc.name      WindowManage_WindowEventMessageOf_0010
     * @tc.desc      windowEventMessageOf(eventCode="1x") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0010 begin`);
      const actual: string = windowEventMessageOf('1x');
      logInfo(`windowEventMessageOf(eventCode="1x"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0011
     * @tc.name      WindowManage_WindowEventMessageOf_0011
     * @tc.desc      windowEventMessageOf(eventCode="FOREGROUND") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0011 begin`);
      const actual: string = windowEventMessageOf('FOREGROUND');
      logInfo(`windowEventMessageOf(eventCode="FOREGROUND"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0012
     * @tc.name      WindowManage_WindowEventMessageOf_0012
     * @tc.desc      windowEventMessageOf(eventCode="foregroun") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0012 begin`);
      const actual: string = windowEventMessageOf('foregroun');
      logInfo(`windowEventMessageOf(eventCode="foregroun"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0013
     * @tc.name      WindowManage_WindowEventMessageOf_0013
     * @tc.desc      windowEventMessageOf(eventCode="foregroundx") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0013 begin`);
      const actual: string = windowEventMessageOf('foregroundx');
      logInfo(`windowEventMessageOf(eventCode="foregroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0014
     * @tc.name      WindowManage_WindowEventMessageOf_0014
     * @tc.desc      windowEventMessageOf(eventCode="2x") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0014 begin`);
      const actual: string = windowEventMessageOf('2x');
      logInfo(`windowEventMessageOf(eventCode="2x"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0015
     * @tc.name      WindowManage_WindowEventMessageOf_0015
     * @tc.desc      windowEventMessageOf(eventCode="GET_FOCUS") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0015 begin`);
      const actual: string = windowEventMessageOf('GET_FOCUS');
      logInfo(`windowEventMessageOf(eventCode="GET_FOCUS"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0016
     * @tc.name      WindowManage_WindowEventMessageOf_0016
     * @tc.desc      windowEventMessageOf(eventCode="get_focu") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0016 begin`);
      const actual: string = windowEventMessageOf('get_focu');
      logInfo(`windowEventMessageOf(eventCode="get_focu"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0017
     * @tc.name      WindowManage_WindowEventMessageOf_0017
     * @tc.desc      windowEventMessageOf(eventCode="get_focusx") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0017 begin`);
      const actual: string = windowEventMessageOf('get_focusx');
      logInfo(`windowEventMessageOf(eventCode="get_focusx"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0018
     * @tc.name      WindowManage_WindowEventMessageOf_0018
     * @tc.desc      windowEventMessageOf(eventCode="3x") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0018 begin`);
      const actual: string = windowEventMessageOf('3x');
      logInfo(`windowEventMessageOf(eventCode="3x"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0019
     * @tc.name      WindowManage_WindowEventMessageOf_0019
     * @tc.desc      windowEventMessageOf(eventCode="LOSE_FOCUS") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0019 begin`);
      const actual: string = windowEventMessageOf('LOSE_FOCUS');
      logInfo(`windowEventMessageOf(eventCode="LOSE_FOCUS"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0020
     * @tc.name      WindowManage_WindowEventMessageOf_0020
     * @tc.desc      windowEventMessageOf(eventCode="lose_focu") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0020 begin`);
      const actual: string = windowEventMessageOf('lose_focu');
      logInfo(`windowEventMessageOf(eventCode="lose_focu"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0021
     * @tc.name      WindowManage_WindowEventMessageOf_0021
     * @tc.desc      windowEventMessageOf(eventCode="lose_focusx") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0021 begin`);
      const actual: string = windowEventMessageOf('lose_focusx');
      logInfo(`windowEventMessageOf(eventCode="lose_focu...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0022
     * @tc.name      WindowManage_WindowEventMessageOf_0022
     * @tc.desc      windowEventMessageOf(eventCode="123456") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0022 begin`);
      const actual: string = windowEventMessageOf('123456');
      logInfo(`windowEventMessageOf(eventCode="123456"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0023
     * @tc.name      WindowManage_WindowEventMessageOf_0023
     * @tc.desc      windowEventMessageOf(eventCode="000000") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0023 begin`);
      const actual: string = windowEventMessageOf('000000');
      logInfo(`windowEventMessageOf(eventCode="000000"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0024
     * @tc.name      WindowManage_WindowEventMessageOf_0024
     * @tc.desc      windowEventMessageOf(eventCode="12345") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0024 begin`);
      const actual: string = windowEventMessageOf('12345');
      logInfo(`windowEventMessageOf(eventCode="12345"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0025
     * @tc.name      WindowManage_WindowEventMessageOf_0025
     * @tc.desc      windowEventMessageOf(eventCode="1234567") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0025 begin`);
      const actual: string = windowEventMessageOf('1234567');
      logInfo(`windowEventMessageOf(eventCode="1234567"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0026
     * @tc.name      WindowManage_WindowEventMessageOf_0026
     * @tc.desc      windowEventMessageOf(eventCode="abc123") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0026 begin`);
      const actual: string = windowEventMessageOf('abc123');
      logInfo(`windowEventMessageOf(eventCode="abc123"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0027
     * @tc.name      WindowManage_WindowEventMessageOf_0027
     * @tc.desc      windowEventMessageOf(eventCode="") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0027 begin`);
      const actual: string = windowEventMessageOf('');
      logInfo(`windowEventMessageOf(eventCode=""): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0028
     * @tc.name      WindowManage_WindowEventMessageOf_0028
     * @tc.desc      windowEventMessageOf(eventCode="a") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0028 begin`);
      const actual: string = windowEventMessageOf('a');
      logInfo(`windowEventMessageOf(eventCode="a"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0029
     * @tc.name      WindowManage_WindowEventMessageOf_0029
     * @tc.desc      windowEventMessageOf(eventCode="abc") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0029 begin`);
      const actual: string = windowEventMessageOf('abc');
      logInfo(`windowEventMessageOf(eventCode="abc"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0030
     * @tc.name      WindowManage_WindowEventMessageOf_0030
     * @tc.desc      windowEventMessageOf(eventCode="Hello World") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0030 begin`);
      const actual: string = windowEventMessageOf('Hello World');
      logInfo(`windowEventMessageOf(eventCode="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0031
     * @tc.name      WindowManage_WindowEventMessageOf_0031
     * @tc.desc      windowEventMessageOf(eventCode=" ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0031 begin`);
      const actual: string = windowEventMessageOf(' ');
      logInfo(`windowEventMessageOf(eventCode=" "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0032
     * @tc.name      WindowManage_WindowEventMessageOf_0032
     * @tc.desc      windowEventMessageOf(eventCode="123") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0032 begin`);
      const actual: string = windowEventMessageOf('123');
      logInfo(`windowEventMessageOf(eventCode="123"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0033
     * @tc.name      WindowManage_WindowEventMessageOf_0033
     * @tc.desc      windowEventMessageOf(eventCode=" 1 ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0033 begin`);
      const actual: string = windowEventMessageOf(' 1 ');
      logInfo(`windowEventMessageOf(eventCode=" 1 "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0034
     * @tc.name      WindowManage_WindowEventMessageOf_0034
     * @tc.desc      windowEventMessageOf(eventCode="11") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0034 begin`);
      const actual: string = windowEventMessageOf('11');
      logInfo(`windowEventMessageOf(eventCode="11"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0035
     * @tc.name      WindowManage_WindowEventMessageOf_0035
     * @tc.desc      windowEventMessageOf(eventCode="1_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0035 begin`);
      const actual: string = windowEventMessageOf('1_1');
      logInfo(`windowEventMessageOf(eventCode="1_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0036
     * @tc.name      WindowManage_WindowEventMessageOf_0036
     * @tc.desc      windowEventMessageOf(eventCode="x1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0036 begin`);
      const actual: string = windowEventMessageOf('x1');
      logInfo(`windowEventMessageOf(eventCode="x1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0037
     * @tc.name      WindowManage_WindowEventMessageOf_0037
     * @tc.desc      windowEventMessageOf(eventCode=" foreground ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0037 begin`);
      const actual: string = windowEventMessageOf(' foreground ');
      logInfo(`windowEventMessageOf(eventCode=" foregrou...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0038
     * @tc.name      WindowManage_WindowEventMessageOf_0038
     * @tc.desc      windowEventMessageOf(eventCode="foregroundforeground") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0038 begin`);
      const actual: string = windowEventMessageOf('foregroundforeground');
      logInfo(`windowEventMessageOf(eventCode="foregroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0039
     * @tc.name      WindowManage_WindowEventMessageOf_0039
     * @tc.desc      windowEventMessageOf(eventCode="foreground_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0039 begin`);
      const actual: string = windowEventMessageOf('foreground_1');
      logInfo(`windowEventMessageOf(eventCode="foregroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0040
     * @tc.name      WindowManage_WindowEventMessageOf_0040
     * @tc.desc      windowEventMessageOf(eventCode="xforeground") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0040 begin`);
      const actual: string = windowEventMessageOf('xforeground');
      logInfo(`windowEventMessageOf(eventCode="xforegrou...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0041
     * @tc.name      WindowManage_WindowEventMessageOf_0041
     * @tc.desc      windowEventMessageOf(eventCode=" 2 ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0041 begin`);
      const actual: string = windowEventMessageOf(' 2 ');
      logInfo(`windowEventMessageOf(eventCode=" 2 "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0042
     * @tc.name      WindowManage_WindowEventMessageOf_0042
     * @tc.desc      windowEventMessageOf(eventCode="22") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0042 begin`);
      const actual: string = windowEventMessageOf('22');
      logInfo(`windowEventMessageOf(eventCode="22"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0043
     * @tc.name      WindowManage_WindowEventMessageOf_0043
     * @tc.desc      windowEventMessageOf(eventCode="2_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0043 begin`);
      const actual: string = windowEventMessageOf('2_1');
      logInfo(`windowEventMessageOf(eventCode="2_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0044
     * @tc.name      WindowManage_WindowEventMessageOf_0044
     * @tc.desc      windowEventMessageOf(eventCode="x2") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0044 begin`);
      const actual: string = windowEventMessageOf('x2');
      logInfo(`windowEventMessageOf(eventCode="x2"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0045
     * @tc.name      WindowManage_WindowEventMessageOf_0045
     * @tc.desc      windowEventMessageOf(eventCode=" get_focus ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0045 begin`);
      const actual: string = windowEventMessageOf(' get_focus ');
      logInfo(`windowEventMessageOf(eventCode=" get_focu...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0046
     * @tc.name      WindowManage_WindowEventMessageOf_0046
     * @tc.desc      windowEventMessageOf(eventCode="get_focusget_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0046 begin`);
      const actual: string = windowEventMessageOf('get_focusget_focus');
      logInfo(`windowEventMessageOf(eventCode="get_focus...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0047
     * @tc.name      WindowManage_WindowEventMessageOf_0047
     * @tc.desc      windowEventMessageOf(eventCode="get_focus_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0047 begin`);
      const actual: string = windowEventMessageOf('get_focus_1');
      logInfo(`windowEventMessageOf(eventCode="get_focus...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0048
     * @tc.name      WindowManage_WindowEventMessageOf_0048
     * @tc.desc      windowEventMessageOf(eventCode="xget_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0048 begin`);
      const actual: string = windowEventMessageOf('xget_focus');
      logInfo(`windowEventMessageOf(eventCode="xget_focus"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0049
     * @tc.name      WindowManage_WindowEventMessageOf_0049
     * @tc.desc      windowEventMessageOf(eventCode=" 3 ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0049 begin`);
      const actual: string = windowEventMessageOf(' 3 ');
      logInfo(`windowEventMessageOf(eventCode=" 3 "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0050
     * @tc.name      WindowManage_WindowEventMessageOf_0050
     * @tc.desc      windowEventMessageOf(eventCode="33") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0050 begin`);
      const actual: string = windowEventMessageOf('33');
      logInfo(`windowEventMessageOf(eventCode="33"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0051
     * @tc.name      WindowManage_WindowEventMessageOf_0051
     * @tc.desc      windowEventMessageOf(eventCode="3_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0051 begin`);
      const actual: string = windowEventMessageOf('3_1');
      logInfo(`windowEventMessageOf(eventCode="3_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0052
     * @tc.name      WindowManage_WindowEventMessageOf_0052
     * @tc.desc      windowEventMessageOf(eventCode="x3") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0052 begin`);
      const actual: string = windowEventMessageOf('x3');
      logInfo(`windowEventMessageOf(eventCode="x3"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0053
     * @tc.name      WindowManage_WindowEventMessageOf_0053
     * @tc.desc      windowEventMessageOf(eventCode=" lose_focus ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0053 begin`);
      const actual: string = windowEventMessageOf(' lose_focus ');
      logInfo(`windowEventMessageOf(eventCode=" lose_foc...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0054
     * @tc.name      WindowManage_WindowEventMessageOf_0054
     * @tc.desc      windowEventMessageOf(eventCode="lose_focuslose_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0054 begin`);
      const actual: string = windowEventMessageOf('lose_focuslose_focus');
      logInfo(`windowEventMessageOf(eventCode="lose_focu...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0055
     * @tc.name      WindowManage_WindowEventMessageOf_0055
     * @tc.desc      windowEventMessageOf(eventCode="lose_focus_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0055 begin`);
      const actual: string = windowEventMessageOf('lose_focus_1');
      logInfo(`windowEventMessageOf(eventCode="lose_focu...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0056
     * @tc.name      WindowManage_WindowEventMessageOf_0056
     * @tc.desc      windowEventMessageOf(eventCode="xlose_focus") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0056 begin`);
      const actual: string = windowEventMessageOf('xlose_focus');
      logInfo(`windowEventMessageOf(eventCode="xlose_foc...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0057
     * @tc.name      WindowManage_WindowEventMessageOf_0057
     * @tc.desc      windowEventMessageOf(eventCode=" 4 ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0057 begin`);
      const actual: string = windowEventMessageOf(' 4 ');
      logInfo(`windowEventMessageOf(eventCode=" 4 "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0058
     * @tc.name      WindowManage_WindowEventMessageOf_0058
     * @tc.desc      windowEventMessageOf(eventCode="44") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0058 begin`);
      const actual: string = windowEventMessageOf('44');
      logInfo(`windowEventMessageOf(eventCode="44"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0059
     * @tc.name      WindowManage_WindowEventMessageOf_0059
     * @tc.desc      windowEventMessageOf(eventCode="4_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0059 begin`);
      const actual: string = windowEventMessageOf('4_1');
      logInfo(`windowEventMessageOf(eventCode="4_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0060
     * @tc.name      WindowManage_WindowEventMessageOf_0060
     * @tc.desc      windowEventMessageOf(eventCode="x4") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0060 begin`);
      const actual: string = windowEventMessageOf('x4');
      logInfo(`windowEventMessageOf(eventCode="x4"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0061
     * @tc.name      WindowManage_WindowEventMessageOf_0061
     * @tc.desc      windowEventMessageOf(eventCode=" background ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0061 begin`);
      const actual: string = windowEventMessageOf(' background ');
      logInfo(`windowEventMessageOf(eventCode=" backgrou...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0062
     * @tc.name      WindowManage_WindowEventMessageOf_0062
     * @tc.desc      windowEventMessageOf(eventCode="backgroundbackground") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0062 begin`);
      const actual: string = windowEventMessageOf('backgroundbackground');
      logInfo(`windowEventMessageOf(eventCode="backgroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0063
     * @tc.name      WindowManage_WindowEventMessageOf_0063
     * @tc.desc      windowEventMessageOf(eventCode="background_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0063 begin`);
      const actual: string = windowEventMessageOf('background_1');
      logInfo(`windowEventMessageOf(eventCode="backgroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0064
     * @tc.name      WindowManage_WindowEventMessageOf_0064
     * @tc.desc      windowEventMessageOf(eventCode="xbackground") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0064 begin`);
      const actual: string = windowEventMessageOf('xbackground');
      logInfo(`windowEventMessageOf(eventCode="xbackgrou...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0065
     * @tc.name      WindowManage_WindowEventMessageOf_0065
     * @tc.desc      windowEventMessageOf(eventCode=" unknown ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0065 begin`);
      const actual: string = windowEventMessageOf(' unknown ');
      logInfo(`windowEventMessageOf(eventCode=" unknown "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0066
     * @tc.name      WindowManage_WindowEventMessageOf_0066
     * @tc.desc      windowEventMessageOf(eventCode="unknownunknown") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0066 begin`);
      const actual: string = windowEventMessageOf('unknownunknown');
      logInfo(`windowEventMessageOf(eventCode="unknownun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0067
     * @tc.name      WindowManage_WindowEventMessageOf_0067
     * @tc.desc      windowEventMessageOf(eventCode="unknown_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0067 begin`);
      const actual: string = windowEventMessageOf('unknown_1');
      logInfo(`windowEventMessageOf(eventCode="unknown_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0068
     * @tc.name      WindowManage_WindowEventMessageOf_0068
     * @tc.desc      windowEventMessageOf(eventCode="xunknown") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0068 begin`);
      const actual: string = windowEventMessageOf('xunknown');
      logInfo(`windowEventMessageOf(eventCode="xunknown"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0069
     * @tc.name      WindowManage_WindowEventMessageOf_0069
     * @tc.desc      windowEventMessageOf(eventCode=" 1x ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0069 begin`);
      const actual: string = windowEventMessageOf(' 1x ');
      logInfo(`windowEventMessageOf(eventCode=" 1x "): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0070
     * @tc.name      WindowManage_WindowEventMessageOf_0070
     * @tc.desc      windowEventMessageOf(eventCode="1x1x") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0070 begin`);
      const actual: string = windowEventMessageOf('1x1x');
      logInfo(`windowEventMessageOf(eventCode="1x1x"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0071
     * @tc.name      WindowManage_WindowEventMessageOf_0071
     * @tc.desc      windowEventMessageOf(eventCode="1x_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0071 begin`);
      const actual: string = windowEventMessageOf('1x_1');
      logInfo(`windowEventMessageOf(eventCode="1x_1"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0072
     * @tc.name      WindowManage_WindowEventMessageOf_0072
     * @tc.desc      windowEventMessageOf(eventCode="x1x") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0072 begin`);
      const actual: string = windowEventMessageOf('x1x');
      logInfo(`windowEventMessageOf(eventCode="x1x"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0073
     * @tc.name      WindowManage_WindowEventMessageOf_0073
     * @tc.desc      windowEventMessageOf(eventCode=" FOREGROUND ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0073 begin`);
      const actual: string = windowEventMessageOf(' FOREGROUND ');
      logInfo(`windowEventMessageOf(eventCode=" FOREGROU...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0074
     * @tc.name      WindowManage_WindowEventMessageOf_0074
     * @tc.desc      windowEventMessageOf(eventCode="FOREGROUNDFOREGROUND") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0074 begin`);
      const actual: string = windowEventMessageOf('FOREGROUNDFOREGROUND');
      logInfo(`windowEventMessageOf(eventCode="FOREGROUN...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0075
     * @tc.name      WindowManage_WindowEventMessageOf_0075
     * @tc.desc      windowEventMessageOf(eventCode="FOREGROUND_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0075 begin`);
      const actual: string = windowEventMessageOf('FOREGROUND_1');
      logInfo(`windowEventMessageOf(eventCode="FOREGROUN...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0076
     * @tc.name      WindowManage_WindowEventMessageOf_0076
     * @tc.desc      windowEventMessageOf(eventCode="xFOREGROUND") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0076 begin`);
      const actual: string = windowEventMessageOf('xFOREGROUND');
      logInfo(`windowEventMessageOf(eventCode="xFOREGROU...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0077
     * @tc.name      WindowManage_WindowEventMessageOf_0077
     * @tc.desc      windowEventMessageOf(eventCode=" foregroun ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0077 begin`);
      const actual: string = windowEventMessageOf(' foregroun ');
      logInfo(`windowEventMessageOf(eventCode=" foregrou...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0078
     * @tc.name      WindowManage_WindowEventMessageOf_0078
     * @tc.desc      windowEventMessageOf(eventCode="foregrounforegroun") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0078 begin`);
      const actual: string = windowEventMessageOf('foregrounforegroun');
      logInfo(`windowEventMessageOf(eventCode="foregroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0079
     * @tc.name      WindowManage_WindowEventMessageOf_0079
     * @tc.desc      windowEventMessageOf(eventCode="foregroun_1") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0079 begin`);
      const actual: string = windowEventMessageOf('foregroun_1');
      logInfo(`windowEventMessageOf(eventCode="foregroun...: actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0080
     * @tc.name      WindowManage_WindowEventMessageOf_0080
     * @tc.desc      windowEventMessageOf(eventCode="xforegroun") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_WindowEventMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0080 begin`);
      const actual: string = windowEventMessageOf('xforegroun');
      logInfo(`windowEventMessageOf(eventCode="xforegroun"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0081
     * @tc.name      WindowManage_WindowEventMessageOf_0081
     * @tc.desc      windowEventMessageOf(eventCode="xeGw3") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0081 begin`);
      const actual: string = windowEventMessageOf('xeGw3');
      logInfo(`windowEventMessageOf(eventCode="xeGw3"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0082
     * @tc.name      WindowManage_WindowEventMessageOf_0082
     * @tc.desc      windowEventMessageOf(eventCode="CIS") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0082 begin`);
      const actual: string = windowEventMessageOf('CIS');
      logInfo(`windowEventMessageOf(eventCode="CIS"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0083
     * @tc.name      WindowManage_WindowEventMessageOf_0083
     * @tc.desc      windowEventMessageOf(eventCode="N78nJ") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0083 begin`);
      const actual: string = windowEventMessageOf('N78nJ');
      logInfo(`windowEventMessageOf(eventCode="N78nJ"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0084
     * @tc.name      WindowManage_WindowEventMessageOf_0084
     * @tc.desc      windowEventMessageOf(eventCode="J") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0084 begin`);
      const actual: string = windowEventMessageOf('J');
      logInfo(`windowEventMessageOf(eventCode="J"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0085
     * @tc.name      WindowManage_WindowEventMessageOf_0085
     * @tc.desc      windowEventMessageOf(eventCode="JN6b") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0085 begin`);
      const actual: string = windowEventMessageOf('JN6b');
      logInfo(`windowEventMessageOf(eventCode="JN6b"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0086
     * @tc.name      WindowManage_WindowEventMessageOf_0086
     * @tc.desc      windowEventMessageOf(eventCode="GJ2mVxtH") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0086 begin`);
      const actual: string = windowEventMessageOf('GJ2mVxtH');
      logInfo(`windowEventMessageOf(eventCode="GJ2mVxtH"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0087
     * @tc.name      WindowManage_WindowEventMessageOf_0087
     * @tc.desc      windowEventMessageOf(eventCode="LBtJvUBcuX") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0087 begin`);
      const actual: string = windowEventMessageOf('LBtJvUBcuX');
      logInfo(`windowEventMessageOf(eventCode="LBtJvUBcuX"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0088
     * @tc.name      WindowManage_WindowEventMessageOf_0088
     * @tc.desc      windowEventMessageOf(eventCode="ESq") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0088 begin`);
      const actual: string = windowEventMessageOf('ESq');
      logInfo(`windowEventMessageOf(eventCode="ESq"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0089
     * @tc.name      WindowManage_WindowEventMessageOf_0089
     * @tc.desc      windowEventMessageOf(eventCode="X") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0089 begin`);
      const actual: string = windowEventMessageOf('X');
      logInfo(`windowEventMessageOf(eventCode="X"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_WINDOW_EVENT_MESSAGE_OF_0090
     * @tc.name      WindowManage_WindowEventMessageOf_0090
     * @tc.desc      windowEventMessageOf(eventCode="vQS8") returns "unknown"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_WindowEventMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}WindowEventMessageOf_0090 begin`);
      const actual: string = windowEventMessageOf('vQS8');
      logInfo(`windowEventMessageOf(eventCode="vQS8"): actual=${actual}`);
      expect(actual).assertEqual('unknown');
      logInfo(`${BUNDLE}WindowEventMessageOf_0090 end`);
    });
  });
}
