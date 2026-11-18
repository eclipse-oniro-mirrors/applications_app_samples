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

import { describe, it, expect } from '@ohos/hypium';
import { BreakpointUtils } from '../main/ets/utils/BreakpointUtils';
import { PromptUtils } from '../main/ets/utils/PromptUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('PromptUtils_Count_001', 0, () => {
      expect(PromptUtils.formatCount('cancel', 1)).assertEqual('cancel: 1');
      expect(PromptUtils.toggleShown(true)).assertFalse();
      expect(PromptUtils.describeRange(0, 3)).assertEqual('range=0-3');
      expect(PromptUtils.selectionSummary(1, 4, 8)).assertEqual('selected 1-4 of 8');
      expect(PromptUtils.actionSummary('cancel', 2)).assertEqual('cancel x2');
    });

    it('PromptUtils_Range_001', 0, () => {
      expect(PromptUtils.clampRange(-1, 9, 5).join('-')).assertEqual('0-5');
      expect(PromptUtils.clampRange(4, 1, 5).join('-')).assertEqual('1-4');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
    });
  });
}
