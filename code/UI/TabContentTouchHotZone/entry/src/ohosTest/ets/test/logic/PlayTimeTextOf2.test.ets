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
import { playTimeTextOf } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for playTimeTextOf (24 cases). */
export default function playTimeTextOf2Test(): void {
  describe('PlayTimeTextOf2Test', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0097
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0097
     * @tc.desc      playTimeTextOf(playTime=1727234.2) returns "1727234.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0097 begin`);
      const actual: string = playTimeTextOf(1727234.2);
      logInfo(`playTimeTextOf(playTime=1727234.2): actual=${actual}`);
      expect(actual).assertEqual('1727234.2');
      logInfo(`${BUNDLE}PlayTimeTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0098
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0098
     * @tc.desc      playTimeTextOf(playTime=1177477.21) returns "1177477.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0098 begin`);
      const actual: string = playTimeTextOf(1177477.21);
      logInfo(`playTimeTextOf(playTime=1177477.21): actual=${actual}`);
      expect(actual).assertEqual('1177477.21');
      logInfo(`${BUNDLE}PlayTimeTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0099
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0099
     * @tc.desc      playTimeTextOf(playTime=-306261) returns "0-306261"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0099 begin`);
      const actual: string = playTimeTextOf(-306261);
      logInfo(`playTimeTextOf(playTime=-306261): actual=${actual}`);
      expect(actual).assertEqual('0-306261');
      logInfo(`${BUNDLE}PlayTimeTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0100
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0100
     * @tc.desc      playTimeTextOf(playTime=-2420152) returns "0-2420152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0100 begin`);
      const actual: string = playTimeTextOf(-2420152);
      logInfo(`playTimeTextOf(playTime=-2420152): actual=${actual}`);
      expect(actual).assertEqual('0-2420152');
      logInfo(`${BUNDLE}PlayTimeTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0101
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0101
     * @tc.desc      playTimeTextOf(playTime=2247301.66) returns "2247301.66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0101 begin`);
      const actual: string = playTimeTextOf(2247301.66);
      logInfo(`playTimeTextOf(playTime=2247301.66): actual=${actual}`);
      expect(actual).assertEqual('2247301.66');
      logInfo(`${BUNDLE}PlayTimeTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0102
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0102
     * @tc.desc      playTimeTextOf(playTime=-474915) returns "0-474915"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0102 begin`);
      const actual: string = playTimeTextOf(-474915);
      logInfo(`playTimeTextOf(playTime=-474915): actual=${actual}`);
      expect(actual).assertEqual('0-474915');
      logInfo(`${BUNDLE}PlayTimeTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0103
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0103
     * @tc.desc      playTimeTextOf(playTime=4459830) returns "4459830"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0103 begin`);
      const actual: string = playTimeTextOf(4459830);
      logInfo(`playTimeTextOf(playTime=4459830): actual=${actual}`);
      expect(actual).assertEqual('4459830');
      logInfo(`${BUNDLE}PlayTimeTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0104
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0104
     * @tc.desc      playTimeTextOf(playTime=594282.09) returns "594282.09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0104 begin`);
      const actual: string = playTimeTextOf(594282.09);
      logInfo(`playTimeTextOf(playTime=594282.09): actual=${actual}`);
      expect(actual).assertEqual('594282.09');
      logInfo(`${BUNDLE}PlayTimeTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0105
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0105
     * @tc.desc      playTimeTextOf(playTime=753472.94) returns "753472.94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0105 begin`);
      const actual: string = playTimeTextOf(753472.94);
      logInfo(`playTimeTextOf(playTime=753472.94): actual=${actual}`);
      expect(actual).assertEqual('753472.94');
      logInfo(`${BUNDLE}PlayTimeTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0106
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0106
     * @tc.desc      playTimeTextOf(playTime=6153037) returns "6153037"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0106 begin`);
      const actual: string = playTimeTextOf(6153037);
      logInfo(`playTimeTextOf(playTime=6153037): actual=${actual}`);
      expect(actual).assertEqual('6153037');
      logInfo(`${BUNDLE}PlayTimeTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0107
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0107
     * @tc.desc      playTimeTextOf(playTime=3134135.16) returns "3134135.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0107 begin`);
      const actual: string = playTimeTextOf(3134135.16);
      logInfo(`playTimeTextOf(playTime=3134135.16): actual=${actual}`);
      expect(actual).assertEqual('3134135.16');
      logInfo(`${BUNDLE}PlayTimeTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0108
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0108
     * @tc.desc      playTimeTextOf(playTime=-2086725) returns "0-2086725"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0108 begin`);
      const actual: string = playTimeTextOf(-2086725);
      logInfo(`playTimeTextOf(playTime=-2086725): actual=${actual}`);
      expect(actual).assertEqual('0-2086725');
      logInfo(`${BUNDLE}PlayTimeTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0109
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0109
     * @tc.desc      playTimeTextOf(playTime=-2770820) returns "0-2770820"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0109 begin`);
      const actual: string = playTimeTextOf(-2770820);
      logInfo(`playTimeTextOf(playTime=-2770820): actual=${actual}`);
      expect(actual).assertEqual('0-2770820');
      logInfo(`${BUNDLE}PlayTimeTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0110
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0110
     * @tc.desc      playTimeTextOf(playTime=3039412.7) returns "3039412.7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0110 begin`);
      const actual: string = playTimeTextOf(3039412.7);
      logInfo(`playTimeTextOf(playTime=3039412.7): actual=${actual}`);
      expect(actual).assertEqual('3039412.7');
      logInfo(`${BUNDLE}PlayTimeTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0111
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0111
     * @tc.desc      playTimeTextOf(playTime=7160890) returns "7160890"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0111 begin`);
      const actual: string = playTimeTextOf(7160890);
      logInfo(`playTimeTextOf(playTime=7160890): actual=${actual}`);
      expect(actual).assertEqual('7160890');
      logInfo(`${BUNDLE}PlayTimeTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0112
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0112
     * @tc.desc      playTimeTextOf(playTime=6923472) returns "6923472"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0112 begin`);
      const actual: string = playTimeTextOf(6923472);
      logInfo(`playTimeTextOf(playTime=6923472): actual=${actual}`);
      expect(actual).assertEqual('6923472');
      logInfo(`${BUNDLE}PlayTimeTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0113
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0113
     * @tc.desc      playTimeTextOf(playTime=850187.56) returns "850187.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0113 begin`);
      const actual: string = playTimeTextOf(850187.56);
      logInfo(`playTimeTextOf(playTime=850187.56): actual=${actual}`);
      expect(actual).assertEqual('850187.56');
      logInfo(`${BUNDLE}PlayTimeTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0114
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0114
     * @tc.desc      playTimeTextOf(playTime=3544680) returns "3544680"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0114 begin`);
      const actual: string = playTimeTextOf(3544680);
      logInfo(`playTimeTextOf(playTime=3544680): actual=${actual}`);
      expect(actual).assertEqual('3544680');
      logInfo(`${BUNDLE}PlayTimeTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0115
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0115
     * @tc.desc      playTimeTextOf(playTime=5980477) returns "5980477"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0115 begin`);
      const actual: string = playTimeTextOf(5980477);
      logInfo(`playTimeTextOf(playTime=5980477): actual=${actual}`);
      expect(actual).assertEqual('5980477');
      logInfo(`${BUNDLE}PlayTimeTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0116
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0116
     * @tc.desc      playTimeTextOf(playTime=2616654) returns "2616654"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0116 begin`);
      const actual: string = playTimeTextOf(2616654);
      logInfo(`playTimeTextOf(playTime=2616654): actual=${actual}`);
      expect(actual).assertEqual('2616654');
      logInfo(`${BUNDLE}PlayTimeTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0117
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0117
     * @tc.desc      playTimeTextOf(playTime=3567352) returns "3567352"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0117 begin`);
      const actual: string = playTimeTextOf(3567352);
      logInfo(`playTimeTextOf(playTime=3567352): actual=${actual}`);
      expect(actual).assertEqual('3567352');
      logInfo(`${BUNDLE}PlayTimeTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0118
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0118
     * @tc.desc      playTimeTextOf(playTime=848163.76) returns "848163.76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0118 begin`);
      const actual: string = playTimeTextOf(848163.76);
      logInfo(`playTimeTextOf(playTime=848163.76): actual=${actual}`);
      expect(actual).assertEqual('848163.76');
      logInfo(`${BUNDLE}PlayTimeTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0119
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0119
     * @tc.desc      playTimeTextOf(playTime=5495482) returns "5495482"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0119 begin`);
      const actual: string = playTimeTextOf(5495482);
      logInfo(`playTimeTextOf(playTime=5495482): actual=${actual}`);
      expect(actual).assertEqual('5495482');
      logInfo(`${BUNDLE}PlayTimeTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_PLAY_TIME_TEXT_OF_0120
     * @tc.name      TabContentTouchHotZone_PlayTimeTextOf_0120
     * @tc.desc      playTimeTextOf(playTime=5390449) returns "5390449"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabContentTouchHotZone_PlayTimeTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PlayTimeTextOf_0120 begin`);
      const actual: string = playTimeTextOf(5390449);
      logInfo(`playTimeTextOf(playTime=5390449): actual=${actual}`);
      expect(actual).assertEqual('5390449');
      logInfo(`${BUNDLE}PlayTimeTextOf_0120 end`);
    });
  });
}
