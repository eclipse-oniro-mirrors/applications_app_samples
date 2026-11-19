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
import { textContents } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for textContents (1 cases). */
export default function textContentsTest(): void {
  describe('TextContentsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_TEXT_CONTENTS_0001
     * @tc.name      ImperativeDynamicLayouts_TextContents_0001
     * @tc.desc      textContents() returns ["??1","??2","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_TextContents_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TextContents_0001 begin`);
      const actual: string[] = textContents();
      logInfo(`textContents(): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`textContents(): JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["\u9996\u9875","\u7cbe\u9009","\u7535\u89c6\u5267"]');
      logInfo(`textContents(): JSON.stringify(actual.slice(5, 7))=${JSON.stringify(actual.slice(5, 7))}`);
      expect(JSON.stringify(actual.slice(5, 7))).assertEqual('["\u6bcf\u65e5\u63a8\u8350","\u66f4\u591a"]');
      logInfo(`textContents(): JSON.stringify(actual.slice(7, 10))=${JSON.stringify(actual.slice(7, 10))}`);
      expect(JSON.stringify(actual.slice(7, 10))).assertEqual('["\u7535\u5f711","\u7535\u5f712","\u5237\u65b0"]');
      logInfo(`${BUNDLE}TextContents_0001 end`);
    });
  });
}
