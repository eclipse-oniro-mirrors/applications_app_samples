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
import { FoldConfigUtils } from '../main/ets/utils/FoldConfigUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('BreakpointUtils_Resolve_001', 0, () => {
      expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
      expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
      expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
      expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
      expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
      expect(BreakpointUtils.columnCount(500)).assertEqual(1);
      expect(BreakpointUtils.columnCount(700)).assertEqual(2);
      expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
    });

    it('BreakpointUtils_Describe_001', 0, () => {
      expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
      expect(BreakpointUtils.isWide(601)).assertTrue();
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
    });

    it('FoldConfigUtils_Mapping_001', 0, () => {
      expect(FoldConfigUtils.ratioName(1)).assertEqual('1V1');
      expect(FoldConfigUtils.ratioName(1.5)).assertEqual('3V2');
      expect(FoldConfigUtils.positionName(2)).assertEqual('BOTTOM');
      expect(FoldConfigUtils.summary('1V1', 'TOP', false, true, false, '2V3', false))
        .assertContain('foldedRatio=2V3');
    });
  });
}
