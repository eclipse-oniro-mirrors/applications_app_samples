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
import { minutesUntilScheduled } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for minutesUntilScheduled (67 cases). */
export default function minutesUntilScheduled3Test(): void {
  describe('MinutesUntilScheduled3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0193
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0193
     * @tc.desc      minutesUntilScheduled(hour=52, minute=216) returns -1266
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0193 begin`);
      const actual: number = minutesUntilScheduled(52, 216);
      logInfo(`minutesUntilScheduled(hour=52, minute=216): actual=${actual}`);
      expect(actual).assertEqual(-1266);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0193 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0194
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0194
     * @tc.desc      minutesUntilScheduled(hour=66, minute=78) returns -1968
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0194 begin`);
      const actual: number = minutesUntilScheduled(66, 78);
      logInfo(`minutesUntilScheduled(hour=66, minute=78): actual=${actual}`);
      expect(actual).assertEqual(-1968);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0194 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0195
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0195
     * @tc.desc      minutesUntilScheduled(hour=144, minute=9) returns -6579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0195 begin`);
      const actual: number = minutesUntilScheduled(144, 9);
      logInfo(`minutesUntilScheduled(hour=144, minute=9): actual=${actual}`);
      expect(actual).assertEqual(-6579);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0195 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0196
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0196
     * @tc.desc      minutesUntilScheduled(hour=126, minute=102) returns -5592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0196 begin`);
      const actual: number = minutesUntilScheduled(126, 102);
      logInfo(`minutesUntilScheduled(hour=126, minute=102): actual=${actual}`);
      expect(actual).assertEqual(-5592);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0196 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0197
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0197
     * @tc.desc      minutesUntilScheduled(hour=29, minute=132) returns 198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0197 begin`);
      const actual: number = minutesUntilScheduled(29, 132);
      logInfo(`minutesUntilScheduled(hour=29, minute=132): actual=${actual}`);
      expect(actual).assertEqual(198);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0197 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0198
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0198
     * @tc.desc      minutesUntilScheduled(hour=5, minute=204) returns 126
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0198 begin`);
      const actual: number = minutesUntilScheduled(5, 204);
      logInfo(`minutesUntilScheduled(hour=5, minute=204): actual=${actual}`);
      expect(actual).assertEqual(126);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0198 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0199
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0199
     * @tc.desc      minutesUntilScheduled(hour=5, minute=-1) returns 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0199 begin`);
      const actual: number = minutesUntilScheduled(5, -1);
      logInfo(`minutesUntilScheduled(hour=5, minute=-1): actual=${actual}`);
      expect(actual).assertEqual(331);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0199 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0200
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0200
     * @tc.desc      minutesUntilScheduled(hour=18, minute=174) returns 816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0200 begin`);
      const actual: number = minutesUntilScheduled(18, 174);
      logInfo(`minutesUntilScheduled(hour=18, minute=174): actual=${actual}`);
      expect(actual).assertEqual(816);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0200 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0201
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0201
     * @tc.desc      minutesUntilScheduled(hour=42, minute=79.23) returns -529.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0201 begin`);
      const actual: number = minutesUntilScheduled(42, 79.23);
      logInfo(`minutesUntilScheduled(hour=42, minute=79.23): actual=${actual}`);
      expect(actual).assertClose(-529.23, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0201 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0202
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0202
     * @tc.desc      minutesUntilScheduled(hour=138, minute=31) returns -6241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0202 begin`);
      const actual: number = minutesUntilScheduled(138, 31);
      logInfo(`minutesUntilScheduled(hour=138, minute=31): actual=${actual}`);
      expect(actual).assertEqual(-6241);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0202 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0203
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0203
     * @tc.desc      minutesUntilScheduled(hour=31, minute=138) returns 72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0203 begin`);
      const actual: number = minutesUntilScheduled(31, 138);
      logInfo(`minutesUntilScheduled(hour=31, minute=138): actual=${actual}`);
      expect(actual).assertEqual(72);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0203 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0204
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0204
     * @tc.desc      minutesUntilScheduled(hour=15, minute=100) returns 1070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0204 begin`);
      const actual: number = minutesUntilScheduled(15, 100);
      logInfo(`minutesUntilScheduled(hour=15, minute=100): actual=${actual}`);
      expect(actual).assertEqual(1070);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0204 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0205
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0205
     * @tc.desc      minutesUntilScheduled(hour=114, minute=31) returns -4801
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0205 begin`);
      const actual: number = minutesUntilScheduled(114, 31);
      logInfo(`minutesUntilScheduled(hour=114, minute=31): actual=${actual}`);
      expect(actual).assertEqual(-4801);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0205 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0206
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0206
     * @tc.desc      minutesUntilScheduled(hour=48, minute=-1) returns -809
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0206 begin`);
      const actual: number = minutesUntilScheduled(48, -1);
      logInfo(`minutesUntilScheduled(hour=48, minute=-1): actual=${actual}`);
      expect(actual).assertEqual(-809);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0206 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0207
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0207
     * @tc.desc      minutesUntilScheduled(hour=59, minute=24) returns -1494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0207 begin`);
      const actual: number = minutesUntilScheduled(59, 24);
      logInfo(`minutesUntilScheduled(hour=59, minute=24): actual=${actual}`);
      expect(actual).assertEqual(-1494);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0207 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0208
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0208
     * @tc.desc      minutesUntilScheduled(hour=108, minute=54) returns -4464
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0208 begin`);
      const actual: number = minutesUntilScheduled(108, 54);
      logInfo(`minutesUntilScheduled(hour=108, minute=54): actual=${actual}`);
      expect(actual).assertEqual(-4464);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0208 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0209
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0209
     * @tc.desc      minutesUntilScheduled(hour=138, minute=25) returns -6235
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0209 begin`);
      const actual: number = minutesUntilScheduled(138, 25);
      logInfo(`minutesUntilScheduled(hour=138, minute=25): actual=${actual}`);
      expect(actual).assertEqual(-6235);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0209 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0210
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0210
     * @tc.desc      minutesUntilScheduled(hour=11, minute=61) returns 1349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0210 begin`);
      const actual: number = minutesUntilScheduled(11, 61);
      logInfo(`minutesUntilScheduled(hour=11, minute=61): actual=${actual}`);
      expect(actual).assertEqual(1349);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0210 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0211
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0211
     * @tc.desc      minutesUntilScheduled(hour=48, minute=84) returns -894
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0211 begin`);
      const actual: number = minutesUntilScheduled(48, 84);
      logInfo(`minutesUntilScheduled(hour=48, minute=84): actual=${actual}`);
      expect(actual).assertEqual(-894);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0211 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0212
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0212
     * @tc.desc      minutesUntilScheduled(hour=162, minute=61) returns -7711
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0212 begin`);
      const actual: number = minutesUntilScheduled(162, 61);
      logInfo(`minutesUntilScheduled(hour=162, minute=61): actual=${actual}`);
      expect(actual).assertEqual(-7711);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0212 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0213
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0213
     * @tc.desc      minutesUntilScheduled(hour=168, minute=3) returns -8013
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0213 begin`);
      const actual: number = minutesUntilScheduled(168, 3);
      logInfo(`minutesUntilScheduled(hour=168, minute=3): actual=${actual}`);
      expect(actual).assertEqual(-8013);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0213 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0214
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0214
     * @tc.desc      minutesUntilScheduled(hour=61, minute=10) returns -1600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0214 begin`);
      const actual: number = minutesUntilScheduled(61, 10);
      logInfo(`minutesUntilScheduled(hour=61, minute=10): actual=${actual}`);
      expect(actual).assertEqual(-1600);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0214 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0215
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0215
     * @tc.desc      minutesUntilScheduled(hour=48, minute=205) returns -1015
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0215 begin`);
      const actual: number = minutesUntilScheduled(48, 205);
      logInfo(`minutesUntilScheduled(hour=48, minute=205): actual=${actual}`);
      expect(actual).assertEqual(-1015);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0215 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0216
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0216
     * @tc.desc      minutesUntilScheduled(hour=132, minute=132) returns -5982
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0216 begin`);
      const actual: number = minutesUntilScheduled(132, 132);
      logInfo(`minutesUntilScheduled(hour=132, minute=132): actual=${actual}`);
      expect(actual).assertEqual(-5982);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0216 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0217
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0217
     * @tc.desc      minutesUntilScheduled(hour=216, minute=96) returns -10986
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0217 begin`);
      const actual: number = minutesUntilScheduled(216, 96);
      logInfo(`minutesUntilScheduled(hour=216, minute=96): actual=${actual}`);
      expect(actual).assertEqual(-10986);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0217 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0218
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0218
     * @tc.desc      minutesUntilScheduled(hour=10, minute=192) returns 1278
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0218 begin`);
      const actual: number = minutesUntilScheduled(10, 192);
      logInfo(`minutesUntilScheduled(hour=10, minute=192): actual=${actual}`);
      expect(actual).assertEqual(1278);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0218 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0219
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0219
     * @tc.desc      minutesUntilScheduled(hour=-1, minute=48) returns 642
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0219 begin`);
      const actual: number = minutesUntilScheduled(-1, 48);
      logInfo(`minutesUntilScheduled(hour=-1, minute=48): actual=${actual}`);
      expect(actual).assertEqual(642);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0219 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0220
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0220
     * @tc.desc      minutesUntilScheduled(hour=186, minute=72) returns -9162
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0220 begin`);
      const actual: number = minutesUntilScheduled(186, 72);
      logInfo(`minutesUntilScheduled(hour=186, minute=72): actual=${actual}`);
      expect(actual).assertEqual(-9162);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0220 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0221
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0221
     * @tc.desc      minutesUntilScheduled(hour=216, minute=132) returns -11022
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0221 begin`);
      const actual: number = minutesUntilScheduled(216, 132);
      logInfo(`minutesUntilScheduled(hour=216, minute=132): actual=${actual}`);
      expect(actual).assertEqual(-11022);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0221 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0222
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0222
     * @tc.desc      minutesUntilScheduled(hour=84, minute=48) returns -3018
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0222 begin`);
      const actual: number = minutesUntilScheduled(84, 48);
      logInfo(`minutesUntilScheduled(hour=84, minute=48): actual=${actual}`);
      expect(actual).assertEqual(-3018);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0222 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0223
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0223
     * @tc.desc      minutesUntilScheduled(hour=84, minute=198) returns -3168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0223 begin`);
      const actual: number = minutesUntilScheduled(84, 198);
      logInfo(`minutesUntilScheduled(hour=84, minute=198): actual=${actual}`);
      expect(actual).assertEqual(-3168);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0223 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0224
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0224
     * @tc.desc      minutesUntilScheduled(hour=23, minute=15) returns 675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0224 begin`);
      const actual: number = minutesUntilScheduled(23, 15);
      logInfo(`minutesUntilScheduled(hour=23, minute=15): actual=${actual}`);
      expect(actual).assertEqual(675);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0224 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0225
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0225
     * @tc.desc      minutesUntilScheduled(hour=59, minute=79.23) returns -1549.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0225 begin`);
      const actual: number = minutesUntilScheduled(59, 79.23);
      logInfo(`minutesUntilScheduled(hour=59, minute=79.23): actual=${actual}`);
      expect(actual).assertClose(-1549.23, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0225 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0226
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0226
     * @tc.desc      minutesUntilScheduled(hour=114, minute=138) returns -4908
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0226 begin`);
      const actual: number = minutesUntilScheduled(114, 138);
      logInfo(`minutesUntilScheduled(hour=114, minute=138): actual=${actual}`);
      expect(actual).assertEqual(-4908);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0226 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0227
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0227
     * @tc.desc      minutesUntilScheduled(hour=30, minute=186) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0227 begin`);
      const actual: number = minutesUntilScheduled(30, 186);
      logInfo(`minutesUntilScheduled(hour=30, minute=186): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0227 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0228
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0228
     * @tc.desc      minutesUntilScheduled(hour=204, minute=30) returns -10200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0228 begin`);
      const actual: number = minutesUntilScheduled(204, 30);
      logInfo(`minutesUntilScheduled(hour=204, minute=30): actual=${actual}`);
      expect(actual).assertEqual(-10200);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0228 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0229
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0229
     * @tc.desc      minutesUntilScheduled(hour=5, minute=174) returns 156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0229 begin`);
      const actual: number = minutesUntilScheduled(5, 174);
      logInfo(`minutesUntilScheduled(hour=5, minute=174): actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0229 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0230
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0230
     * @tc.desc      minutesUntilScheduled(hour=5, minute=31) returns 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0230 begin`);
      const actual: number = minutesUntilScheduled(5, 31);
      logInfo(`minutesUntilScheduled(hour=5, minute=31): actual=${actual}`);
      expect(actual).assertEqual(299);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0230 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0231
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0231
     * @tc.desc      minutesUntilScheduled(hour=186, minute=79.23) returns -9169.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0231 begin`);
      const actual: number = minutesUntilScheduled(186, 79.23);
      logInfo(`minutesUntilScheduled(hour=186, minute=79...: actual=${actual}`);
      expect(actual).assertClose(-9169.23, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0231 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0232
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0232
     * @tc.desc      minutesUntilScheduled(hour=-3, minute=42) returns 768
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0232 begin`);
      const actual: number = minutesUntilScheduled(-3, 42);
      logInfo(`minutesUntilScheduled(hour=-3, minute=42): actual=${actual}`);
      expect(actual).assertEqual(768);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0232 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0233
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0233
     * @tc.desc      minutesUntilScheduled(hour=90, minute=162) returns -3492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0233 begin`);
      const actual: number = minutesUntilScheduled(90, 162);
      logInfo(`minutesUntilScheduled(hour=90, minute=162): actual=${actual}`);
      expect(actual).assertEqual(-3492);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0233 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0234
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0234
     * @tc.desc      minutesUntilScheduled(hour=20, minute=36) returns 834
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0234 begin`);
      const actual: number = minutesUntilScheduled(20, 36);
      logInfo(`minutesUntilScheduled(hour=20, minute=36): actual=${actual}`);
      expect(actual).assertEqual(834);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0234 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0235
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0235
     * @tc.desc      minutesUntilScheduled(hour=25, minute=59) returns 511
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0235 begin`);
      const actual: number = minutesUntilScheduled(25, 59);
      logInfo(`minutesUntilScheduled(hour=25, minute=59): actual=${actual}`);
      expect(actual).assertEqual(511);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0235 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0236
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0236
     * @tc.desc      minutesUntilScheduled(hour=42, minute=186) returns -636
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0236 begin`);
      const actual: number = minutesUntilScheduled(42, 186);
      logInfo(`minutesUntilScheduled(hour=42, minute=186): actual=${actual}`);
      expect(actual).assertEqual(-636);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0236 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0237
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0237
     * @tc.desc      minutesUntilScheduled(hour=10, minute=144) returns 1326
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0237 begin`);
      const actual: number = minutesUntilScheduled(10, 144);
      logInfo(`minutesUntilScheduled(hour=10, minute=144): actual=${actual}`);
      expect(actual).assertEqual(1326);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0237 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0238
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0238
     * @tc.desc      minutesUntilScheduled(hour=6, minute=210) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0238 begin`);
      const actual: number = minutesUntilScheduled(6, 210);
      logInfo(`minutesUntilScheduled(hour=6, minute=210): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0238 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0239
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0239
     * @tc.desc      minutesUntilScheduled(hour=18, minute=79.23) returns 910.77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0239 begin`);
      const actual: number = minutesUntilScheduled(18, 79.23);
      logInfo(`minutesUntilScheduled(hour=18, minute=79.23): actual=${actual}`);
      expect(actual).assertClose(910.77, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0239 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0240
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0240
     * @tc.desc      minutesUntilScheduled(hour=210, minute=24) returns -10554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0240 begin`);
      const actual: number = minutesUntilScheduled(210, 24);
      logInfo(`minutesUntilScheduled(hour=210, minute=24): actual=${actual}`);
      expect(actual).assertEqual(-10554);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0240 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0241
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0241
     * @tc.desc      minutesUntilScheduled(hour=54, minute=19.52) returns -1189.52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0241 begin`);
      const actual: number = minutesUntilScheduled(54, 19.52);
      logInfo(`minutesUntilScheduled(hour=54, minute=19.52): actual=${actual}`);
      expect(actual).assertClose(-1189.52, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0241 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0242
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0242
     * @tc.desc      minutesUntilScheduled(hour=156, minute=3) returns -7293
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0242 begin`);
      const actual: number = minutesUntilScheduled(156, 3);
      logInfo(`minutesUntilScheduled(hour=156, minute=3): actual=${actual}`);
      expect(actual).assertEqual(-7293);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0242 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0243
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0243
     * @tc.desc      minutesUntilScheduled(hour=210, minute=66) returns -10596
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0243 begin`);
      const actual: number = minutesUntilScheduled(210, 66);
      logInfo(`minutesUntilScheduled(hour=210, minute=66): actual=${actual}`);
      expect(actual).assertEqual(-10596);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0243 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0244
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0244
     * @tc.desc      minutesUntilScheduled(hour=5.49, minute=31) returns 269.59999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0244 begin`);
      const actual: number = minutesUntilScheduled(5.49, 31);
      logInfo(`minutesUntilScheduled(hour=5.49, minute=31): actual=${actual}`);
      expect(actual).assertClose(269.59999999999997, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0244 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0245
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0245
     * @tc.desc      minutesUntilScheduled(hour=114, minute=90) returns -4860
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0245 begin`);
      const actual: number = minutesUntilScheduled(114, 90);
      logInfo(`minutesUntilScheduled(hour=114, minute=90): actual=${actual}`);
      expect(actual).assertEqual(-4860);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0245 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0246
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0246
     * @tc.desc      minutesUntilScheduled(hour=108, minute=15) returns -4425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0246 begin`);
      const actual: number = minutesUntilScheduled(108, 15);
      logInfo(`minutesUntilScheduled(hour=108, minute=15): actual=${actual}`);
      expect(actual).assertEqual(-4425);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0246 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0247
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0247
     * @tc.desc      minutesUntilScheduled(hour=-3, minute=79.23) returns 730.77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0247 begin`);
      const actual: number = minutesUntilScheduled(-3, 79.23);
      logInfo(`minutesUntilScheduled(hour=-3, minute=79.23): actual=${actual}`);
      expect(actual).assertClose(730.77, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0247 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0248
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0248
     * @tc.desc      minutesUntilScheduled(hour=61, minute=156) returns -1746
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0248 begin`);
      const actual: number = minutesUntilScheduled(61, 156);
      logInfo(`minutesUntilScheduled(hour=61, minute=156): actual=${actual}`);
      expect(actual).assertEqual(-1746);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0248 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0249
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0249
     * @tc.desc      minutesUntilScheduled(hour=52, minute=25) returns -1075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0249 begin`);
      const actual: number = minutesUntilScheduled(52, 25);
      logInfo(`minutesUntilScheduled(hour=52, minute=25): actual=${actual}`);
      expect(actual).assertEqual(-1075);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0249 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0250
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0250
     * @tc.desc      minutesUntilScheduled(hour=138, minute=11) returns -6221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0250 begin`);
      const actual: number = minutesUntilScheduled(138, 11);
      logInfo(`minutesUntilScheduled(hour=138, minute=11): actual=${actual}`);
      expect(actual).assertEqual(-6221);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0250 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0251
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0251
     * @tc.desc      minutesUntilScheduled(hour=36, minute=-103) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0251 begin`);
      const actual: number = minutesUntilScheduled(36, -103);
      logInfo(`minutesUntilScheduled(hour=36, minute=-103): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0251 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0252
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0252
     * @tc.desc      minutesUntilScheduled(hour=120, minute=112) returns -5242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0252 begin`);
      const actual: number = minutesUntilScheduled(120, 112);
      logInfo(`minutesUntilScheduled(hour=120, minute=112): actual=${actual}`);
      expect(actual).assertEqual(-5242);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0252 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0253
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0253
     * @tc.desc      minutesUntilScheduled(hour=216, minute=114) returns -11004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0253 begin`);
      const actual: number = minutesUntilScheduled(216, 114);
      logInfo(`minutesUntilScheduled(hour=216, minute=114): actual=${actual}`);
      expect(actual).assertEqual(-11004);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0253 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0254
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0254
     * @tc.desc      minutesUntilScheduled(hour=10, minute=9) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0254 begin`);
      const actual: number = minutesUntilScheduled(10, 9);
      logInfo(`minutesUntilScheduled(hour=10, minute=9): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0254 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0255
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0255
     * @tc.desc      minutesUntilScheduled(hour=66, minute=162) returns -2052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0255 begin`);
      const actual: number = minutesUntilScheduled(66, 162);
      logInfo(`minutesUntilScheduled(hour=66, minute=162): actual=${actual}`);
      expect(actual).assertEqual(-2052);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0255 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0256
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0256
     * @tc.desc      minutesUntilScheduled(hour=101, minute=205) returns -4195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0256 begin`);
      const actual: number = minutesUntilScheduled(101, 205);
      logInfo(`minutesUntilScheduled(hour=101, minute=205): actual=${actual}`);
      expect(actual).assertEqual(-4195);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0256 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0257
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0257
     * @tc.desc      minutesUntilScheduled(hour=30, minute=66) returns 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0257 begin`);
      const actual: number = minutesUntilScheduled(30, 66);
      logInfo(`minutesUntilScheduled(hour=30, minute=66): actual=${actual}`);
      expect(actual).assertEqual(204);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0257 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0258
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0258
     * @tc.desc      minutesUntilScheduled(hour=15, minute=48) returns 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0258 begin`);
      const actual: number = minutesUntilScheduled(15, 48);
      logInfo(`minutesUntilScheduled(hour=15, minute=48): actual=${actual}`);
      expect(actual).assertEqual(1122);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0258 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0259
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0259
     * @tc.desc      minutesUntilScheduled(hour=29, minute=108) returns 222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0259 begin`);
      const actual: number = minutesUntilScheduled(29, 108);
      logInfo(`minutesUntilScheduled(hour=29, minute=108): actual=${actual}`);
      expect(actual).assertEqual(222);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0259 end`);
    });
  });
}
