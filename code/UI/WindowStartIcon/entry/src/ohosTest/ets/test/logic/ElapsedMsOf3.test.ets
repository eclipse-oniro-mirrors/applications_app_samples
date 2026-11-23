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

/** Logic checks for elapsedMsOf (48 cases). */
export default function elapsedMsOf3Test(): void {
  describe('ElapsedMsOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0193
     * @tc.name      WindowStartIcon_ElapsedMsOf_0193
     * @tc.desc      elapsedMsOf(ticks=47.25) returns 47000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0193 begin`);
      const actual: number = elapsedMsOf(47.25);
      logInfo(`elapsedMsOf(ticks=47.25): actual=${actual}`);
      expect(actual).assertEqual(47000);
      logInfo(`${BUNDLE}ElapsedMsOf_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0194
     * @tc.name      WindowStartIcon_ElapsedMsOf_0194
     * @tc.desc      elapsedMsOf(ticks=21) returns 21000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0194 begin`);
      const actual: number = elapsedMsOf(21);
      logInfo(`elapsedMsOf(ticks=21): actual=${actual}`);
      expect(actual).assertEqual(21000);
      logInfo(`${BUNDLE}ElapsedMsOf_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0195
     * @tc.name      WindowStartIcon_ElapsedMsOf_0195
     * @tc.desc      elapsedMsOf(ticks=92.58) returns 92000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0195 begin`);
      const actual: number = elapsedMsOf(92.58);
      logInfo(`elapsedMsOf(ticks=92.58): actual=${actual}`);
      expect(actual).assertEqual(92000);
      logInfo(`${BUNDLE}ElapsedMsOf_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0196
     * @tc.name      WindowStartIcon_ElapsedMsOf_0196
     * @tc.desc      elapsedMsOf(ticks=58.48) returns 58000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0196 begin`);
      const actual: number = elapsedMsOf(58.48);
      logInfo(`elapsedMsOf(ticks=58.48): actual=${actual}`);
      expect(actual).assertEqual(58000);
      logInfo(`${BUNDLE}ElapsedMsOf_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0197
     * @tc.name      WindowStartIcon_ElapsedMsOf_0197
     * @tc.desc      elapsedMsOf(ticks=17.56) returns 17000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0197 begin`);
      const actual: number = elapsedMsOf(17.56);
      logInfo(`elapsedMsOf(ticks=17.56): actual=${actual}`);
      expect(actual).assertEqual(17000);
      logInfo(`${BUNDLE}ElapsedMsOf_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0198
     * @tc.name      WindowStartIcon_ElapsedMsOf_0198
     * @tc.desc      elapsedMsOf(ticks=-91) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0198 begin`);
      const actual: number = elapsedMsOf(-91);
      logInfo(`elapsedMsOf(ticks=-91): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0199
     * @tc.name      WindowStartIcon_ElapsedMsOf_0199
     * @tc.desc      elapsedMsOf(ticks=-74) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0199 begin`);
      const actual: number = elapsedMsOf(-74);
      logInfo(`elapsedMsOf(ticks=-74): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0200
     * @tc.name      WindowStartIcon_ElapsedMsOf_0200
     * @tc.desc      elapsedMsOf(ticks=35.71) returns 35000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0200 begin`);
      const actual: number = elapsedMsOf(35.71);
      logInfo(`elapsedMsOf(ticks=35.71): actual=${actual}`);
      expect(actual).assertEqual(35000);
      logInfo(`${BUNDLE}ElapsedMsOf_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0201
     * @tc.name      WindowStartIcon_ElapsedMsOf_0201
     * @tc.desc      elapsedMsOf(ticks=2.56) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0201 begin`);
      const actual: number = elapsedMsOf(2.56);
      logInfo(`elapsedMsOf(ticks=2.56): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}ElapsedMsOf_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0202
     * @tc.name      WindowStartIcon_ElapsedMsOf_0202
     * @tc.desc      elapsedMsOf(ticks=37.24) returns 37000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0202 begin`);
      const actual: number = elapsedMsOf(37.24);
      logInfo(`elapsedMsOf(ticks=37.24): actual=${actual}`);
      expect(actual).assertEqual(37000);
      logInfo(`${BUNDLE}ElapsedMsOf_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0203
     * @tc.name      WindowStartIcon_ElapsedMsOf_0203
     * @tc.desc      elapsedMsOf(ticks=45.29) returns 45000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0203 begin`);
      const actual: number = elapsedMsOf(45.29);
      logInfo(`elapsedMsOf(ticks=45.29): actual=${actual}`);
      expect(actual).assertEqual(45000);
      logInfo(`${BUNDLE}ElapsedMsOf_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0204
     * @tc.name      WindowStartIcon_ElapsedMsOf_0204
     * @tc.desc      elapsedMsOf(ticks=17.46) returns 17000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0204 begin`);
      const actual: number = elapsedMsOf(17.46);
      logInfo(`elapsedMsOf(ticks=17.46): actual=${actual}`);
      expect(actual).assertEqual(17000);
      logInfo(`${BUNDLE}ElapsedMsOf_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0205
     * @tc.name      WindowStartIcon_ElapsedMsOf_0205
     * @tc.desc      elapsedMsOf(ticks=96.15) returns 96000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0205 begin`);
      const actual: number = elapsedMsOf(96.15);
      logInfo(`elapsedMsOf(ticks=96.15): actual=${actual}`);
      expect(actual).assertEqual(96000);
      logInfo(`${BUNDLE}ElapsedMsOf_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0206
     * @tc.name      WindowStartIcon_ElapsedMsOf_0206
     * @tc.desc      elapsedMsOf(ticks=-72) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0206 begin`);
      const actual: number = elapsedMsOf(-72);
      logInfo(`elapsedMsOf(ticks=-72): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0207
     * @tc.name      WindowStartIcon_ElapsedMsOf_0207
     * @tc.desc      elapsedMsOf(ticks=1.85) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0207 begin`);
      const actual: number = elapsedMsOf(1.85);
      logInfo(`elapsedMsOf(ticks=1.85): actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}ElapsedMsOf_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0208
     * @tc.name      WindowStartIcon_ElapsedMsOf_0208
     * @tc.desc      elapsedMsOf(ticks=59.58) returns 59000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0208 begin`);
      const actual: number = elapsedMsOf(59.58);
      logInfo(`elapsedMsOf(ticks=59.58): actual=${actual}`);
      expect(actual).assertEqual(59000);
      logInfo(`${BUNDLE}ElapsedMsOf_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0209
     * @tc.name      WindowStartIcon_ElapsedMsOf_0209
     * @tc.desc      elapsedMsOf(ticks=72) returns 72000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0209 begin`);
      const actual: number = elapsedMsOf(72);
      logInfo(`elapsedMsOf(ticks=72): actual=${actual}`);
      expect(actual).assertEqual(72000);
      logInfo(`${BUNDLE}ElapsedMsOf_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0210
     * @tc.name      WindowStartIcon_ElapsedMsOf_0210
     * @tc.desc      elapsedMsOf(ticks=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0210 begin`);
      const actual: number = elapsedMsOf(-8);
      logInfo(`elapsedMsOf(ticks=-8): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0211
     * @tc.name      WindowStartIcon_ElapsedMsOf_0211
     * @tc.desc      elapsedMsOf(ticks=75.99) returns 75000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0211 begin`);
      const actual: number = elapsedMsOf(75.99);
      logInfo(`elapsedMsOf(ticks=75.99): actual=${actual}`);
      expect(actual).assertEqual(75000);
      logInfo(`${BUNDLE}ElapsedMsOf_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0212
     * @tc.name      WindowStartIcon_ElapsedMsOf_0212
     * @tc.desc      elapsedMsOf(ticks=66.5) returns 66000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0212 begin`);
      const actual: number = elapsedMsOf(66.5);
      logInfo(`elapsedMsOf(ticks=66.5): actual=${actual}`);
      expect(actual).assertEqual(66000);
      logInfo(`${BUNDLE}ElapsedMsOf_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0213
     * @tc.name      WindowStartIcon_ElapsedMsOf_0213
     * @tc.desc      elapsedMsOf(ticks=27.83) returns 27000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0213 begin`);
      const actual: number = elapsedMsOf(27.83);
      logInfo(`elapsedMsOf(ticks=27.83): actual=${actual}`);
      expect(actual).assertEqual(27000);
      logInfo(`${BUNDLE}ElapsedMsOf_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0214
     * @tc.name      WindowStartIcon_ElapsedMsOf_0214
     * @tc.desc      elapsedMsOf(ticks=40.04) returns 40000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0214 begin`);
      const actual: number = elapsedMsOf(40.04);
      logInfo(`elapsedMsOf(ticks=40.04): actual=${actual}`);
      expect(actual).assertEqual(40000);
      logInfo(`${BUNDLE}ElapsedMsOf_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0215
     * @tc.name      WindowStartIcon_ElapsedMsOf_0215
     * @tc.desc      elapsedMsOf(ticks=97.22) returns 97000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0215 begin`);
      const actual: number = elapsedMsOf(97.22);
      logInfo(`elapsedMsOf(ticks=97.22): actual=${actual}`);
      expect(actual).assertEqual(97000);
      logInfo(`${BUNDLE}ElapsedMsOf_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0216
     * @tc.name      WindowStartIcon_ElapsedMsOf_0216
     * @tc.desc      elapsedMsOf(ticks=-55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0216 begin`);
      const actual: number = elapsedMsOf(-55);
      logInfo(`elapsedMsOf(ticks=-55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0217
     * @tc.name      WindowStartIcon_ElapsedMsOf_0217
     * @tc.desc      elapsedMsOf(ticks=-41) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0217 begin`);
      const actual: number = elapsedMsOf(-41);
      logInfo(`elapsedMsOf(ticks=-41): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0218
     * @tc.name      WindowStartIcon_ElapsedMsOf_0218
     * @tc.desc      elapsedMsOf(ticks=-87) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0218 begin`);
      const actual: number = elapsedMsOf(-87);
      logInfo(`elapsedMsOf(ticks=-87): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0219
     * @tc.name      WindowStartIcon_ElapsedMsOf_0219
     * @tc.desc      elapsedMsOf(ticks=20.28) returns 20000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0219 begin`);
      const actual: number = elapsedMsOf(20.28);
      logInfo(`elapsedMsOf(ticks=20.28): actual=${actual}`);
      expect(actual).assertEqual(20000);
      logInfo(`${BUNDLE}ElapsedMsOf_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0220
     * @tc.name      WindowStartIcon_ElapsedMsOf_0220
     * @tc.desc      elapsedMsOf(ticks=-51) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0220 begin`);
      const actual: number = elapsedMsOf(-51);
      logInfo(`elapsedMsOf(ticks=-51): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0221
     * @tc.name      WindowStartIcon_ElapsedMsOf_0221
     * @tc.desc      elapsedMsOf(ticks=-49) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0221 begin`);
      const actual: number = elapsedMsOf(-49);
      logInfo(`elapsedMsOf(ticks=-49): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0222
     * @tc.name      WindowStartIcon_ElapsedMsOf_0222
     * @tc.desc      elapsedMsOf(ticks=-61) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0222 begin`);
      const actual: number = elapsedMsOf(-61);
      logInfo(`elapsedMsOf(ticks=-61): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0223
     * @tc.name      WindowStartIcon_ElapsedMsOf_0223
     * @tc.desc      elapsedMsOf(ticks=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0223 begin`);
      const actual: number = elapsedMsOf(-3);
      logInfo(`elapsedMsOf(ticks=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0224
     * @tc.name      WindowStartIcon_ElapsedMsOf_0224
     * @tc.desc      elapsedMsOf(ticks=-21) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0224 begin`);
      const actual: number = elapsedMsOf(-21);
      logInfo(`elapsedMsOf(ticks=-21): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0225
     * @tc.name      WindowStartIcon_ElapsedMsOf_0225
     * @tc.desc      elapsedMsOf(ticks=-20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0225 begin`);
      const actual: number = elapsedMsOf(-20);
      logInfo(`elapsedMsOf(ticks=-20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0226
     * @tc.name      WindowStartIcon_ElapsedMsOf_0226
     * @tc.desc      elapsedMsOf(ticks=47.54) returns 47000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0226 begin`);
      const actual: number = elapsedMsOf(47.54);
      logInfo(`elapsedMsOf(ticks=47.54): actual=${actual}`);
      expect(actual).assertEqual(47000);
      logInfo(`${BUNDLE}ElapsedMsOf_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0227
     * @tc.name      WindowStartIcon_ElapsedMsOf_0227
     * @tc.desc      elapsedMsOf(ticks=92) returns 92000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0227 begin`);
      const actual: number = elapsedMsOf(92);
      logInfo(`elapsedMsOf(ticks=92): actual=${actual}`);
      expect(actual).assertEqual(92000);
      logInfo(`${BUNDLE}ElapsedMsOf_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0228
     * @tc.name      WindowStartIcon_ElapsedMsOf_0228
     * @tc.desc      elapsedMsOf(ticks=-81) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0228 begin`);
      const actual: number = elapsedMsOf(-81);
      logInfo(`elapsedMsOf(ticks=-81): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0229
     * @tc.name      WindowStartIcon_ElapsedMsOf_0229
     * @tc.desc      elapsedMsOf(ticks=61.88) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0229 begin`);
      const actual: number = elapsedMsOf(61.88);
      logInfo(`elapsedMsOf(ticks=61.88): actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}ElapsedMsOf_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0230
     * @tc.name      WindowStartIcon_ElapsedMsOf_0230
     * @tc.desc      elapsedMsOf(ticks=28) returns 28000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0230 begin`);
      const actual: number = elapsedMsOf(28);
      logInfo(`elapsedMsOf(ticks=28): actual=${actual}`);
      expect(actual).assertEqual(28000);
      logInfo(`${BUNDLE}ElapsedMsOf_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0231
     * @tc.name      WindowStartIcon_ElapsedMsOf_0231
     * @tc.desc      elapsedMsOf(ticks=-30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0231 begin`);
      const actual: number = elapsedMsOf(-30);
      logInfo(`elapsedMsOf(ticks=-30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0232
     * @tc.name      WindowStartIcon_ElapsedMsOf_0232
     * @tc.desc      elapsedMsOf(ticks=97.04) returns 97000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0232 begin`);
      const actual: number = elapsedMsOf(97.04);
      logInfo(`elapsedMsOf(ticks=97.04): actual=${actual}`);
      expect(actual).assertEqual(97000);
      logInfo(`${BUNDLE}ElapsedMsOf_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0233
     * @tc.name      WindowStartIcon_ElapsedMsOf_0233
     * @tc.desc      elapsedMsOf(ticks=31) returns 31000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0233 begin`);
      const actual: number = elapsedMsOf(31);
      logInfo(`elapsedMsOf(ticks=31): actual=${actual}`);
      expect(actual).assertEqual(31000);
      logInfo(`${BUNDLE}ElapsedMsOf_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0234
     * @tc.name      WindowStartIcon_ElapsedMsOf_0234
     * @tc.desc      elapsedMsOf(ticks=-6) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0234 begin`);
      const actual: number = elapsedMsOf(-6);
      logInfo(`elapsedMsOf(ticks=-6): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0235
     * @tc.name      WindowStartIcon_ElapsedMsOf_0235
     * @tc.desc      elapsedMsOf(ticks=67.99) returns 67000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0235 begin`);
      const actual: number = elapsedMsOf(67.99);
      logInfo(`elapsedMsOf(ticks=67.99): actual=${actual}`);
      expect(actual).assertEqual(67000);
      logInfo(`${BUNDLE}ElapsedMsOf_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0236
     * @tc.name      WindowStartIcon_ElapsedMsOf_0236
     * @tc.desc      elapsedMsOf(ticks=48.23) returns 48000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0236 begin`);
      const actual: number = elapsedMsOf(48.23);
      logInfo(`elapsedMsOf(ticks=48.23): actual=${actual}`);
      expect(actual).assertEqual(48000);
      logInfo(`${BUNDLE}ElapsedMsOf_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0237
     * @tc.name      WindowStartIcon_ElapsedMsOf_0237
     * @tc.desc      elapsedMsOf(ticks=-27) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0237 begin`);
      const actual: number = elapsedMsOf(-27);
      logInfo(`elapsedMsOf(ticks=-27): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0238
     * @tc.name      WindowStartIcon_ElapsedMsOf_0238
     * @tc.desc      elapsedMsOf(ticks=21.89) returns 21000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0238 begin`);
      const actual: number = elapsedMsOf(21.89);
      logInfo(`elapsedMsOf(ticks=21.89): actual=${actual}`);
      expect(actual).assertEqual(21000);
      logInfo(`${BUNDLE}ElapsedMsOf_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0239
     * @tc.name      WindowStartIcon_ElapsedMsOf_0239
     * @tc.desc      elapsedMsOf(ticks=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_ElapsedMsOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0239 begin`);
      const actual: number = elapsedMsOf(-11);
      logInfo(`elapsedMsOf(ticks=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ElapsedMsOf_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_ELAPSED_MS_OF_0240
     * @tc.name      WindowStartIcon_ElapsedMsOf_0240
     * @tc.desc      elapsedMsOf(ticks=56) returns 56000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_ElapsedMsOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ElapsedMsOf_0240 begin`);
      const actual: number = elapsedMsOf(56);
      logInfo(`elapsedMsOf(ticks=56): actual=${actual}`);
      expect(actual).assertEqual(56000);
      logInfo(`${BUNDLE}ElapsedMsOf_0240 end`);
    });
  });
}
