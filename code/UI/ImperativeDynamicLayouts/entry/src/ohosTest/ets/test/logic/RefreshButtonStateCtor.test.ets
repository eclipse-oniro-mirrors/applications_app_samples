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
import { RefreshButtonState } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RefreshButtonState (1 cases). */
export default function refreshButtonStateCtorTest(): void {
  describe('RefreshButtonStateCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_REFRESH_BUTTON_STATE_CTOR_0001
     * @tc.name      ImperativeDynamicLayouts_RefreshButtonStateCtor_0001
     * @tc.desc      new RefreshButtonState() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_RefreshButtonStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshButtonStateCtor_0001 begin`);
      const subject: RefreshButtonState = new RefreshButtonState();
      logInfo(`new RefreshButtonState(): subject.enabled=${subject.enabled}`);
      expect(subject.enabled).assertTrue();
      logInfo(`new RefreshButtonState(): subject.clicks=${subject.clicks}`);
      expect(subject.clicks).assertEqual(0);
      logInfo(`new RefreshButtonState(): subject.images.length=${subject.images.length}`);
      expect(subject.images.length).assertEqual(6);
      logInfo(`new RefreshButtonState(): JSON.stringify(subject.image...${JSON.stringify(subject.images.slice(0, 2))}`);
      expect(JSON.stringify(subject.images.slice(0, 2))).assertEqual('["app.media.search","app.media.movie1"]');
      logInfo(`new RefreshButtonState(): JSON.stringify(subject.image...${JSON.stringify(subject.images.slice(2, 4))}`);
      expect(JSON.stringify(subject.images.slice(2, 4))).assertEqual('["app.media.movie2","app.media.movie3"]');
      logInfo(`new RefreshButtonState(): JSON.stringify(subject.image...${JSON.stringify(subject.images.slice(4, 6))}`);
      expect(JSON.stringify(subject.images.slice(4, 6))).assertEqual('["app.media.movie4","app.media.movie5"]');
      logInfo(`${BUNDLE}RefreshButtonStateCtor_0001 end`);
    });
  });
}
