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

/** Logic checks for vp2pxAt (11 cases). */
export default function vp2pxAt4Test(): void {
  describe('Vp2pxAt4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0289
     * @tc.name      NdkNotification_Vp2pxAt_0289
     * @tc.desc      vp2pxAt(vp=80, density=110) returns 8800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0289 begin`);
      const actual: number = vp2pxAt(80, 110);
      logInfo(`vp2pxAt(vp=80, density=110): actual=${actual}`);
      expect(actual).assertEqual(8800);
      logInfo(`${BUNDLE}Vp2pxAt_0289 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0290
     * @tc.name      NdkNotification_Vp2pxAt_0290
     * @tc.desc      vp2pxAt(vp=80, density=115) returns 9200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0290 begin`);
      const actual: number = vp2pxAt(80, 115);
      logInfo(`vp2pxAt(vp=80, density=115): actual=${actual}`);
      expect(actual).assertEqual(9200);
      logInfo(`${BUNDLE}Vp2pxAt_0290 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0291
     * @tc.name      NdkNotification_Vp2pxAt_0291
     * @tc.desc      vp2pxAt(vp=80, density=66.02) returns 5281.599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0291 begin`);
      const actual: number = vp2pxAt(80, 66.02);
      logInfo(`vp2pxAt(vp=80, density=66.02): actual=${actual}`);
      expect(actual).assertClose(5281.599999999999, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0291 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0292
     * @tc.name      NdkNotification_Vp2pxAt_0292
     * @tc.desc      vp2pxAt(vp=80, density=-36) returns -2880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NdkNotification_Vp2pxAt_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0292 begin`);
      const actual: number = vp2pxAt(80, -36);
      logInfo(`vp2pxAt(vp=80, density=-36): actual=${actual}`);
      expect(actual).assertEqual(-2880);
      logInfo(`${BUNDLE}Vp2pxAt_0292 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0293
     * @tc.name      NdkNotification_Vp2pxAt_0293
     * @tc.desc      vp2pxAt(vp=85, density=85) returns 7225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0293 begin`);
      const actual: number = vp2pxAt(85, 85);
      logInfo(`vp2pxAt(vp=85, density=85): actual=${actual}`);
      expect(actual).assertEqual(7225);
      logInfo(`${BUNDLE}Vp2pxAt_0293 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0294
     * @tc.name      NdkNotification_Vp2pxAt_0294
     * @tc.desc      vp2pxAt(vp=85, density=90) returns 7650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0294 begin`);
      const actual: number = vp2pxAt(85, 90);
      logInfo(`vp2pxAt(vp=85, density=90): actual=${actual}`);
      expect(actual).assertEqual(7650);
      logInfo(`${BUNDLE}Vp2pxAt_0294 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0295
     * @tc.name      NdkNotification_Vp2pxAt_0295
     * @tc.desc      vp2pxAt(vp=85, density=95) returns 8075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0295 begin`);
      const actual: number = vp2pxAt(85, 95);
      logInfo(`vp2pxAt(vp=85, density=95): actual=${actual}`);
      expect(actual).assertEqual(8075);
      logInfo(`${BUNDLE}Vp2pxAt_0295 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0296
     * @tc.name      NdkNotification_Vp2pxAt_0296
     * @tc.desc      vp2pxAt(vp=85, density=105) returns 8925
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0296 begin`);
      const actual: number = vp2pxAt(85, 105);
      logInfo(`vp2pxAt(vp=85, density=105): actual=${actual}`);
      expect(actual).assertEqual(8925);
      logInfo(`${BUNDLE}Vp2pxAt_0296 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0297
     * @tc.name      NdkNotification_Vp2pxAt_0297
     * @tc.desc      vp2pxAt(vp=85, density=110) returns 9350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0297 begin`);
      const actual: number = vp2pxAt(85, 110);
      logInfo(`vp2pxAt(vp=85, density=110): actual=${actual}`);
      expect(actual).assertEqual(9350);
      logInfo(`${BUNDLE}Vp2pxAt_0297 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0298
     * @tc.name      NdkNotification_Vp2pxAt_0298
     * @tc.desc      vp2pxAt(vp=85, density=115) returns 9775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0298 begin`);
      const actual: number = vp2pxAt(85, 115);
      logInfo(`vp2pxAt(vp=85, density=115): actual=${actual}`);
      expect(actual).assertEqual(9775);
      logInfo(`${BUNDLE}Vp2pxAt_0298 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_VP2PX_AT_0299
     * @tc.name      NdkNotification_Vp2pxAt_0299
     * @tc.desc      vp2pxAt(vp=85, density=66.02) returns 5611.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Vp2pxAt_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Vp2pxAt_0299 begin`);
      const actual: number = vp2pxAt(85, 66.02);
      logInfo(`vp2pxAt(vp=85, density=66.02): actual=${actual}`);
      expect(actual).assertClose(5611.7, PRECISION);
      logInfo(`${BUNDLE}Vp2pxAt_0299 end`);
    });
  });
}
