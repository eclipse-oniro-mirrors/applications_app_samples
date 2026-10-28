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
import { RefreshSession } from '../main/ets/utils/RefreshController';
import { TreeNodeSpec, TreeSpecUtils } from '../main/ets/utils/TreeSpecUtils';
import { SortItemLike, TreeSortUtils } from '../main/ets/utils/TreeSortUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('TreeSortUtils_Selected_001', 0, () => {
      const items: SortItemLike[] = [
        { id: 0, selected: true, order: 0 },
        { id: 1, selected: false, order: 1 }
      ];
      expect(TreeSortUtils.countSelected(items)).assertEqual(1);
      expect(TreeSortUtils.countSelected([])).assertEqual(0);
      expect(TreeSortUtils.sortSummary(1, 1)).assertEqual('selected=1, unselected=1');
    });

    it('TreeSortUtils_Refresh_001', 0, () => {
      expect(TreeSortUtils.refreshStatus(0, false)).assertEqual('count=0, loading=false');
      expect(TreeSortUtils.refreshStatus(2, true)).assertEqual('count=2, loading=true');
    });

    it('TreeSortUtils_Style_001', 0, () => {
      expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
      expect(TreeSortUtils.nextSpanStyle(false)).assertTrue();
      expect(TreeSortUtils.formStatus(1, '')).assertEqual('code=1, formId=none');
      expect(TreeSortUtils.treeStatus(1, 'Reports')).assertEqual('node=1, title=Reports');
    });

    it('BreakpointUtils_Template_001', 0, () => {
      expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
    });

    it('TreeSpecUtils_Structure_001', 0, () => {
      const specs: TreeNodeSpec[] = TreeSpecUtils.create([
        'Documents', 'Reports', 'Images', 'Photo.png', 'Downloads', 'Archive.zip'
      ]);
      expect(specs.length).assertEqual(6);
      expect(TreeSpecUtils.rootCount(specs)).assertEqual(2);
      expect(TreeSpecUtils.childCount(specs, 0)).assertEqual(2);
      expect(TreeSpecUtils.nodeById(specs, 3)?.isFolder).assertFalse();
    });

    it('RefreshSession_State_001', 0, () => {
      const session = new RefreshSession();
      expect(session.begin()).assertTrue();
      expect(session.begin()).assertFalse();
      expect(session.complete()).assertEqual(1);
      expect(session.begin()).assertTrue();
      expect(session.stop()).assertEqual(1);
      session.reset();
      expect(session.count()).assertEqual(0);
    });
  });
}
