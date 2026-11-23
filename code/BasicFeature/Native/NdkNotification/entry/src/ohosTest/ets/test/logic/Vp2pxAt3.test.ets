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
import { vp2pxAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for vp2pxAt (96 cases). */
export default function vp2pxAt3Test(): void {
  describe('Vp2pxAt3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0193
     * @tc.name      NdkNotification_Vp2pxAt_0193
     * @tc.desc      vp2pxAt(vp=35, density=55) returns 1925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0193 begin`);
      const actual: number = vp2pxAt(35, 55);
      logInfo(`vp2pxAt(vp=35, density=55): actual=${actual}`);
      expect(actual).assertEqual(1925);
      logInfo(`${BUNDLE}Vp2pxAt_0193 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0194
     * @tc.name      NdkNotification_Vp2pxAt_0194
     * @tc.desc      vp2pxAt(vp=35, density=65) returns 2275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0194 begin`);
      const actual: number = vp2pxAt(35, 65);
      logInfo(`vp2pxAt(vp=35, density=65): actual=${actual}`);
      expect(actual).assertEqual(2275);
      logInfo(`${BUNDLE}Vp2pxAt_0194 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0195
     * @tc.name      NdkNotification_Vp2pxAt_0195
     * @tc.desc      vp2pxAt(vp=35, density=70) returns 2450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0195 begin`);
      const actual: number = vp2pxAt(35, 70);
      logInfo(`vp2pxAt(vp=35, density=70): actual=${actual}`);
      expect(actual).assertEqual(2450);
      logInfo(`${BUNDLE}Vp2pxAt_0195 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0196
     * @tc.name      NdkNotification_Vp2pxAt_0196
     * @tc.desc      vp2pxAt(vp=35, density=80) returns 2800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0196 begin`);
      const actual: number = vp2pxAt(35, 80);
      logInfo(`vp2pxAt(vp=35, density=80): actual=${actual}`);
      expect(actual).assertEqual(2800);
      logInfo(`${BUNDLE}Vp2pxAt_0196 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0197
     * @tc.name      NdkNotification_Vp2pxAt_0197
     * @tc.desc      vp2pxAt(vp=35, density=85) returns 2975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0197 begin`);
      const actual: number = vp2pxAt(35, 85);
      logInfo(`vp2pxAt(vp=35, density=85): actual=${actual}`);
      expect(actual).assertEqual(2975);
      logInfo(`${BUNDLE}Vp2pxAt_0197 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0198
     * @tc.name      NdkNotification_Vp2pxAt_0198
     * @tc.desc      vp2pxAt(vp=35, density=95) returns 3325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0198 begin`);
      const actual: number = vp2pxAt(35, 95);
      logInfo(`vp2pxAt(vp=35, density=95): actual=${actual}`);
      expect(actual).assertEqual(3325);
      logInfo(`${BUNDLE}Vp2pxAt_0198 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0199
     * @tc.name      NdkNotification_Vp2pxAt_0199
     * @tc.desc      vp2pxAt(vp=35, density=105) returns 3675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0199 begin`);
      const actual: number = vp2pxAt(35, 105);
      logInfo(`vp2pxAt(vp=35, density=105): actual=${actual}`);
      expect(actual).assertEqual(3675);
      logInfo(`${BUNDLE}Vp2pxAt_0199 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0200
     * @tc.name      NdkNotification_Vp2pxAt_0200
     * @tc.desc      vp2pxAt(vp=35, density=110) returns 3850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0200 begin`);
      const actual: number = vp2pxAt(35, 110);
      logInfo(`vp2pxAt(vp=35, density=110): actual=${actual}`);
      expect(actual).assertEqual(3850);
      logInfo(`${BUNDLE}Vp2pxAt_0200 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0201
     * @tc.name      NdkNotification_Vp2pxAt_0201
     * @tc.desc      vp2pxAt(vp=35, density=115) returns 4025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0201 begin`);
      const actual: number = vp2pxAt(35, 115);
      logInfo(`vp2pxAt(vp=35, density=115): actual=${actual}`);
      expect(actual).assertEqual(4025);
      logInfo(`${BUNDLE}Vp2pxAt_0201 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0202
     * @tc.name      NdkNotification_Vp2pxAt_0202
     * @tc.desc      vp2pxAt(vp=35, density=66.02) returns 2310.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0202 begin`);
      const actual: number = vp2pxAt(35, 66.02);
      logInfo(`vp2pxAt(vp=35, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2310.7, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0202 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0203
     * @tc.name      NdkNotification_Vp2pxAt_0203
     * @tc.desc      vp2pxAt(vp=35, density=-36) returns -1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0203 begin`);
      const actual: number = vp2pxAt(35, -36);
      logInfo(`vp2pxAt(vp=35, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1260);
      logInfo(`${BUNDLE}Vp2pxAt_0203 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0204
     * @tc.name      NdkNotification_Vp2pxAt_0204
     * @tc.desc      vp2pxAt(vp=40, density=65) returns 2600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0204 begin`);
      const actual: number = vp2pxAt(40, 65);
      logInfo(`vp2pxAt(vp=40, density=65): actual=${actual}`);
      expect(actual).assertEqual(2600);
      logInfo(`${BUNDLE}Vp2pxAt_0204 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0205
     * @tc.name      NdkNotification_Vp2pxAt_0205
     * @tc.desc      vp2pxAt(vp=40, density=80) returns 3200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0205 begin`);
      const actual: number = vp2pxAt(40, 80);
      logInfo(`vp2pxAt(vp=40, density=80): actual=${actual}`);
      expect(actual).assertEqual(3200);
      logInfo(`${BUNDLE}Vp2pxAt_0205 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0206
     * @tc.name      NdkNotification_Vp2pxAt_0206
     * @tc.desc      vp2pxAt(vp=40, density=85) returns 3400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0206 begin`);
      const actual: number = vp2pxAt(40, 85);
      logInfo(`vp2pxAt(vp=40, density=85): actual=${actual}`);
      expect(actual).assertEqual(3400);
      logInfo(`${BUNDLE}Vp2pxAt_0206 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0207
     * @tc.name      NdkNotification_Vp2pxAt_0207
     * @tc.desc      vp2pxAt(vp=40, density=90) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0207 begin`);
      const actual: number = vp2pxAt(40, 90);
      logInfo(`vp2pxAt(vp=40, density=90): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}Vp2pxAt_0207 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0208
     * @tc.name      NdkNotification_Vp2pxAt_0208
     * @tc.desc      vp2pxAt(vp=40, density=95) returns 3800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0208 begin`);
      const actual: number = vp2pxAt(40, 95);
      logInfo(`vp2pxAt(vp=40, density=95): actual=${actual}`);
      expect(actual).assertEqual(3800);
      logInfo(`${BUNDLE}Vp2pxAt_0208 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0209
     * @tc.name      NdkNotification_Vp2pxAt_0209
     * @tc.desc      vp2pxAt(vp=40, density=105) returns 4200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0209 begin`);
      const actual: number = vp2pxAt(40, 105);
      logInfo(`vp2pxAt(vp=40, density=105): actual=${actual}`);
      expect(actual).assertEqual(4200);
      logInfo(`${BUNDLE}Vp2pxAt_0209 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0210
     * @tc.name      NdkNotification_Vp2pxAt_0210
     * @tc.desc      vp2pxAt(vp=40, density=110) returns 4400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0210 begin`);
      const actual: number = vp2pxAt(40, 110);
      logInfo(`vp2pxAt(vp=40, density=110): actual=${actual}`);
      expect(actual).assertEqual(4400);
      logInfo(`${BUNDLE}Vp2pxAt_0210 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0211
     * @tc.name      NdkNotification_Vp2pxAt_0211
     * @tc.desc      vp2pxAt(vp=40, density=115) returns 4600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0211 begin`);
      const actual: number = vp2pxAt(40, 115);
      logInfo(`vp2pxAt(vp=40, density=115): actual=${actual}`);
      expect(actual).assertEqual(4600);
      logInfo(`${BUNDLE}Vp2pxAt_0211 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0212
     * @tc.name      NdkNotification_Vp2pxAt_0212
     * @tc.desc      vp2pxAt(vp=40, density=66.02) returns 2640.7999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0212 begin`);
      const actual: number = vp2pxAt(40, 66.02);
      logInfo(`vp2pxAt(vp=40, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2640.7999999999997, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0212 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0213
     * @tc.name      NdkNotification_Vp2pxAt_0213
     * @tc.desc      vp2pxAt(vp=40, density=-36) returns -1440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0213 begin`);
      const actual: number = vp2pxAt(40, -36);
      logInfo(`vp2pxAt(vp=40, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1440);
      logInfo(`${BUNDLE}Vp2pxAt_0213 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0214
     * @tc.name      NdkNotification_Vp2pxAt_0214
     * @tc.desc      vp2pxAt(vp=45, density=45) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0214 begin`);
      const actual: number = vp2pxAt(45, 45);
      logInfo(`vp2pxAt(vp=45, density=45): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}Vp2pxAt_0214 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0215
     * @tc.name      NdkNotification_Vp2pxAt_0215
     * @tc.desc      vp2pxAt(vp=45, density=55) returns 2475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0215 begin`);
      const actual: number = vp2pxAt(45, 55);
      logInfo(`vp2pxAt(vp=45, density=55): actual=${actual}`);
      expect(actual).assertEqual(2475);
      logInfo(`${BUNDLE}Vp2pxAt_0215 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0216
     * @tc.name      NdkNotification_Vp2pxAt_0216
     * @tc.desc      vp2pxAt(vp=45, density=65) returns 2925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0216 begin`);
      const actual: number = vp2pxAt(45, 65);
      logInfo(`vp2pxAt(vp=45, density=65): actual=${actual}`);
      expect(actual).assertEqual(2925);
      logInfo(`${BUNDLE}Vp2pxAt_0216 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0217
     * @tc.name      NdkNotification_Vp2pxAt_0217
     * @tc.desc      vp2pxAt(vp=45, density=75) returns 3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0217 begin`);
      const actual: number = vp2pxAt(45, 75);
      logInfo(`vp2pxAt(vp=45, density=75): actual=${actual}`);
      expect(actual).assertEqual(3375);
      logInfo(`${BUNDLE}Vp2pxAt_0217 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0218
     * @tc.name      NdkNotification_Vp2pxAt_0218
     * @tc.desc      vp2pxAt(vp=45, density=85) returns 3825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0218 begin`);
      const actual: number = vp2pxAt(45, 85);
      logInfo(`vp2pxAt(vp=45, density=85): actual=${actual}`);
      expect(actual).assertEqual(3825);
      logInfo(`${BUNDLE}Vp2pxAt_0218 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0219
     * @tc.name      NdkNotification_Vp2pxAt_0219
     * @tc.desc      vp2pxAt(vp=45, density=90) returns 4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0219 begin`);
      const actual: number = vp2pxAt(45, 90);
      logInfo(`vp2pxAt(vp=45, density=90): actual=${actual}`);
      expect(actual).assertEqual(4050);
      logInfo(`${BUNDLE}Vp2pxAt_0219 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0220
     * @tc.name      NdkNotification_Vp2pxAt_0220
     * @tc.desc      vp2pxAt(vp=45, density=95) returns 4275
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0220 begin`);
      const actual: number = vp2pxAt(45, 95);
      logInfo(`vp2pxAt(vp=45, density=95): actual=${actual}`);
      expect(actual).assertEqual(4275);
      logInfo(`${BUNDLE}Vp2pxAt_0220 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0221
     * @tc.name      NdkNotification_Vp2pxAt_0221
     * @tc.desc      vp2pxAt(vp=45, density=105) returns 4725
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0221 begin`);
      const actual: number = vp2pxAt(45, 105);
      logInfo(`vp2pxAt(vp=45, density=105): actual=${actual}`);
      expect(actual).assertEqual(4725);
      logInfo(`${BUNDLE}Vp2pxAt_0221 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0222
     * @tc.name      NdkNotification_Vp2pxAt_0222
     * @tc.desc      vp2pxAt(vp=45, density=110) returns 4950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0222 begin`);
      const actual: number = vp2pxAt(45, 110);
      logInfo(`vp2pxAt(vp=45, density=110): actual=${actual}`);
      expect(actual).assertEqual(4950);
      logInfo(`${BUNDLE}Vp2pxAt_0222 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0223
     * @tc.name      NdkNotification_Vp2pxAt_0223
     * @tc.desc      vp2pxAt(vp=45, density=115) returns 5175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0223 begin`);
      const actual: number = vp2pxAt(45, 115);
      logInfo(`vp2pxAt(vp=45, density=115): actual=${actual}`);
      expect(actual).assertEqual(5175);
      logInfo(`${BUNDLE}Vp2pxAt_0223 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0224
     * @tc.name      NdkNotification_Vp2pxAt_0224
     * @tc.desc      vp2pxAt(vp=45, density=66.02) returns 2970.8999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0224 begin`);
      const actual: number = vp2pxAt(45, 66.02);
      logInfo(`vp2pxAt(vp=45, density=66.02): actual=${actual}`);
      expect(actual).assertClose(2970.8999999999996, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0224 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0225
     * @tc.name      NdkNotification_Vp2pxAt_0225
     * @tc.desc      vp2pxAt(vp=45, density=-36) returns -1620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0225 begin`);
      const actual: number = vp2pxAt(45, -36);
      logInfo(`vp2pxAt(vp=45, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1620);
      logInfo(`${BUNDLE}Vp2pxAt_0225 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0226
     * @tc.name      NdkNotification_Vp2pxAt_0226
     * @tc.desc      vp2pxAt(vp=50, density=65) returns 3250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0226 begin`);
      const actual: number = vp2pxAt(50, 65);
      logInfo(`vp2pxAt(vp=50, density=65): actual=${actual}`);
      expect(actual).assertEqual(3250);
      logInfo(`${BUNDLE}Vp2pxAt_0226 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0227
     * @tc.name      NdkNotification_Vp2pxAt_0227
     * @tc.desc      vp2pxAt(vp=50, density=75) returns 3750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0227 begin`);
      const actual: number = vp2pxAt(50, 75);
      logInfo(`vp2pxAt(vp=50, density=75): actual=${actual}`);
      expect(actual).assertEqual(3750);
      logInfo(`${BUNDLE}Vp2pxAt_0227 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0228
     * @tc.name      NdkNotification_Vp2pxAt_0228
     * @tc.desc      vp2pxAt(vp=50, density=85) returns 4250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0228 begin`);
      const actual: number = vp2pxAt(50, 85);
      logInfo(`vp2pxAt(vp=50, density=85): actual=${actual}`);
      expect(actual).assertEqual(4250);
      logInfo(`${BUNDLE}Vp2pxAt_0228 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0229
     * @tc.name      NdkNotification_Vp2pxAt_0229
     * @tc.desc      vp2pxAt(vp=50, density=95) returns 4750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0229 begin`);
      const actual: number = vp2pxAt(50, 95);
      logInfo(`vp2pxAt(vp=50, density=95): actual=${actual}`);
      expect(actual).assertEqual(4750);
      logInfo(`${BUNDLE}Vp2pxAt_0229 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0230
     * @tc.name      NdkNotification_Vp2pxAt_0230
     * @tc.desc      vp2pxAt(vp=50, density=105) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0230 begin`);
      const actual: number = vp2pxAt(50, 105);
      logInfo(`vp2pxAt(vp=50, density=105): actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}Vp2pxAt_0230 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0231
     * @tc.name      NdkNotification_Vp2pxAt_0231
     * @tc.desc      vp2pxAt(vp=50, density=115) returns 5750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0231 begin`);
      const actual: number = vp2pxAt(50, 115);
      logInfo(`vp2pxAt(vp=50, density=115): actual=${actual}`);
      expect(actual).assertEqual(5750);
      logInfo(`${BUNDLE}Vp2pxAt_0231 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0232
     * @tc.name      NdkNotification_Vp2pxAt_0232
     * @tc.desc      vp2pxAt(vp=50, density=66.02) returns 3301
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0232 begin`);
      const actual: number = vp2pxAt(50, 66.02);
      logInfo(`vp2pxAt(vp=50, density=66.02): actual=${actual}`);
      expect(actual).assertEqual(3301);
      logInfo(`${BUNDLE}Vp2pxAt_0232 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0233
     * @tc.name      NdkNotification_Vp2pxAt_0233
     * @tc.desc      vp2pxAt(vp=50, density=-36) returns -1800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0233 begin`);
      const actual: number = vp2pxAt(50, -36);
      logInfo(`vp2pxAt(vp=50, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1800);
      logInfo(`${BUNDLE}Vp2pxAt_0233 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0234
     * @tc.name      NdkNotification_Vp2pxAt_0234
     * @tc.desc      vp2pxAt(vp=55, density=55) returns 3025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0234 begin`);
      const actual: number = vp2pxAt(55, 55);
      logInfo(`vp2pxAt(vp=55, density=55): actual=${actual}`);
      expect(actual).assertEqual(3025);
      logInfo(`${BUNDLE}Vp2pxAt_0234 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0235
     * @tc.name      NdkNotification_Vp2pxAt_0235
     * @tc.desc      vp2pxAt(vp=55, density=65) returns 3575
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0235 begin`);
      const actual: number = vp2pxAt(55, 65);
      logInfo(`vp2pxAt(vp=55, density=65): actual=${actual}`);
      expect(actual).assertEqual(3575);
      logInfo(`${BUNDLE}Vp2pxAt_0235 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0236
     * @tc.name      NdkNotification_Vp2pxAt_0236
     * @tc.desc      vp2pxAt(vp=55, density=75) returns 4125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0236 begin`);
      const actual: number = vp2pxAt(55, 75);
      logInfo(`vp2pxAt(vp=55, density=75): actual=${actual}`);
      expect(actual).assertEqual(4125);
      logInfo(`${BUNDLE}Vp2pxAt_0236 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0237
     * @tc.name      NdkNotification_Vp2pxAt_0237
     * @tc.desc      vp2pxAt(vp=55, density=85) returns 4675
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0237 begin`);
      const actual: number = vp2pxAt(55, 85);
      logInfo(`vp2pxAt(vp=55, density=85): actual=${actual}`);
      expect(actual).assertEqual(4675);
      logInfo(`${BUNDLE}Vp2pxAt_0237 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0238
     * @tc.name      NdkNotification_Vp2pxAt_0238
     * @tc.desc      vp2pxAt(vp=55, density=95) returns 5225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0238 begin`);
      const actual: number = vp2pxAt(55, 95);
      logInfo(`vp2pxAt(vp=55, density=95): actual=${actual}`);
      expect(actual).assertEqual(5225);
      logInfo(`${BUNDLE}Vp2pxAt_0238 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0239
     * @tc.name      NdkNotification_Vp2pxAt_0239
     * @tc.desc      vp2pxAt(vp=55, density=105) returns 5775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0239 begin`);
      const actual: number = vp2pxAt(55, 105);
      logInfo(`vp2pxAt(vp=55, density=105): actual=${actual}`);
      expect(actual).assertEqual(5775);
      logInfo(`${BUNDLE}Vp2pxAt_0239 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0240
     * @tc.name      NdkNotification_Vp2pxAt_0240
     * @tc.desc      vp2pxAt(vp=55, density=110) returns 6050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0240 begin`);
      const actual: number = vp2pxAt(55, 110);
      logInfo(`vp2pxAt(vp=55, density=110): actual=${actual}`);
      expect(actual).assertEqual(6050);
      logInfo(`${BUNDLE}Vp2pxAt_0240 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0241
     * @tc.name      NdkNotification_Vp2pxAt_0241
     * @tc.desc      vp2pxAt(vp=55, density=115) returns 6325
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0241 begin`);
      const actual: number = vp2pxAt(55, 115);
      logInfo(`vp2pxAt(vp=55, density=115): actual=${actual}`);
      expect(actual).assertEqual(6325);
      logInfo(`${BUNDLE}Vp2pxAt_0241 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0242
     * @tc.name      NdkNotification_Vp2pxAt_0242
     * @tc.desc      vp2pxAt(vp=55, density=66.02) returns 3631.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0242 begin`);
      const actual: number = vp2pxAt(55, 66.02);
      logInfo(`vp2pxAt(vp=55, density=66.02): actual=${actual}`);
      expect(actual).assertClose(3631.1, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0242 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0243
     * @tc.name      NdkNotification_Vp2pxAt_0243
     * @tc.desc      vp2pxAt(vp=55, density=-36) returns -1980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0243 begin`);
      const actual: number = vp2pxAt(55, -36);
      logInfo(`vp2pxAt(vp=55, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-1980);
      logInfo(`${BUNDLE}Vp2pxAt_0243 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0244
     * @tc.name      NdkNotification_Vp2pxAt_0244
     * @tc.desc      vp2pxAt(vp=60, density=65) returns 3900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0244 begin`);
      const actual: number = vp2pxAt(60, 65);
      logInfo(`vp2pxAt(vp=60, density=65): actual=${actual}`);
      expect(actual).assertEqual(3900);
      logInfo(`${BUNDLE}Vp2pxAt_0244 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0245
     * @tc.name      NdkNotification_Vp2pxAt_0245
     * @tc.desc      vp2pxAt(vp=60, density=80) returns 4800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0245 begin`);
      const actual: number = vp2pxAt(60, 80);
      logInfo(`vp2pxAt(vp=60, density=80): actual=${actual}`);
      expect(actual).assertEqual(4800);
      logInfo(`${BUNDLE}Vp2pxAt_0245 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0246
     * @tc.name      NdkNotification_Vp2pxAt_0246
     * @tc.desc      vp2pxAt(vp=60, density=85) returns 5100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0246 begin`);
      const actual: number = vp2pxAt(60, 85);
      logInfo(`vp2pxAt(vp=60, density=85): actual=${actual}`);
      expect(actual).assertEqual(5100);
      logInfo(`${BUNDLE}Vp2pxAt_0246 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0247
     * @tc.name      NdkNotification_Vp2pxAt_0247
     * @tc.desc      vp2pxAt(vp=60, density=90) returns 5400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0247 begin`);
      const actual: number = vp2pxAt(60, 90);
      logInfo(`vp2pxAt(vp=60, density=90): actual=${actual}`);
      expect(actual).assertEqual(5400);
      logInfo(`${BUNDLE}Vp2pxAt_0247 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0248
     * @tc.name      NdkNotification_Vp2pxAt_0248
     * @tc.desc      vp2pxAt(vp=60, density=95) returns 5700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0248 begin`);
      const actual: number = vp2pxAt(60, 95);
      logInfo(`vp2pxAt(vp=60, density=95): actual=${actual}`);
      expect(actual).assertEqual(5700);
      logInfo(`${BUNDLE}Vp2pxAt_0248 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0249
     * @tc.name      NdkNotification_Vp2pxAt_0249
     * @tc.desc      vp2pxAt(vp=60, density=105) returns 6300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0249 begin`);
      const actual: number = vp2pxAt(60, 105);
      logInfo(`vp2pxAt(vp=60, density=105): actual=${actual}`);
      expect(actual).assertEqual(6300);
      logInfo(`${BUNDLE}Vp2pxAt_0249 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0250
     * @tc.name      NdkNotification_Vp2pxAt_0250
     * @tc.desc      vp2pxAt(vp=60, density=110) returns 6600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0250 begin`);
      const actual: number = vp2pxAt(60, 110);
      logInfo(`vp2pxAt(vp=60, density=110): actual=${actual}`);
      expect(actual).assertEqual(6600);
      logInfo(`${BUNDLE}Vp2pxAt_0250 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0251
     * @tc.name      NdkNotification_Vp2pxAt_0251
     * @tc.desc      vp2pxAt(vp=60, density=115) returns 6900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0251 begin`);
      const actual: number = vp2pxAt(60, 115);
      logInfo(`vp2pxAt(vp=60, density=115): actual=${actual}`);
      expect(actual).assertEqual(6900);
      logInfo(`${BUNDLE}Vp2pxAt_0251 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0252
     * @tc.name      NdkNotification_Vp2pxAt_0252
     * @tc.desc      vp2pxAt(vp=60, density=66.02) returns 3961.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0252 begin`);
      const actual: number = vp2pxAt(60, 66.02);
      logInfo(`vp2pxAt(vp=60, density=66.02): actual=${actual}`);
      expect(actual).assertClose(3961.2, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0252 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0253
     * @tc.name      NdkNotification_Vp2pxAt_0253
     * @tc.desc      vp2pxAt(vp=60, density=-36) returns -2160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0253 begin`);
      const actual: number = vp2pxAt(60, -36);
      logInfo(`vp2pxAt(vp=60, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-2160);
      logInfo(`${BUNDLE}Vp2pxAt_0253 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0254
     * @tc.name      NdkNotification_Vp2pxAt_0254
     * @tc.desc      vp2pxAt(vp=65, density=65) returns 4225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0254 begin`);
      const actual: number = vp2pxAt(65, 65);
      logInfo(`vp2pxAt(vp=65, density=65): actual=${actual}`);
      expect(actual).assertEqual(4225);
      logInfo(`${BUNDLE}Vp2pxAt_0254 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0255
     * @tc.name      NdkNotification_Vp2pxAt_0255
     * @tc.desc      vp2pxAt(vp=65, density=70) returns 4550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0255 begin`);
      const actual: number = vp2pxAt(65, 70);
      logInfo(`vp2pxAt(vp=65, density=70): actual=${actual}`);
      expect(actual).assertEqual(4550);
      logInfo(`${BUNDLE}Vp2pxAt_0255 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0256
     * @tc.name      NdkNotification_Vp2pxAt_0256
     * @tc.desc      vp2pxAt(vp=65, density=75) returns 4875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0256 begin`);
      const actual: number = vp2pxAt(65, 75);
      logInfo(`vp2pxAt(vp=65, density=75): actual=${actual}`);
      expect(actual).assertEqual(4875);
      logInfo(`${BUNDLE}Vp2pxAt_0256 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0257
     * @tc.name      NdkNotification_Vp2pxAt_0257
     * @tc.desc      vp2pxAt(vp=65, density=80) returns 5200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0257 begin`);
      const actual: number = vp2pxAt(65, 80);
      logInfo(`vp2pxAt(vp=65, density=80): actual=${actual}`);
      expect(actual).assertEqual(5200);
      logInfo(`${BUNDLE}Vp2pxAt_0257 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0258
     * @tc.name      NdkNotification_Vp2pxAt_0258
     * @tc.desc      vp2pxAt(vp=65, density=85) returns 5525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0258 begin`);
      const actual: number = vp2pxAt(65, 85);
      logInfo(`vp2pxAt(vp=65, density=85): actual=${actual}`);
      expect(actual).assertEqual(5525);
      logInfo(`${BUNDLE}Vp2pxAt_0258 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0259
     * @tc.name      NdkNotification_Vp2pxAt_0259
     * @tc.desc      vp2pxAt(vp=65, density=90) returns 5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0259 begin`);
      const actual: number = vp2pxAt(65, 90);
      logInfo(`vp2pxAt(vp=65, density=90): actual=${actual}`);
      expect(actual).assertEqual(5850);
      logInfo(`${BUNDLE}Vp2pxAt_0259 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0260
     * @tc.name      NdkNotification_Vp2pxAt_0260
     * @tc.desc      vp2pxAt(vp=65, density=95) returns 6175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0260 begin`);
      const actual: number = vp2pxAt(65, 95);
      logInfo(`vp2pxAt(vp=65, density=95): actual=${actual}`);
      expect(actual).assertEqual(6175);
      logInfo(`${BUNDLE}Vp2pxAt_0260 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0261
     * @tc.name      NdkNotification_Vp2pxAt_0261
     * @tc.desc      vp2pxAt(vp=65, density=105) returns 6825
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0261 begin`);
      const actual: number = vp2pxAt(65, 105);
      logInfo(`vp2pxAt(vp=65, density=105): actual=${actual}`);
      expect(actual).assertEqual(6825);
      logInfo(`${BUNDLE}Vp2pxAt_0261 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0262
     * @tc.name      NdkNotification_Vp2pxAt_0262
     * @tc.desc      vp2pxAt(vp=65, density=110) returns 7150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0262 begin`);
      const actual: number = vp2pxAt(65, 110);
      logInfo(`vp2pxAt(vp=65, density=110): actual=${actual}`);
      expect(actual).assertEqual(7150);
      logInfo(`${BUNDLE}Vp2pxAt_0262 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0263
     * @tc.name      NdkNotification_Vp2pxAt_0263
     * @tc.desc      vp2pxAt(vp=65, density=115) returns 7475
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0263 begin`);
      const actual: number = vp2pxAt(65, 115);
      logInfo(`vp2pxAt(vp=65, density=115): actual=${actual}`);
      expect(actual).assertEqual(7475);
      logInfo(`${BUNDLE}Vp2pxAt_0263 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0264
     * @tc.name      NdkNotification_Vp2pxAt_0264
     * @tc.desc      vp2pxAt(vp=65, density=66.02) returns 4291.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0264 begin`);
      const actual: number = vp2pxAt(65, 66.02);
      logInfo(`vp2pxAt(vp=65, density=66.02): actual=${actual}`);
      expect(actual).assertClose(4291.3, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0264 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0265
     * @tc.name      NdkNotification_Vp2pxAt_0265
     * @tc.desc      vp2pxAt(vp=65, density=-36) returns -2340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0265 begin`);
      const actual: number = vp2pxAt(65, -36);
      logInfo(`vp2pxAt(vp=65, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-2340);
      logInfo(`${BUNDLE}Vp2pxAt_0265 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0266
     * @tc.name      NdkNotification_Vp2pxAt_0266
     * @tc.desc      vp2pxAt(vp=70, density=70) returns 4900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0266 begin`);
      const actual: number = vp2pxAt(70, 70);
      logInfo(`vp2pxAt(vp=70, density=70): actual=${actual}`);
      expect(actual).assertEqual(4900);
      logInfo(`${BUNDLE}Vp2pxAt_0266 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0267
     * @tc.name      NdkNotification_Vp2pxAt_0267
     * @tc.desc      vp2pxAt(vp=70, density=80) returns 5600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0267 begin`);
      const actual: number = vp2pxAt(70, 80);
      logInfo(`vp2pxAt(vp=70, density=80): actual=${actual}`);
      expect(actual).assertEqual(5600);
      logInfo(`${BUNDLE}Vp2pxAt_0267 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0268
     * @tc.name      NdkNotification_Vp2pxAt_0268
     * @tc.desc      vp2pxAt(vp=70, density=85) returns 5950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0268 begin`);
      const actual: number = vp2pxAt(70, 85);
      logInfo(`vp2pxAt(vp=70, density=85): actual=${actual}`);
      expect(actual).assertEqual(5950);
      logInfo(`${BUNDLE}Vp2pxAt_0268 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0269
     * @tc.name      NdkNotification_Vp2pxAt_0269
     * @tc.desc      vp2pxAt(vp=70, density=95) returns 6650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0269 begin`);
      const actual: number = vp2pxAt(70, 95);
      logInfo(`vp2pxAt(vp=70, density=95): actual=${actual}`);
      expect(actual).assertEqual(6650);
      logInfo(`${BUNDLE}Vp2pxAt_0269 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0270
     * @tc.name      NdkNotification_Vp2pxAt_0270
     * @tc.desc      vp2pxAt(vp=70, density=105) returns 7350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0270 begin`);
      const actual: number = vp2pxAt(70, 105);
      logInfo(`vp2pxAt(vp=70, density=105): actual=${actual}`);
      expect(actual).assertEqual(7350);
      logInfo(`${BUNDLE}Vp2pxAt_0270 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0271
     * @tc.name      NdkNotification_Vp2pxAt_0271
     * @tc.desc      vp2pxAt(vp=70, density=110) returns 7700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0271 begin`);
      const actual: number = vp2pxAt(70, 110);
      logInfo(`vp2pxAt(vp=70, density=110): actual=${actual}`);
      expect(actual).assertEqual(7700);
      logInfo(`${BUNDLE}Vp2pxAt_0271 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0272
     * @tc.name      NdkNotification_Vp2pxAt_0272
     * @tc.desc      vp2pxAt(vp=70, density=115) returns 8050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0272 begin`);
      const actual: number = vp2pxAt(70, 115);
      logInfo(`vp2pxAt(vp=70, density=115): actual=${actual}`);
      expect(actual).assertEqual(8050);
      logInfo(`${BUNDLE}Vp2pxAt_0272 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0273
     * @tc.name      NdkNotification_Vp2pxAt_0273
     * @tc.desc      vp2pxAt(vp=70, density=66.02) returns 4621.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0273 begin`);
      const actual: number = vp2pxAt(70, 66.02);
      logInfo(`vp2pxAt(vp=70, density=66.02): actual=${actual}`);
      expect(actual).assertClose(4621.4, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0273 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0274
     * @tc.name      NdkNotification_Vp2pxAt_0274
     * @tc.desc      vp2pxAt(vp=70, density=-36) returns -2520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0274 begin`);
      const actual: number = vp2pxAt(70, -36);
      logInfo(`vp2pxAt(vp=70, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-2520);
      logInfo(`${BUNDLE}Vp2pxAt_0274 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0275
     * @tc.name      NdkNotification_Vp2pxAt_0275
     * @tc.desc      vp2pxAt(vp=75, density=75) returns 5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0275 begin`);
      const actual: number = vp2pxAt(75, 75);
      logInfo(`vp2pxAt(vp=75, density=75): actual=${actual}`);
      expect(actual).assertEqual(5625);
      logInfo(`${BUNDLE}Vp2pxAt_0275 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0276
     * @tc.name      NdkNotification_Vp2pxAt_0276
     * @tc.desc      vp2pxAt(vp=75, density=85) returns 6375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0276 begin`);
      const actual: number = vp2pxAt(75, 85);
      logInfo(`vp2pxAt(vp=75, density=85): actual=${actual}`);
      expect(actual).assertEqual(6375);
      logInfo(`${BUNDLE}Vp2pxAt_0276 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0277
     * @tc.name      NdkNotification_Vp2pxAt_0277
     * @tc.desc      vp2pxAt(vp=75, density=90) returns 6750
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0277 begin`);
      const actual: number = vp2pxAt(75, 90);
      logInfo(`vp2pxAt(vp=75, density=90): actual=${actual}`);
      expect(actual).assertEqual(6750);
      logInfo(`${BUNDLE}Vp2pxAt_0277 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0278
     * @tc.name      NdkNotification_Vp2pxAt_0278
     * @tc.desc      vp2pxAt(vp=75, density=95) returns 7125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0278 begin`);
      const actual: number = vp2pxAt(75, 95);
      logInfo(`vp2pxAt(vp=75, density=95): actual=${actual}`);
      expect(actual).assertEqual(7125);
      logInfo(`${BUNDLE}Vp2pxAt_0278 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0279
     * @tc.name      NdkNotification_Vp2pxAt_0279
     * @tc.desc      vp2pxAt(vp=75, density=105) returns 7875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0279 begin`);
      const actual: number = vp2pxAt(75, 105);
      logInfo(`vp2pxAt(vp=75, density=105): actual=${actual}`);
      expect(actual).assertEqual(7875);
      logInfo(`${BUNDLE}Vp2pxAt_0279 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0280
     * @tc.name      NdkNotification_Vp2pxAt_0280
     * @tc.desc      vp2pxAt(vp=75, density=110) returns 8250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0280 begin`);
      const actual: number = vp2pxAt(75, 110);
      logInfo(`vp2pxAt(vp=75, density=110): actual=${actual}`);
      expect(actual).assertEqual(8250);
      logInfo(`${BUNDLE}Vp2pxAt_0280 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0281
     * @tc.name      NdkNotification_Vp2pxAt_0281
     * @tc.desc      vp2pxAt(vp=75, density=115) returns 8625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0281 begin`);
      const actual: number = vp2pxAt(75, 115);
      logInfo(`vp2pxAt(vp=75, density=115): actual=${actual}`);
      expect(actual).assertEqual(8625);
      logInfo(`${BUNDLE}Vp2pxAt_0281 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0282
     * @tc.name      NdkNotification_Vp2pxAt_0282
     * @tc.desc      vp2pxAt(vp=75, density=66.02) returns 4951.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0282 begin`);
      const actual: number = vp2pxAt(75, 66.02);
      logInfo(`vp2pxAt(vp=75, density=66.02): actual=${actual}`);
      expect(actual).assertClose(4951.5, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0282 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0283
     * @tc.name      NdkNotification_Vp2pxAt_0283
     * @tc.desc      vp2pxAt(vp=75, density=-36) returns -2700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0283 begin`);
      const actual: number = vp2pxAt(75, -36);
      logInfo(`vp2pxAt(vp=75, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-2700);
      logInfo(`${BUNDLE}Vp2pxAt_0283 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0284
     * @tc.name      NdkNotification_Vp2pxAt_0284
     * @tc.desc      vp2pxAt(vp=80, density=80) returns 6400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0284 begin`);
      const actual: number = vp2pxAt(80, 80);
      logInfo(`vp2pxAt(vp=80, density=80): actual=${actual}`);
      expect(actual).assertEqual(6400);
      logInfo(`${BUNDLE}Vp2pxAt_0284 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0285
     * @tc.name      NdkNotification_Vp2pxAt_0285
     * @tc.desc      vp2pxAt(vp=80, density=85) returns 6800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0285 begin`);
      const actual: number = vp2pxAt(80, 85);
      logInfo(`vp2pxAt(vp=80, density=85): actual=${actual}`);
      expect(actual).assertEqual(6800);
      logInfo(`${BUNDLE}Vp2pxAt_0285 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0286
     * @tc.name      NdkNotification_Vp2pxAt_0286
     * @tc.desc      vp2pxAt(vp=80, density=90) returns 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0286 begin`);
      const actual: number = vp2pxAt(80, 90);
      logInfo(`vp2pxAt(vp=80, density=90): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}Vp2pxAt_0286 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0287
     * @tc.name      NdkNotification_Vp2pxAt_0287
     * @tc.desc      vp2pxAt(vp=80, density=95) returns 7600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0287 begin`);
      const actual: number = vp2pxAt(80, 95);
      logInfo(`vp2pxAt(vp=80, density=95): actual=${actual}`);
      expect(actual).assertEqual(7600);
      logInfo(`${BUNDLE}Vp2pxAt_0287 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0288
     * @tc.name      NdkNotification_Vp2pxAt_0288
     * @tc.desc      vp2pxAt(vp=80, density=105) returns 8400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0288 begin`);
      const actual: number = vp2pxAt(80, 105);
      logInfo(`vp2pxAt(vp=80, density=105): actual=${actual}`);
      expect(actual).assertEqual(8400);
      logInfo(`${BUNDLE}Vp2pxAt_0288 end`);
    });
  });
}
