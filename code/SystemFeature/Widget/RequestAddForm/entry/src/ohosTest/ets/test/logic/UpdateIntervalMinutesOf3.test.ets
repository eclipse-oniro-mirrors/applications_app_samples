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
import { updateIntervalMinutesOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for updateIntervalMinutesOf (48 cases). */
export default function updateIntervalMinutesOf3Test(): void {
  describe('UpdateIntervalMinutesOf3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0193
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0193
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0193 begin`);
      const actual: number = updateIntervalMinutesOf(-2);
      logInfo(`updateIntervalMinutesOf(updateDuration=-2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0193 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0194
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0194
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0194 begin`);
      const actual: number = updateIntervalMinutesOf(-31);
      logInfo(`updateIntervalMinutesOf(updateDuration=-31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0194 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0195
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0195
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0195 begin`);
      const actual: number = updateIntervalMinutesOf(-75);
      logInfo(`updateIntervalMinutesOf(updateDuration=-75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0195 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0196
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0196
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0196 begin`);
      const actual: number = updateIntervalMinutesOf(-55);
      logInfo(`updateIntervalMinutesOf(updateDuration=-55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0196 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0197
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0197
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-14) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0197 begin`);
      const actual: number = updateIntervalMinutesOf(-14);
      logInfo(`updateIntervalMinutesOf(updateDuration=-14): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0197 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0198
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0198
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-18) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0198 begin`);
      const actual: number = updateIntervalMinutesOf(-18);
      logInfo(`updateIntervalMinutesOf(updateDuration=-18): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0198 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0199
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0199
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0199 begin`);
      const actual: number = updateIntervalMinutesOf(-13);
      logInfo(`updateIntervalMinutesOf(updateDuration=-13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0199 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0200
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0200
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-98) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0200 begin`);
      const actual: number = updateIntervalMinutesOf(-98);
      logInfo(`updateIntervalMinutesOf(updateDuration=-98): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0200 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0201
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0201
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-16) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0201 begin`);
      const actual: number = updateIntervalMinutesOf(-16);
      logInfo(`updateIntervalMinutesOf(updateDuration=-16): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0201 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0202
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0202
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0202 begin`);
      const actual: number = updateIntervalMinutesOf(-8);
      logInfo(`updateIntervalMinutesOf(updateDuration=-8): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0202 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0203
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0203
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0203 begin`);
      const actual: number = updateIntervalMinutesOf(-30);
      logInfo(`updateIntervalMinutesOf(updateDuration=-30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0203 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0204
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0204
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-39) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0204 begin`);
      const actual: number = updateIntervalMinutesOf(-39);
      logInfo(`updateIntervalMinutesOf(updateDuration=-39): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0204 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0205
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0205
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0205 begin`);
      const actual: number = updateIntervalMinutesOf(-62);
      logInfo(`updateIntervalMinutesOf(updateDuration=-62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0205 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0206
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0206
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-71) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0206 begin`);
      const actual: number = updateIntervalMinutesOf(-71);
      logInfo(`updateIntervalMinutesOf(updateDuration=-71): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0206 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0207
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0207
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0207 begin`);
      const actual: number = updateIntervalMinutesOf(-20);
      logInfo(`updateIntervalMinutesOf(updateDuration=-20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0207 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0208
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0208
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-58) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0208 begin`);
      const actual: number = updateIntervalMinutesOf(-58);
      logInfo(`updateIntervalMinutesOf(updateDuration=-58): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0208 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0209
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0209
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-46) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0209 begin`);
      const actual: number = updateIntervalMinutesOf(-46);
      logInfo(`updateIntervalMinutesOf(updateDuration=-46): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0209 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0210
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0210
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-96) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0210 begin`);
      const actual: number = updateIntervalMinutesOf(-96);
      logInfo(`updateIntervalMinutesOf(updateDuration=-96): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0210 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0211
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0211
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-77) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0211 begin`);
      const actual: number = updateIntervalMinutesOf(-77);
      logInfo(`updateIntervalMinutesOf(updateDuration=-77): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0211 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0212
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0212
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-42) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0212 begin`);
      const actual: number = updateIntervalMinutesOf(-42);
      logInfo(`updateIntervalMinutesOf(updateDuration=-42): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0212 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0213
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0213
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-86) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0213 begin`);
      const actual: number = updateIntervalMinutesOf(-86);
      logInfo(`updateIntervalMinutesOf(updateDuration=-86): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0213 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0214
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0214
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0214 begin`);
      const actual: number = updateIntervalMinutesOf(-35);
      logInfo(`updateIntervalMinutesOf(updateDuration=-35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0214 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0215
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0215
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-47) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0215 begin`);
      const actual: number = updateIntervalMinutesOf(-47);
      logInfo(`updateIntervalMinutesOf(updateDuration=-47): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0215 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0216
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0216
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0216 begin`);
      const actual: number = updateIntervalMinutesOf(-3);
      logInfo(`updateIntervalMinutesOf(updateDuration=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0216 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0217
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0217
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-81) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0217 begin`);
      const actual: number = updateIntervalMinutesOf(-81);
      logInfo(`updateIntervalMinutesOf(updateDuration=-81): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0217 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0218
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0218
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0218 begin`);
      const actual: number = updateIntervalMinutesOf(-10);
      logInfo(`updateIntervalMinutesOf(updateDuration=-10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0218 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0219
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0219
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-19) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0219 begin`);
      const actual: number = updateIntervalMinutesOf(-19);
      logInfo(`updateIntervalMinutesOf(updateDuration=-19): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0219 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0220
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0220
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-89) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0220 begin`);
      const actual: number = updateIntervalMinutesOf(-89);
      logInfo(`updateIntervalMinutesOf(updateDuration=-89): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0220 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0221
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0221
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-28) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0221 begin`);
      const actual: number = updateIntervalMinutesOf(-28);
      logInfo(`updateIntervalMinutesOf(updateDuration=-28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0221 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0222
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0222
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-64) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0222 begin`);
      const actual: number = updateIntervalMinutesOf(-64);
      logInfo(`updateIntervalMinutesOf(updateDuration=-64): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0222 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0223
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0223
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-4) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0223 begin`);
      const actual: number = updateIntervalMinutesOf(-4);
      logInfo(`updateIntervalMinutesOf(updateDuration=-4): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0223 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0224
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0224
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-68) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0224 begin`);
      const actual: number = updateIntervalMinutesOf(-68);
      logInfo(`updateIntervalMinutesOf(updateDuration=-68): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0224 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0225
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0225
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0225 begin`);
      const actual: number = updateIntervalMinutesOf(-99);
      logInfo(`updateIntervalMinutesOf(updateDuration=-99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0225 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0226
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0226
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0226 begin`);
      const actual: number = updateIntervalMinutesOf(-9);
      logInfo(`updateIntervalMinutesOf(updateDuration=-9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0226 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0227
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0227
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-59) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0227 begin`);
      const actual: number = updateIntervalMinutesOf(-59);
      logInfo(`updateIntervalMinutesOf(updateDuration=-59): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0227 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0228
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0228
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0228 begin`);
      const actual: number = updateIntervalMinutesOf(-29);
      logInfo(`updateIntervalMinutesOf(updateDuration=-29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0228 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0229
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0229
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-66) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0229 begin`);
      const actual: number = updateIntervalMinutesOf(-66);
      logInfo(`updateIntervalMinutesOf(updateDuration=-66): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0229 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0230
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0230
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-48) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0230 begin`);
      const actual: number = updateIntervalMinutesOf(-48);
      logInfo(`updateIntervalMinutesOf(updateDuration=-48): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0230 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0231
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0231
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-87) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0231 begin`);
      const actual: number = updateIntervalMinutesOf(-87);
      logInfo(`updateIntervalMinutesOf(updateDuration=-87): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0231 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0232
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0232
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-7) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0232 begin`);
      const actual: number = updateIntervalMinutesOf(-7);
      logInfo(`updateIntervalMinutesOf(updateDuration=-7): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0232 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0233
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0233
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0233 begin`);
      const actual: number = updateIntervalMinutesOf(-45);
      logInfo(`updateIntervalMinutesOf(updateDuration=-45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0233 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0234
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0234
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0234 begin`);
      const actual: number = updateIntervalMinutesOf(-11);
      logInfo(`updateIntervalMinutesOf(updateDuration=-11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0234 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0235
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0235
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-78) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0235 begin`);
      const actual: number = updateIntervalMinutesOf(-78);
      logInfo(`updateIntervalMinutesOf(updateDuration=-78): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0235 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0236
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0236
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-34) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0236 begin`);
      const actual: number = updateIntervalMinutesOf(-34);
      logInfo(`updateIntervalMinutesOf(updateDuration=-34): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0236 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0237
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0237
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-54) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0237 begin`);
      const actual: number = updateIntervalMinutesOf(-54);
      logInfo(`updateIntervalMinutesOf(updateDuration=-54): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0237 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0238
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0238
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0238 begin`);
      const actual: number = updateIntervalMinutesOf(-80);
      logInfo(`updateIntervalMinutesOf(updateDuration=-80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0238 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0239
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0239
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-97) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0239 begin`);
      const actual: number = updateIntervalMinutesOf(-97);
      logInfo(`updateIntervalMinutesOf(updateDuration=-97): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0239 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0240
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0240
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0240 begin`);
      const actual: number = updateIntervalMinutesOf(-95);
      logInfo(`updateIntervalMinutesOf(updateDuration=-95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0240 end`);
    });
  });
}
