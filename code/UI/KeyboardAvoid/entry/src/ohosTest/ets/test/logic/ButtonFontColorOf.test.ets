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
import { buttonFontColorOf } from '../model/KeyboardAvoidLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_KeyboardAvoid]';
const BUNDLE: string = 'KeyboardAvoid_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for buttonFontColorOf (2 cases). */
export default function buttonFontColorOfTest(): void {
  describe('ButtonFontColorOfTest', (): void => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_BUTTON_FONT_COLOR_OF_0001
     * @tc.name      KeyboardAvoid_ButtonFontColorOf_0001
     * @tc.desc      buttonFontColorOf(selected=true) returns "White"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ButtonFontColorOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ButtonFontColorOf_0001 begin`);
      const actual: string = buttonFontColorOf(true);
      logInfo(`buttonFontColorOf(selected=true): actual=${actual}`);
      expect(actual).assertEqual('White');
      logInfo(`${BUNDLE}ButtonFontColorOf_0001 end`);
    });

    /**
     * @tc.number    SUB_KEYBOARDAVOID_BUTTON_FONT_COLOR_OF_0002
     * @tc.name      KeyboardAvoid_ButtonFontColorOf_0002
     * @tc.desc      buttonFontColorOf(selected=false) returns "Black"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('KeyboardAvoid_ButtonFontColorOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ButtonFontColorOf_0002 begin`);
      const actual: string = buttonFontColorOf(false);
      logInfo(`buttonFontColorOf(selected=false): actual=${actual}`);
      expect(actual).assertEqual('Black');
      logInfo(`${BUNDLE}ButtonFontColorOf_0002 end`);
    });
  });
}
