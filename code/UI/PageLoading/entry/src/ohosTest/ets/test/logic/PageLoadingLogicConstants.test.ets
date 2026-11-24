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
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BANNER_SHADOW_OFFSET_X, BANNER_SHADOW_OFFSET_Y, GRADIENT_ANGLE, IMAGE_ASPECT_RATIO, MILLISECONDS, PRICE_OFFSET,
  PRODUCT_COUNT, PROGRESS_STEP, PROGRESS_TOTAL, TICK_MS
} from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for PageLoadingLogic (10 cases). */
export default function pageLoadingLogicConstantsTest(): void {
  describe('PageLoadingLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0001
     * @tc.name      PageLoading_PageLoadingLogicConstants_0001
     * @tc.desc      MILLISECONDS keeps value 5000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_PageLoadingLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0001 begin`);
      const actual: number = MILLISECONDS;
      logInfo(`MILLISECONDS: actual=${actual}`);
      expect(actual).assertEqual(5000);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0002
     * @tc.name      PageLoading_PageLoadingLogicConstants_0002
     * @tc.desc      PROGRESS_STEP keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_PageLoadingLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0002 begin`);
      const actual: number = PROGRESS_STEP;
      logInfo(`PROGRESS_STEP: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0003
     * @tc.name      PageLoading_PageLoadingLogicConstants_0003
     * @tc.desc      TICK_MS keeps value 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0003 begin`);
      const actual: number = TICK_MS;
      logInfo(`TICK_MS: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0004
     * @tc.name      PageLoading_PageLoadingLogicConstants_0004
     * @tc.desc      PROGRESS_TOTAL keeps value 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0004 begin`);
      const actual: number = PROGRESS_TOTAL;
      logInfo(`PROGRESS_TOTAL: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0005
     * @tc.name      PageLoading_PageLoadingLogicConstants_0005
     * @tc.desc      IMAGE_ASPECT_RATIO keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0005 begin`);
      const actual: number = IMAGE_ASPECT_RATIO;
      logInfo(`IMAGE_ASPECT_RATIO: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0006
     * @tc.name      PageLoading_PageLoadingLogicConstants_0006
     * @tc.desc      PRICE_OFFSET keeps value -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0006 begin`);
      const actual: number = PRICE_OFFSET;
      logInfo(`PRICE_OFFSET: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0007
     * @tc.name      PageLoading_PageLoadingLogicConstants_0007
     * @tc.desc      GRADIENT_ANGLE keeps value 180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0007 begin`);
      const actual: number = GRADIENT_ANGLE;
      logInfo(`GRADIENT_ANGLE: actual=${actual}`);
      expect(actual).assertEqual(180);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0008
     * @tc.name      PageLoading_PageLoadingLogicConstants_0008
     * @tc.desc      PRODUCT_COUNT keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0008 begin`);
      const actual: number = PRODUCT_COUNT;
      logInfo(`PRODUCT_COUNT: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0009
     * @tc.name      PageLoading_PageLoadingLogicConstants_0009
     * @tc.desc      BANNER_SHADOW_OFFSET_X keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0009 begin`);
      const actual: number = BANNER_SHADOW_OFFSET_X;
      logInfo(`BANNER_SHADOW_OFFSET_X: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_LOGIC_CONSTANTS_0010
     * @tc.name      PageLoading_PageLoadingLogicConstants_0010
     * @tc.desc      BANNER_SHADOW_OFFSET_Y keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_PageLoadingLogicConstants_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0010 begin`);
      const actual: number = BANNER_SHADOW_OFFSET_Y;
      logInfo(`BANNER_SHADOW_OFFSET_Y: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}PageLoadingLogicConstants_0010 end`);
    });
  });
}
