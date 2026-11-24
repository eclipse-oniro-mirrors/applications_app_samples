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
import { px2vpAt } from '../model/NdkNotificationLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkNotification]';
const BUNDLE: string = 'NdkNotification_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for px2vpAt (11 cases). */
export default function px2vpAt4Test(): void {
  describe('Px2vpAt4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0289
     * @tc.name      NdkNotification_Px2vpAt_0289
     * @tc.desc      px2vpAt(px=55, density=95) returns 0.5789473684210527
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0289 begin`);
      const actual: number = px2vpAt(55, 95);
      logInfo(`px2vpAt(px=55, density=95): actual=${actual}`);
      expect(actual).assertClose(0.5789473684210527, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0289 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0290
     * @tc.name      NdkNotification_Px2vpAt_0290
     * @tc.desc      px2vpAt(px=55, density=105) returns 0.5238095238095238
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0290 begin`);
      const actual: number = px2vpAt(55, 105);
      logInfo(`px2vpAt(px=55, density=105): actual=${actual}`);
      expect(actual).assertClose(0.5238095238095238, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0290 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0291
     * @tc.name      NdkNotification_Px2vpAt_0291
     * @tc.desc      px2vpAt(px=55, density=115) returns 0.4782608695652174
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0291 begin`);
      const actual: number = px2vpAt(55, 115);
      logInfo(`px2vpAt(px=55, density=115): actual=${actual}`);
      expect(actual).assertClose(0.4782608695652174, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0291 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0292
     * @tc.name      NdkNotification_Px2vpAt_0292
     * @tc.desc      px2vpAt(px=55, density=38) returns 1.4473684210526316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0292 begin`);
      const actual: number = px2vpAt(55, 38);
      logInfo(`px2vpAt(px=55, density=38): actual=${actual}`);
      expect(actual).assertClose(1.4473684210526316, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0292 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0293
     * @tc.name      NdkNotification_Px2vpAt_0293
     * @tc.desc      px2vpAt(px=55, density=152) returns 0.3618421052631579
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0293 begin`);
      const actual: number = px2vpAt(55, 152);
      logInfo(`px2vpAt(px=55, density=152): actual=${actual}`);
      expect(actual).assertClose(0.3618421052631579, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0293 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0294
     * @tc.name      NdkNotification_Px2vpAt_0294
     * @tc.desc      px2vpAt(px=60, density=1) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NdkNotification_Px2vpAt_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}Px2vpAt_0294 begin`);
      const actual: number = px2vpAt(60, 1);
      logInfo(`px2vpAt(px=60, density=1): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}Px2vpAt_0294 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0295
     * @tc.name      NdkNotification_Px2vpAt_0295
     * @tc.desc      px2vpAt(px=60, density=5) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0295 begin`);
      const actual: number = px2vpAt(60, 5);
      logInfo(`px2vpAt(px=60, density=5): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}Px2vpAt_0295 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0296
     * @tc.name      NdkNotification_Px2vpAt_0296
     * @tc.desc      px2vpAt(px=60, density=25) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0296 begin`);
      const actual: number = px2vpAt(60, 25);
      logInfo(`px2vpAt(px=60, density=25): actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0296 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0297
     * @tc.name      NdkNotification_Px2vpAt_0297
     * @tc.desc      px2vpAt(px=60, density=35) returns 1.7142857142857142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0297 begin`);
      const actual: number = px2vpAt(60, 35);
      logInfo(`px2vpAt(px=60, density=35): actual=${actual}`);
      expect(actual).assertClose(1.7142857142857142, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0297 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0298
     * @tc.name      NdkNotification_Px2vpAt_0298
     * @tc.desc      px2vpAt(px=60, density=55) returns 1.0909090909090908
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0298 begin`);
      const actual: number = px2vpAt(60, 55);
      logInfo(`px2vpAt(px=60, density=55): actual=${actual}`);
      expect(actual).assertClose(1.0909090909090908, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0298 end`);
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_PX2VP_AT_0299
     * @tc.name      NdkNotification_Px2vpAt_0299
     * @tc.desc      px2vpAt(px=60, density=65) returns 0.9230769230769231
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('NdkNotification_Px2vpAt_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Px2vpAt_0299 begin`);
      const actual: number = px2vpAt(60, 65);
      logInfo(`px2vpAt(px=60, density=65): actual=${actual}`);
      expect(actual).assertClose(0.9230769230769231, PRECISION);
      logInfo(`${BUNDLE}Px2vpAt_0299 end`);
    });
  });
}
