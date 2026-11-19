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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { REFRESH_ID, REFRESH_IMAGES, SUPPORTED_TYPES } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for DynamicLayoutLogic (3 cases). */
export default function dynamicLayoutLogicConstantsTest(): void {
  describe('DynamicLayoutLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DYNAMIC_LAYOUT_LOGIC_CONSTANTS_0001
     * @tc.name      ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0001
     * @tc.desc      SUPPORTED_TYPES keeps value ["Column","Row","Swiper","Image","Text"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0001 begin`);
      const actual: string[] = SUPPORTED_TYPES;
      logInfo(`SUPPORTED_TYPES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`SUPPORTED_TYPES: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Column","Row","Swiper","Image","Text"]');
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DYNAMIC_LAYOUT_LOGIC_CONSTANTS_0002
     * @tc.name      ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0002
     * @tc.desc      REFRESH_IMAGES keeps value ["app.media.movie10"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0002 begin`);
      const actual: string[] = REFRESH_IMAGES;
      logInfo(`REFRESH_IMAGES: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`REFRESH_IMAGES: JSON.stringify(actual.slice(0, 2))=${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["app.media.movie6","app.media.movie7"]');
      logInfo(`REFRESH_IMAGES: JSON.stringify(actual.slice(2, 4))=${JSON.stringify(actual.slice(2, 4))}`);
      expect(JSON.stringify(actual.slice(2, 4))).assertEqual('["app.media.movie8","app.media.movie9"]');
      logInfo(`REFRESH_IMAGES: JSON.stringify(actual.slice(4, 5))=${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["app.media.movie10"]');
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_DYNAMIC_LAYOUT_LOGIC_CONSTANTS_0003
     * @tc.name      ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0003
     * @tc.desc      REFRESH_ID keeps value "refreshImage"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_DynamicLayoutLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0003 begin`);
      const actual: string = REFRESH_ID;
      logInfo(`REFRESH_ID: actual=${actual}`);
      expect(actual).assertEqual('refreshImage');
      logInfo(`${BUNDLE}DynamicLayoutLogicConstants_0003 end`);
    });
  });
}
