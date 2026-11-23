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
import { SideBarState } from '../model/TabContentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TabContentTouchHotZone]';
const BUNDLE: string = 'TabContentTouchHotZone_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SideBarState.toggleFocus (1 cases). */
export default function sideBarStateToggleFocusTest(): void {
  describe('SideBarStateToggleFocusTest', (): void => {
    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDE_BAR_STATE_TOGGLE_FOCUS_0001
     * @tc.name      TabContentTouchHotZone_SideBarStateToggleFocus_0001
     * @tc.desc      SideBarState.toggleFocus() yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabContentTouchHotZone_SideBarStateToggleFocus_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SideBarStateToggleFocus_0001 begin`);
      const subject: SideBarState = new SideBarState();
      const actual: boolean = subject.toggleFocus();
      logInfo(`toggleFocus(): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`toggleFocus() state: subject.isFocus=${subject.isFocus}`);
      expect(subject.isFocus).assertTrue();
      logInfo(`${BUNDLE}SideBarStateToggleFocus_0001 end`);
    });
  });
}
