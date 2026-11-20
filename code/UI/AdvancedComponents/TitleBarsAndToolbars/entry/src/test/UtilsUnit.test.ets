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
import { TitleBarActions } from '../main/ets/utils/TitleBarActions';
import { TitleBarUtils } from '../main/ets/utils/TitleBarUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('TitleBarUtils_Index_001', 0, () => {
      expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
      expect(TitleBarUtils.clampIndex(3, 3)).assertEqual(2);
      expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
      expect(TitleBarUtils.nextIndex(0, 0)).assertEqual(0);
    });

    it('TitleBarUtils_Badge_001', 0, () => {
      expect(TitleBarUtils.badgeText(0)).assertEqual('');
      expect(TitleBarUtils.badgeText(10)).assertEqual('10');
      expect(TitleBarUtils.badgeText(100)).assertEqual('99+');
    });

    it('TitleBarUtils_Describe_001', 0, () => {
      expect(TitleBarUtils.formatAction('menu', 3)).assertEqual('action=menu, count=3');
      expect(TitleBarUtils.describeIndex('selected', 2, 3)).assertEqual('selected=2/3');
      expect(TitleBarUtils.describeToolbar(1, 'Edit', 2)).assertEqual('index=1, label=Edit, count=2');
    });

    it('BreakpointUtils_Template_001', 0, () => {
      expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
      expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
      expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
    });

    it('TitleBarActions_Count_001', 0, () => {
      const actions = new TitleBarActions('LocalTest');
      actions.save();
      actions.cancel();
      actions.menu();
      expect(actions.summary()).assertEqual('save=1, cancel=1, menu=1');
      expect(actions.reset()).assertEqual('save=0, cancel=0, menu=0');
    });
  });
}
