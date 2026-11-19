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
import { vp2pxAt } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for vp2pxAt (52 cases). */
export default function vp2pxAt3Test(): void {
  describe('Vp2pxAt3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0193
     * @tc.name      WindowManage_Vp2pxAt_0193
     * @tc.desc      vp2pxAt(vp=35, density=55) returns 1925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0193 begin`);
      const actual: number = vp2pxAt(35, 55);
      logInfo(`vp2pxAt(vp=35, density=55): actual=${actual}`);
      expect(actual).assertEqual(1925);
      logInfo(`${BUNDLE}Vp2pxAt_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0194
     * @tc.name      WindowManage_Vp2pxAt_0194
     * @tc.desc      vp2pxAt(vp=35, density=65) returns 2275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0194 begin`);
      const actual: number = vp2pxAt(35, 65);
      logInfo(`vp2pxAt(vp=35, density=65): actual=${actual}`);
      expect(actual).assertEqual(2275);
      logInfo(`${BUNDLE}Vp2pxAt_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0195
     * @tc.name      WindowManage_Vp2pxAt_0195
     * @tc.desc      vp2pxAt(vp=35, density=70) returns 2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0195 begin`);
      const actual: number = vp2pxAt(35, 70);
      logInfo(`vp2pxAt(vp=35, density=70): actual=${actual}`);
      expect(actual).assertEqual(2450);
      logInfo(`${BUNDLE}Vp2pxAt_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0196
     * @tc.name      WindowManage_Vp2pxAt_0196
     * @tc.desc      vp2pxAt(vp=35, density=80) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0196 begin`);
      const actual: number = vp2pxAt(35, 80);
      logInfo(`vp2pxAt(vp=35, density=80): actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}Vp2pxAt_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0197
     * @tc.name      WindowManage_Vp2pxAt_0197
     * @tc.desc      vp2pxAt(vp=35, density=85) returns 2975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0197 begin`);
      const actual: number = vp2pxAt(35, 85);
      logInfo(`vp2pxAt(vp=35, density=85): actual=${actual}`);
      expect(actual).assertEqual(2975);
      logInfo(`${BUNDLE}Vp2pxAt_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0198
     * @tc.name      WindowManage_Vp2pxAt_0198
     * @tc.desc      vp2pxAt(vp=35, density=95) returns 3325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0198 begin`);
      const actual: number = vp2pxAt(35, 95);
      logInfo(`vp2pxAt(vp=35, density=95): actual=${actual}`);
      expect(actual).assertEqual(3325);
      logInfo(`${BUNDLE}Vp2pxAt_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0199
     * @tc.name      WindowManage_Vp2pxAt_0199
     * @tc.desc      vp2pxAt(vp=35, density=105) returns 3675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0199 begin`);
      const actual: number = vp2pxAt(35, 105);
      logInfo(`vp2pxAt(vp=35, density=105): actual=${actual}`);
      expect(actual).assertEqual(3675);
      logInfo(`${BUNDLE}Vp2pxAt_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0200
     * @tc.name      WindowManage_Vp2pxAt_0200
     * @tc.desc      vp2pxAt(vp=35, density=110) returns 3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0200 begin`);
      const actual: number = vp2pxAt(35, 110);
      logInfo(`vp2pxAt(vp=35, density=110): actual=${actual}`);
      expect(actual).assertEqual(3850);
      logInfo(`${BUNDLE}Vp2pxAt_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0201
     * @tc.name      WindowManage_Vp2pxAt_0201
     * @tc.desc      vp2pxAt(vp=35, density=115) returns 4025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0201 begin`);
      const actual: number = vp2pxAt(35, 115);
      logInfo(`vp2pxAt(vp=35, density=115): actual=${actual}`);
      expect(actual).assertEqual(4025);
      logInfo(`${BUNDLE}Vp2pxAt_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0202
     * @tc.name      WindowManage_Vp2pxAt_0202
     * @tc.desc      vp2pxAt(vp=35, density=66.02) returns 2310.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0202 begin`);
      const actual: number = vp2pxAt(35, 66.02);
      logInfo(`vp2pxAt(vp=35, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2310.7, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0203
     * @tc.name      WindowManage_Vp2pxAt_0203
     * @tc.desc      vp2pxAt(vp=35, density=-36) returns -1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0203 begin`);
      const actual: number = vp2pxAt(35, -36);
      logInfo(`vp2pxAt(vp=35, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1260);
      logInfo(`${BUNDLE}Vp2pxAt_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0204
     * @tc.name      WindowManage_Vp2pxAt_0204
     * @tc.desc      vp2pxAt(vp=40, density=65) returns 2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0204 begin`);
      const actual: number = vp2pxAt(40, 65);
      logInfo(`vp2pxAt(vp=40, density=65): actual=${actual}`);
      expect(actual).assertEqual(2600);
      logInfo(`${BUNDLE}Vp2pxAt_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0205
     * @tc.name      WindowManage_Vp2pxAt_0205
     * @tc.desc      vp2pxAt(vp=40, density=80) returns 3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0205 begin`);
      const actual: number = vp2pxAt(40, 80);
      logInfo(`vp2pxAt(vp=40, density=80): actual=${actual}`);
      expect(actual).assertEqual(3200);
      logInfo(`${BUNDLE}Vp2pxAt_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0206
     * @tc.name      WindowManage_Vp2pxAt_0206
     * @tc.desc      vp2pxAt(vp=40, density=85) returns 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0206 begin`);
      const actual: number = vp2pxAt(40, 85);
      logInfo(`vp2pxAt(vp=40, density=85): actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}Vp2pxAt_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0207
     * @tc.name      WindowManage_Vp2pxAt_0207
     * @tc.desc      vp2pxAt(vp=40, density=90) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0207 begin`);
      const actual: number = vp2pxAt(40, 90);
      logInfo(`vp2pxAt(vp=40, density=90): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}Vp2pxAt_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0208
     * @tc.name      WindowManage_Vp2pxAt_0208
     * @tc.desc      vp2pxAt(vp=40, density=95) returns 3800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0208 begin`);
      const actual: number = vp2pxAt(40, 95);
      logInfo(`vp2pxAt(vp=40, density=95): actual=${actual}`);
      expect(actual).assertEqual(3800);
      logInfo(`${BUNDLE}Vp2pxAt_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0209
     * @tc.name      WindowManage_Vp2pxAt_0209
     * @tc.desc      vp2pxAt(vp=40, density=105) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0209 begin`);
      const actual: number = vp2pxAt(40, 105);
      logInfo(`vp2pxAt(vp=40, density=105): actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}Vp2pxAt_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0210
     * @tc.name      WindowManage_Vp2pxAt_0210
     * @tc.desc      vp2pxAt(vp=40, density=110) returns 4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0210 begin`);
      const actual: number = vp2pxAt(40, 110);
      logInfo(`vp2pxAt(vp=40, density=110): actual=${actual}`);
      expect(actual).assertEqual(4400);
      logInfo(`${BUNDLE}Vp2pxAt_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0211
     * @tc.name      WindowManage_Vp2pxAt_0211
     * @tc.desc      vp2pxAt(vp=40, density=115) returns 4600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0211 begin`);
      const actual: number = vp2pxAt(40, 115);
      logInfo(`vp2pxAt(vp=40, density=115): actual=${actual}`);
      expect(actual).assertEqual(4600);
      logInfo(`${BUNDLE}Vp2pxAt_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0212
     * @tc.name      WindowManage_Vp2pxAt_0212
     * @tc.desc      vp2pxAt(vp=40, density=66.02) returns 2640.7999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0212 begin`);
      const actual: number = vp2pxAt(40, 66.02);
      logInfo(`vp2pxAt(vp=40, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2640.7999999999997, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0213
     * @tc.name      WindowManage_Vp2pxAt_0213
     * @tc.desc      vp2pxAt(vp=40, density=-36) returns -1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0213 begin`);
      const actual: number = vp2pxAt(40, -36);
      logInfo(`vp2pxAt(vp=40, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1440);
      logInfo(`${BUNDLE}Vp2pxAt_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0214
     * @tc.name      WindowManage_Vp2pxAt_0214
     * @tc.desc      vp2pxAt(vp=45, density=45) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0214 begin`);
      const actual: number = vp2pxAt(45, 45);
      logInfo(`vp2pxAt(vp=45, density=45): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}Vp2pxAt_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0215
     * @tc.name      WindowManage_Vp2pxAt_0215
     * @tc.desc      vp2pxAt(vp=45, density=55) returns 2475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0215 begin`);
      const actual: number = vp2pxAt(45, 55);
      logInfo(`vp2pxAt(vp=45, density=55): actual=${actual}`);
      expect(actual).assertEqual(2475);
      logInfo(`${BUNDLE}Vp2pxAt_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0216
     * @tc.name      WindowManage_Vp2pxAt_0216
     * @tc.desc      vp2pxAt(vp=45, density=65) returns 2925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0216 begin`);
      const actual: number = vp2pxAt(45, 65);
      logInfo(`vp2pxAt(vp=45, density=65): actual=${actual}`);
      expect(actual).assertEqual(2925);
      logInfo(`${BUNDLE}Vp2pxAt_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0217
     * @tc.name      WindowManage_Vp2pxAt_0217
     * @tc.desc      vp2pxAt(vp=45, density=75) returns 3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0217 begin`);
      const actual: number = vp2pxAt(45, 75);
      logInfo(`vp2pxAt(vp=45, density=75): actual=${actual}`);
      expect(actual).assertEqual(3375);
      logInfo(`${BUNDLE}Vp2pxAt_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0218
     * @tc.name      WindowManage_Vp2pxAt_0218
     * @tc.desc      vp2pxAt(vp=45, density=85) returns 3825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0218 begin`);
      const actual: number = vp2pxAt(45, 85);
      logInfo(`vp2pxAt(vp=45, density=85): actual=${actual}`);
      expect(actual).assertEqual(3825);
      logInfo(`${BUNDLE}Vp2pxAt_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0219
     * @tc.name      WindowManage_Vp2pxAt_0219
     * @tc.desc      vp2pxAt(vp=45, density=90) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0219 begin`);
      const actual: number = vp2pxAt(45, 90);
      logInfo(`vp2pxAt(vp=45, density=90): actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}Vp2pxAt_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0220
     * @tc.name      WindowManage_Vp2pxAt_0220
     * @tc.desc      vp2pxAt(vp=45, density=95) returns 4275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0220 begin`);
      const actual: number = vp2pxAt(45, 95);
      logInfo(`vp2pxAt(vp=45, density=95): actual=${actual}`);
      expect(actual).assertEqual(4275);
      logInfo(`${BUNDLE}Vp2pxAt_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0221
     * @tc.name      WindowManage_Vp2pxAt_0221
     * @tc.desc      vp2pxAt(vp=45, density=105) returns 4725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0221 begin`);
      const actual: number = vp2pxAt(45, 105);
      logInfo(`vp2pxAt(vp=45, density=105): actual=${actual}`);
      expect(actual).assertEqual(4725);
      logInfo(`${BUNDLE}Vp2pxAt_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0222
     * @tc.name      WindowManage_Vp2pxAt_0222
     * @tc.desc      vp2pxAt(vp=45, density=110) returns 4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0222 begin`);
      const actual: number = vp2pxAt(45, 110);
      logInfo(`vp2pxAt(vp=45, density=110): actual=${actual}`);
      expect(actual).assertEqual(4950);
      logInfo(`${BUNDLE}Vp2pxAt_0222 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0223
     * @tc.name      WindowManage_Vp2pxAt_0223
     * @tc.desc      vp2pxAt(vp=45, density=115) returns 5175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0223 begin`);
      const actual: number = vp2pxAt(45, 115);
      logInfo(`vp2pxAt(vp=45, density=115): actual=${actual}`);
      expect(actual).assertEqual(5175);
      logInfo(`${BUNDLE}Vp2pxAt_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0224
     * @tc.name      WindowManage_Vp2pxAt_0224
     * @tc.desc      vp2pxAt(vp=45, density=66.02) returns 2970.8999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0224 begin`);
      const actual: number = vp2pxAt(45, 66.02);
      logInfo(`vp2pxAt(vp=45, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2970.8999999999996, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0225
     * @tc.name      WindowManage_Vp2pxAt_0225
     * @tc.desc      vp2pxAt(vp=45, density=-36) returns -1620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0225 begin`);
      const actual: number = vp2pxAt(45, -36);
      logInfo(`vp2pxAt(vp=45, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1620);
      logInfo(`${BUNDLE}Vp2pxAt_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0226
     * @tc.name      WindowManage_Vp2pxAt_0226
     * @tc.desc      vp2pxAt(vp=50, density=65) returns 3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0226 begin`);
      const actual: number = vp2pxAt(50, 65);
      logInfo(`vp2pxAt(vp=50, density=65): actual=${actual}`);
      expect(actual).assertEqual(3250);
      logInfo(`${BUNDLE}Vp2pxAt_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0227
     * @tc.name      WindowManage_Vp2pxAt_0227
     * @tc.desc      vp2pxAt(vp=50, density=75) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0227 begin`);
      const actual: number = vp2pxAt(50, 75);
      logInfo(`vp2pxAt(vp=50, density=75): actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}Vp2pxAt_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0228
     * @tc.name      WindowManage_Vp2pxAt_0228
     * @tc.desc      vp2pxAt(vp=50, density=85) returns 4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0228 begin`);
      const actual: number = vp2pxAt(50, 85);
      logInfo(`vp2pxAt(vp=50, density=85): actual=${actual}`);
      expect(actual).assertEqual(4250);
      logInfo(`${BUNDLE}Vp2pxAt_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0229
     * @tc.name      WindowManage_Vp2pxAt_0229
     * @tc.desc      vp2pxAt(vp=50, density=95) returns 4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0229 begin`);
      const actual: number = vp2pxAt(50, 95);
      logInfo(`vp2pxAt(vp=50, density=95): actual=${actual}`);
      expect(actual).assertEqual(4750);
      logInfo(`${BUNDLE}Vp2pxAt_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0230
     * @tc.name      WindowManage_Vp2pxAt_0230
     * @tc.desc      vp2pxAt(vp=50, density=105) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0230 begin`);
      const actual: number = vp2pxAt(50, 105);
      logInfo(`vp2pxAt(vp=50, density=105): actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}Vp2pxAt_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0231
     * @tc.name      WindowManage_Vp2pxAt_0231
     * @tc.desc      vp2pxAt(vp=50, density=115) returns 5750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0231 begin`);
      const actual: number = vp2pxAt(50, 115);
      logInfo(`vp2pxAt(vp=50, density=115): actual=${actual}`);
      expect(actual).assertEqual(5750);
      logInfo(`${BUNDLE}Vp2pxAt_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0232
     * @tc.name      WindowManage_Vp2pxAt_0232
     * @tc.desc      vp2pxAt(vp=50, density=66.02) returns 3301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0232 begin`);
      const actual: number = vp2pxAt(50, 66.02);
      logInfo(`vp2pxAt(vp=50, density=66.02): actual=${actual}`);
      expect(actual).assertEqual(3301);
      logInfo(`${BUNDLE}Vp2pxAt_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0233
     * @tc.name      WindowManage_Vp2pxAt_0233
     * @tc.desc      vp2pxAt(vp=50, density=-36) returns -1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0233 begin`);
      const actual: number = vp2pxAt(50, -36);
      logInfo(`vp2pxAt(vp=50, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1800);
      logInfo(`${BUNDLE}Vp2pxAt_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0234
     * @tc.name      WindowManage_Vp2pxAt_0234
     * @tc.desc      vp2pxAt(vp=55, density=55) returns 3025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0234 begin`);
      const actual: number = vp2pxAt(55, 55);
      logInfo(`vp2pxAt(vp=55, density=55): actual=${actual}`);
      expect(actual).assertEqual(3025);
      logInfo(`${BUNDLE}Vp2pxAt_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0235
     * @tc.name      WindowManage_Vp2pxAt_0235
     * @tc.desc      vp2pxAt(vp=55, density=65) returns 3575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0235 begin`);
      const actual: number = vp2pxAt(55, 65);
      logInfo(`vp2pxAt(vp=55, density=65): actual=${actual}`);
      expect(actual).assertEqual(3575);
      logInfo(`${BUNDLE}Vp2pxAt_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0236
     * @tc.name      WindowManage_Vp2pxAt_0236
     * @tc.desc      vp2pxAt(vp=55, density=75) returns 4125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0236 begin`);
      const actual: number = vp2pxAt(55, 75);
      logInfo(`vp2pxAt(vp=55, density=75): actual=${actual}`);
      expect(actual).assertEqual(4125);
      logInfo(`${BUNDLE}Vp2pxAt_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0237
     * @tc.name      WindowManage_Vp2pxAt_0237
     * @tc.desc      vp2pxAt(vp=55, density=85) returns 4675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0237 begin`);
      const actual: number = vp2pxAt(55, 85);
      logInfo(`vp2pxAt(vp=55, density=85): actual=${actual}`);
      expect(actual).assertEqual(4675);
      logInfo(`${BUNDLE}Vp2pxAt_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0238
     * @tc.name      WindowManage_Vp2pxAt_0238
     * @tc.desc      vp2pxAt(vp=55, density=95) returns 5225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0238 begin`);
      const actual: number = vp2pxAt(55, 95);
      logInfo(`vp2pxAt(vp=55, density=95): actual=${actual}`);
      expect(actual).assertEqual(5225);
      logInfo(`${BUNDLE}Vp2pxAt_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0239
     * @tc.name      WindowManage_Vp2pxAt_0239
     * @tc.desc      vp2pxAt(vp=55, density=105) returns 5775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0239 begin`);
      const actual: number = vp2pxAt(55, 105);
      logInfo(`vp2pxAt(vp=55, density=105): actual=${actual}`);
      expect(actual).assertEqual(5775);
      logInfo(`${BUNDLE}Vp2pxAt_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0240
     * @tc.name      WindowManage_Vp2pxAt_0240
     * @tc.desc      vp2pxAt(vp=55, density=110) returns 6050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0240 begin`);
      const actual: number = vp2pxAt(55, 110);
      logInfo(`vp2pxAt(vp=55, density=110): actual=${actual}`);
      expect(actual).assertEqual(6050);
      logInfo(`${BUNDLE}Vp2pxAt_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0241
     * @tc.name      WindowManage_Vp2pxAt_0241
     * @tc.desc      vp2pxAt(vp=55, density=115) returns 6325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0241 begin`);
      const actual: number = vp2pxAt(55, 115);
      logInfo(`vp2pxAt(vp=55, density=115): actual=${actual}`);
      expect(actual).assertEqual(6325);
      logInfo(`${BUNDLE}Vp2pxAt_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0242
     * @tc.name      WindowManage_Vp2pxAt_0242
     * @tc.desc      vp2pxAt(vp=55, density=66.02) returns 3631.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0242 begin`);
      const actual: number = vp2pxAt(55, 66.02);
      logInfo(`vp2pxAt(vp=55, density=66.02): actual=${actual}`);
      expect(actual).assertClose(3631.1, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0243
     * @tc.name      WindowManage_Vp2pxAt_0243
     * @tc.desc      vp2pxAt(vp=55, density=-36) returns -1980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_Vp2pxAt_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0243 begin`);
      const actual: number = vp2pxAt(55, -36);
      logInfo(`vp2pxAt(vp=55, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1980);
      logInfo(`${BUNDLE}Vp2pxAt_0243 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_VP2PX_AT_0244
     * @tc.name      WindowManage_Vp2pxAt_0244
     * @tc.desc      vp2pxAt(vp=60, density=65) returns 3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_Vp2pxAt_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}Vp2pxAt_0244 begin`);
      const actual: number = vp2pxAt(60, 65);
      logInfo(`vp2pxAt(vp=60, density=65): actual=${actual}`);
      expect(actual).assertEqual(3900);
      logInfo(`${BUNDLE}Vp2pxAt_0244 end`);
    });
  });
}
