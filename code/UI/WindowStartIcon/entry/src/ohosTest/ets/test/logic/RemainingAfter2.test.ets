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
import { remainingAfter } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for remainingAfter (96 cases). */
export default function remainingAfter2Test(): void {
  describe('RemainingAfter2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0097
     * @tc.name      WindowStartIcon_RemainingAfter_0097
     * @tc.desc      remainingAfter(ticks=21, initial=80) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0097 begin`);
      const actual: number = remainingAfter(21, 80);
      logInfo(`remainingAfter(ticks=21, initial=80): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}RemainingAfter_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0098
     * @tc.name      WindowStartIcon_RemainingAfter_0098
     * @tc.desc      remainingAfter(ticks=97, initial=165) returns 68
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0098 begin`);
      const actual: number = remainingAfter(97, 165);
      logInfo(`remainingAfter(ticks=97, initial=165): actual=${actual}`);
      expect(actual).assertEqual(68);
      logInfo(`${BUNDLE}RemainingAfter_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0099
     * @tc.name      WindowStartIcon_RemainingAfter_0099
     * @tc.desc      remainingAfter(ticks=97, initial=195) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0099 begin`);
      const actual: number = remainingAfter(97, 195);
      logInfo(`remainingAfter(ticks=97, initial=195): actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}RemainingAfter_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0100
     * @tc.name      WindowStartIcon_RemainingAfter_0100
     * @tc.desc      remainingAfter(ticks=60, initial=142) returns 82
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0100 begin`);
      const actual: number = remainingAfter(60, 142);
      logInfo(`remainingAfter(ticks=60, initial=142): actual=${actual}`);
      expect(actual).assertEqual(82);
      logInfo(`${BUNDLE}RemainingAfter_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0101
     * @tc.name      WindowStartIcon_RemainingAfter_0101
     * @tc.desc      remainingAfter(ticks=2, initial=130) returns 128
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0101 begin`);
      const actual: number = remainingAfter(2, 130);
      logInfo(`remainingAfter(ticks=2, initial=130): actual=${actual}`);
      expect(actual).assertEqual(128);
      logInfo(`${BUNDLE}RemainingAfter_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0102
     * @tc.name      WindowStartIcon_RemainingAfter_0102
     * @tc.desc      remainingAfter(ticks=2, initial=200) returns 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0102 begin`);
      const actual: number = remainingAfter(2, 200);
      logInfo(`remainingAfter(ticks=2, initial=200): actual=${actual}`);
      expect(actual).assertEqual(198);
      logInfo(`${BUNDLE}RemainingAfter_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0103
     * @tc.name      WindowStartIcon_RemainingAfter_0103
     * @tc.desc      remainingAfter(ticks=70, initial=176) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0103 begin`);
      const actual: number = remainingAfter(70, 176);
      logInfo(`remainingAfter(ticks=70, initial=176): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}RemainingAfter_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0104
     * @tc.name      WindowStartIcon_RemainingAfter_0104
     * @tc.desc      remainingAfter(ticks=2, initial=176) returns 174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0104 begin`);
      const actual: number = remainingAfter(2, 176);
      logInfo(`remainingAfter(ticks=2, initial=176): actual=${actual}`);
      expect(actual).assertEqual(174);
      logInfo(`${BUNDLE}RemainingAfter_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0105
     * @tc.name      WindowStartIcon_RemainingAfter_0105
     * @tc.desc      remainingAfter(ticks=21, initial=95) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0105 begin`);
      const actual: number = remainingAfter(21, 95);
      logInfo(`remainingAfter(ticks=21, initial=95): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}RemainingAfter_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0106
     * @tc.name      WindowStartIcon_RemainingAfter_0106
     * @tc.desc      remainingAfter(ticks=97, initial=140) returns 43
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0106 begin`);
      const actual: number = remainingAfter(97, 140);
      logInfo(`remainingAfter(ticks=97, initial=140): actual=${actual}`);
      expect(actual).assertEqual(43);
      logInfo(`${BUNDLE}RemainingAfter_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0107
     * @tc.name      WindowStartIcon_RemainingAfter_0107
     * @tc.desc      remainingAfter(ticks=44, initial=115) returns 71
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0107 begin`);
      const actual: number = remainingAfter(44, 115);
      logInfo(`remainingAfter(ticks=44, initial=115): actual=${actual}`);
      expect(actual).assertEqual(71);
      logInfo(`${BUNDLE}RemainingAfter_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0108
     * @tc.name      WindowStartIcon_RemainingAfter_0108
     * @tc.desc      remainingAfter(ticks=58.09, initial=96.17) returns 38.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0108 begin`);
      const actual: number = remainingAfter(58.09, 96.17);
      logInfo(`remainingAfter(ticks=58.09, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(38.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0109
     * @tc.name      WindowStartIcon_RemainingAfter_0109
     * @tc.desc      remainingAfter(ticks=10, initial=176) returns 166
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0109 begin`);
      const actual: number = remainingAfter(10, 176);
      logInfo(`remainingAfter(ticks=10, initial=176): actual=${actual}`);
      expect(actual).assertEqual(166);
      logInfo(`${BUNDLE}RemainingAfter_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0110
     * @tc.name      WindowStartIcon_RemainingAfter_0110
     * @tc.desc      remainingAfter(ticks=58.09, initial=160) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0110 begin`);
      const actual: number = remainingAfter(58.09, 160);
      logInfo(`remainingAfter(ticks=58.09, initial=160): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}RemainingAfter_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0111
     * @tc.name      WindowStartIcon_RemainingAfter_0111
     * @tc.desc      remainingAfter(ticks=80, initial=96.17) returns 16.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0111 begin`);
      const actual: number = remainingAfter(80, 96.17);
      logInfo(`remainingAfter(ticks=80, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(16.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0112
     * @tc.name      WindowStartIcon_RemainingAfter_0112
     * @tc.desc      remainingAfter(ticks=3, initial=67.03) returns 64.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0112 begin`);
      const actual: number = remainingAfter(3, 67.03);
      logInfo(`remainingAfter(ticks=3, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(64.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0113
     * @tc.name      WindowStartIcon_RemainingAfter_0113
     * @tc.desc      remainingAfter(ticks=44, initial=145) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0113 begin`);
      const actual: number = remainingAfter(44, 145);
      logInfo(`remainingAfter(ticks=44, initial=145): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}RemainingAfter_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0114
     * @tc.name      WindowStartIcon_RemainingAfter_0114
     * @tc.desc      remainingAfter(ticks=44, initial=75) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0114 begin`);
      const actual: number = remainingAfter(44, 75);
      logInfo(`remainingAfter(ticks=44, initial=75): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}RemainingAfter_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0115
     * @tc.name      WindowStartIcon_RemainingAfter_0115
     * @tc.desc      remainingAfter(ticks=4, initial=142) returns 138
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0115 begin`);
      const actual: number = remainingAfter(4, 142);
      logInfo(`remainingAfter(ticks=4, initial=142): actual=${actual}`);
      expect(actual).assertEqual(138);
      logInfo(`${BUNDLE}RemainingAfter_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0116
     * @tc.name      WindowStartIcon_RemainingAfter_0116
     * @tc.desc      remainingAfter(ticks=35, initial=61) returns 26
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0116 begin`);
      const actual: number = remainingAfter(35, 61);
      logInfo(`remainingAfter(ticks=35, initial=61): actual=${actual}`);
      expect(actual).assertEqual(26);
      logInfo(`${BUNDLE}RemainingAfter_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0117
     * @tc.name      WindowStartIcon_RemainingAfter_0117
     * @tc.desc      remainingAfter(ticks=85, initial=142) returns 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0117 begin`);
      const actual: number = remainingAfter(85, 142);
      logInfo(`remainingAfter(ticks=85, initial=142): actual=${actual}`);
      expect(actual).assertEqual(57);
      logInfo(`${BUNDLE}RemainingAfter_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0118
     * @tc.name      WindowStartIcon_RemainingAfter_0118
     * @tc.desc      remainingAfter(ticks=4, initial=67.03) returns 63.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0118 begin`);
      const actual: number = remainingAfter(4, 67.03);
      logInfo(`remainingAfter(ticks=4, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(63.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0119
     * @tc.name      WindowStartIcon_RemainingAfter_0119
     * @tc.desc      remainingAfter(ticks=21, initial=67.03) returns 46.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0119 begin`);
      const actual: number = remainingAfter(21, 67.03);
      logInfo(`remainingAfter(ticks=21, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(46.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0120
     * @tc.name      WindowStartIcon_RemainingAfter_0120
     * @tc.desc      remainingAfter(ticks=65, initial=142) returns 77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0120 begin`);
      const actual: number = remainingAfter(65, 142);
      logInfo(`remainingAfter(ticks=65, initial=142): actual=${actual}`);
      expect(actual).assertEqual(77);
      logInfo(`${BUNDLE}RemainingAfter_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0121
     * @tc.name      WindowStartIcon_RemainingAfter_0121
     * @tc.desc      remainingAfter(ticks=110, initial=176) returns 66
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0121 begin`);
      const actual: number = remainingAfter(110, 176);
      logInfo(`remainingAfter(ticks=110, initial=176): actual=${actual}`);
      expect(actual).assertEqual(66);
      logInfo(`${BUNDLE}RemainingAfter_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0122
     * @tc.name      WindowStartIcon_RemainingAfter_0122
     * @tc.desc      remainingAfter(ticks=4, initial=185) returns 181
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0122 begin`);
      const actual: number = remainingAfter(4, 185);
      logInfo(`remainingAfter(ticks=4, initial=185): actual=${actual}`);
      expect(actual).assertEqual(181);
      logInfo(`${BUNDLE}RemainingAfter_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0123
     * @tc.name      WindowStartIcon_RemainingAfter_0123
     * @tc.desc      remainingAfter(ticks=3, initial=195) returns 192
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0123 begin`);
      const actual: number = remainingAfter(3, 195);
      logInfo(`remainingAfter(ticks=3, initial=195): actual=${actual}`);
      expect(actual).assertEqual(192);
      logInfo(`${BUNDLE}RemainingAfter_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0124
     * @tc.name      WindowStartIcon_RemainingAfter_0124
     * @tc.desc      remainingAfter(ticks=115, initial=133) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0124 begin`);
      const actual: number = remainingAfter(115, 133);
      logInfo(`remainingAfter(ticks=115, initial=133): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}RemainingAfter_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0125
     * @tc.name      WindowStartIcon_RemainingAfter_0125
     * @tc.desc      remainingAfter(ticks=142, initial=150) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0125 begin`);
      const actual: number = remainingAfter(142, 150);
      logInfo(`remainingAfter(ticks=142, initial=150): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RemainingAfter_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0126
     * @tc.name      WindowStartIcon_RemainingAfter_0126
     * @tc.desc      remainingAfter(ticks=4, initial=85) returns 81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0126 begin`);
      const actual: number = remainingAfter(4, 85);
      logInfo(`remainingAfter(ticks=4, initial=85): actual=${actual}`);
      expect(actual).assertEqual(81);
      logInfo(`${BUNDLE}RemainingAfter_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0127
     * @tc.name      WindowStartIcon_RemainingAfter_0127
     * @tc.desc      remainingAfter(ticks=3, initial=61) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0127 begin`);
      const actual: number = remainingAfter(3, 61);
      logInfo(`remainingAfter(ticks=3, initial=61): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}RemainingAfter_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0128
     * @tc.name      WindowStartIcon_RemainingAfter_0128
     * @tc.desc      remainingAfter(ticks=2, initial=185) returns 183
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0128 begin`);
      const actual: number = remainingAfter(2, 185);
      logInfo(`remainingAfter(ticks=2, initial=185): actual=${actual}`);
      expect(actual).assertEqual(183);
      logInfo(`${BUNDLE}RemainingAfter_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0129
     * @tc.name      WindowStartIcon_RemainingAfter_0129
     * @tc.desc      remainingAfter(ticks=3, initial=180) returns 177
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0129 begin`);
      const actual: number = remainingAfter(3, 180);
      logInfo(`remainingAfter(ticks=3, initial=180): actual=${actual}`);
      expect(actual).assertEqual(177);
      logInfo(`${BUNDLE}RemainingAfter_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0130
     * @tc.name      WindowStartIcon_RemainingAfter_0130
     * @tc.desc      remainingAfter(ticks=25, initial=96.17) returns 71.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0130 begin`);
      const actual: number = remainingAfter(25, 96.17);
      logInfo(`remainingAfter(ticks=25, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(71.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0131
     * @tc.name      WindowStartIcon_RemainingAfter_0131
     * @tc.desc      remainingAfter(ticks=56, initial=135) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0131 begin`);
      const actual: number = remainingAfter(56, 135);
      logInfo(`remainingAfter(ticks=56, initial=135): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}RemainingAfter_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0132
     * @tc.name      WindowStartIcon_RemainingAfter_0132
     * @tc.desc      remainingAfter(ticks=5, initial=61) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0132 begin`);
      const actual: number = remainingAfter(5, 61);
      logInfo(`remainingAfter(ticks=5, initial=61): actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}RemainingAfter_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0133
     * @tc.name      WindowStartIcon_RemainingAfter_0133
     * @tc.desc      remainingAfter(ticks=15, initial=41.89) returns 26.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0133 begin`);
      const actual: number = remainingAfter(15, 41.89);
      logInfo(`remainingAfter(ticks=15, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(26.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0134
     * @tc.name      WindowStartIcon_RemainingAfter_0134
     * @tc.desc      remainingAfter(ticks=10, initial=136) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0134 begin`);
      const actual: number = remainingAfter(10, 136);
      logInfo(`remainingAfter(ticks=10, initial=136): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}RemainingAfter_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0135
     * @tc.name      WindowStartIcon_RemainingAfter_0135
     * @tc.desc      remainingAfter(ticks=70, initial=133) returns 63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0135 begin`);
      const actual: number = remainingAfter(70, 133);
      logInfo(`remainingAfter(ticks=70, initial=133): actual=${actual}`);
      expect(actual).assertEqual(63);
      logInfo(`${BUNDLE}RemainingAfter_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0136
     * @tc.name      WindowStartIcon_RemainingAfter_0136
     * @tc.desc      remainingAfter(ticks=56, initial=105) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0136 begin`);
      const actual: number = remainingAfter(56, 105);
      logInfo(`remainingAfter(ticks=56, initial=105): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}RemainingAfter_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0137
     * @tc.name      WindowStartIcon_RemainingAfter_0137
     * @tc.desc      remainingAfter(ticks=4, initial=45) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0137 begin`);
      const actual: number = remainingAfter(4, 45);
      logInfo(`remainingAfter(ticks=4, initial=45): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}RemainingAfter_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0138
     * @tc.name      WindowStartIcon_RemainingAfter_0138
     * @tc.desc      remainingAfter(ticks=3, initial=175) returns 172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0138 begin`);
      const actual: number = remainingAfter(3, 175);
      logInfo(`remainingAfter(ticks=3, initial=175): actual=${actual}`);
      expect(actual).assertEqual(172);
      logInfo(`${BUNDLE}RemainingAfter_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0139
     * @tc.name      WindowStartIcon_RemainingAfter_0139
     * @tc.desc      remainingAfter(ticks=35, initial=142) returns 107
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0139 begin`);
      const actual: number = remainingAfter(35, 142);
      logInfo(`remainingAfter(ticks=35, initial=142): actual=${actual}`);
      expect(actual).assertEqual(107);
      logInfo(`${BUNDLE}RemainingAfter_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0140
     * @tc.name      WindowStartIcon_RemainingAfter_0140
     * @tc.desc      remainingAfter(ticks=20, initial=75.76) returns 55.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0140 begin`);
      const actual: number = remainingAfter(20, 75.76);
      logInfo(`remainingAfter(ticks=20, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(55.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0141
     * @tc.name      WindowStartIcon_RemainingAfter_0141
     * @tc.desc      remainingAfter(ticks=135, initial=142) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0141 begin`);
      const actual: number = remainingAfter(135, 142);
      logInfo(`remainingAfter(ticks=135, initial=142): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RemainingAfter_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0142
     * @tc.name      WindowStartIcon_RemainingAfter_0142
     * @tc.desc      remainingAfter(ticks=44, initial=190) returns 146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0142 begin`);
      const actual: number = remainingAfter(44, 190);
      logInfo(`remainingAfter(ticks=44, initial=190): actual=${actual}`);
      expect(actual).assertEqual(146);
      logInfo(`${BUNDLE}RemainingAfter_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0143
     * @tc.name      WindowStartIcon_RemainingAfter_0143
     * @tc.desc      remainingAfter(ticks=21, initial=75.76) returns 54.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0143 begin`);
      const actual: number = remainingAfter(21, 75.76);
      logInfo(`remainingAfter(ticks=21, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(54.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0144
     * @tc.name      WindowStartIcon_RemainingAfter_0144
     * @tc.desc      remainingAfter(ticks=58.09, initial=142) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0144 begin`);
      const actual: number = remainingAfter(58.09, 142);
      logInfo(`remainingAfter(ticks=58.09, initial=142): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}RemainingAfter_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0145
     * @tc.name      WindowStartIcon_RemainingAfter_0145
     * @tc.desc      remainingAfter(ticks=1, initial=190) returns 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0145 begin`);
      const actual: number = remainingAfter(1, 190);
      logInfo(`remainingAfter(ticks=1, initial=190): actual=${actual}`);
      expect(actual).assertEqual(189);
      logInfo(`${BUNDLE}RemainingAfter_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0146
     * @tc.name      WindowStartIcon_RemainingAfter_0146
     * @tc.desc      remainingAfter(ticks=56, initial=170) returns 114
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0146 begin`);
      const actual: number = remainingAfter(56, 170);
      logInfo(`remainingAfter(ticks=56, initial=170): actual=${actual}`);
      expect(actual).assertEqual(114);
      logInfo(`${BUNDLE}RemainingAfter_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0147
     * @tc.name      WindowStartIcon_RemainingAfter_0147
     * @tc.desc      remainingAfter(ticks=5, initial=75.76) returns 70.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0147 begin`);
      const actual: number = remainingAfter(5, 75.76);
      logInfo(`remainingAfter(ticks=5, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(70.76, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0148
     * @tc.name      WindowStartIcon_RemainingAfter_0148
     * @tc.desc      remainingAfter(ticks=4, initial=96.17) returns 92.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0148 begin`);
      const actual: number = remainingAfter(4, 96.17);
      logInfo(`remainingAfter(ticks=4, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(92.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0149
     * @tc.name      WindowStartIcon_RemainingAfter_0149
     * @tc.desc      remainingAfter(ticks=15, initial=91) returns 76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0149 begin`);
      const actual: number = remainingAfter(15, 91);
      logInfo(`remainingAfter(ticks=15, initial=91): actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}RemainingAfter_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0150
     * @tc.name      WindowStartIcon_RemainingAfter_0150
     * @tc.desc      remainingAfter(ticks=56, initial=175) returns 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0150 begin`);
      const actual: number = remainingAfter(56, 175);
      logInfo(`remainingAfter(ticks=56, initial=175): actual=${actual}`);
      expect(actual).assertEqual(119);
      logInfo(`${BUNDLE}RemainingAfter_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0151
     * @tc.name      WindowStartIcon_RemainingAfter_0151
     * @tc.desc      remainingAfter(ticks=20, initial=41.89) returns 21.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0151 begin`);
      const actual: number = remainingAfter(20, 41.89);
      logInfo(`remainingAfter(ticks=20, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(21.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0152
     * @tc.name      WindowStartIcon_RemainingAfter_0152
     * @tc.desc      remainingAfter(ticks=56, initial=150) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0152 begin`);
      const actual: number = remainingAfter(56, 150);
      logInfo(`remainingAfter(ticks=56, initial=150): actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}RemainingAfter_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0153
     * @tc.name      WindowStartIcon_RemainingAfter_0153
     * @tc.desc      remainingAfter(ticks=85, initial=133) returns 48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0153 begin`);
      const actual: number = remainingAfter(85, 133);
      logInfo(`remainingAfter(ticks=85, initial=133): actual=${actual}`);
      expect(actual).assertEqual(48);
      logInfo(`${BUNDLE}RemainingAfter_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0154
     * @tc.name      WindowStartIcon_RemainingAfter_0154
     * @tc.desc      remainingAfter(ticks=50, initial=133) returns 83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0154 begin`);
      const actual: number = remainingAfter(50, 133);
      logInfo(`remainingAfter(ticks=50, initial=133): actual=${actual}`);
      expect(actual).assertEqual(83);
      logInfo(`${BUNDLE}RemainingAfter_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0155
     * @tc.name      WindowStartIcon_RemainingAfter_0155
     * @tc.desc      remainingAfter(ticks=90, initial=136) returns 46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0155 begin`);
      const actual: number = remainingAfter(90, 136);
      logInfo(`remainingAfter(ticks=90, initial=136): actual=${actual}`);
      expect(actual).assertEqual(46);
      logInfo(`${BUNDLE}RemainingAfter_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0156
     * @tc.name      WindowStartIcon_RemainingAfter_0156
     * @tc.desc      remainingAfter(ticks=1, initial=180) returns 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0156 begin`);
      const actual: number = remainingAfter(1, 180);
      logInfo(`remainingAfter(ticks=1, initial=180): actual=${actual}`);
      expect(actual).assertEqual(179);
      logInfo(`${BUNDLE}RemainingAfter_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0157
     * @tc.name      WindowStartIcon_RemainingAfter_0157
     * @tc.desc      remainingAfter(ticks=21, initial=75) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0157 begin`);
      const actual: number = remainingAfter(21, 75);
      logInfo(`remainingAfter(ticks=21, initial=75): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}RemainingAfter_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0158
     * @tc.name      WindowStartIcon_RemainingAfter_0158
     * @tc.desc      remainingAfter(ticks=21, initial=165) returns 144
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0158 begin`);
      const actual: number = remainingAfter(21, 165);
      logInfo(`remainingAfter(ticks=21, initial=165): actual=${actual}`);
      expect(actual).assertEqual(144);
      logInfo(`${BUNDLE}RemainingAfter_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0159
     * @tc.name      WindowStartIcon_RemainingAfter_0159
     * @tc.desc      remainingAfter(ticks=21, initial=185) returns 164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0159 begin`);
      const actual: number = remainingAfter(21, 185);
      logInfo(`remainingAfter(ticks=21, initial=185): actual=${actual}`);
      expect(actual).assertEqual(164);
      logInfo(`${BUNDLE}RemainingAfter_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0160
     * @tc.name      WindowStartIcon_RemainingAfter_0160
     * @tc.desc      remainingAfter(ticks=3, initial=200) returns 197
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0160 begin`);
      const actual: number = remainingAfter(3, 200);
      logInfo(`remainingAfter(ticks=3, initial=200): actual=${actual}`);
      expect(actual).assertEqual(197);
      logInfo(`${BUNDLE}RemainingAfter_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0161
     * @tc.name      WindowStartIcon_RemainingAfter_0161
     * @tc.desc      remainingAfter(ticks=50.37, initial=159) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0161 begin`);
      const actual: number = remainingAfter(50.37, 159);
      logInfo(`remainingAfter(ticks=50.37, initial=159): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}RemainingAfter_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0162
     * @tc.name      WindowStartIcon_RemainingAfter_0162
     * @tc.desc      remainingAfter(ticks=44, initial=75.76) returns 31.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0162 begin`);
      const actual: number = remainingAfter(44, 75.76);
      logInfo(`remainingAfter(ticks=44, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(31.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0163
     * @tc.name      WindowStartIcon_RemainingAfter_0163
     * @tc.desc      remainingAfter(ticks=50, initial=136) returns 86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0163 begin`);
      const actual: number = remainingAfter(50, 136);
      logInfo(`remainingAfter(ticks=50, initial=136): actual=${actual}`);
      expect(actual).assertEqual(86);
      logInfo(`${BUNDLE}RemainingAfter_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0164
     * @tc.name      WindowStartIcon_RemainingAfter_0164
     * @tc.desc      remainingAfter(ticks=80, initial=176) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0164 begin`);
      const actual: number = remainingAfter(80, 176);
      logInfo(`remainingAfter(ticks=80, initial=176): actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}RemainingAfter_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0165
     * @tc.name      WindowStartIcon_RemainingAfter_0165
     * @tc.desc      remainingAfter(ticks=97, initial=125) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0165 begin`);
      const actual: number = remainingAfter(97, 125);
      logInfo(`remainingAfter(ticks=97, initial=125): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}RemainingAfter_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0166
     * @tc.name      WindowStartIcon_RemainingAfter_0166
     * @tc.desc      remainingAfter(ticks=1, initial=75.76) returns 74.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0166 begin`);
      const actual: number = remainingAfter(1, 75.76);
      logInfo(`remainingAfter(ticks=1, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(74.76, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0167
     * @tc.name      WindowStartIcon_RemainingAfter_0167
     * @tc.desc      remainingAfter(ticks=3, initial=91) returns 88
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0167 begin`);
      const actual: number = remainingAfter(3, 91);
      logInfo(`remainingAfter(ticks=3, initial=91): actual=${actual}`);
      expect(actual).assertEqual(88);
      logInfo(`${BUNDLE}RemainingAfter_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0168
     * @tc.name      WindowStartIcon_RemainingAfter_0168
     * @tc.desc      remainingAfter(ticks=3, initial=125) returns 122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0168 begin`);
      const actual: number = remainingAfter(3, 125);
      logInfo(`remainingAfter(ticks=3, initial=125): actual=${actual}`);
      expect(actual).assertEqual(122);
      logInfo(`${BUNDLE}RemainingAfter_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0169
     * @tc.name      WindowStartIcon_RemainingAfter_0169
     * @tc.desc      remainingAfter(ticks=1, initial=200) returns 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0169 begin`);
      const actual: number = remainingAfter(1, 200);
      logInfo(`remainingAfter(ticks=1, initial=200): actual=${actual}`);
      expect(actual).assertEqual(199);
      logInfo(`${BUNDLE}RemainingAfter_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0170
     * @tc.name      WindowStartIcon_RemainingAfter_0170
     * @tc.desc      remainingAfter(ticks=4, initial=115) returns 111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0170 begin`);
      const actual: number = remainingAfter(4, 115);
      logInfo(`remainingAfter(ticks=4, initial=115): actual=${actual}`);
      expect(actual).assertEqual(111);
      logInfo(`${BUNDLE}RemainingAfter_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0171
     * @tc.name      WindowStartIcon_RemainingAfter_0171
     * @tc.desc      remainingAfter(ticks=3, initial=20) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0171 begin`);
      const actual: number = remainingAfter(3, 20);
      logInfo(`remainingAfter(ticks=3, initial=20): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}RemainingAfter_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0172
     * @tc.name      WindowStartIcon_RemainingAfter_0172
     * @tc.desc      remainingAfter(ticks=45, initial=142) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0172 begin`);
      const actual: number = remainingAfter(45, 142);
      logInfo(`remainingAfter(ticks=45, initial=142): actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}RemainingAfter_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0173
     * @tc.name      WindowStartIcon_RemainingAfter_0173
     * @tc.desc      remainingAfter(ticks=21, initial=133) returns 112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0173 begin`);
      const actual: number = remainingAfter(21, 133);
      logInfo(`remainingAfter(ticks=21, initial=133): actual=${actual}`);
      expect(actual).assertEqual(112);
      logInfo(`${BUNDLE}RemainingAfter_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0174
     * @tc.name      WindowStartIcon_RemainingAfter_0174
     * @tc.desc      remainingAfter(ticks=60, initial=96.17) returns 36.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0174 begin`);
      const actual: number = remainingAfter(60, 96.17);
      logInfo(`remainingAfter(ticks=60, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(36.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0175
     * @tc.name      WindowStartIcon_RemainingAfter_0175
     * @tc.desc      remainingAfter(ticks=1, initial=125) returns 124
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0175 begin`);
      const actual: number = remainingAfter(1, 125);
      logInfo(`remainingAfter(ticks=1, initial=125): actual=${actual}`);
      expect(actual).assertEqual(124);
      logInfo(`${BUNDLE}RemainingAfter_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0176
     * @tc.name      WindowStartIcon_RemainingAfter_0176
     * @tc.desc      remainingAfter(ticks=3, initial=170) returns 167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0176 begin`);
      const actual: number = remainingAfter(3, 170);
      logInfo(`remainingAfter(ticks=3, initial=170): actual=${actual}`);
      expect(actual).assertEqual(167);
      logInfo(`${BUNDLE}RemainingAfter_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0177
     * @tc.name      WindowStartIcon_RemainingAfter_0177
     * @tc.desc      remainingAfter(ticks=115, initial=142) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0177 begin`);
      const actual: number = remainingAfter(115, 142);
      logInfo(`remainingAfter(ticks=115, initial=142): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}RemainingAfter_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0178
     * @tc.name      WindowStartIcon_RemainingAfter_0178
     * @tc.desc      remainingAfter(ticks=97, initial=120) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0178 begin`);
      const actual: number = remainingAfter(97, 120);
      logInfo(`remainingAfter(ticks=97, initial=120): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}RemainingAfter_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0179
     * @tc.name      WindowStartIcon_RemainingAfter_0179
     * @tc.desc      remainingAfter(ticks=1, initial=195) returns 194
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0179 begin`);
      const actual: number = remainingAfter(1, 195);
      logInfo(`remainingAfter(ticks=1, initial=195): actual=${actual}`);
      expect(actual).assertEqual(194);
      logInfo(`${BUNDLE}RemainingAfter_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0180
     * @tc.name      WindowStartIcon_RemainingAfter_0180
     * @tc.desc      remainingAfter(ticks=58.09, initial=175) returns 117
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0180 begin`);
      const actual: number = remainingAfter(58.09, 175);
      logInfo(`remainingAfter(ticks=58.09, initial=175): actual=${actual}`);
      expect(actual).assertEqual(117);
      logInfo(`${BUNDLE}RemainingAfter_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0181
     * @tc.name      WindowStartIcon_RemainingAfter_0181
     * @tc.desc      remainingAfter(ticks=60, initial=67.03) returns 7.030000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0181 begin`);
      const actual: number = remainingAfter(60, 67.03);
      logInfo(`remainingAfter(ticks=60, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(7.030000000000001, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0182
     * @tc.name      WindowStartIcon_RemainingAfter_0182
     * @tc.desc      remainingAfter(ticks=45, initial=67.03) returns 22.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0182 begin`);
      const actual: number = remainingAfter(45, 67.03);
      logInfo(`remainingAfter(ticks=45, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(22.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0183
     * @tc.name      WindowStartIcon_RemainingAfter_0183
     * @tc.desc      remainingAfter(ticks=1, initial=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0183 begin`);
      const actual: number = remainingAfter(1, 35);
      logInfo(`remainingAfter(ticks=1, initial=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}RemainingAfter_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0184
     * @tc.name      WindowStartIcon_RemainingAfter_0184
     * @tc.desc      remainingAfter(ticks=4, initial=200) returns 196
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0184 begin`);
      const actual: number = remainingAfter(4, 200);
      logInfo(`remainingAfter(ticks=4, initial=200): actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}RemainingAfter_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0185
     * @tc.name      WindowStartIcon_RemainingAfter_0185
     * @tc.desc      remainingAfter(ticks=3, initial=130) returns 127
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0185 begin`);
      const actual: number = remainingAfter(3, 130);
      logInfo(`remainingAfter(ticks=3, initial=130): actual=${actual}`);
      expect(actual).assertEqual(127);
      logInfo(`${BUNDLE}RemainingAfter_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0186
     * @tc.name      WindowStartIcon_RemainingAfter_0186
     * @tc.desc      remainingAfter(ticks=2, initial=96.17) returns 94.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0186 begin`);
      const actual: number = remainingAfter(2, 96.17);
      logInfo(`remainingAfter(ticks=2, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(94.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0187
     * @tc.name      WindowStartIcon_RemainingAfter_0187
     * @tc.desc      remainingAfter(ticks=56, initial=75.76) returns 19.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0187 begin`);
      const actual: number = remainingAfter(56, 75.76);
      logInfo(`remainingAfter(ticks=56, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(19.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0188
     * @tc.name      WindowStartIcon_RemainingAfter_0188
     * @tc.desc      remainingAfter(ticks=40, initial=133) returns 93
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0188 begin`);
      const actual: number = remainingAfter(40, 133);
      logInfo(`remainingAfter(ticks=40, initial=133): actual=${actual}`);
      expect(actual).assertEqual(93);
      logInfo(`${BUNDLE}RemainingAfter_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0189
     * @tc.name      WindowStartIcon_RemainingAfter_0189
     * @tc.desc      remainingAfter(ticks=3, initial=155) returns 152
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0189 begin`);
      const actual: number = remainingAfter(3, 155);
      logInfo(`remainingAfter(ticks=3, initial=155): actual=${actual}`);
      expect(actual).assertEqual(152);
      logInfo(`${BUNDLE}RemainingAfter_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0190
     * @tc.name      WindowStartIcon_RemainingAfter_0190
     * @tc.desc      remainingAfter(ticks=15, initial=176) returns 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0190 begin`);
      const actual: number = remainingAfter(15, 176);
      logInfo(`remainingAfter(ticks=15, initial=176): actual=${actual}`);
      expect(actual).assertEqual(161);
      logInfo(`${BUNDLE}RemainingAfter_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0191
     * @tc.name      WindowStartIcon_RemainingAfter_0191
     * @tc.desc      remainingAfter(ticks=58.09, initial=195) returns 137
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0191 begin`);
      const actual: number = remainingAfter(58.09, 195);
      logInfo(`remainingAfter(ticks=58.09, initial=195): actual=${actual}`);
      expect(actual).assertEqual(137);
      logInfo(`${BUNDLE}RemainingAfter_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0192
     * @tc.name      WindowStartIcon_RemainingAfter_0192
     * @tc.desc      remainingAfter(ticks=1, initial=67.03) returns 66.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0192 begin`);
      const actual: number = remainingAfter(1, 67.03);
      logInfo(`remainingAfter(ticks=1, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(66.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0192 end`);
    });
  });
}
