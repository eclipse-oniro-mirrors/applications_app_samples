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
export default function remainingAfter3Test(): void {
  describe('RemainingAfter3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0193
     * @tc.name      WindowStartIcon_RemainingAfter_0193
     * @tc.desc      remainingAfter(ticks=15, initial=136) returns 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0193 begin`);
      const actual: number = remainingAfter(15, 136);
      logInfo(`remainingAfter(ticks=15, initial=136): actual=${actual}`);
      expect(actual).assertEqual(121);
      logInfo(`${BUNDLE}RemainingAfter_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0194
     * @tc.name      WindowStartIcon_RemainingAfter_0194
     * @tc.desc      remainingAfter(ticks=5, initial=176) returns 171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0194 begin`);
      const actual: number = remainingAfter(5, 176);
      logInfo(`remainingAfter(ticks=5, initial=176): actual=${actual}`);
      expect(actual).assertEqual(171);
      logInfo(`${BUNDLE}RemainingAfter_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0195
     * @tc.name      WindowStartIcon_RemainingAfter_0195
     * @tc.desc      remainingAfter(ticks=50.37, initial=75.76) returns 25.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0195 begin`);
      const actual: number = remainingAfter(50.37, 75.76);
      logInfo(`remainingAfter(ticks=50.37, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(25.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0196
     * @tc.name      WindowStartIcon_RemainingAfter_0196
     * @tc.desc      remainingAfter(ticks=120, initial=136) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0196 begin`);
      const actual: number = remainingAfter(120, 136);
      logInfo(`remainingAfter(ticks=120, initial=136): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}RemainingAfter_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0197
     * @tc.name      WindowStartIcon_RemainingAfter_0197
     * @tc.desc      remainingAfter(ticks=90, initial=96.17) returns 6.170000000000002
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0197 begin`);
      const actual: number = remainingAfter(90, 96.17);
      logInfo(`remainingAfter(ticks=90, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(6.170000000000002, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0198
     * @tc.name      WindowStartIcon_RemainingAfter_0198
     * @tc.desc      remainingAfter(ticks=2, initial=170) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0198 begin`);
      const actual: number = remainingAfter(2, 170);
      logInfo(`remainingAfter(ticks=2, initial=170): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}RemainingAfter_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0199
     * @tc.name      WindowStartIcon_RemainingAfter_0199
     * @tc.desc      remainingAfter(ticks=5, initial=41.89) returns 36.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0199 begin`);
      const actual: number = remainingAfter(5, 41.89);
      logInfo(`remainingAfter(ticks=5, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(36.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0200
     * @tc.name      WindowStartIcon_RemainingAfter_0200
     * @tc.desc      remainingAfter(ticks=1, initial=185) returns 184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0200 begin`);
      const actual: number = remainingAfter(1, 185);
      logInfo(`remainingAfter(ticks=1, initial=185): actual=${actual}`);
      expect(actual).assertEqual(184);
      logInfo(`${BUNDLE}RemainingAfter_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0201
     * @tc.name      WindowStartIcon_RemainingAfter_0201
     * @tc.desc      remainingAfter(ticks=2, initial=75.76) returns 73.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0201 begin`);
      const actual: number = remainingAfter(2, 75.76);
      logInfo(`remainingAfter(ticks=2, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(73.76, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0202
     * @tc.name      WindowStartIcon_RemainingAfter_0202
     * @tc.desc      remainingAfter(ticks=75, initial=96.17) returns 21.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0202 begin`);
      const actual: number = remainingAfter(75, 96.17);
      logInfo(`remainingAfter(ticks=75, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(21.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0203
     * @tc.name      WindowStartIcon_RemainingAfter_0203
     * @tc.desc      remainingAfter(ticks=20, initial=67.03) returns 47.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0203 begin`);
      const actual: number = remainingAfter(20, 67.03);
      logInfo(`remainingAfter(ticks=20, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(47.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0204
     * @tc.name      WindowStartIcon_RemainingAfter_0204
     * @tc.desc      remainingAfter(ticks=2, initial=159) returns 157
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0204 begin`);
      const actual: number = remainingAfter(2, 159);
      logInfo(`remainingAfter(ticks=2, initial=159): actual=${actual}`);
      expect(actual).assertEqual(157);
      logInfo(`${BUNDLE}RemainingAfter_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0205
     * @tc.name      WindowStartIcon_RemainingAfter_0205
     * @tc.desc      remainingAfter(ticks=3, initial=176) returns 173
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0205 begin`);
      const actual: number = remainingAfter(3, 176);
      logInfo(`remainingAfter(ticks=3, initial=176): actual=${actual}`);
      expect(actual).assertEqual(173);
      logInfo(`${BUNDLE}RemainingAfter_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0206
     * @tc.name      WindowStartIcon_RemainingAfter_0206
     * @tc.desc      remainingAfter(ticks=56, initial=67.03) returns 11.030000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0206 begin`);
      const actual: number = remainingAfter(56, 67.03);
      logInfo(`remainingAfter(ticks=56, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(11.030000000000001, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0207
     * @tc.name      WindowStartIcon_RemainingAfter_0207
     * @tc.desc      remainingAfter(ticks=15, initial=67.03) returns 52.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0207 begin`);
      const actual: number = remainingAfter(15, 67.03);
      logInfo(`remainingAfter(ticks=15, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(52.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0208
     * @tc.name      WindowStartIcon_RemainingAfter_0208
     * @tc.desc      remainingAfter(ticks=35, initial=75.76) returns 40.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0208 begin`);
      const actual: number = remainingAfter(35, 75.76);
      logInfo(`remainingAfter(ticks=35, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(40.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0209
     * @tc.name      WindowStartIcon_RemainingAfter_0209
     * @tc.desc      remainingAfter(ticks=58.09, initial=105) returns 47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0209 begin`);
      const actual: number = remainingAfter(58.09, 105);
      logInfo(`remainingAfter(ticks=58.09, initial=105): actual=${actual}`);
      expect(actual).assertEqual(47);
      logInfo(`${BUNDLE}RemainingAfter_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0210
     * @tc.name      WindowStartIcon_RemainingAfter_0210
     * @tc.desc      remainingAfter(ticks=2, initial=190) returns 188
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0210 begin`);
      const actual: number = remainingAfter(2, 190);
      logInfo(`remainingAfter(ticks=2, initial=190): actual=${actual}`);
      expect(actual).assertEqual(188);
      logInfo(`${BUNDLE}RemainingAfter_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0211
     * @tc.name      WindowStartIcon_RemainingAfter_0211
     * @tc.desc      remainingAfter(ticks=58.09, initial=80) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0211 begin`);
      const actual: number = remainingAfter(58.09, 80);
      logInfo(`remainingAfter(ticks=58.09, initial=80): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}RemainingAfter_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0212
     * @tc.name      WindowStartIcon_RemainingAfter_0212
     * @tc.desc      remainingAfter(ticks=40, initial=96.17) returns 56.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0212 begin`);
      const actual: number = remainingAfter(40, 96.17);
      logInfo(`remainingAfter(ticks=40, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(56.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0213
     * @tc.name      WindowStartIcon_RemainingAfter_0213
     * @tc.desc      remainingAfter(ticks=25, initial=41.89) returns 16.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0213 begin`);
      const actual: number = remainingAfter(25, 41.89);
      logInfo(`remainingAfter(ticks=25, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(16.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0214
     * @tc.name      WindowStartIcon_RemainingAfter_0214
     * @tc.desc      remainingAfter(ticks=3, initial=150) returns 147
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0214 begin`);
      const actual: number = remainingAfter(3, 150);
      logInfo(`remainingAfter(ticks=3, initial=150): actual=${actual}`);
      expect(actual).assertEqual(147);
      logInfo(`${BUNDLE}RemainingAfter_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0215
     * @tc.name      WindowStartIcon_RemainingAfter_0215
     * @tc.desc      remainingAfter(ticks=3, initial=41.89) returns 38.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0215 begin`);
      const actual: number = remainingAfter(3, 41.89);
      logInfo(`remainingAfter(ticks=3, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(38.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0216
     * @tc.name      WindowStartIcon_RemainingAfter_0216
     * @tc.desc      remainingAfter(ticks=45, initial=96.17) returns 51.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0216 begin`);
      const actual: number = remainingAfter(45, 96.17);
      logInfo(`remainingAfter(ticks=45, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(51.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0217
     * @tc.name      WindowStartIcon_RemainingAfter_0217
     * @tc.desc      remainingAfter(ticks=21, initial=30) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0217 begin`);
      const actual: number = remainingAfter(21, 30);
      logInfo(`remainingAfter(ticks=21, initial=30): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RemainingAfter_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0218
     * @tc.name      WindowStartIcon_RemainingAfter_0218
     * @tc.desc      remainingAfter(ticks=4, initial=160) returns 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0218 begin`);
      const actual: number = remainingAfter(4, 160);
      logInfo(`remainingAfter(ticks=4, initial=160): actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}RemainingAfter_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0219
     * @tc.name      WindowStartIcon_RemainingAfter_0219
     * @tc.desc      remainingAfter(ticks=2, initial=150) returns 148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0219 begin`);
      const actual: number = remainingAfter(2, 150);
      logInfo(`remainingAfter(ticks=2, initial=150): actual=${actual}`);
      expect(actual).assertEqual(148);
      logInfo(`${BUNDLE}RemainingAfter_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0220
     * @tc.name      WindowStartIcon_RemainingAfter_0220
     * @tc.desc      remainingAfter(ticks=58.09, initial=176) returns 118
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0220 begin`);
      const actual: number = remainingAfter(58.09, 176);
      logInfo(`remainingAfter(ticks=58.09, initial=176): actual=${actual}`);
      expect(actual).assertEqual(118);
      logInfo(`${BUNDLE}RemainingAfter_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0221
     * @tc.name      WindowStartIcon_RemainingAfter_0221
     * @tc.desc      remainingAfter(ticks=1, initial=41.89) returns 40.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0221 begin`);
      const actual: number = remainingAfter(1, 41.89);
      logInfo(`remainingAfter(ticks=1, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(40.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0222
     * @tc.name      WindowStartIcon_RemainingAfter_0222
     * @tc.desc      remainingAfter(ticks=3, initial=96.17) returns 93.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0222 begin`);
      const actual: number = remainingAfter(3, 96.17);
      logInfo(`remainingAfter(ticks=3, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(93.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0223
     * @tc.name      WindowStartIcon_RemainingAfter_0223
     * @tc.desc      remainingAfter(ticks=5, initial=159) returns 154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0223 begin`);
      const actual: number = remainingAfter(5, 159);
      logInfo(`remainingAfter(ticks=5, initial=159): actual=${actual}`);
      expect(actual).assertEqual(154);
      logInfo(`${BUNDLE}RemainingAfter_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0224
     * @tc.name      WindowStartIcon_RemainingAfter_0224
     * @tc.desc      remainingAfter(ticks=5, initial=96.17) returns 91.17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0224 begin`);
      const actual: number = remainingAfter(5, 96.17);
      logInfo(`remainingAfter(ticks=5, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(91.17, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0225
     * @tc.name      WindowStartIcon_RemainingAfter_0225
     * @tc.desc      remainingAfter(ticks=25, initial=67.03) returns 42.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0225 begin`);
      const actual: number = remainingAfter(25, 67.03);
      logInfo(`remainingAfter(ticks=25, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(42.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0226
     * @tc.name      WindowStartIcon_RemainingAfter_0226
     * @tc.desc      remainingAfter(ticks=30, initial=41.89) returns 11.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0226 begin`);
      const actual: number = remainingAfter(30, 41.89);
      logInfo(`remainingAfter(ticks=30, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(11.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0227
     * @tc.name      WindowStartIcon_RemainingAfter_0227
     * @tc.desc      remainingAfter(ticks=30, initial=67.03) returns 37.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0227 begin`);
      const actual: number = remainingAfter(30, 67.03);
      logInfo(`remainingAfter(ticks=30, initial=67.03): actual=${actual}`);
      expect(actual).assertClose(37.03, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0228
     * @tc.name      WindowStartIcon_RemainingAfter_0228
     * @tc.desc      remainingAfter(ticks=95, initial=96.17) returns 1.1700000000000017
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0228 begin`);
      const actual: number = remainingAfter(95, 96.17);
      logInfo(`remainingAfter(ticks=95, initial=96.17): actual=${actual}`);
      expect(actual).assertClose(1.1700000000000017, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0229
     * @tc.name      WindowStartIcon_RemainingAfter_0229
     * @tc.desc      remainingAfter(ticks=2, initial=145) returns 143
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0229 begin`);
      const actual: number = remainingAfter(2, 145);
      logInfo(`remainingAfter(ticks=2, initial=145): actual=${actual}`);
      expect(actual).assertEqual(143);
      logInfo(`${BUNDLE}RemainingAfter_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0230
     * @tc.name      WindowStartIcon_RemainingAfter_0230
     * @tc.desc      remainingAfter(ticks=10, initial=133) returns 123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0230 begin`);
      const actual: number = remainingAfter(10, 133);
      logInfo(`remainingAfter(ticks=10, initial=133): actual=${actual}`);
      expect(actual).assertEqual(123);
      logInfo(`${BUNDLE}RemainingAfter_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0231
     * @tc.name      WindowStartIcon_RemainingAfter_0231
     * @tc.desc      remainingAfter(ticks=1, initial=142) returns 141
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0231 begin`);
      const actual: number = remainingAfter(1, 142);
      logInfo(`remainingAfter(ticks=1, initial=142): actual=${actual}`);
      expect(actual).assertEqual(141);
      logInfo(`${BUNDLE}RemainingAfter_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0232
     * @tc.name      WindowStartIcon_RemainingAfter_0232
     * @tc.desc      remainingAfter(ticks=40, initial=41.89) returns 1.8900000000000006
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0232 begin`);
      const actual: number = remainingAfter(40, 41.89);
      logInfo(`remainingAfter(ticks=40, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(1.8900000000000006, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0233
     * @tc.name      WindowStartIcon_RemainingAfter_0233
     * @tc.desc      remainingAfter(ticks=10, initial=75.76) returns 65.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0233 begin`);
      const actual: number = remainingAfter(10, 75.76);
      logInfo(`remainingAfter(ticks=10, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(65.76, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0234
     * @tc.name      WindowStartIcon_RemainingAfter_0234
     * @tc.desc      remainingAfter(ticks=70, initial=75.76) returns 5.760000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0234 begin`);
      const actual: number = remainingAfter(70, 75.76);
      logInfo(`remainingAfter(ticks=70, initial=75.76): actual=${actual}`);
      expect(actual).assertClose(5.760000000000005, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0235
     * @tc.name      WindowStartIcon_RemainingAfter_0235
     * @tc.desc      remainingAfter(ticks=2, initial=80) returns 78
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0235 begin`);
      const actual: number = remainingAfter(2, 80);
      logInfo(`remainingAfter(ticks=2, initial=80): actual=${actual}`);
      expect(actual).assertEqual(78);
      logInfo(`${BUNDLE}RemainingAfter_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0236
     * @tc.name      WindowStartIcon_RemainingAfter_0236
     * @tc.desc      remainingAfter(ticks=2, initial=180) returns 178
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0236 begin`);
      const actual: number = remainingAfter(2, 180);
      logInfo(`remainingAfter(ticks=2, initial=180): actual=${actual}`);
      expect(actual).assertEqual(178);
      logInfo(`${BUNDLE}RemainingAfter_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0237
     * @tc.name      WindowStartIcon_RemainingAfter_0237
     * @tc.desc      remainingAfter(ticks=21, initial=41.89) returns 20.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0237 begin`);
      const actual: number = remainingAfter(21, 41.89);
      logInfo(`remainingAfter(ticks=21, initial=41.89): actual=${actual}`);
      expect(actual).assertClose(20.89, PRECISION);
      logInfo(`${BUNDLE}RemainingAfter_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0238
     * @tc.name      WindowStartIcon_RemainingAfter_0238
     * @tc.desc      remainingAfter(ticks=1, initial=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0238 begin`);
      const actual: number = remainingAfter(1, 45);
      logInfo(`remainingAfter(ticks=1, initial=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}RemainingAfter_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0239
     * @tc.name      WindowStartIcon_RemainingAfter_0239
     * @tc.desc      remainingAfter(ticks=3, initial=142) returns 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_RemainingAfter_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RemainingAfter_0239 begin`);
      const actual: number = remainingAfter(3, 142);
      logInfo(`remainingAfter(ticks=3, initial=142): actual=${actual}`);
      expect(actual).assertEqual(139);
      logInfo(`${BUNDLE}RemainingAfter_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0240
     * @tc.name      WindowStartIcon_RemainingAfter_0240
     * @tc.desc      remainingAfter(ticks=-1, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0240 begin`);
      const actual: number = remainingAfter(-1, 0);
      logInfo(`remainingAfter(ticks=-1, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0241
     * @tc.name      WindowStartIcon_RemainingAfter_0241
     * @tc.desc      remainingAfter(ticks=1, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0241 begin`);
      const actual: number = remainingAfter(1, 0);
      logInfo(`remainingAfter(ticks=1, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0242
     * @tc.name      WindowStartIcon_RemainingAfter_0242
     * @tc.desc      remainingAfter(ticks=2, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0242 begin`);
      const actual: number = remainingAfter(2, 0);
      logInfo(`remainingAfter(ticks=2, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0243
     * @tc.name      WindowStartIcon_RemainingAfter_0243
     * @tc.desc      remainingAfter(ticks=3, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0243 begin`);
      const actual: number = remainingAfter(3, 0);
      logInfo(`remainingAfter(ticks=3, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0244
     * @tc.name      WindowStartIcon_RemainingAfter_0244
     * @tc.desc      remainingAfter(ticks=10, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0244 begin`);
      const actual: number = remainingAfter(10, 0);
      logInfo(`remainingAfter(ticks=10, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0244 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0245
     * @tc.name      WindowStartIcon_RemainingAfter_0245
     * @tc.desc      remainingAfter(ticks=100, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0245 begin`);
      const actual: number = remainingAfter(100, 0);
      logInfo(`remainingAfter(ticks=100, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0245 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0246
     * @tc.name      WindowStartIcon_RemainingAfter_0246
     * @tc.desc      remainingAfter(ticks=5, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0246 begin`);
      const actual: number = remainingAfter(5, 0);
      logInfo(`remainingAfter(ticks=5, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0246 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0247
     * @tc.name      WindowStartIcon_RemainingAfter_0247
     * @tc.desc      remainingAfter(ticks=15, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0247 begin`);
      const actual: number = remainingAfter(15, 0);
      logInfo(`remainingAfter(ticks=15, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0247 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0248
     * @tc.name      WindowStartIcon_RemainingAfter_0248
     * @tc.desc      remainingAfter(ticks=20, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0248 begin`);
      const actual: number = remainingAfter(20, 0);
      logInfo(`remainingAfter(ticks=20, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0248 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0249
     * @tc.name      WindowStartIcon_RemainingAfter_0249
     * @tc.desc      remainingAfter(ticks=25, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0249 begin`);
      const actual: number = remainingAfter(25, 0);
      logInfo(`remainingAfter(ticks=25, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0249 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0250
     * @tc.name      WindowStartIcon_RemainingAfter_0250
     * @tc.desc      remainingAfter(ticks=30, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0250 begin`);
      const actual: number = remainingAfter(30, 0);
      logInfo(`remainingAfter(ticks=30, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0250 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0251
     * @tc.name      WindowStartIcon_RemainingAfter_0251
     * @tc.desc      remainingAfter(ticks=35, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0251 begin`);
      const actual: number = remainingAfter(35, 0);
      logInfo(`remainingAfter(ticks=35, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0251 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0252
     * @tc.name      WindowStartIcon_RemainingAfter_0252
     * @tc.desc      remainingAfter(ticks=40, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0252 begin`);
      const actual: number = remainingAfter(40, 0);
      logInfo(`remainingAfter(ticks=40, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0252 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0253
     * @tc.name      WindowStartIcon_RemainingAfter_0253
     * @tc.desc      remainingAfter(ticks=45, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0253 begin`);
      const actual: number = remainingAfter(45, 0);
      logInfo(`remainingAfter(ticks=45, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0253 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0254
     * @tc.name      WindowStartIcon_RemainingAfter_0254
     * @tc.desc      remainingAfter(ticks=50, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0254 begin`);
      const actual: number = remainingAfter(50, 0);
      logInfo(`remainingAfter(ticks=50, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0254 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0255
     * @tc.name      WindowStartIcon_RemainingAfter_0255
     * @tc.desc      remainingAfter(ticks=55, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0255 begin`);
      const actual: number = remainingAfter(55, 0);
      logInfo(`remainingAfter(ticks=55, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0255 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0256
     * @tc.name      WindowStartIcon_RemainingAfter_0256
     * @tc.desc      remainingAfter(ticks=60, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0256 begin`);
      const actual: number = remainingAfter(60, 0);
      logInfo(`remainingAfter(ticks=60, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0256 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0257
     * @tc.name      WindowStartIcon_RemainingAfter_0257
     * @tc.desc      remainingAfter(ticks=65, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0257 begin`);
      const actual: number = remainingAfter(65, 0);
      logInfo(`remainingAfter(ticks=65, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0257 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0258
     * @tc.name      WindowStartIcon_RemainingAfter_0258
     * @tc.desc      remainingAfter(ticks=70, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0258 begin`);
      const actual: number = remainingAfter(70, 0);
      logInfo(`remainingAfter(ticks=70, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0258 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0259
     * @tc.name      WindowStartIcon_RemainingAfter_0259
     * @tc.desc      remainingAfter(ticks=75, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0259 begin`);
      const actual: number = remainingAfter(75, 0);
      logInfo(`remainingAfter(ticks=75, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0259 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0260
     * @tc.name      WindowStartIcon_RemainingAfter_0260
     * @tc.desc      remainingAfter(ticks=80, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0260 begin`);
      const actual: number = remainingAfter(80, 0);
      logInfo(`remainingAfter(ticks=80, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0260 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0261
     * @tc.name      WindowStartIcon_RemainingAfter_0261
     * @tc.desc      remainingAfter(ticks=85, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0261 begin`);
      const actual: number = remainingAfter(85, 0);
      logInfo(`remainingAfter(ticks=85, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0261 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0262
     * @tc.name      WindowStartIcon_RemainingAfter_0262
     * @tc.desc      remainingAfter(ticks=90, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0262 begin`);
      const actual: number = remainingAfter(90, 0);
      logInfo(`remainingAfter(ticks=90, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0262 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0263
     * @tc.name      WindowStartIcon_RemainingAfter_0263
     * @tc.desc      remainingAfter(ticks=95, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0263 begin`);
      const actual: number = remainingAfter(95, 0);
      logInfo(`remainingAfter(ticks=95, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0263 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0264
     * @tc.name      WindowStartIcon_RemainingAfter_0264
     * @tc.desc      remainingAfter(ticks=105, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0264 begin`);
      const actual: number = remainingAfter(105, 0);
      logInfo(`remainingAfter(ticks=105, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0264 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0265
     * @tc.name      WindowStartIcon_RemainingAfter_0265
     * @tc.desc      remainingAfter(ticks=110, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0265 begin`);
      const actual: number = remainingAfter(110, 0);
      logInfo(`remainingAfter(ticks=110, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0265 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0266
     * @tc.name      WindowStartIcon_RemainingAfter_0266
     * @tc.desc      remainingAfter(ticks=115, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0266 begin`);
      const actual: number = remainingAfter(115, 0);
      logInfo(`remainingAfter(ticks=115, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0266 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0267
     * @tc.name      WindowStartIcon_RemainingAfter_0267
     * @tc.desc      remainingAfter(ticks=120, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0267 begin`);
      const actual: number = remainingAfter(120, 0);
      logInfo(`remainingAfter(ticks=120, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0267 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0268
     * @tc.name      WindowStartIcon_RemainingAfter_0268
     * @tc.desc      remainingAfter(ticks=125, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0268 begin`);
      const actual: number = remainingAfter(125, 0);
      logInfo(`remainingAfter(ticks=125, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0268 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0269
     * @tc.name      WindowStartIcon_RemainingAfter_0269
     * @tc.desc      remainingAfter(ticks=130, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0269 begin`);
      const actual: number = remainingAfter(130, 0);
      logInfo(`remainingAfter(ticks=130, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0269 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0270
     * @tc.name      WindowStartIcon_RemainingAfter_0270
     * @tc.desc      remainingAfter(ticks=135, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0270 begin`);
      const actual: number = remainingAfter(135, 0);
      logInfo(`remainingAfter(ticks=135, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0270 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0271
     * @tc.name      WindowStartIcon_RemainingAfter_0271
     * @tc.desc      remainingAfter(ticks=140, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0271 begin`);
      const actual: number = remainingAfter(140, 0);
      logInfo(`remainingAfter(ticks=140, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0271 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0272
     * @tc.name      WindowStartIcon_RemainingAfter_0272
     * @tc.desc      remainingAfter(ticks=145, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0272 begin`);
      const actual: number = remainingAfter(145, 0);
      logInfo(`remainingAfter(ticks=145, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0272 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0273
     * @tc.name      WindowStartIcon_RemainingAfter_0273
     * @tc.desc      remainingAfter(ticks=150, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0273 begin`);
      const actual: number = remainingAfter(150, 0);
      logInfo(`remainingAfter(ticks=150, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0273 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0274
     * @tc.name      WindowStartIcon_RemainingAfter_0274
     * @tc.desc      remainingAfter(ticks=155, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0274 begin`);
      const actual: number = remainingAfter(155, 0);
      logInfo(`remainingAfter(ticks=155, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0274 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0275
     * @tc.name      WindowStartIcon_RemainingAfter_0275
     * @tc.desc      remainingAfter(ticks=160, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0275 begin`);
      const actual: number = remainingAfter(160, 0);
      logInfo(`remainingAfter(ticks=160, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0275 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0276
     * @tc.name      WindowStartIcon_RemainingAfter_0276
     * @tc.desc      remainingAfter(ticks=165, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0276 begin`);
      const actual: number = remainingAfter(165, 0);
      logInfo(`remainingAfter(ticks=165, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0276 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0277
     * @tc.name      WindowStartIcon_RemainingAfter_0277
     * @tc.desc      remainingAfter(ticks=170, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0277 begin`);
      const actual: number = remainingAfter(170, 0);
      logInfo(`remainingAfter(ticks=170, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0277 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0278
     * @tc.name      WindowStartIcon_RemainingAfter_0278
     * @tc.desc      remainingAfter(ticks=175, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0278 begin`);
      const actual: number = remainingAfter(175, 0);
      logInfo(`remainingAfter(ticks=175, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0278 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0279
     * @tc.name      WindowStartIcon_RemainingAfter_0279
     * @tc.desc      remainingAfter(ticks=180, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0279 begin`);
      const actual: number = remainingAfter(180, 0);
      logInfo(`remainingAfter(ticks=180, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0279 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0280
     * @tc.name      WindowStartIcon_RemainingAfter_0280
     * @tc.desc      remainingAfter(ticks=185, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0280 begin`);
      const actual: number = remainingAfter(185, 0);
      logInfo(`remainingAfter(ticks=185, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0280 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0281
     * @tc.name      WindowStartIcon_RemainingAfter_0281
     * @tc.desc      remainingAfter(ticks=190, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0281 begin`);
      const actual: number = remainingAfter(190, 0);
      logInfo(`remainingAfter(ticks=190, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0281 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0282
     * @tc.name      WindowStartIcon_RemainingAfter_0282
     * @tc.desc      remainingAfter(ticks=195, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0282 begin`);
      const actual: number = remainingAfter(195, 0);
      logInfo(`remainingAfter(ticks=195, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0282 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0283
     * @tc.name      WindowStartIcon_RemainingAfter_0283
     * @tc.desc      remainingAfter(ticks=200, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0283 begin`);
      const actual: number = remainingAfter(200, 0);
      logInfo(`remainingAfter(ticks=200, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0283 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0284
     * @tc.name      WindowStartIcon_RemainingAfter_0284
     * @tc.desc      remainingAfter(ticks=199, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0284 begin`);
      const actual: number = remainingAfter(199, 0);
      logInfo(`remainingAfter(ticks=199, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0284 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0285
     * @tc.name      WindowStartIcon_RemainingAfter_0285
     * @tc.desc      remainingAfter(ticks=56, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0285 begin`);
      const actual: number = remainingAfter(56, 0);
      logInfo(`remainingAfter(ticks=56, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0285 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0286
     * @tc.name      WindowStartIcon_RemainingAfter_0286
     * @tc.desc      remainingAfter(ticks=4, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0286 begin`);
      const actual: number = remainingAfter(4, 0);
      logInfo(`remainingAfter(ticks=4, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0286 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0287
     * @tc.name      WindowStartIcon_RemainingAfter_0287
     * @tc.desc      remainingAfter(ticks=-5, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_RemainingAfter_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RemainingAfter_0287 begin`);
      const actual: number = remainingAfter(-5, 0);
      logInfo(`remainingAfter(ticks=-5, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0287 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_REMAINING_AFTER_0288
     * @tc.name      WindowStartIcon_RemainingAfter_0288
     * @tc.desc      remainingAfter(ticks=162, initial=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowStartIcon_RemainingAfter_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RemainingAfter_0288 begin`);
      const actual: number = remainingAfter(162, 0);
      logInfo(`remainingAfter(ticks=162, initial=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RemainingAfter_0288 end`);
    });
  });
}
