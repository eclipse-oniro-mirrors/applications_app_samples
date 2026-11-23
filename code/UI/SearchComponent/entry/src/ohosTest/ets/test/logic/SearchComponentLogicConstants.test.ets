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
import { CLASSIFY_DATA, INPUT_WIDTH_RESERVED } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SearchComponentLogic (2 cases). */
export default function searchComponentLogicConstantsTest(): void {
  describe('SearchComponentLogicConstantsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_COMPONENT_LOGIC_CONSTANTS_0001
     * @tc.name      SearchComponent_SearchComponentLogicConstants_0001
     * @tc.desc      CLASSIFY_DATA keeps value ["Native","????","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchComponentLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchComponentLogicConstants_0001 begin`);
      const actual: string[] = CLASSIFY_DATA;
      logInfo(`CLASSIFY_DATA: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`CLASSIFY_DATA: JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["UI\u5e03\u5c40","\u52a8\u6548","\u4e09\u65b9\u5e93"]');
      logInfo(`CLASSIFY_DATA: JSON.stringify(actual.slice(3, 6))=${JSON.stringify(actual.slice(3, 6))}`);
      expect(JSON.stringify(actual.slice(3, 6))).assertEqual('["Native","\u6027\u80fd\u793a\u4f8b","\u5176\u4ed6"]');
      logInfo(`${BUNDLE}SearchComponentLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_COMPONENT_LOGIC_CONSTANTS_0002
     * @tc.name      SearchComponent_SearchComponentLogicConstants_0002
     * @tc.desc      INPUT_WIDTH_RESERVED keeps value 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchComponentLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchComponentLogicConstants_0002 begin`);
      const actual: number = INPUT_WIDTH_RESERVED;
      logInfo(`INPUT_WIDTH_RESERVED: actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}SearchComponentLogicConstants_0002 end`);
    });
  });
}
