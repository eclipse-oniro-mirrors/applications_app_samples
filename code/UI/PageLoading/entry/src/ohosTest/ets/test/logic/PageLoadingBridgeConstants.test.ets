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
import { CommodityDataModel, PRODUCTS_DATA } from '../../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for PageLoadingBridge (1 cases). */
export default function pageLoadingBridgeConstantsTest(): void {
  describe('PageLoadingBridgeConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PAGE_LOADING_BRIDGE_CONSTANTS_0001
     * @tc.name      PageLoading_PageLoadingBridgeConstants_0001
     * @tc.desc      PRODUCTS_DATA keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_PageLoadingBridgeConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PageLoadingBridgeConstants_0001 begin`);
      const actual: CommodityDataModel[] = PRODUCTS_DATA;
      logInfo(`PRODUCTS_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`PRODUCTS_DATA: actual[0].id=${actual[0].id}`);
      expect(actual[0].id).assertEqual(0);
      logInfo(`PRODUCTS_DATA: actual[2].id=${actual[2].id}`);
      expect(actual[2].id).assertEqual(2);
      logInfo(`PRODUCTS_DATA: actual[5].id=${actual[5].id}`);
      expect(actual[5].id).assertEqual(5);
      logInfo(`${BUNDLE}PageLoadingBridgeConstants_0001 end`);
    });
  });
}
