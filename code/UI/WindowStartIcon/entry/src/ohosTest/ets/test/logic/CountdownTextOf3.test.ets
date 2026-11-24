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

/** Logic checks for countdownTextOf (48 cases). */
export default function countdownTextOf3Test(): void {
  describe('CountdownTextOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0193
     * @tc.name      WindowStartIcon_CountdownTextOf_0193
     * @tc.desc      countdownTextOf(count=8.42) returns "8.42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0193 begin`);
      const actual: string = countdownTextOf(8.42);
      logInfo(`countdownTextOf(count=8.42): actual=${actual}`);
      expect(actual).assertEqual('8.42');
      logInfo(`${BUNDLE}CountdownTextOf_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0194
     * @tc.name      WindowStartIcon_CountdownTextOf_0194
     * @tc.desc      countdownTextOf(count=86.85) returns "86.85"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0194 begin`);
      const actual: string = countdownTextOf(86.85);
      logInfo(`countdownTextOf(count=86.85): actual=${actual}`);
      expect(actual).assertEqual('86.85');
      logInfo(`${BUNDLE}CountdownTextOf_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0195
     * @tc.name      WindowStartIcon_CountdownTextOf_0195
     * @tc.desc      countdownTextOf(count=14) returns "14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0195 begin`);
      const actual: string = countdownTextOf(14);
      logInfo(`countdownTextOf(count=14): actual=${actual}`);
      expect(actual).assertEqual('14');
      logInfo(`${BUNDLE}CountdownTextOf_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0196
     * @tc.name      WindowStartIcon_CountdownTextOf_0196
     * @tc.desc      countdownTextOf(count=126) returns "126"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0196 begin`);
      const actual: string = countdownTextOf(126);
      logInfo(`countdownTextOf(count=126): actual=${actual}`);
      expect(actual).assertEqual('126');
      logInfo(`${BUNDLE}CountdownTextOf_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0197
     * @tc.name      WindowStartIcon_CountdownTextOf_0197
     * @tc.desc      countdownTextOf(count=50.2) returns "50.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0197 begin`);
      const actual: string = countdownTextOf(50.2);
      logInfo(`countdownTextOf(count=50.2): actual=${actual}`);
      expect(actual).assertEqual('50.2');
      logInfo(`${BUNDLE}CountdownTextOf_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0198
     * @tc.name      WindowStartIcon_CountdownTextOf_0198
     * @tc.desc      countdownTextOf(count=50.61) returns "50.61"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0198 begin`);
      const actual: string = countdownTextOf(50.61);
      logInfo(`countdownTextOf(count=50.61): actual=${actual}`);
      expect(actual).assertEqual('50.61');
      logInfo(`${BUNDLE}CountdownTextOf_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0199
     * @tc.name      WindowStartIcon_CountdownTextOf_0199
     * @tc.desc      countdownTextOf(count=34) returns "34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0199 begin`);
      const actual: string = countdownTextOf(34);
      logInfo(`countdownTextOf(count=34): actual=${actual}`);
      expect(actual).assertEqual('34');
      logInfo(`${BUNDLE}CountdownTextOf_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0200
     * @tc.name      WindowStartIcon_CountdownTextOf_0200
     * @tc.desc      countdownTextOf(count=-81) returns "-81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0200 begin`);
      const actual: string = countdownTextOf(-81);
      logInfo(`countdownTextOf(count=-81): actual=${actual}`);
      expect(actual).assertEqual('-81');
      logInfo(`${BUNDLE}CountdownTextOf_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0201
     * @tc.name      WindowStartIcon_CountdownTextOf_0201
     * @tc.desc      countdownTextOf(count=93.33) returns "93.33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0201 begin`);
      const actual: string = countdownTextOf(93.33);
      logInfo(`countdownTextOf(count=93.33): actual=${actual}`);
      expect(actual).assertEqual('93.33');
      logInfo(`${BUNDLE}CountdownTextOf_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0202
     * @tc.name      WindowStartIcon_CountdownTextOf_0202
     * @tc.desc      countdownTextOf(count=-88) returns "-88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0202 begin`);
      const actual: string = countdownTextOf(-88);
      logInfo(`countdownTextOf(count=-88): actual=${actual}`);
      expect(actual).assertEqual('-88');
      logInfo(`${BUNDLE}CountdownTextOf_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0203
     * @tc.name      WindowStartIcon_CountdownTextOf_0203
     * @tc.desc      countdownTextOf(count=24) returns "24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0203 begin`);
      const actual: string = countdownTextOf(24);
      logInfo(`countdownTextOf(count=24): actual=${actual}`);
      expect(actual).assertEqual('24');
      logInfo(`${BUNDLE}CountdownTextOf_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0204
     * @tc.name      WindowStartIcon_CountdownTextOf_0204
     * @tc.desc      countdownTextOf(count=59.25) returns "59.25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0204 begin`);
      const actual: string = countdownTextOf(59.25);
      logInfo(`countdownTextOf(count=59.25): actual=${actual}`);
      expect(actual).assertEqual('59.25');
      logInfo(`${BUNDLE}CountdownTextOf_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0205
     * @tc.name      WindowStartIcon_CountdownTextOf_0205
     * @tc.desc      countdownTextOf(count=83) returns "83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0205 begin`);
      const actual: string = countdownTextOf(83);
      logInfo(`countdownTextOf(count=83): actual=${actual}`);
      expect(actual).assertEqual('83');
      logInfo(`${BUNDLE}CountdownTextOf_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0206
     * @tc.name      WindowStartIcon_CountdownTextOf_0206
     * @tc.desc      countdownTextOf(count=37.98) returns "37.98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0206 begin`);
      const actual: string = countdownTextOf(37.98);
      logInfo(`countdownTextOf(count=37.98): actual=${actual}`);
      expect(actual).assertEqual('37.98');
      logInfo(`${BUNDLE}CountdownTextOf_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0207
     * @tc.name      WindowStartIcon_CountdownTextOf_0207
     * @tc.desc      countdownTextOf(count=-20) returns "-20"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0207 begin`);
      const actual: string = countdownTextOf(-20);
      logInfo(`countdownTextOf(count=-20): actual=${actual}`);
      expect(actual).assertEqual('-20');
      logInfo(`${BUNDLE}CountdownTextOf_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0208
     * @tc.name      WindowStartIcon_CountdownTextOf_0208
     * @tc.desc      countdownTextOf(count=10.8) returns "10.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0208 begin`);
      const actual: string = countdownTextOf(10.8);
      logInfo(`countdownTextOf(count=10.8): actual=${actual}`);
      expect(actual).assertEqual('10.8');
      logInfo(`${BUNDLE}CountdownTextOf_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0209
     * @tc.name      WindowStartIcon_CountdownTextOf_0209
     * @tc.desc      countdownTextOf(count=-94) returns "-94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0209 begin`);
      const actual: string = countdownTextOf(-94);
      logInfo(`countdownTextOf(count=-94): actual=${actual}`);
      expect(actual).assertEqual('-94');
      logInfo(`${BUNDLE}CountdownTextOf_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0210
     * @tc.name      WindowStartIcon_CountdownTextOf_0210
     * @tc.desc      countdownTextOf(count=71.99) returns "71.99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0210 begin`);
      const actual: string = countdownTextOf(71.99);
      logInfo(`countdownTextOf(count=71.99): actual=${actual}`);
      expect(actual).assertEqual('71.99');
      logInfo(`${BUNDLE}CountdownTextOf_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0211
     * @tc.name      WindowStartIcon_CountdownTextOf_0211
     * @tc.desc      countdownTextOf(count=86.73) returns "86.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0211 begin`);
      const actual: string = countdownTextOf(86.73);
      logInfo(`countdownTextOf(count=86.73): actual=${actual}`);
      expect(actual).assertEqual('86.73');
      logInfo(`${BUNDLE}CountdownTextOf_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0212
     * @tc.name      WindowStartIcon_CountdownTextOf_0212
     * @tc.desc      countdownTextOf(count=93) returns "93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0212 begin`);
      const actual: string = countdownTextOf(93);
      logInfo(`countdownTextOf(count=93): actual=${actual}`);
      expect(actual).assertEqual('93');
      logInfo(`${BUNDLE}CountdownTextOf_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0213
     * @tc.name      WindowStartIcon_CountdownTextOf_0213
     * @tc.desc      countdownTextOf(count=-44) returns "-44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0213 begin`);
      const actual: string = countdownTextOf(-44);
      logInfo(`countdownTextOf(count=-44): actual=${actual}`);
      expect(actual).assertEqual('-44');
      logInfo(`${BUNDLE}CountdownTextOf_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0214
     * @tc.name      WindowStartIcon_CountdownTextOf_0214
     * @tc.desc      countdownTextOf(count=23.73) returns "23.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0214 begin`);
      const actual: string = countdownTextOf(23.73);
      logInfo(`countdownTextOf(count=23.73): actual=${actual}`);
      expect(actual).assertEqual('23.73');
      logInfo(`${BUNDLE}CountdownTextOf_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0215
     * @tc.name      WindowStartIcon_CountdownTextOf_0215
     * @tc.desc      countdownTextOf(count=-34) returns "-34"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0215 begin`);
      const actual: string = countdownTextOf(-34);
      logInfo(`countdownTextOf(count=-34): actual=${actual}`);
      expect(actual).assertEqual('-34');
      logInfo(`${BUNDLE}CountdownTextOf_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0216
     * @tc.name      WindowStartIcon_CountdownTextOf_0216
     * @tc.desc      countdownTextOf(count=90.43) returns "90.43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0216 begin`);
      const actual: string = countdownTextOf(90.43);
      logInfo(`countdownTextOf(count=90.43): actual=${actual}`);
      expect(actual).assertEqual('90.43');
      logInfo(`${BUNDLE}CountdownTextOf_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0217
     * @tc.name      WindowStartIcon_CountdownTextOf_0217
     * @tc.desc      countdownTextOf(count=24.75) returns "24.75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0217 begin`);
      const actual: string = countdownTextOf(24.75);
      logInfo(`countdownTextOf(count=24.75): actual=${actual}`);
      expect(actual).assertEqual('24.75');
      logInfo(`${BUNDLE}CountdownTextOf_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0218
     * @tc.name      WindowStartIcon_CountdownTextOf_0218
     * @tc.desc      countdownTextOf(count=8.21) returns "8.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0218 begin`);
      const actual: string = countdownTextOf(8.21);
      logInfo(`countdownTextOf(count=8.21): actual=${actual}`);
      expect(actual).assertEqual('8.21');
      logInfo(`${BUNDLE}CountdownTextOf_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0219
     * @tc.name      WindowStartIcon_CountdownTextOf_0219
     * @tc.desc      countdownTextOf(count=69.05) returns "69.05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0219 begin`);
      const actual: string = countdownTextOf(69.05);
      logInfo(`countdownTextOf(count=69.05): actual=${actual}`);
      expect(actual).assertEqual('69.05');
      logInfo(`${BUNDLE}CountdownTextOf_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0220
     * @tc.name      WindowStartIcon_CountdownTextOf_0220
     * @tc.desc      countdownTextOf(count=9.13) returns "9.13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0220 begin`);
      const actual: string = countdownTextOf(9.13);
      logInfo(`countdownTextOf(count=9.13): actual=${actual}`);
      expect(actual).assertEqual('9.13');
      logInfo(`${BUNDLE}CountdownTextOf_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0221
     * @tc.name      WindowStartIcon_CountdownTextOf_0221
     * @tc.desc      countdownTextOf(count=69.12) returns "69.12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0221 begin`);
      const actual: string = countdownTextOf(69.12);
      logInfo(`countdownTextOf(count=69.12): actual=${actual}`);
      expect(actual).assertEqual('69.12');
      logInfo(`${BUNDLE}CountdownTextOf_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0222
     * @tc.name      WindowStartIcon_CountdownTextOf_0222
     * @tc.desc      countdownTextOf(count=-26) returns "-26"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0222 begin`);
      const actual: string = countdownTextOf(-26);
      logInfo(`countdownTextOf(count=-26): actual=${actual}`);
      expect(actual).assertEqual('-26');
      logInfo(`${BUNDLE}CountdownTextOf_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0223
     * @tc.name      WindowStartIcon_CountdownTextOf_0223
     * @tc.desc      countdownTextOf(count=41.42) returns "41.42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0223 begin`);
      const actual: string = countdownTextOf(41.42);
      logInfo(`countdownTextOf(count=41.42): actual=${actual}`);
      expect(actual).assertEqual('41.42');
      logInfo(`${BUNDLE}CountdownTextOf_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0224
     * @tc.name      WindowStartIcon_CountdownTextOf_0224
     * @tc.desc      countdownTextOf(count=103) returns "103"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0224 begin`);
      const actual: string = countdownTextOf(103);
      logInfo(`countdownTextOf(count=103): actual=${actual}`);
      expect(actual).assertEqual('103');
      logInfo(`${BUNDLE}CountdownTextOf_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0225
     * @tc.name      WindowStartIcon_CountdownTextOf_0225
     * @tc.desc      countdownTextOf(count=-23) returns "-23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0225 begin`);
      const actual: string = countdownTextOf(-23);
      logInfo(`countdownTextOf(count=-23): actual=${actual}`);
      expect(actual).assertEqual('-23');
      logInfo(`${BUNDLE}CountdownTextOf_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0226
     * @tc.name      WindowStartIcon_CountdownTextOf_0226
     * @tc.desc      countdownTextOf(count=-55) returns "-55"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0226 begin`);
      const actual: string = countdownTextOf(-55);
      logInfo(`countdownTextOf(count=-55): actual=${actual}`);
      expect(actual).assertEqual('-55');
      logInfo(`${BUNDLE}CountdownTextOf_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0227
     * @tc.name      WindowStartIcon_CountdownTextOf_0227
     * @tc.desc      countdownTextOf(count=92.96) returns "92.96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0227 begin`);
      const actual: string = countdownTextOf(92.96);
      logInfo(`countdownTextOf(count=92.96): actual=${actual}`);
      expect(actual).assertEqual('92.96');
      logInfo(`${BUNDLE}CountdownTextOf_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0228
     * @tc.name      WindowStartIcon_CountdownTextOf_0228
     * @tc.desc      countdownTextOf(count=4.84) returns "4.84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0228 begin`);
      const actual: string = countdownTextOf(4.84);
      logInfo(`countdownTextOf(count=4.84): actual=${actual}`);
      expect(actual).assertEqual('4.84');
      logInfo(`${BUNDLE}CountdownTextOf_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0229
     * @tc.name      WindowStartIcon_CountdownTextOf_0229
     * @tc.desc      countdownTextOf(count=24.69) returns "24.69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0229 begin`);
      const actual: string = countdownTextOf(24.69);
      logInfo(`countdownTextOf(count=24.69): actual=${actual}`);
      expect(actual).assertEqual('24.69');
      logInfo(`${BUNDLE}CountdownTextOf_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0230
     * @tc.name      WindowStartIcon_CountdownTextOf_0230
     * @tc.desc      countdownTextOf(count=-6) returns "-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0230 begin`);
      const actual: string = countdownTextOf(-6);
      logInfo(`countdownTextOf(count=-6): actual=${actual}`);
      expect(actual).assertEqual('-6');
      logInfo(`${BUNDLE}CountdownTextOf_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0231
     * @tc.name      WindowStartIcon_CountdownTextOf_0231
     * @tc.desc      countdownTextOf(count=-43) returns "-43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0231 begin`);
      const actual: string = countdownTextOf(-43);
      logInfo(`countdownTextOf(count=-43): actual=${actual}`);
      expect(actual).assertEqual('-43');
      logInfo(`${BUNDLE}CountdownTextOf_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0232
     * @tc.name      WindowStartIcon_CountdownTextOf_0232
     * @tc.desc      countdownTextOf(count=94.65) returns "94.65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0232 begin`);
      const actual: string = countdownTextOf(94.65);
      logInfo(`countdownTextOf(count=94.65): actual=${actual}`);
      expect(actual).assertEqual('94.65');
      logInfo(`${BUNDLE}CountdownTextOf_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0233
     * @tc.name      WindowStartIcon_CountdownTextOf_0233
     * @tc.desc      countdownTextOf(count=26.9) returns "26.9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0233 begin`);
      const actual: string = countdownTextOf(26.9);
      logInfo(`countdownTextOf(count=26.9): actual=${actual}`);
      expect(actual).assertEqual('26.9');
      logInfo(`${BUNDLE}CountdownTextOf_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0234
     * @tc.name      WindowStartIcon_CountdownTextOf_0234
     * @tc.desc      countdownTextOf(count=82.91) returns "82.91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0234 begin`);
      const actual: string = countdownTextOf(82.91);
      logInfo(`countdownTextOf(count=82.91): actual=${actual}`);
      expect(actual).assertEqual('82.91');
      logInfo(`${BUNDLE}CountdownTextOf_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0235
     * @tc.name      WindowStartIcon_CountdownTextOf_0235
     * @tc.desc      countdownTextOf(count=78.74) returns "78.74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0235 begin`);
      const actual: string = countdownTextOf(78.74);
      logInfo(`countdownTextOf(count=78.74): actual=${actual}`);
      expect(actual).assertEqual('78.74');
      logInfo(`${BUNDLE}CountdownTextOf_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0236
     * @tc.name      WindowStartIcon_CountdownTextOf_0236
     * @tc.desc      countdownTextOf(count=71) returns "71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0236 begin`);
      const actual: string = countdownTextOf(71);
      logInfo(`countdownTextOf(count=71): actual=${actual}`);
      expect(actual).assertEqual('71');
      logInfo(`${BUNDLE}CountdownTextOf_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0237
     * @tc.name      WindowStartIcon_CountdownTextOf_0237
     * @tc.desc      countdownTextOf(count=-49) returns "-49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowStartIcon_CountdownTextOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0237 begin`);
      const actual: string = countdownTextOf(-49);
      logInfo(`countdownTextOf(count=-49): actual=${actual}`);
      expect(actual).assertEqual('-49');
      logInfo(`${BUNDLE}CountdownTextOf_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0238
     * @tc.name      WindowStartIcon_CountdownTextOf_0238
     * @tc.desc      countdownTextOf(count=63) returns "63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0238 begin`);
      const actual: string = countdownTextOf(63);
      logInfo(`countdownTextOf(count=63): actual=${actual}`);
      expect(actual).assertEqual('63');
      logInfo(`${BUNDLE}CountdownTextOf_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0239
     * @tc.name      WindowStartIcon_CountdownTextOf_0239
     * @tc.desc      countdownTextOf(count=76.76) returns "76.76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0239 begin`);
      const actual: string = countdownTextOf(76.76);
      logInfo(`countdownTextOf(count=76.76): actual=${actual}`);
      expect(actual).assertEqual('76.76');
      logInfo(`${BUNDLE}CountdownTextOf_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWSTARTICON_COUNTDOWN_TEXT_OF_0240
     * @tc.name      WindowStartIcon_CountdownTextOf_0240
     * @tc.desc      countdownTextOf(count=74) returns "74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowStartIcon_CountdownTextOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CountdownTextOf_0240 begin`);
      const actual: string = countdownTextOf(74);
      logInfo(`countdownTextOf(count=74): actual=${actual}`);
      expect(actual).assertEqual('74');
      logInfo(`${BUNDLE}CountdownTextOf_0240 end`);
    });
  });
}
