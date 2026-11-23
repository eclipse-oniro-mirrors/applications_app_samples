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
import { countdownTextOf } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for countdownTextOf (96 cases). */
export default function countdownTextOf2Test(): void {
  describe('CountdownTextOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0097
     * @tc.name      WindowStartIcon_CountdownTextOf_0097
     * @tc.desc      countdownTextOf(count=17.12) returns "17.12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0097 begin`);
      const actual: string = countdownTextOf(17.12);
      logInfo(`countdownTextOf(count=17.12): actual=${actual}`);
      expect(actual).assertEqual('17.12');
      logInfo(`${BUNDLE}CountdownTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0098
     * @tc.name      WindowStartIcon_CountdownTextOf_0098
     * @tc.desc      countdownTextOf(count=116) returns "116"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0098 begin`);
      const actual: string = countdownTextOf(116);
      logInfo(`countdownTextOf(count=116): actual=${actual}`);
      expect(actual).assertEqual('116');
      logInfo(`${BUNDLE}CountdownTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0099
     * @tc.name      WindowStartIcon_CountdownTextOf_0099
     * @tc.desc      countdownTextOf(count=48.36) returns "48.36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0099 begin`);
      const actual: string = countdownTextOf(48.36);
      logInfo(`countdownTextOf(count=48.36): actual=${actual}`);
      expect(actual).assertEqual('48.36');
      logInfo(`${BUNDLE}CountdownTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0100
     * @tc.name      WindowStartIcon_CountdownTextOf_0100
     * @tc.desc      countdownTextOf(count=102) returns "102"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0100 begin`);
      const actual: string = countdownTextOf(102);
      logInfo(`countdownTextOf(count=102): actual=${actual}`);
      expect(actual).assertEqual('102');
      logInfo(`${BUNDLE}CountdownTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0101
     * @tc.name      WindowStartIcon_CountdownTextOf_0101
     * @tc.desc      countdownTextOf(count=149) returns "149"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0101 begin`);
      const actual: string = countdownTextOf(149);
      logInfo(`countdownTextOf(count=149): actual=${actual}`);
      expect(actual).assertEqual('149');
      logInfo(`${BUNDLE}CountdownTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0102
     * @tc.name      WindowStartIcon_CountdownTextOf_0102
     * @tc.desc      countdownTextOf(count=29.45) returns "29.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0102 begin`);
      const actual: string = countdownTextOf(29.45);
      logInfo(`countdownTextOf(count=29.45): actual=${actual}`);
      expect(actual).assertEqual('29.45');
      logInfo(`${BUNDLE}CountdownTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0103
     * @tc.name      WindowStartIcon_CountdownTextOf_0103
     * @tc.desc      countdownTextOf(count=15.94) returns "15.94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0103 begin`);
      const actual: string = countdownTextOf(15.94);
      logInfo(`countdownTextOf(count=15.94): actual=${actual}`);
      expect(actual).assertEqual('15.94');
      logInfo(`${BUNDLE}CountdownTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0104
     * @tc.name      WindowStartIcon_CountdownTextOf_0104
     * @tc.desc      countdownTextOf(count=20.93) returns "20.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0104 begin`);
      const actual: string = countdownTextOf(20.93);
      logInfo(`countdownTextOf(count=20.93): actual=${actual}`);
      expect(actual).assertEqual('20.93');
      logInfo(`${BUNDLE}CountdownTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0105
     * @tc.name      WindowStartIcon_CountdownTextOf_0105
     * @tc.desc      countdownTextOf(count=-75) returns "-75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0105 begin`);
      const actual: string = countdownTextOf(-75);
      logInfo(`countdownTextOf(count=-75): actual=${actual}`);
      expect(actual).assertEqual('-75');
      logInfo(`${BUNDLE}CountdownTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0106
     * @tc.name      WindowStartIcon_CountdownTextOf_0106
     * @tc.desc      countdownTextOf(count=95.66) returns "95.66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0106 begin`);
      const actual: string = countdownTextOf(95.66);
      logInfo(`countdownTextOf(count=95.66): actual=${actual}`);
      expect(actual).assertEqual('95.66');
      logInfo(`${BUNDLE}CountdownTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0107
     * @tc.name      WindowStartIcon_CountdownTextOf_0107
     * @tc.desc      countdownTextOf(count=-14) returns "-14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0107 begin`);
      const actual: string = countdownTextOf(-14);
      logInfo(`countdownTextOf(count=-14): actual=${actual}`);
      expect(actual).assertEqual('-14');
      logInfo(`${BUNDLE}CountdownTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0108
     * @tc.name      WindowStartIcon_CountdownTextOf_0108
     * @tc.desc      countdownTextOf(count=97) returns "97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0108 begin`);
      const actual: string = countdownTextOf(97);
      logInfo(`countdownTextOf(count=97): actual=${actual}`);
      expect(actual).assertEqual('97');
      logInfo(`${BUNDLE}CountdownTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0109
     * @tc.name      WindowStartIcon_CountdownTextOf_0109
     * @tc.desc      countdownTextOf(count=129) returns "129"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0109 begin`);
      const actual: string = countdownTextOf(129);
      logInfo(`countdownTextOf(count=129): actual=${actual}`);
      expect(actual).assertEqual('129');
      logInfo(`${BUNDLE}CountdownTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0110
     * @tc.name      WindowStartIcon_CountdownTextOf_0110
     * @tc.desc      countdownTextOf(count=154) returns "154"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0110 begin`);
      const actual: string = countdownTextOf(154);
      logInfo(`countdownTextOf(count=154): actual=${actual}`);
      expect(actual).assertEqual('154');
      logInfo(`${BUNDLE}CountdownTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0111
     * @tc.name      WindowStartIcon_CountdownTextOf_0111
     * @tc.desc      countdownTextOf(count=-7) returns "-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0111 begin`);
      const actual: string = countdownTextOf(-7);
      logInfo(`countdownTextOf(count=-7): actual=${actual}`);
      expect(actual).assertEqual('-7');
      logInfo(`${BUNDLE}CountdownTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0112
     * @tc.name      WindowStartIcon_CountdownTextOf_0112
     * @tc.desc      countdownTextOf(count=11.96) returns "11.96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0112 begin`);
      const actual: string = countdownTextOf(11.96);
      logInfo(`countdownTextOf(count=11.96): actual=${actual}`);
      expect(actual).assertEqual('11.96');
      logInfo(`${BUNDLE}CountdownTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0113
     * @tc.name      WindowStartIcon_CountdownTextOf_0113
     * @tc.desc      countdownTextOf(count=13.09) returns "13.09"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0113 begin`);
      const actual: string = countdownTextOf(13.09);
      logInfo(`countdownTextOf(count=13.09): actual=${actual}`);
      expect(actual).assertEqual('13.09');
      logInfo(`${BUNDLE}CountdownTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0114
     * @tc.name      WindowStartIcon_CountdownTextOf_0114
     * @tc.desc      countdownTextOf(count=-21) returns "-21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0114 begin`);
      const actual: string = countdownTextOf(-21);
      logInfo(`countdownTextOf(count=-21): actual=${actual}`);
      expect(actual).assertEqual('-21');
      logInfo(`${BUNDLE}CountdownTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0115
     * @tc.name      WindowStartIcon_CountdownTextOf_0115
     * @tc.desc      countdownTextOf(count=27) returns "27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0115 begin`);
      const actual: string = countdownTextOf(27);
      logInfo(`countdownTextOf(count=27): actual=${actual}`);
      expect(actual).assertEqual('27');
      logInfo(`${BUNDLE}CountdownTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0116
     * @tc.name      WindowStartIcon_CountdownTextOf_0116
     * @tc.desc      countdownTextOf(count=91) returns "91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0116 begin`);
      const actual: string = countdownTextOf(91);
      logInfo(`countdownTextOf(count=91): actual=${actual}`);
      expect(actual).assertEqual('91');
      logInfo(`${BUNDLE}CountdownTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0117
     * @tc.name      WindowStartIcon_CountdownTextOf_0117
     * @tc.desc      countdownTextOf(count=89.38) returns "89.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0117 begin`);
      const actual: string = countdownTextOf(89.38);
      logInfo(`countdownTextOf(count=89.38): actual=${actual}`);
      expect(actual).assertEqual('89.38');
      logInfo(`${BUNDLE}CountdownTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0118
     * @tc.name      WindowStartIcon_CountdownTextOf_0118
     * @tc.desc      countdownTextOf(count=89.22) returns "89.22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0118 begin`);
      const actual: string = countdownTextOf(89.22);
      logInfo(`countdownTextOf(count=89.22): actual=${actual}`);
      expect(actual).assertEqual('89.22');
      logInfo(`${BUNDLE}CountdownTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0119
     * @tc.name      WindowStartIcon_CountdownTextOf_0119
     * @tc.desc      countdownTextOf(count=34.95) returns "34.95"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0119 begin`);
      const actual: string = countdownTextOf(34.95);
      logInfo(`countdownTextOf(count=34.95): actual=${actual}`);
      expect(actual).assertEqual('34.95');
      logInfo(`${BUNDLE}CountdownTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0120
     * @tc.name      WindowStartIcon_CountdownTextOf_0120
     * @tc.desc      countdownTextOf(count=-40) returns "-40"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0120 begin`);
      const actual: string = countdownTextOf(-40);
      logInfo(`countdownTextOf(count=-40): actual=${actual}`);
      expect(actual).assertEqual('-40');
      logInfo(`${BUNDLE}CountdownTextOf_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0121
     * @tc.name      WindowStartIcon_CountdownTextOf_0121
     * @tc.desc      countdownTextOf(count=-73) returns "-73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0121 begin`);
      const actual: string = countdownTextOf(-73);
      logInfo(`countdownTextOf(count=-73): actual=${actual}`);
      expect(actual).assertEqual('-73');
      logInfo(`${BUNDLE}CountdownTextOf_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0122
     * @tc.name      WindowStartIcon_CountdownTextOf_0122
     * @tc.desc      countdownTextOf(count=22) returns "22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0122 begin`);
      const actual: string = countdownTextOf(22);
      logInfo(`countdownTextOf(count=22): actual=${actual}`);
      expect(actual).assertEqual('22');
      logInfo(`${BUNDLE}CountdownTextOf_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0123
     * @tc.name      WindowStartIcon_CountdownTextOf_0123
     * @tc.desc      countdownTextOf(count=99.83) returns "99.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0123 begin`);
      const actual: string = countdownTextOf(99.83);
      logInfo(`countdownTextOf(count=99.83): actual=${actual}`);
      expect(actual).assertEqual('99.83');
      logInfo(`${BUNDLE}CountdownTextOf_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0124
     * @tc.name      WindowStartIcon_CountdownTextOf_0124
     * @tc.desc      countdownTextOf(count=-53) returns "-53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0124 begin`);
      const actual: string = countdownTextOf(-53);
      logInfo(`countdownTextOf(count=-53): actual=${actual}`);
      expect(actual).assertEqual('-53');
      logInfo(`${BUNDLE}CountdownTextOf_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0125
     * @tc.name      WindowStartIcon_CountdownTextOf_0125
     * @tc.desc      countdownTextOf(count=40.79) returns "40.79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0125 begin`);
      const actual: string = countdownTextOf(40.79);
      logInfo(`countdownTextOf(count=40.79): actual=${actual}`);
      expect(actual).assertEqual('40.79');
      logInfo(`${BUNDLE}CountdownTextOf_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0126
     * @tc.name      WindowStartIcon_CountdownTextOf_0126
     * @tc.desc      countdownTextOf(count=142) returns "142"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0126 begin`);
      const actual: string = countdownTextOf(142);
      logInfo(`countdownTextOf(count=142): actual=${actual}`);
      expect(actual).assertEqual('142');
      logInfo(`${BUNDLE}CountdownTextOf_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0127
     * @tc.name      WindowStartIcon_CountdownTextOf_0127
     * @tc.desc      countdownTextOf(count=106) returns "106"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0127 begin`);
      const actual: string = countdownTextOf(106);
      logInfo(`countdownTextOf(count=106): actual=${actual}`);
      expect(actual).assertEqual('106');
      logInfo(`${BUNDLE}CountdownTextOf_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0128
     * @tc.name      WindowStartIcon_CountdownTextOf_0128
     * @tc.desc      countdownTextOf(count=58.8) returns "58.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0128 begin`);
      const actual: string = countdownTextOf(58.8);
      logInfo(`countdownTextOf(count=58.8): actual=${actual}`);
      expect(actual).assertEqual('58.8');
      logInfo(`${BUNDLE}CountdownTextOf_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0129
     * @tc.name      WindowStartIcon_CountdownTextOf_0129
     * @tc.desc      countdownTextOf(count=-93) returns "-93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0129 begin`);
      const actual: string = countdownTextOf(-93);
      logInfo(`countdownTextOf(count=-93): actual=${actual}`);
      expect(actual).assertEqual('-93');
      logInfo(`${BUNDLE}CountdownTextOf_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0130
     * @tc.name      WindowStartIcon_CountdownTextOf_0130
     * @tc.desc      countdownTextOf(count=-24) returns "-24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0130 begin`);
      const actual: string = countdownTextOf(-24);
      logInfo(`countdownTextOf(count=-24): actual=${actual}`);
      expect(actual).assertEqual('-24');
      logInfo(`${BUNDLE}CountdownTextOf_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0131
     * @tc.name      WindowStartIcon_CountdownTextOf_0131
     * @tc.desc      countdownTextOf(count=78.75) returns "78.75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0131 begin`);
      const actual: string = countdownTextOf(78.75);
      logInfo(`countdownTextOf(count=78.75): actual=${actual}`);
      expect(actual).assertEqual('78.75');
      logInfo(`${BUNDLE}CountdownTextOf_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0132
     * @tc.name      WindowStartIcon_CountdownTextOf_0132
     * @tc.desc      countdownTextOf(count=75.87) returns "75.87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0132 begin`);
      const actual: string = countdownTextOf(75.87);
      logInfo(`countdownTextOf(count=75.87): actual=${actual}`);
      expect(actual).assertEqual('75.87');
      logInfo(`${BUNDLE}CountdownTextOf_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0133
     * @tc.name      WindowStartIcon_CountdownTextOf_0133
     * @tc.desc      countdownTextOf(count=44.16) returns "44.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0133 begin`);
      const actual: string = countdownTextOf(44.16);
      logInfo(`countdownTextOf(count=44.16): actual=${actual}`);
      expect(actual).assertEqual('44.16');
      logInfo(`${BUNDLE}CountdownTextOf_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0134
     * @tc.name      WindowStartIcon_CountdownTextOf_0134
     * @tc.desc      countdownTextOf(count=77.36) returns "77.36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0134 begin`);
      const actual: string = countdownTextOf(77.36);
      logInfo(`countdownTextOf(count=77.36): actual=${actual}`);
      expect(actual).assertEqual('77.36');
      logInfo(`${BUNDLE}CountdownTextOf_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0135
     * @tc.name      WindowStartIcon_CountdownTextOf_0135
     * @tc.desc      countdownTextOf(count=119) returns "119"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0135 begin`);
      const actual: string = countdownTextOf(119);
      logInfo(`countdownTextOf(count=119): actual=${actual}`);
      expect(actual).assertEqual('119');
      logInfo(`${BUNDLE}CountdownTextOf_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0136
     * @tc.name      WindowStartIcon_CountdownTextOf_0136
     * @tc.desc      countdownTextOf(count=132) returns "132"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0136 begin`);
      const actual: string = countdownTextOf(132);
      logInfo(`countdownTextOf(count=132): actual=${actual}`);
      expect(actual).assertEqual('132');
      logInfo(`${BUNDLE}CountdownTextOf_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0137
     * @tc.name      WindowStartIcon_CountdownTextOf_0137
     * @tc.desc      countdownTextOf(count=46) returns "46"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0137 begin`);
      const actual: string = countdownTextOf(46);
      logInfo(`countdownTextOf(count=46): actual=${actual}`);
      expect(actual).assertEqual('46');
      logInfo(`${BUNDLE}CountdownTextOf_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0138
     * @tc.name      WindowStartIcon_CountdownTextOf_0138
     * @tc.desc      countdownTextOf(count=-47) returns "-47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0138 begin`);
      const actual: string = countdownTextOf(-47);
      logInfo(`countdownTextOf(count=-47): actual=${actual}`);
      expect(actual).assertEqual('-47');
      logInfo(`${BUNDLE}CountdownTextOf_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0139
     * @tc.name      WindowStartIcon_CountdownTextOf_0139
     * @tc.desc      countdownTextOf(count=11.41) returns "11.41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0139 begin`);
      const actual: string = countdownTextOf(11.41);
      logInfo(`countdownTextOf(count=11.41): actual=${actual}`);
      expect(actual).assertEqual('11.41');
      logInfo(`${BUNDLE}CountdownTextOf_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0140
     * @tc.name      WindowStartIcon_CountdownTextOf_0140
     * @tc.desc      countdownTextOf(count=11) returns "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0140 begin`);
      const actual: string = countdownTextOf(11);
      logInfo(`countdownTextOf(count=11): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`${BUNDLE}CountdownTextOf_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0141
     * @tc.name      WindowStartIcon_CountdownTextOf_0141
     * @tc.desc      countdownTextOf(count=98.38) returns "98.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0141 begin`);
      const actual: string = countdownTextOf(98.38);
      logInfo(`countdownTextOf(count=98.38): actual=${actual}`);
      expect(actual).assertEqual('98.38');
      logInfo(`${BUNDLE}CountdownTextOf_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0142
     * @tc.name      WindowStartIcon_CountdownTextOf_0142
     * @tc.desc      countdownTextOf(count=6) returns "6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0142 begin`);
      const actual: string = countdownTextOf(6);
      logInfo(`countdownTextOf(count=6): actual=${actual}`);
      expect(actual).assertEqual('6');
      logInfo(`${BUNDLE}CountdownTextOf_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0143
     * @tc.name      WindowStartIcon_CountdownTextOf_0143
     * @tc.desc      countdownTextOf(count=-65) returns "-65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0143 begin`);
      const actual: string = countdownTextOf(-65);
      logInfo(`countdownTextOf(count=-65): actual=${actual}`);
      expect(actual).assertEqual('-65');
      logInfo(`${BUNDLE}CountdownTextOf_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0144
     * @tc.name      WindowStartIcon_CountdownTextOf_0144
     * @tc.desc      countdownTextOf(count=21.55) returns "21.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0144 begin`);
      const actual: string = countdownTextOf(21.55);
      logInfo(`countdownTextOf(count=21.55): actual=${actual}`);
      expect(actual).assertEqual('21.55');
      logInfo(`${BUNDLE}CountdownTextOf_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0145
     * @tc.name      WindowStartIcon_CountdownTextOf_0145
     * @tc.desc      countdownTextOf(count=172) returns "172"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0145 begin`);
      const actual: string = countdownTextOf(172);
      logInfo(`countdownTextOf(count=172): actual=${actual}`);
      expect(actual).assertEqual('172');
      logInfo(`${BUNDLE}CountdownTextOf_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0146
     * @tc.name      WindowStartIcon_CountdownTextOf_0146
     * @tc.desc      countdownTextOf(count=30.83) returns "30.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0146 begin`);
      const actual: string = countdownTextOf(30.83);
      logInfo(`countdownTextOf(count=30.83): actual=${actual}`);
      expect(actual).assertEqual('30.83');
      logInfo(`${BUNDLE}CountdownTextOf_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0147
     * @tc.name      WindowStartIcon_CountdownTextOf_0147
     * @tc.desc      countdownTextOf(count=75.18) returns "75.18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0147 begin`);
      const actual: string = countdownTextOf(75.18);
      logInfo(`countdownTextOf(count=75.18): actual=${actual}`);
      expect(actual).assertEqual('75.18');
      logInfo(`${BUNDLE}CountdownTextOf_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0148
     * @tc.name      WindowStartIcon_CountdownTextOf_0148
     * @tc.desc      countdownTextOf(count=-33) returns "-33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0148 begin`);
      const actual: string = countdownTextOf(-33);
      logInfo(`countdownTextOf(count=-33): actual=${actual}`);
      expect(actual).assertEqual('-33');
      logInfo(`${BUNDLE}CountdownTextOf_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0149
     * @tc.name      WindowStartIcon_CountdownTextOf_0149
     * @tc.desc      countdownTextOf(count=24.88) returns "24.88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0149 begin`);
      const actual: string = countdownTextOf(24.88);
      logInfo(`countdownTextOf(count=24.88): actual=${actual}`);
      expect(actual).assertEqual('24.88');
      logInfo(`${BUNDLE}CountdownTextOf_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0150
     * @tc.name      WindowStartIcon_CountdownTextOf_0150
     * @tc.desc      countdownTextOf(count=14.55) returns "14.55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0150 begin`);
      const actual: string = countdownTextOf(14.55);
      logInfo(`countdownTextOf(count=14.55): actual=${actual}`);
      expect(actual).assertEqual('14.55');
      logInfo(`${BUNDLE}CountdownTextOf_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0151
     * @tc.name      WindowStartIcon_CountdownTextOf_0151
     * @tc.desc      countdownTextOf(count=-5) returns "-5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0151 begin`);
      const actual: string = countdownTextOf(-5);
      logInfo(`countdownTextOf(count=-5): actual=${actual}`);
      expect(actual).assertEqual('-5');
      logInfo(`${BUNDLE}CountdownTextOf_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0152
     * @tc.name      WindowStartIcon_CountdownTextOf_0152
     * @tc.desc      countdownTextOf(count=-70) returns "-70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0152 begin`);
      const actual: string = countdownTextOf(-70);
      logInfo(`countdownTextOf(count=-70): actual=${actual}`);
      expect(actual).assertEqual('-70');
      logInfo(`${BUNDLE}CountdownTextOf_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0153
     * @tc.name      WindowStartIcon_CountdownTextOf_0153
     * @tc.desc      countdownTextOf(count=-74) returns "-74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0153 begin`);
      const actual: string = countdownTextOf(-74);
      logInfo(`countdownTextOf(count=-74): actual=${actual}`);
      expect(actual).assertEqual('-74');
      logInfo(`${BUNDLE}CountdownTextOf_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0154
     * @tc.name      WindowStartIcon_CountdownTextOf_0154
     * @tc.desc      countdownTextOf(count=16) returns "16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0154 begin`);
      const actual: string = countdownTextOf(16);
      logInfo(`countdownTextOf(count=16): actual=${actual}`);
      expect(actual).assertEqual('16');
      logInfo(`${BUNDLE}CountdownTextOf_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0155
     * @tc.name      WindowStartIcon_CountdownTextOf_0155
     * @tc.desc      countdownTextOf(count=2.3) returns "2.3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0155 begin`);
      const actual: string = countdownTextOf(2.3);
      logInfo(`countdownTextOf(count=2.3): actual=${actual}`);
      expect(actual).assertEqual('2.3');
      logInfo(`${BUNDLE}CountdownTextOf_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0156
     * @tc.name      WindowStartIcon_CountdownTextOf_0156
     * @tc.desc      countdownTextOf(count=95.07) returns "95.07"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0156 begin`);
      const actual: string = countdownTextOf(95.07);
      logInfo(`countdownTextOf(count=95.07): actual=${actual}`);
      expect(actual).assertEqual('95.07');
      logInfo(`${BUNDLE}CountdownTextOf_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0157
     * @tc.name      WindowStartIcon_CountdownTextOf_0157
     * @tc.desc      countdownTextOf(count=-52) returns "-52"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0157 begin`);
      const actual: string = countdownTextOf(-52);
      logInfo(`countdownTextOf(count=-52): actual=${actual}`);
      expect(actual).assertEqual('-52');
      logInfo(`${BUNDLE}CountdownTextOf_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0158
     * @tc.name      WindowStartIcon_CountdownTextOf_0158
     * @tc.desc      countdownTextOf(count=51.51) returns "51.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0158 begin`);
      const actual: string = countdownTextOf(51.51);
      logInfo(`countdownTextOf(count=51.51): actual=${actual}`);
      expect(actual).assertEqual('51.51');
      logInfo(`${BUNDLE}CountdownTextOf_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0159
     * @tc.name      WindowStartIcon_CountdownTextOf_0159
     * @tc.desc      countdownTextOf(count=-96) returns "-96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0159 begin`);
      const actual: string = countdownTextOf(-96);
      logInfo(`countdownTextOf(count=-96): actual=${actual}`);
      expect(actual).assertEqual('-96');
      logInfo(`${BUNDLE}CountdownTextOf_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0160
     * @tc.name      WindowStartIcon_CountdownTextOf_0160
     * @tc.desc      countdownTextOf(count=12.85) returns "12.85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0160 begin`);
      const actual: string = countdownTextOf(12.85);
      logInfo(`countdownTextOf(count=12.85): actual=${actual}`);
      expect(actual).assertEqual('12.85');
      logInfo(`${BUNDLE}CountdownTextOf_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0161
     * @tc.name      WindowStartIcon_CountdownTextOf_0161
     * @tc.desc      countdownTextOf(count=101) returns "101"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0161 begin`);
      const actual: string = countdownTextOf(101);
      logInfo(`countdownTextOf(count=101): actual=${actual}`);
      expect(actual).assertEqual('101');
      logInfo(`${BUNDLE}CountdownTextOf_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0162
     * @tc.name      WindowStartIcon_CountdownTextOf_0162
     * @tc.desc      countdownTextOf(count=104) returns "104"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0162 begin`);
      const actual: string = countdownTextOf(104);
      logInfo(`countdownTextOf(count=104): actual=${actual}`);
      expect(actual).assertEqual('104');
      logInfo(`${BUNDLE}CountdownTextOf_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0163
     * @tc.name      WindowStartIcon_CountdownTextOf_0163
     * @tc.desc      countdownTextOf(count=11.77) returns "11.77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0163 begin`);
      const actual: string = countdownTextOf(11.77);
      logInfo(`countdownTextOf(count=11.77): actual=${actual}`);
      expect(actual).assertEqual('11.77');
      logInfo(`${BUNDLE}CountdownTextOf_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0164
     * @tc.name      WindowStartIcon_CountdownTextOf_0164
     * @tc.desc      countdownTextOf(count=-27) returns "-27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0164 begin`);
      const actual: string = countdownTextOf(-27);
      logInfo(`countdownTextOf(count=-27): actual=${actual}`);
      expect(actual).assertEqual('-27');
      logInfo(`${BUNDLE}CountdownTextOf_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0165
     * @tc.name      WindowStartIcon_CountdownTextOf_0165
     * @tc.desc      countdownTextOf(count=4) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0165 begin`);
      const actual: string = countdownTextOf(4);
      logInfo(`countdownTextOf(count=4): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CountdownTextOf_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0166
     * @tc.name      WindowStartIcon_CountdownTextOf_0166
     * @tc.desc      countdownTextOf(count=7.45) returns "7.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0166 begin`);
      const actual: string = countdownTextOf(7.45);
      logInfo(`countdownTextOf(count=7.45): actual=${actual}`);
      expect(actual).assertEqual('7.45');
      logInfo(`${BUNDLE}CountdownTextOf_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0167
     * @tc.name      WindowStartIcon_CountdownTextOf_0167
     * @tc.desc      countdownTextOf(count=-42) returns "-42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0167 begin`);
      const actual: string = countdownTextOf(-42);
      logInfo(`countdownTextOf(count=-42): actual=${actual}`);
      expect(actual).assertEqual('-42');
      logInfo(`${BUNDLE}CountdownTextOf_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0168
     * @tc.name      WindowStartIcon_CountdownTextOf_0168
     * @tc.desc      countdownTextOf(count=-35) returns "-35"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0168 begin`);
      const actual: string = countdownTextOf(-35);
      logInfo(`countdownTextOf(count=-35): actual=${actual}`);
      expect(actual).assertEqual('-35');
      logInfo(`${BUNDLE}CountdownTextOf_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0169
     * @tc.name      WindowStartIcon_CountdownTextOf_0169
     * @tc.desc      countdownTextOf(count=4.21) returns "4.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0169 begin`);
      const actual: string = countdownTextOf(4.21);
      logInfo(`countdownTextOf(count=4.21): actual=${actual}`);
      expect(actual).assertEqual('4.21');
      logInfo(`${BUNDLE}CountdownTextOf_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0170
     * @tc.name      WindowStartIcon_CountdownTextOf_0170
     * @tc.desc      countdownTextOf(count=72) returns "72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0170 begin`);
      const actual: string = countdownTextOf(72);
      logInfo(`countdownTextOf(count=72): actual=${actual}`);
      expect(actual).assertEqual('72');
      logInfo(`${BUNDLE}CountdownTextOf_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0171
     * @tc.name      WindowStartIcon_CountdownTextOf_0171
     * @tc.desc      countdownTextOf(count=-8) returns "-8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0171 begin`);
      const actual: string = countdownTextOf(-8);
      logInfo(`countdownTextOf(count=-8): actual=${actual}`);
      expect(actual).assertEqual('-8');
      logInfo(`${BUNDLE}CountdownTextOf_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0172
     * @tc.name      WindowStartIcon_CountdownTextOf_0172
     * @tc.desc      countdownTextOf(count=192) returns "192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0172 begin`);
      const actual: string = countdownTextOf(192);
      logInfo(`countdownTextOf(count=192): actual=${actual}`);
      expect(actual).assertEqual('192');
      logInfo(`${BUNDLE}CountdownTextOf_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0173
     * @tc.name      WindowStartIcon_CountdownTextOf_0173
     * @tc.desc      countdownTextOf(count=62.11) returns "62.11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0173 begin`);
      const actual: string = countdownTextOf(62.11);
      logInfo(`countdownTextOf(count=62.11): actual=${actual}`);
      expect(actual).assertEqual('62.11');
      logInfo(`${BUNDLE}CountdownTextOf_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0174
     * @tc.name      WindowStartIcon_CountdownTextOf_0174
     * @tc.desc      countdownTextOf(count=43.61) returns "43.61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0174 begin`);
      const actual: string = countdownTextOf(43.61);
      logInfo(`countdownTextOf(count=43.61): actual=${actual}`);
      expect(actual).assertEqual('43.61');
      logInfo(`${BUNDLE}CountdownTextOf_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0175
     * @tc.name      WindowStartIcon_CountdownTextOf_0175
     * @tc.desc      countdownTextOf(count=174) returns "174"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0175 begin`);
      const actual: string = countdownTextOf(174);
      logInfo(`countdownTextOf(count=174): actual=${actual}`);
      expect(actual).assertEqual('174');
      logInfo(`${BUNDLE}CountdownTextOf_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0176
     * @tc.name      WindowStartIcon_CountdownTextOf_0176
     * @tc.desc      countdownTextOf(count=37) returns "37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0176 begin`);
      const actual: string = countdownTextOf(37);
      logInfo(`countdownTextOf(count=37): actual=${actual}`);
      expect(actual).assertEqual('37');
      logInfo(`${BUNDLE}CountdownTextOf_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0177
     * @tc.name      WindowStartIcon_CountdownTextOf_0177
     * @tc.desc      countdownTextOf(count=49.14) returns "49.14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0177 begin`);
      const actual: string = countdownTextOf(49.14);
      logInfo(`countdownTextOf(count=49.14): actual=${actual}`);
      expect(actual).assertEqual('49.14');
      logInfo(`${BUNDLE}CountdownTextOf_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0178
     * @tc.name      WindowStartIcon_CountdownTextOf_0178
     * @tc.desc      countdownTextOf(count=-22) returns "-22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0178 begin`);
      const actual: string = countdownTextOf(-22);
      logInfo(`countdownTextOf(count=-22): actual=${actual}`);
      expect(actual).assertEqual('-22');
      logInfo(`${BUNDLE}CountdownTextOf_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0179
     * @tc.name      WindowStartIcon_CountdownTextOf_0179
     * @tc.desc      countdownTextOf(count=141) returns "141"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0179 begin`);
      const actual: string = countdownTextOf(141);
      logInfo(`countdownTextOf(count=141): actual=${actual}`);
      expect(actual).assertEqual('141');
      logInfo(`${BUNDLE}CountdownTextOf_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0180
     * @tc.name      WindowStartIcon_CountdownTextOf_0180
     * @tc.desc      countdownTextOf(count=41) returns "41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0180 begin`);
      const actual: string = countdownTextOf(41);
      logInfo(`countdownTextOf(count=41): actual=${actual}`);
      expect(actual).assertEqual('41');
      logInfo(`${BUNDLE}CountdownTextOf_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0181
     * @tc.name      WindowStartIcon_CountdownTextOf_0181
     * @tc.desc      countdownTextOf(count=88) returns "88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0181 begin`);
      const actual: string = countdownTextOf(88);
      logInfo(`countdownTextOf(count=88): actual=${actual}`);
      expect(actual).assertEqual('88');
      logInfo(`${BUNDLE}CountdownTextOf_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0182
     * @tc.name      WindowStartIcon_CountdownTextOf_0182
     * @tc.desc      countdownTextOf(count=-15) returns "-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0182 begin`);
      const actual: string = countdownTextOf(-15);
      logInfo(`countdownTextOf(count=-15): actual=${actual}`);
      expect(actual).assertEqual('-15');
      logInfo(`${BUNDLE}CountdownTextOf_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0183
     * @tc.name      WindowStartIcon_CountdownTextOf_0183
     * @tc.desc      countdownTextOf(count=13) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0183 begin`);
      const actual: string = countdownTextOf(13);
      logInfo(`countdownTextOf(count=13): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}CountdownTextOf_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0184
     * @tc.name      WindowStartIcon_CountdownTextOf_0184
     * @tc.desc      countdownTextOf(count=36) returns "36"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0184 begin`);
      const actual: string = countdownTextOf(36);
      logInfo(`countdownTextOf(count=36): actual=${actual}`);
      expect(actual).assertEqual('36');
      logInfo(`${BUNDLE}CountdownTextOf_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0185
     * @tc.name      WindowStartIcon_CountdownTextOf_0185
     * @tc.desc      countdownTextOf(count=56) returns "56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0185 begin`);
      const actual: string = countdownTextOf(56);
      logInfo(`countdownTextOf(count=56): actual=${actual}`);
      expect(actual).assertEqual('56');
      logInfo(`${BUNDLE}CountdownTextOf_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0186
     * @tc.name      WindowStartIcon_CountdownTextOf_0186
     * @tc.desc      countdownTextOf(count=23) returns "23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0186 begin`);
      const actual: string = countdownTextOf(23);
      logInfo(`countdownTextOf(count=23): actual=${actual}`);
      expect(actual).assertEqual('23');
      logInfo(`${BUNDLE}CountdownTextOf_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0187
     * @tc.name      WindowStartIcon_CountdownTextOf_0187
     * @tc.desc      countdownTextOf(count=127) returns "127"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0187 begin`);
      const actual: string = countdownTextOf(127);
      logInfo(`countdownTextOf(count=127): actual=${actual}`);
      expect(actual).assertEqual('127');
      logInfo(`${BUNDLE}CountdownTextOf_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0188
     * @tc.name      WindowStartIcon_CountdownTextOf_0188
     * @tc.desc      countdownTextOf(count=56.21) returns "56.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0188 begin`);
      const actual: string = countdownTextOf(56.21);
      logInfo(`countdownTextOf(count=56.21): actual=${actual}`);
      expect(actual).assertEqual('56.21');
      logInfo(`${BUNDLE}CountdownTextOf_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0189
     * @tc.name      WindowStartIcon_CountdownTextOf_0189
     * @tc.desc      countdownTextOf(count=94.44) returns "94.44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0189 begin`);
      const actual: string = countdownTextOf(94.44);
      logInfo(`countdownTextOf(count=94.44): actual=${actual}`);
      expect(actual).assertEqual('94.44');
      logInfo(`${BUNDLE}CountdownTextOf_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0190
     * @tc.name      WindowStartIcon_CountdownTextOf_0190
     * @tc.desc      countdownTextOf(count=51.41) returns "51.41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0190 begin`);
      const actual: string = countdownTextOf(51.41);
      logInfo(`countdownTextOf(count=51.41): actual=${actual}`);
      expect(actual).assertEqual('51.41');
      logInfo(`${BUNDLE}CountdownTextOf_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0191
     * @tc.name      WindowStartIcon_CountdownTextOf_0191
     * @tc.desc      countdownTextOf(count=146) returns "146"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0191 begin`);
      const actual: string = countdownTextOf(146);
      logInfo(`countdownTextOf(count=146): actual=${actual}`);
      expect(actual).assertEqual('146');
      logInfo(`${BUNDLE}CountdownTextOf_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0192
     * @tc.name      WindowStartIcon_CountdownTextOf_0192
     * @tc.desc      countdownTextOf(count=-2) returns "-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0192 begin`);
      const actual: string = countdownTextOf(-2);
      logInfo(`countdownTextOf(count=-2): actual=${actual}`);
      expect(actual).assertEqual('-2');
      logInfo(`${BUNDLE}CountdownTextOf_0192 end`);
    });
  });
}
