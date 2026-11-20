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
import { elapsedMsOf } from '../model/AdvertisingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowStartIcon]';
const BUNDLE: string = 'WindowStartIcon_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for elapsedMsOf (96 cases). */
export default function elapsedMsOf2Test(): void {
  describe('ElapsedMsOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0097
     * @tc.name      WindowStartIcon_ElapsedMsOf_0097
     * @tc.desc      elapsedMsOf(ticks=86.75) returns 86000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0097 begin`);
      const actual: number = elapsedMsOf(86.75);
      logInfo(`elapsedMsOf(ticks=86.75): actual=${actual}`);
      expect(actual).assertEqual(86000);
      logInfo(`${BUNDLE}ElapsedMsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0098
     * @tc.name      WindowStartIcon_ElapsedMsOf_0098
     * @tc.desc      elapsedMsOf(ticks=174) returns 174000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0098 begin`);
      const actual: number = elapsedMsOf(174);
      logInfo(`elapsedMsOf(ticks=174): actual=${actual}`);
      expect(actual).assertEqual(174000);
      logInfo(`${BUNDLE}ElapsedMsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0099
     * @tc.name      WindowStartIcon_ElapsedMsOf_0099
     * @tc.desc      elapsedMsOf(ticks=144) returns 144000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0099 begin`);
      const actual: number = elapsedMsOf(144);
      logInfo(`elapsedMsOf(ticks=144): actual=${actual}`);
      expect(actual).assertEqual(144000);
      logInfo(`${BUNDLE}ElapsedMsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0100
     * @tc.name      WindowStartIcon_ElapsedMsOf_0100
     * @tc.desc      elapsedMsOf(ticks=58.84) returns 58000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0100 begin`);
      const actual: number = elapsedMsOf(58.84);
      logInfo(`elapsedMsOf(ticks=58.84): actual=${actual}`);
      expect(actual).assertEqual(58000);
      logInfo(`${BUNDLE}ElapsedMsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0101
     * @tc.name      WindowStartIcon_ElapsedMsOf_0101
     * @tc.desc      elapsedMsOf(ticks=98.13) returns 98000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0101 begin`);
      const actual: number = elapsedMsOf(98.13);
      logInfo(`elapsedMsOf(ticks=98.13): actual=${actual}`);
      expect(actual).assertEqual(98000);
      logInfo(`${BUNDLE}ElapsedMsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0102
     * @tc.name      WindowStartIcon_ElapsedMsOf_0102
     * @tc.desc      elapsedMsOf(ticks=187) returns 187000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0102 begin`);
      const actual: number = elapsedMsOf(187);
      logInfo(`elapsedMsOf(ticks=187): actual=${actual}`);
      expect(actual).assertEqual(187000);
      logInfo(`${BUNDLE}ElapsedMsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0103
     * @tc.name      WindowStartIcon_ElapsedMsOf_0103
     * @tc.desc      elapsedMsOf(ticks=61.07) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0103 begin`);
      const actual: number = elapsedMsOf(61.07);
      logInfo(`elapsedMsOf(ticks=61.07): actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}ElapsedMsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0104
     * @tc.name      WindowStartIcon_ElapsedMsOf_0104
     * @tc.desc      elapsedMsOf(ticks=102) returns 102000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0104 begin`);
      const actual: number = elapsedMsOf(102);
      logInfo(`elapsedMsOf(ticks=102): actual=${actual}`);
      expect(actual).assertEqual(102000);
      logInfo(`${BUNDLE}ElapsedMsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0105
     * @tc.name      WindowStartIcon_ElapsedMsOf_0105
     * @tc.desc      elapsedMsOf(ticks=19) returns 19000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0105 begin`);
      const actual: number = elapsedMsOf(19);
      logInfo(`elapsedMsOf(ticks=19): actual=${actual}`);
      expect(actual).assertEqual(19000);
      logInfo(`${BUNDLE}ElapsedMsOf_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0106
     * @tc.name      WindowStartIcon_ElapsedMsOf_0106
     * @tc.desc      elapsedMsOf(ticks=33.84) returns 33000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0106 begin`);
      const actual: number = elapsedMsOf(33.84);
      logInfo(`elapsedMsOf(ticks=33.84): actual=${actual}`);
      expect(actual).assertEqual(33000);
      logInfo(`${BUNDLE}ElapsedMsOf_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0107
     * @tc.name      WindowStartIcon_ElapsedMsOf_0107
     * @tc.desc      elapsedMsOf(ticks=128) returns 128000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0107 begin`);
      const actual: number = elapsedMsOf(128);
      logInfo(`elapsedMsOf(ticks=128): actual=${actual}`);
      expect(actual).assertEqual(128000);
      logInfo(`${BUNDLE}ElapsedMsOf_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0108
     * @tc.name      WindowStartIcon_ElapsedMsOf_0108
     * @tc.desc      elapsedMsOf(ticks=136) returns 136000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0108 begin`);
      const actual: number = elapsedMsOf(136);
      logInfo(`elapsedMsOf(ticks=136): actual=${actual}`);
      expect(actual).assertEqual(136000);
      logInfo(`${BUNDLE}ElapsedMsOf_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0109
     * @tc.name      WindowStartIcon_ElapsedMsOf_0109
     * @tc.desc      elapsedMsOf(ticks=72.45) returns 72000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0109 begin`);
      const actual: number = elapsedMsOf(72.45);
      logInfo(`elapsedMsOf(ticks=72.45): actual=${actual}`);
      expect(actual).assertEqual(72000);
      logInfo(`${BUNDLE}ElapsedMsOf_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0110
     * @tc.name      WindowStartIcon_ElapsedMsOf_0110
     * @tc.desc      elapsedMsOf(ticks=103) returns 103000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0110 begin`);
      const actual: number = elapsedMsOf(103);
      logInfo(`elapsedMsOf(ticks=103): actual=${actual}`);
      expect(actual).assertEqual(103000);
      logInfo(`${BUNDLE}ElapsedMsOf_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0111
     * @tc.name      WindowStartIcon_ElapsedMsOf_0111
     * @tc.desc      elapsedMsOf(ticks=167) returns 167000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0111 begin`);
      const actual: number = elapsedMsOf(167);
      logInfo(`elapsedMsOf(ticks=167): actual=${actual}`);
      expect(actual).assertEqual(167000);
      logInfo(`${BUNDLE}ElapsedMsOf_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0112
     * @tc.name      WindowStartIcon_ElapsedMsOf_0112
     * @tc.desc      elapsedMsOf(ticks=141) returns 141000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0112 begin`);
      const actual: number = elapsedMsOf(141);
      logInfo(`elapsedMsOf(ticks=141): actual=${actual}`);
      expect(actual).assertEqual(141000);
      logInfo(`${BUNDLE}ElapsedMsOf_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0113
     * @tc.name      WindowStartIcon_ElapsedMsOf_0113
     * @tc.desc      elapsedMsOf(ticks=178) returns 178000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0113 begin`);
      const actual: number = elapsedMsOf(178);
      logInfo(`elapsedMsOf(ticks=178): actual=${actual}`);
      expect(actual).assertEqual(178000);
      logInfo(`${BUNDLE}ElapsedMsOf_0113 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0114
     * @tc.name      WindowStartIcon_ElapsedMsOf_0114
     * @tc.desc      elapsedMsOf(ticks=168) returns 168000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0114 begin`);
      const actual: number = elapsedMsOf(168);
      logInfo(`elapsedMsOf(ticks=168): actual=${actual}`);
      expect(actual).assertEqual(168000);
      logInfo(`${BUNDLE}ElapsedMsOf_0114 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0115
     * @tc.name      WindowStartIcon_ElapsedMsOf_0115
     * @tc.desc      elapsedMsOf(ticks=12.46) returns 12000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0115 begin`);
      const actual: number = elapsedMsOf(12.46);
      logInfo(`elapsedMsOf(ticks=12.46): actual=${actual}`);
      expect(actual).assertEqual(12000);
      logInfo(`${BUNDLE}ElapsedMsOf_0115 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0116
     * @tc.name      WindowStartIcon_ElapsedMsOf_0116
     * @tc.desc      elapsedMsOf(ticks=11) returns 11000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0116 begin`);
      const actual: number = elapsedMsOf(11);
      logInfo(`elapsedMsOf(ticks=11): actual=${actual}`);
      expect(actual).assertEqual(11000);
      logInfo(`${BUNDLE}ElapsedMsOf_0116 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0117
     * @tc.name      WindowStartIcon_ElapsedMsOf_0117
     * @tc.desc      elapsedMsOf(ticks=23.89) returns 23000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0117 begin`);
      const actual: number = elapsedMsOf(23.89);
      logInfo(`elapsedMsOf(ticks=23.89): actual=${actual}`);
      expect(actual).assertEqual(23000);
      logInfo(`${BUNDLE}ElapsedMsOf_0117 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0118
     * @tc.name      WindowStartIcon_ElapsedMsOf_0118
     * @tc.desc      elapsedMsOf(ticks=192) returns 192000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0118 begin`);
      const actual: number = elapsedMsOf(192);
      logInfo(`elapsedMsOf(ticks=192): actual=${actual}`);
      expect(actual).assertEqual(192000);
      logInfo(`${BUNDLE}ElapsedMsOf_0118 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0119
     * @tc.name      WindowStartIcon_ElapsedMsOf_0119
     * @tc.desc      elapsedMsOf(ticks=169) returns 169000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0119 begin`);
      const actual: number = elapsedMsOf(169);
      logInfo(`elapsedMsOf(ticks=169): actual=${actual}`);
      expect(actual).assertEqual(169000);
      logInfo(`${BUNDLE}ElapsedMsOf_0119 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0120
     * @tc.name      WindowStartIcon_ElapsedMsOf_0120
     * @tc.desc      elapsedMsOf(ticks=114) returns 114000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0120 begin`);
      const actual: number = elapsedMsOf(114);
      logInfo(`elapsedMsOf(ticks=114): actual=${actual}`);
      expect(actual).assertEqual(114000);
      logInfo(`${BUNDLE}ElapsedMsOf_0120 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0121
     * @tc.name      WindowStartIcon_ElapsedMsOf_0121
     * @tc.desc      elapsedMsOf(ticks=196) returns 196000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0121 begin`);
      const actual: number = elapsedMsOf(196);
      logInfo(`elapsedMsOf(ticks=196): actual=${actual}`);
      expect(actual).assertEqual(196000);
      logInfo(`${BUNDLE}ElapsedMsOf_0121 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0122
     * @tc.name      WindowStartIcon_ElapsedMsOf_0122
     * @tc.desc      elapsedMsOf(ticks=194) returns 194000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0122 begin`);
      const actual: number = elapsedMsOf(194);
      logInfo(`elapsedMsOf(ticks=194): actual=${actual}`);
      expect(actual).assertEqual(194000);
      logInfo(`${BUNDLE}ElapsedMsOf_0122 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0123
     * @tc.name      WindowStartIcon_ElapsedMsOf_0123
     * @tc.desc      elapsedMsOf(ticks=176) returns 176000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0123 begin`);
      const actual: number = elapsedMsOf(176);
      logInfo(`elapsedMsOf(ticks=176): actual=${actual}`);
      expect(actual).assertEqual(176000);
      logInfo(`${BUNDLE}ElapsedMsOf_0123 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0124
     * @tc.name      WindowStartIcon_ElapsedMsOf_0124
     * @tc.desc      elapsedMsOf(ticks=69) returns 69000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0124 begin`);
      const actual: number = elapsedMsOf(69);
      logInfo(`elapsedMsOf(ticks=69): actual=${actual}`);
      expect(actual).assertEqual(69000);
      logInfo(`${BUNDLE}ElapsedMsOf_0124 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0125
     * @tc.name      WindowStartIcon_ElapsedMsOf_0125
     * @tc.desc      elapsedMsOf(ticks=26) returns 26000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0125 begin`);
      const actual: number = elapsedMsOf(26);
      logInfo(`elapsedMsOf(ticks=26): actual=${actual}`);
      expect(actual).assertEqual(26000);
      logInfo(`${BUNDLE}ElapsedMsOf_0125 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0126
     * @tc.name      WindowStartIcon_ElapsedMsOf_0126
     * @tc.desc      elapsedMsOf(ticks=171) returns 171000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0126 begin`);
      const actual: number = elapsedMsOf(171);
      logInfo(`elapsedMsOf(ticks=171): actual=${actual}`);
      expect(actual).assertEqual(171000);
      logInfo(`${BUNDLE}ElapsedMsOf_0126 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0127
     * @tc.name      WindowStartIcon_ElapsedMsOf_0127
     * @tc.desc      elapsedMsOf(ticks=117) returns 117000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0127 begin`);
      const actual: number = elapsedMsOf(117);
      logInfo(`elapsedMsOf(ticks=117): actual=${actual}`);
      expect(actual).assertEqual(117000);
      logInfo(`${BUNDLE}ElapsedMsOf_0127 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0128
     * @tc.name      WindowStartIcon_ElapsedMsOf_0128
     * @tc.desc      elapsedMsOf(ticks=82) returns 82000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0128 begin`);
      const actual: number = elapsedMsOf(82);
      logInfo(`elapsedMsOf(ticks=82): actual=${actual}`);
      expect(actual).assertEqual(82000);
      logInfo(`${BUNDLE}ElapsedMsOf_0128 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0129
     * @tc.name      WindowStartIcon_ElapsedMsOf_0129
     * @tc.desc      elapsedMsOf(ticks=147) returns 147000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0129 begin`);
      const actual: number = elapsedMsOf(147);
      logInfo(`elapsedMsOf(ticks=147): actual=${actual}`);
      expect(actual).assertEqual(147000);
      logInfo(`${BUNDLE}ElapsedMsOf_0129 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0130
     * @tc.name      WindowStartIcon_ElapsedMsOf_0130
     * @tc.desc      elapsedMsOf(ticks=71.75) returns 71000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0130 begin`);
      const actual: number = elapsedMsOf(71.75);
      logInfo(`elapsedMsOf(ticks=71.75): actual=${actual}`);
      expect(actual).assertEqual(71000);
      logInfo(`${BUNDLE}ElapsedMsOf_0130 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0131
     * @tc.name      WindowStartIcon_ElapsedMsOf_0131
     * @tc.desc      elapsedMsOf(ticks=14) returns 14000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0131 begin`);
      const actual: number = elapsedMsOf(14);
      logInfo(`elapsedMsOf(ticks=14): actual=${actual}`);
      expect(actual).assertEqual(14000);
      logInfo(`${BUNDLE}ElapsedMsOf_0131 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0132
     * @tc.name      WindowStartIcon_ElapsedMsOf_0132
     * @tc.desc      elapsedMsOf(ticks=172) returns 172000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0132 begin`);
      const actual: number = elapsedMsOf(172);
      logInfo(`elapsedMsOf(ticks=172): actual=${actual}`);
      expect(actual).assertEqual(172000);
      logInfo(`${BUNDLE}ElapsedMsOf_0132 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0133
     * @tc.name      WindowStartIcon_ElapsedMsOf_0133
     * @tc.desc      elapsedMsOf(ticks=31.88) returns 31000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0133 begin`);
      const actual: number = elapsedMsOf(31.88);
      logInfo(`elapsedMsOf(ticks=31.88): actual=${actual}`);
      expect(actual).assertEqual(31000);
      logInfo(`${BUNDLE}ElapsedMsOf_0133 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0134
     * @tc.name      WindowStartIcon_ElapsedMsOf_0134
     * @tc.desc      elapsedMsOf(ticks=24) returns 24000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0134 begin`);
      const actual: number = elapsedMsOf(24);
      logInfo(`elapsedMsOf(ticks=24): actual=${actual}`);
      expect(actual).assertEqual(24000);
      logInfo(`${BUNDLE}ElapsedMsOf_0134 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0135
     * @tc.name      WindowStartIcon_ElapsedMsOf_0135
     * @tc.desc      elapsedMsOf(ticks=48) returns 48000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0135 begin`);
      const actual: number = elapsedMsOf(48);
      logInfo(`elapsedMsOf(ticks=48): actual=${actual}`);
      expect(actual).assertEqual(48000);
      logInfo(`${BUNDLE}ElapsedMsOf_0135 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0136
     * @tc.name      WindowStartIcon_ElapsedMsOf_0136
     * @tc.desc      elapsedMsOf(ticks=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_ElapsedMsOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0136 begin`);
      const actual: number = elapsedMsOf(-1);
      logInfo(`elapsedMsOf(ticks=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0136 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0137
     * @tc.name      WindowStartIcon_ElapsedMsOf_0137
     * @tc.desc      elapsedMsOf(ticks=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0137 begin`);
      const actual: number = elapsedMsOf(-100);
      logInfo(`elapsedMsOf(ticks=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0137 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0138
     * @tc.name      WindowStartIcon_ElapsedMsOf_0138
     * @tc.desc      elapsedMsOf(ticks=-23) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0138 begin`);
      const actual: number = elapsedMsOf(-23);
      logInfo(`elapsedMsOf(ticks=-23): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0138 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0139
     * @tc.name      WindowStartIcon_ElapsedMsOf_0139
     * @tc.desc      elapsedMsOf(ticks=-12) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0139 begin`);
      const actual: number = elapsedMsOf(-12);
      logInfo(`elapsedMsOf(ticks=-12): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0139 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0140
     * @tc.name      WindowStartIcon_ElapsedMsOf_0140
     * @tc.desc      elapsedMsOf(ticks=-95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0140 begin`);
      const actual: number = elapsedMsOf(-95);
      logInfo(`elapsedMsOf(ticks=-95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0140 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0141
     * @tc.name      WindowStartIcon_ElapsedMsOf_0141
     * @tc.desc      elapsedMsOf(ticks=-42) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0141 begin`);
      const actual: number = elapsedMsOf(-42);
      logInfo(`elapsedMsOf(ticks=-42): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0141 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0142
     * @tc.name      WindowStartIcon_ElapsedMsOf_0142
     * @tc.desc      elapsedMsOf(ticks=-77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0142 begin`);
      const actual: number = elapsedMsOf(-77);
      logInfo(`elapsedMsOf(ticks=-77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0142 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0143
     * @tc.name      WindowStartIcon_ElapsedMsOf_0143
     * @tc.desc      elapsedMsOf(ticks=-40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0143 begin`);
      const actual: number = elapsedMsOf(-40);
      logInfo(`elapsedMsOf(ticks=-40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0143 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0144
     * @tc.name      WindowStartIcon_ElapsedMsOf_0144
     * @tc.desc      elapsedMsOf(ticks=70.84) returns 70000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0144 begin`);
      const actual: number = elapsedMsOf(70.84);
      logInfo(`elapsedMsOf(ticks=70.84): actual=${actual}`);
      expect(actual).assertEqual(70000);
      logInfo(`${BUNDLE}ElapsedMsOf_0144 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0145
     * @tc.name      WindowStartIcon_ElapsedMsOf_0145
     * @tc.desc      elapsedMsOf(ticks=-57) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0145 begin`);
      const actual: number = elapsedMsOf(-57);
      logInfo(`elapsedMsOf(ticks=-57): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0145 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0146
     * @tc.name      WindowStartIcon_ElapsedMsOf_0146
     * @tc.desc      elapsedMsOf(ticks=-34) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0146 begin`);
      const actual: number = elapsedMsOf(-34);
      logInfo(`elapsedMsOf(ticks=-34): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0146 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0147
     * @tc.name      WindowStartIcon_ElapsedMsOf_0147
     * @tc.desc      elapsedMsOf(ticks=-15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0147 begin`);
      const actual: number = elapsedMsOf(-15);
      logInfo(`elapsedMsOf(ticks=-15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0147 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0148
     * @tc.name      WindowStartIcon_ElapsedMsOf_0148
     * @tc.desc      elapsedMsOf(ticks=-17) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0148 begin`);
      const actual: number = elapsedMsOf(-17);
      logInfo(`elapsedMsOf(ticks=-17): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0148 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0149
     * @tc.name      WindowStartIcon_ElapsedMsOf_0149
     * @tc.desc      elapsedMsOf(ticks=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0149 begin`);
      const actual: number = elapsedMsOf(-14);
      logInfo(`elapsedMsOf(ticks=-14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0150
     * @tc.name      WindowStartIcon_ElapsedMsOf_0150
     * @tc.desc      elapsedMsOf(ticks=-96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0150 begin`);
      const actual: number = elapsedMsOf(-96);
      logInfo(`elapsedMsOf(ticks=-96): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0151
     * @tc.name      WindowStartIcon_ElapsedMsOf_0151
     * @tc.desc      elapsedMsOf(ticks=-88) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0151 begin`);
      const actual: number = elapsedMsOf(-88);
      logInfo(`elapsedMsOf(ticks=-88): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0152
     * @tc.name      WindowStartIcon_ElapsedMsOf_0152
     * @tc.desc      elapsedMsOf(ticks=-97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0152 begin`);
      const actual: number = elapsedMsOf(-97);
      logInfo(`elapsedMsOf(ticks=-97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0153
     * @tc.name      WindowStartIcon_ElapsedMsOf_0153
     * @tc.desc      elapsedMsOf(ticks=90.24) returns 90000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0153 begin`);
      const actual: number = elapsedMsOf(90.24);
      logInfo(`elapsedMsOf(ticks=90.24): actual=${actual}`);
      expect(actual).assertEqual(90000);
      logInfo(`${BUNDLE}ElapsedMsOf_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0154
     * @tc.name      WindowStartIcon_ElapsedMsOf_0154
     * @tc.desc      elapsedMsOf(ticks=-16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0154 begin`);
      const actual: number = elapsedMsOf(-16);
      logInfo(`elapsedMsOf(ticks=-16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0155
     * @tc.name      WindowStartIcon_ElapsedMsOf_0155
     * @tc.desc      elapsedMsOf(ticks=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0155 begin`);
      const actual: number = elapsedMsOf(-4);
      logInfo(`elapsedMsOf(ticks=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0156
     * @tc.name      WindowStartIcon_ElapsedMsOf_0156
     * @tc.desc      elapsedMsOf(ticks=55.92) returns 55000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0156 begin`);
      const actual: number = elapsedMsOf(55.92);
      logInfo(`elapsedMsOf(ticks=55.92): actual=${actual}`);
      expect(actual).assertEqual(55000);
      logInfo(`${BUNDLE}ElapsedMsOf_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0157
     * @tc.name      WindowStartIcon_ElapsedMsOf_0157
     * @tc.desc      elapsedMsOf(ticks=-37) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0157 begin`);
      const actual: number = elapsedMsOf(-37);
      logInfo(`elapsedMsOf(ticks=-37): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0158
     * @tc.name      WindowStartIcon_ElapsedMsOf_0158
     * @tc.desc      elapsedMsOf(ticks=-45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0158 begin`);
      const actual: number = elapsedMsOf(-45);
      logInfo(`elapsedMsOf(ticks=-45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0159
     * @tc.name      WindowStartIcon_ElapsedMsOf_0159
     * @tc.desc      elapsedMsOf(ticks=-63) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0159 begin`);
      const actual: number = elapsedMsOf(-63);
      logInfo(`elapsedMsOf(ticks=-63): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0160
     * @tc.name      WindowStartIcon_ElapsedMsOf_0160
     * @tc.desc      elapsedMsOf(ticks=35.9) returns 35000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0160 begin`);
      const actual: number = elapsedMsOf(35.9);
      logInfo(`elapsedMsOf(ticks=35.9): actual=${actual}`);
      expect(actual).assertEqual(35000);
      logInfo(`${BUNDLE}ElapsedMsOf_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0161
     * @tc.name      WindowStartIcon_ElapsedMsOf_0161
     * @tc.desc      elapsedMsOf(ticks=-5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0161 begin`);
      const actual: number = elapsedMsOf(-5);
      logInfo(`elapsedMsOf(ticks=-5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0162
     * @tc.name      WindowStartIcon_ElapsedMsOf_0162
     * @tc.desc      elapsedMsOf(ticks=-60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0162 begin`);
      const actual: number = elapsedMsOf(-60);
      logInfo(`elapsedMsOf(ticks=-60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0163
     * @tc.name      WindowStartIcon_ElapsedMsOf_0163
     * @tc.desc      elapsedMsOf(ticks=-19) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0163 begin`);
      const actual: number = elapsedMsOf(-19);
      logInfo(`elapsedMsOf(ticks=-19): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0164
     * @tc.name      WindowStartIcon_ElapsedMsOf_0164
     * @tc.desc      elapsedMsOf(ticks=-36) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0164 begin`);
      const actual: number = elapsedMsOf(-36);
      logInfo(`elapsedMsOf(ticks=-36): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0165
     * @tc.name      WindowStartIcon_ElapsedMsOf_0165
     * @tc.desc      elapsedMsOf(ticks=36.06) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0165 begin`);
      const actual: number = elapsedMsOf(36.06);
      logInfo(`elapsedMsOf(ticks=36.06): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}ElapsedMsOf_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0166
     * @tc.name      WindowStartIcon_ElapsedMsOf_0166
     * @tc.desc      elapsedMsOf(ticks=97.79) returns 97000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0166 begin`);
      const actual: number = elapsedMsOf(97.79);
      logInfo(`elapsedMsOf(ticks=97.79): actual=${actual}`);
      expect(actual).assertEqual(97000);
      logInfo(`${BUNDLE}ElapsedMsOf_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0167
     * @tc.name      WindowStartIcon_ElapsedMsOf_0167
     * @tc.desc      elapsedMsOf(ticks=42.6) returns 42000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0167 begin`);
      const actual: number = elapsedMsOf(42.6);
      logInfo(`elapsedMsOf(ticks=42.6): actual=${actual}`);
      expect(actual).assertEqual(42000);
      logInfo(`${BUNDLE}ElapsedMsOf_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0168
     * @tc.name      WindowStartIcon_ElapsedMsOf_0168
     * @tc.desc      elapsedMsOf(ticks=87.31) returns 87000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0168 begin`);
      const actual: number = elapsedMsOf(87.31);
      logInfo(`elapsedMsOf(ticks=87.31): actual=${actual}`);
      expect(actual).assertEqual(87000);
      logInfo(`${BUNDLE}ElapsedMsOf_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0169
     * @tc.name      WindowStartIcon_ElapsedMsOf_0169
     * @tc.desc      elapsedMsOf(ticks=97) returns 97000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0169 begin`);
      const actual: number = elapsedMsOf(97);
      logInfo(`elapsedMsOf(ticks=97): actual=${actual}`);
      expect(actual).assertEqual(97000);
      logInfo(`${BUNDLE}ElapsedMsOf_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0170
     * @tc.name      WindowStartIcon_ElapsedMsOf_0170
     * @tc.desc      elapsedMsOf(ticks=1.83) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0170 begin`);
      const actual: number = elapsedMsOf(1.83);
      logInfo(`elapsedMsOf(ticks=1.83): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}ElapsedMsOf_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0171
     * @tc.name      WindowStartIcon_ElapsedMsOf_0171
     * @tc.desc      elapsedMsOf(ticks=-68) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0171 begin`);
      const actual: number = elapsedMsOf(-68);
      logInfo(`elapsedMsOf(ticks=-68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0172
     * @tc.name      WindowStartIcon_ElapsedMsOf_0172
     * @tc.desc      elapsedMsOf(ticks=-7) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0172 begin`);
      const actual: number = elapsedMsOf(-7);
      logInfo(`elapsedMsOf(ticks=-7): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0173
     * @tc.name      WindowStartIcon_ElapsedMsOf_0173
     * @tc.desc      elapsedMsOf(ticks=-10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0173 begin`);
      const actual: number = elapsedMsOf(-10);
      logInfo(`elapsedMsOf(ticks=-10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0174
     * @tc.name      WindowStartIcon_ElapsedMsOf_0174
     * @tc.desc      elapsedMsOf(ticks=65.71) returns 65000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0174 begin`);
      const actual: number = elapsedMsOf(65.71);
      logInfo(`elapsedMsOf(ticks=65.71): actual=${actual}`);
      expect(actual).assertEqual(65000);
      logInfo(`${BUNDLE}ElapsedMsOf_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0175
     * @tc.name      WindowStartIcon_ElapsedMsOf_0175
     * @tc.desc      elapsedMsOf(ticks=-67) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0175 begin`);
      const actual: number = elapsedMsOf(-67);
      logInfo(`elapsedMsOf(ticks=-67): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0176
     * @tc.name      WindowStartIcon_ElapsedMsOf_0176
     * @tc.desc      elapsedMsOf(ticks=0.3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0176 begin`);
      const actual: number = elapsedMsOf(0.3);
      logInfo(`elapsedMsOf(ticks=0.3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0177
     * @tc.name      WindowStartIcon_ElapsedMsOf_0177
     * @tc.desc      elapsedMsOf(ticks=46) returns 46000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0177 begin`);
      const actual: number = elapsedMsOf(46);
      logInfo(`elapsedMsOf(ticks=46): actual=${actual}`);
      expect(actual).assertEqual(46000);
      logInfo(`${BUNDLE}ElapsedMsOf_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0178
     * @tc.name      WindowStartIcon_ElapsedMsOf_0178
     * @tc.desc      elapsedMsOf(ticks=-85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0178 begin`);
      const actual: number = elapsedMsOf(-85);
      logInfo(`elapsedMsOf(ticks=-85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0179
     * @tc.name      WindowStartIcon_ElapsedMsOf_0179
     * @tc.desc      elapsedMsOf(ticks=32.34) returns 32000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0179 begin`);
      const actual: number = elapsedMsOf(32.34);
      logInfo(`elapsedMsOf(ticks=32.34): actual=${actual}`);
      expect(actual).assertEqual(32000);
      logInfo(`${BUNDLE}ElapsedMsOf_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0180
     * @tc.name      WindowStartIcon_ElapsedMsOf_0180
     * @tc.desc      elapsedMsOf(ticks=68.51) returns 68000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0180 begin`);
      const actual: number = elapsedMsOf(68.51);
      logInfo(`elapsedMsOf(ticks=68.51): actual=${actual}`);
      expect(actual).assertEqual(68000);
      logInfo(`${BUNDLE}ElapsedMsOf_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0181
     * @tc.name      WindowStartIcon_ElapsedMsOf_0181
     * @tc.desc      elapsedMsOf(ticks=-66) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0181 begin`);
      const actual: number = elapsedMsOf(-66);
      logInfo(`elapsedMsOf(ticks=-66): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0182
     * @tc.name      WindowStartIcon_ElapsedMsOf_0182
     * @tc.desc      elapsedMsOf(ticks=-53) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0182 begin`);
      const actual: number = elapsedMsOf(-53);
      logInfo(`elapsedMsOf(ticks=-53): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0183
     * @tc.name      WindowStartIcon_ElapsedMsOf_0183
     * @tc.desc      elapsedMsOf(ticks=98) returns 98000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0183 begin`);
      const actual: number = elapsedMsOf(98);
      logInfo(`elapsedMsOf(ticks=98): actual=${actual}`);
      expect(actual).assertEqual(98000);
      logInfo(`${BUNDLE}ElapsedMsOf_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0184
     * @tc.name      WindowStartIcon_ElapsedMsOf_0184
     * @tc.desc      elapsedMsOf(ticks=42.75) returns 42000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0184 begin`);
      const actual: number = elapsedMsOf(42.75);
      logInfo(`elapsedMsOf(ticks=42.75): actual=${actual}`);
      expect(actual).assertEqual(42000);
      logInfo(`${BUNDLE}ElapsedMsOf_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0185
     * @tc.name      WindowStartIcon_ElapsedMsOf_0185
     * @tc.desc      elapsedMsOf(ticks=55.46) returns 55000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0185 begin`);
      const actual: number = elapsedMsOf(55.46);
      logInfo(`elapsedMsOf(ticks=55.46): actual=${actual}`);
      expect(actual).assertEqual(55000);
      logInfo(`${BUNDLE}ElapsedMsOf_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0186
     * @tc.name      WindowStartIcon_ElapsedMsOf_0186
     * @tc.desc      elapsedMsOf(ticks=-83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0186 begin`);
      const actual: number = elapsedMsOf(-83);
      logInfo(`elapsedMsOf(ticks=-83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0187
     * @tc.name      WindowStartIcon_ElapsedMsOf_0187
     * @tc.desc      elapsedMsOf(ticks=-18) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0187 begin`);
      const actual: number = elapsedMsOf(-18);
      logInfo(`elapsedMsOf(ticks=-18): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0188
     * @tc.name      WindowStartIcon_ElapsedMsOf_0188
     * @tc.desc      elapsedMsOf(ticks=-44) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0188 begin`);
      const actual: number = elapsedMsOf(-44);
      logInfo(`elapsedMsOf(ticks=-44): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0189
     * @tc.name      WindowStartIcon_ElapsedMsOf_0189
     * @tc.desc      elapsedMsOf(ticks=-69) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0189 begin`);
      const actual: number = elapsedMsOf(-69);
      logInfo(`elapsedMsOf(ticks=-69): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0190
     * @tc.name      WindowStartIcon_ElapsedMsOf_0190
     * @tc.desc      elapsedMsOf(ticks=-46) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0190 begin`);
      const actual: number = elapsedMsOf(-46);
      logInfo(`elapsedMsOf(ticks=-46): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0191
     * @tc.name      WindowStartIcon_ElapsedMsOf_0191
     * @tc.desc      elapsedMsOf(ticks=15.25) returns 15000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0191 begin`);
      const actual: number = elapsedMsOf(15.25);
      logInfo(`elapsedMsOf(ticks=15.25): actual=${actual}`);
      expect(actual).assertEqual(15000);
      logInfo(`${BUNDLE}ElapsedMsOf_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0192
     * @tc.name      WindowStartIcon_ElapsedMsOf_0192
     * @tc.desc      elapsedMsOf(ticks=75.17) returns 75000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0192 begin`);
      const actual: number = elapsedMsOf(75.17);
      logInfo(`elapsedMsOf(ticks=75.17): actual=${actual}`);
      expect(actual).assertEqual(75000);
      logInfo(`${BUNDLE}ElapsedMsOf_0192 end`);
    });
  });
}
