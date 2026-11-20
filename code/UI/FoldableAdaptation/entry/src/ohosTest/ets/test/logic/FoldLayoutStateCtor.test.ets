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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FoldLayoutState } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new FoldLayoutState (1 cases). */
export default function foldLayoutStateCtorTest(): void {
  describe('FoldLayoutStateCtorTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_FOLD_LAYOUT_STATE_CTOR_0001
     * @tc.name      FoldableAdaptation_FoldLayoutStateCtor_0001
     * @tc.desc      new FoldLayoutState() initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FoldLayoutStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FoldLayoutStateCtor_0001 begin`);
      const subject: FoldLayoutState = new FoldLayoutState();
      logInfo(`new FoldLayoutState(): subject.breakpoint=${subject.breakpoint}`);
      expect(subject.breakpoint).assertEqual('');
      logInfo(`new FoldLayoutState(): subject.navMode=${subject.navMode}`);
      expect(subject.navMode).assertEqual(0);
      logInfo(`new FoldLayoutState(): subject.navigationMode=${subject.navigationMode}`);
      expect(subject.navigationMode).assertEqual('Stack');
      logInfo(`new FoldLayoutState(): subject.swiperDisplayCount=${subject.swiperDisplayCount}`);
      expect(subject.swiperDisplayCount).assertEqual(1);
      logInfo(`new FoldLayoutState(): subject.stackSize=${subject.stackSize}`);
      expect(subject.stackSize).assertEqual(0);
      logInfo(`new FoldLayoutState(): subject.lastRoute=${subject.lastRoute}`);
      expect(subject.lastRoute).assertEqual('');
      logInfo(`new FoldLayoutState(): subject.enterRoute=${subject.enterRoute}`);
      expect(subject.enterRoute).assertEqual('');
      logInfo(`${BUNDLE}FoldLayoutStateCtor_0001 end`);
    });
  });
}
