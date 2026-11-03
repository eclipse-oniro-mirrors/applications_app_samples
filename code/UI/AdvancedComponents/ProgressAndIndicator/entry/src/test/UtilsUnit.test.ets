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
import { DownloadSession } from '../main/ets/utils/DownloadController';
import { ProgressUtils } from '../main/ets/utils/ProgressUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('ProgressUtils_Clamp_001', 0, () => {
      expect(ProgressUtils.clamp(-1)).assertEqual(0);
      expect(ProgressUtils.clamp(101)).assertEqual(100);
      expect(ProgressUtils.clamp(50.4)).assertEqual(50);
      expect(ProgressUtils.step(0, -10)).assertEqual(0);
      expect(ProgressUtils.step(100, 10)).assertEqual(100);
    });

    it('ProgressUtils_State_001', 0, () => {
      expect(ProgressUtils.state(0)).assertEqual('idle');
      expect(ProgressUtils.state(50)).assertEqual('running');
      expect(ProgressUtils.state(100)).assertEqual('completed');
      expect(ProgressUtils.formatPercent(30)).assertEqual('30%');
      expect(ProgressUtils.describeIndicator(2, 3, 'digit')).assertEqual('index=2/3, style=digit');
    });

    it('DownloadSession_State_001', 0, () => {
      const session = new DownloadSession();
      session.begin();
      expect(session.isRunning()).assertTrue();
      session.advance();
      expect(session.value()).assertEqual(10);
      for (let i = 0; i < 9; i++) {
        session.advance();
      }
      expect(session.value()).assertEqual(100);
      expect(session.isCompleted()).assertTrue();
      session.reset();
      expect(session.value()).assertEqual(0);
      expect(session.isRunning()).assertFalse();
    });

    it('BreakpointUtils_Template_001', 0, () => {
      expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
    });
  });
}
