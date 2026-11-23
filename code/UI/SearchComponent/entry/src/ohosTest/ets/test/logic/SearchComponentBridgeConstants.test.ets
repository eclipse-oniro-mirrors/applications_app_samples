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
import { yieldToEventLoop } from '../../utils/TestScheduler';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SceneModuleInfo, waterFlowData } from '../../../../main/ets/bridge/SearchComponentBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SearchComponentBridge (1 cases). */
export default function searchComponentBridgeConstantsTest(): void {
  describe('SearchComponentBridgeConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_COMPONENT_BRIDGE_CONSTANTS_0001
     * @tc.name      SearchComponent_SearchComponentBridgeConstants_0001
     * @tc.desc      waterFlowData keeps value ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchComponentBridgeConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchComponentBridgeConstants_0001 begin`);
      const actual: SceneModuleInfo[] = waterFlowData;
      logInfo(`waterFlowData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(158);
      logInfo(`waterFlowData: actual[0].name=${actual[0].name}`);
      expect(actual[0].name).assertEqual('MpChart\u56fe\u8868\u5b9e\u73b0\u6848\u4f8b');
      logInfo(`waterFlowData: actual[0].appUri=${actual[0].appUri}`);
      expect(actual[0].appUri).assertEqual('barchart/BarChartPage');
      logInfo(`waterFlowData: actual[0].param=${actual[0].param}`);
      expect(actual[0].param).assertEqual('');
      logInfo(`waterFlowData: actual[0].ratingNumber=${actual[0].ratingNumber}`);
      expect(actual[0].ratingNumber).assertEqual(1);
      logInfo(`waterFlowData: actual[0].category=${actual[0].category}`);
      expect(actual[0].category).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`waterFlowData: actual[0].serialNumber=${actual[0].serialNumber}`);
      expect(actual[0].serialNumber).assertEqual(4);
      logInfo(`waterFlowData: actual[0].swiperImage=${actual[0].swiperImage}`);
      expect(actual[0].swiperImage).assertEqual('');
      logInfo(`${BUNDLE}SearchComponentBridgeConstants_0001 end`);
    });
  });
}
