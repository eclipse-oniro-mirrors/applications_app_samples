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
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { cellKeyOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellKeyOf (48 cases). */
export default function cellKeyOf3Test(): void {
  describe('CellKeyOf3Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0193
     * @tc.name      VerifyCode_CellKeyOf_0193
     * @tc.desc      cellKeyOf(item=-70) returns "-70"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0193 begin`);
      const actual: string = cellKeyOf(-70);
      logInfo(`cellKeyOf(item=-70): actual=${actual}`);
      expect(actual).assertEqual('-70');
      logInfo(`${BUNDLE}CellKeyOf_0193 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0194
     * @tc.name      VerifyCode_CellKeyOf_0194
     * @tc.desc      cellKeyOf(item=70.8) returns "70.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0194 begin`);
      const actual: string = cellKeyOf(70.8);
      logInfo(`cellKeyOf(item=70.8): actual=${actual}`);
      expect(actual).assertEqual('70.8');
      logInfo(`${BUNDLE}CellKeyOf_0194 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0195
     * @tc.name      VerifyCode_CellKeyOf_0195
     * @tc.desc      cellKeyOf(item=83.6) returns "83.6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0195 begin`);
      const actual: string = cellKeyOf(83.6);
      logInfo(`cellKeyOf(item=83.6): actual=${actual}`);
      expect(actual).assertEqual('83.6');
      logInfo(`${BUNDLE}CellKeyOf_0195 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0196
     * @tc.name      VerifyCode_CellKeyOf_0196
     * @tc.desc      cellKeyOf(item=129) returns "129"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0196 begin`);
      const actual: string = cellKeyOf(129);
      logInfo(`cellKeyOf(item=129): actual=${actual}`);
      expect(actual).assertEqual('129');
      logInfo(`${BUNDLE}CellKeyOf_0196 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0197
     * @tc.name      VerifyCode_CellKeyOf_0197
     * @tc.desc      cellKeyOf(item=20.48) returns "20.48"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0197 begin`);
      const actual: string = cellKeyOf(20.48);
      logInfo(`cellKeyOf(item=20.48): actual=${actual}`);
      expect(actual).assertEqual('20.48');
      logInfo(`${BUNDLE}CellKeyOf_0197 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0198
     * @tc.name      VerifyCode_CellKeyOf_0198
     * @tc.desc      cellKeyOf(item=24.81) returns "24.81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0198 begin`);
      const actual: string = cellKeyOf(24.81);
      logInfo(`cellKeyOf(item=24.81): actual=${actual}`);
      expect(actual).assertEqual('24.81');
      logInfo(`${BUNDLE}CellKeyOf_0198 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0199
     * @tc.name      VerifyCode_CellKeyOf_0199
     * @tc.desc      cellKeyOf(item=77.83) returns "77.83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0199 begin`);
      const actual: string = cellKeyOf(77.83);
      logInfo(`cellKeyOf(item=77.83): actual=${actual}`);
      expect(actual).assertEqual('77.83');
      logInfo(`${BUNDLE}CellKeyOf_0199 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0200
     * @tc.name      VerifyCode_CellKeyOf_0200
     * @tc.desc      cellKeyOf(item=21.88) returns "21.88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0200 begin`);
      const actual: string = cellKeyOf(21.88);
      logInfo(`cellKeyOf(item=21.88): actual=${actual}`);
      expect(actual).assertEqual('21.88');
      logInfo(`${BUNDLE}CellKeyOf_0200 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0201
     * @tc.name      VerifyCode_CellKeyOf_0201
     * @tc.desc      cellKeyOf(item=163) returns "163"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0201 begin`);
      const actual: string = cellKeyOf(163);
      logInfo(`cellKeyOf(item=163): actual=${actual}`);
      expect(actual).assertEqual('163');
      logInfo(`${BUNDLE}CellKeyOf_0201 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0202
     * @tc.name      VerifyCode_CellKeyOf_0202
     * @tc.desc      cellKeyOf(item=98.94) returns "98.94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0202 begin`);
      const actual: string = cellKeyOf(98.94);
      logInfo(`cellKeyOf(item=98.94): actual=${actual}`);
      expect(actual).assertEqual('98.94');
      logInfo(`${BUNDLE}CellKeyOf_0202 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0203
     * @tc.name      VerifyCode_CellKeyOf_0203
     * @tc.desc      cellKeyOf(item=-44) returns "-44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0203 begin`);
      const actual: string = cellKeyOf(-44);
      logInfo(`cellKeyOf(item=-44): actual=${actual}`);
      expect(actual).assertEqual('-44');
      logInfo(`${BUNDLE}CellKeyOf_0203 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0204
     * @tc.name      VerifyCode_CellKeyOf_0204
     * @tc.desc      cellKeyOf(item=96) returns "96"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0204 begin`);
      const actual: string = cellKeyOf(96);
      logInfo(`cellKeyOf(item=96): actual=${actual}`);
      expect(actual).assertEqual('96');
      logInfo(`${BUNDLE}CellKeyOf_0204 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0205
     * @tc.name      VerifyCode_CellKeyOf_0205
     * @tc.desc      cellKeyOf(item=-41) returns "-41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0205 begin`);
      const actual: string = cellKeyOf(-41);
      logInfo(`cellKeyOf(item=-41): actual=${actual}`);
      expect(actual).assertEqual('-41');
      logInfo(`${BUNDLE}CellKeyOf_0205 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0206
     * @tc.name      VerifyCode_CellKeyOf_0206
     * @tc.desc      cellKeyOf(item=196) returns "196"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0206 begin`);
      const actual: string = cellKeyOf(196);
      logInfo(`cellKeyOf(item=196): actual=${actual}`);
      expect(actual).assertEqual('196');
      logInfo(`${BUNDLE}CellKeyOf_0206 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0207
     * @tc.name      VerifyCode_CellKeyOf_0207
     * @tc.desc      cellKeyOf(item=181) returns "181"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0207 begin`);
      const actual: string = cellKeyOf(181);
      logInfo(`cellKeyOf(item=181): actual=${actual}`);
      expect(actual).assertEqual('181');
      logInfo(`${BUNDLE}CellKeyOf_0207 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0208
     * @tc.name      VerifyCode_CellKeyOf_0208
     * @tc.desc      cellKeyOf(item=174) returns "174"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0208 begin`);
      const actual: string = cellKeyOf(174);
      logInfo(`cellKeyOf(item=174): actual=${actual}`);
      expect(actual).assertEqual('174');
      logInfo(`${BUNDLE}CellKeyOf_0208 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0209
     * @tc.name      VerifyCode_CellKeyOf_0209
     * @tc.desc      cellKeyOf(item=33.38) returns "33.38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0209 begin`);
      const actual: string = cellKeyOf(33.38);
      logInfo(`cellKeyOf(item=33.38): actual=${actual}`);
      expect(actual).assertEqual('33.38');
      logInfo(`${BUNDLE}CellKeyOf_0209 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0210
     * @tc.name      VerifyCode_CellKeyOf_0210
     * @tc.desc      cellKeyOf(item=44.72) returns "44.72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0210 begin`);
      const actual: string = cellKeyOf(44.72);
      logInfo(`cellKeyOf(item=44.72): actual=${actual}`);
      expect(actual).assertEqual('44.72');
      logInfo(`${BUNDLE}CellKeyOf_0210 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0211
     * @tc.name      VerifyCode_CellKeyOf_0211
     * @tc.desc      cellKeyOf(item=77) returns "77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0211 begin`);
      const actual: string = cellKeyOf(77);
      logInfo(`cellKeyOf(item=77): actual=${actual}`);
      expect(actual).assertEqual('77');
      logInfo(`${BUNDLE}CellKeyOf_0211 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0212
     * @tc.name      VerifyCode_CellKeyOf_0212
     * @tc.desc      cellKeyOf(item=33) returns "33"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0212 begin`);
      const actual: string = cellKeyOf(33);
      logInfo(`cellKeyOf(item=33): actual=${actual}`);
      expect(actual).assertEqual('33');
      logInfo(`${BUNDLE}CellKeyOf_0212 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0213
     * @tc.name      VerifyCode_CellKeyOf_0213
     * @tc.desc      cellKeyOf(item=44.88) returns "44.88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0213 begin`);
      const actual: string = cellKeyOf(44.88);
      logInfo(`cellKeyOf(item=44.88): actual=${actual}`);
      expect(actual).assertEqual('44.88');
      logInfo(`${BUNDLE}CellKeyOf_0213 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0214
     * @tc.name      VerifyCode_CellKeyOf_0214
     * @tc.desc      cellKeyOf(item=27.23) returns "27.23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0214 begin`);
      const actual: string = cellKeyOf(27.23);
      logInfo(`cellKeyOf(item=27.23): actual=${actual}`);
      expect(actual).assertEqual('27.23');
      logInfo(`${BUNDLE}CellKeyOf_0214 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0215
     * @tc.name      VerifyCode_CellKeyOf_0215
     * @tc.desc      cellKeyOf(item=66) returns "66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0215 begin`);
      const actual: string = cellKeyOf(66);
      logInfo(`cellKeyOf(item=66): actual=${actual}`);
      expect(actual).assertEqual('66');
      logInfo(`${BUNDLE}CellKeyOf_0215 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0216
     * @tc.name      VerifyCode_CellKeyOf_0216
     * @tc.desc      cellKeyOf(item=70.42) returns "70.42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0216 begin`);
      const actual: string = cellKeyOf(70.42);
      logInfo(`cellKeyOf(item=70.42): actual=${actual}`);
      expect(actual).assertEqual('70.42');
      logInfo(`${BUNDLE}CellKeyOf_0216 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0217
     * @tc.name      VerifyCode_CellKeyOf_0217
     * @tc.desc      cellKeyOf(item=53.75) returns "53.75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0217 begin`);
      const actual: string = cellKeyOf(53.75);
      logInfo(`cellKeyOf(item=53.75): actual=${actual}`);
      expect(actual).assertEqual('53.75');
      logInfo(`${BUNDLE}CellKeyOf_0217 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0218
     * @tc.name      VerifyCode_CellKeyOf_0218
     * @tc.desc      cellKeyOf(item=124) returns "124"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0218 begin`);
      const actual: string = cellKeyOf(124);
      logInfo(`cellKeyOf(item=124): actual=${actual}`);
      expect(actual).assertEqual('124');
      logInfo(`${BUNDLE}CellKeyOf_0218 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0219
     * @tc.name      VerifyCode_CellKeyOf_0219
     * @tc.desc      cellKeyOf(item=16.31) returns "16.31"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0219 begin`);
      const actual: string = cellKeyOf(16.31);
      logInfo(`cellKeyOf(item=16.31): actual=${actual}`);
      expect(actual).assertEqual('16.31');
      logInfo(`${BUNDLE}CellKeyOf_0219 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0220
     * @tc.name      VerifyCode_CellKeyOf_0220
     * @tc.desc      cellKeyOf(item=32.81) returns "32.81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0220 begin`);
      const actual: string = cellKeyOf(32.81);
      logInfo(`cellKeyOf(item=32.81): actual=${actual}`);
      expect(actual).assertEqual('32.81');
      logInfo(`${BUNDLE}CellKeyOf_0220 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0221
     * @tc.name      VerifyCode_CellKeyOf_0221
     * @tc.desc      cellKeyOf(item=182) returns "182"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0221 begin`);
      const actual: string = cellKeyOf(182);
      logInfo(`cellKeyOf(item=182): actual=${actual}`);
      expect(actual).assertEqual('182');
      logInfo(`${BUNDLE}CellKeyOf_0221 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0222
     * @tc.name      VerifyCode_CellKeyOf_0222
     * @tc.desc      cellKeyOf(item=43) returns "43"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0222 begin`);
      const actual: string = cellKeyOf(43);
      logInfo(`cellKeyOf(item=43): actual=${actual}`);
      expect(actual).assertEqual('43');
      logInfo(`${BUNDLE}CellKeyOf_0222 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0223
     * @tc.name      VerifyCode_CellKeyOf_0223
     * @tc.desc      cellKeyOf(item=148) returns "148"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0223 begin`);
      const actual: string = cellKeyOf(148);
      logInfo(`cellKeyOf(item=148): actual=${actual}`);
      expect(actual).assertEqual('148');
      logInfo(`${BUNDLE}CellKeyOf_0223 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0224
     * @tc.name      VerifyCode_CellKeyOf_0224
     * @tc.desc      cellKeyOf(item=64.04) returns "64.04"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0224 begin`);
      const actual: string = cellKeyOf(64.04);
      logInfo(`cellKeyOf(item=64.04): actual=${actual}`);
      expect(actual).assertEqual('64.04');
      logInfo(`${BUNDLE}CellKeyOf_0224 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0225
     * @tc.name      VerifyCode_CellKeyOf_0225
     * @tc.desc      cellKeyOf(item=72) returns "72"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0225 begin`);
      const actual: string = cellKeyOf(72);
      logInfo(`cellKeyOf(item=72): actual=${actual}`);
      expect(actual).assertEqual('72');
      logInfo(`${BUNDLE}CellKeyOf_0225 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0226
     * @tc.name      VerifyCode_CellKeyOf_0226
     * @tc.desc      cellKeyOf(item=68.93) returns "68.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0226 begin`);
      const actual: string = cellKeyOf(68.93);
      logInfo(`cellKeyOf(item=68.93): actual=${actual}`);
      expect(actual).assertEqual('68.93');
      logInfo(`${BUNDLE}CellKeyOf_0226 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0227
     * @tc.name      VerifyCode_CellKeyOf_0227
     * @tc.desc      cellKeyOf(item=94.97) returns "94.97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0227 begin`);
      const actual: string = cellKeyOf(94.97);
      logInfo(`cellKeyOf(item=94.97): actual=${actual}`);
      expect(actual).assertEqual('94.97');
      logInfo(`${BUNDLE}CellKeyOf_0227 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0228
     * @tc.name      VerifyCode_CellKeyOf_0228
     * @tc.desc      cellKeyOf(item=29.28) returns "29.28"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0228 begin`);
      const actual: string = cellKeyOf(29.28);
      logInfo(`cellKeyOf(item=29.28): actual=${actual}`);
      expect(actual).assertEqual('29.28');
      logInfo(`${BUNDLE}CellKeyOf_0228 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0229
     * @tc.name      VerifyCode_CellKeyOf_0229
     * @tc.desc      cellKeyOf(item=17) returns "17"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0229 begin`);
      const actual: string = cellKeyOf(17);
      logInfo(`cellKeyOf(item=17): actual=${actual}`);
      expect(actual).assertEqual('17');
      logInfo(`${BUNDLE}CellKeyOf_0229 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0230
     * @tc.name      VerifyCode_CellKeyOf_0230
     * @tc.desc      cellKeyOf(item=114) returns "114"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0230 begin`);
      const actual: string = cellKeyOf(114);
      logInfo(`cellKeyOf(item=114): actual=${actual}`);
      expect(actual).assertEqual('114');
      logInfo(`${BUNDLE}CellKeyOf_0230 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0231
     * @tc.name      VerifyCode_CellKeyOf_0231
     * @tc.desc      cellKeyOf(item=-11) returns "-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0231 begin`);
      const actual: string = cellKeyOf(-11);
      logInfo(`cellKeyOf(item=-11): actual=${actual}`);
      expect(actual).assertEqual('-11');
      logInfo(`${BUNDLE}CellKeyOf_0231 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0232
     * @tc.name      VerifyCode_CellKeyOf_0232
     * @tc.desc      cellKeyOf(item=78) returns "78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0232 begin`);
      const actual: string = cellKeyOf(78);
      logInfo(`cellKeyOf(item=78): actual=${actual}`);
      expect(actual).assertEqual('78');
      logInfo(`${BUNDLE}CellKeyOf_0232 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0233
     * @tc.name      VerifyCode_CellKeyOf_0233
     * @tc.desc      cellKeyOf(item=22) returns "22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0233 begin`);
      const actual: string = cellKeyOf(22);
      logInfo(`cellKeyOf(item=22): actual=${actual}`);
      expect(actual).assertEqual('22');
      logInfo(`${BUNDLE}CellKeyOf_0233 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0234
     * @tc.name      VerifyCode_CellKeyOf_0234
     * @tc.desc      cellKeyOf(item=10.2) returns "10.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0234 begin`);
      const actual: string = cellKeyOf(10.2);
      logInfo(`cellKeyOf(item=10.2): actual=${actual}`);
      expect(actual).assertEqual('10.2');
      logInfo(`${BUNDLE}CellKeyOf_0234 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0235
     * @tc.name      VerifyCode_CellKeyOf_0235
     * @tc.desc      cellKeyOf(item=158) returns "158"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0235 begin`);
      const actual: string = cellKeyOf(158);
      logInfo(`cellKeyOf(item=158): actual=${actual}`);
      expect(actual).assertEqual('158');
      logInfo(`${BUNDLE}CellKeyOf_0235 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0236
     * @tc.name      VerifyCode_CellKeyOf_0236
     * @tc.desc      cellKeyOf(item=-73) returns "-73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0236 begin`);
      const actual: string = cellKeyOf(-73);
      logInfo(`cellKeyOf(item=-73): actual=${actual}`);
      expect(actual).assertEqual('-73');
      logInfo(`${BUNDLE}CellKeyOf_0236 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0237
     * @tc.name      VerifyCode_CellKeyOf_0237
     * @tc.desc      cellKeyOf(item=5.93) returns "5.93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0237 begin`);
      const actual: string = cellKeyOf(5.93);
      logInfo(`cellKeyOf(item=5.93): actual=${actual}`);
      expect(actual).assertEqual('5.93');
      logInfo(`${BUNDLE}CellKeyOf_0237 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0238
     * @tc.name      VerifyCode_CellKeyOf_0238
     * @tc.desc      cellKeyOf(item=26.56) returns "26.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0238 begin`);
      const actual: string = cellKeyOf(26.56);
      logInfo(`cellKeyOf(item=26.56): actual=${actual}`);
      expect(actual).assertEqual('26.56');
      logInfo(`${BUNDLE}CellKeyOf_0238 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0239
     * @tc.name      VerifyCode_CellKeyOf_0239
     * @tc.desc      cellKeyOf(item=128) returns "128"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0239 begin`);
      const actual: string = cellKeyOf(128);
      logInfo(`cellKeyOf(item=128): actual=${actual}`);
      expect(actual).assertEqual('128');
      logInfo(`${BUNDLE}CellKeyOf_0239 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0240
     * @tc.name      VerifyCode_CellKeyOf_0240
     * @tc.desc      cellKeyOf(item=9.94) returns "9.94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0240 begin`);
      const actual: string = cellKeyOf(9.94);
      logInfo(`cellKeyOf(item=9.94): actual=${actual}`);
      expect(actual).assertEqual('9.94');
      logInfo(`${BUNDLE}CellKeyOf_0240 end`);
    });
  });
}
