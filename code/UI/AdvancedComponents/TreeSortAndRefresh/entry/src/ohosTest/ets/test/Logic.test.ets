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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { RefreshSession } from '../../../main/ets/utils/RefreshController';
import { TreeNodeSpec, TreeSpecUtils } from '../../../main/ets/utils/TreeSpecUtils';
import { SortItemLike, TreeSortUtils } from '../../../main/ets/utils/TreeSortUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('TreeSortLogicTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_TREESORT_LOGIC_0100
     * @tc.name testTreeSortLogicSelected0001
     * @tc.desc Verify logic selected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicSelected0001', 0, async (done: Function) => {
      await runCase('testTreeSortLogicSelected0001', async () => {
        const items: SortItemLike[] = [
          { id: 0, selected: true, order: 0 },
          { id: 1, selected: false, order: 1 },
          { id: 2, selected: true, order: 2 }
        ];
        expect(TreeSortUtils.countSelected(items)).assertEqual(2);
        expect(TreeSortUtils.countSelected([])).assertEqual(0);
        expect(TreeSortUtils.sortSummary(2, 1)).assertEqual('selected=2, unselected=1');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0200
     * @tc.name testTreeSortLogicRefresh0002
     * @tc.desc Verify logic refresh behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicRefresh0002', 0, async (done: Function) => {
      await runCase('testTreeSortLogicRefresh0002', async () => {
        expect(TreeSortUtils.refreshStatus(0, false)).assertEqual('count=0, loading=false');
        expect(TreeSortUtils.refreshStatus(3, true)).assertEqual('count=3, loading=true');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0300
     * @tc.name testTreeSortLogicStyle0003
     * @tc.desc Verify logic style behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicStyle0003', 0, async (done: Function) => {
      await runCase('testTreeSortLogicStyle0003', async () => {
        expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
        expect(TreeSortUtils.spanStyle(false)).assertEqual('style=light');
        expect(TreeSortUtils.nextSpanStyle(true)).assertFalse();
        expect(TreeSortUtils.nextSpanStyle(false)).assertTrue();
        expect(TreeSortUtils.formStatus(0, '123')).assertEqual('code=0, formId=123');
        expect(TreeSortUtils.formStatus(1, '')).assertEqual('code=1, formId=none');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0400
     * @tc.name testTreeSortLogicTree0004
     * @tc.desc Verify logic tree behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicTree0004', 0, async (done: Function) => {
      await runCase('testTreeSortLogicTree0004', async () => {
        expect(TreeSortUtils.treeStatus(0, 'Documents')).assertEqual('node=0, title=Documents');
        expect(TreeSortUtils.treeStatus(5, 'Archive.zip')).assertEqual('node=5, title=Archive.zip');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0500
     * @tc.name testTreeSortLogicBreakpoint0005
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicBreakpoint0005', 0, async (done: Function) => {
      await runCase('testTreeSortLogicBreakpoint0005', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.contentPadding(500)).assertEqual(16);
        expect(BreakpointUtils.contentPadding(700)).assertEqual(24);
        expect(BreakpointUtils.contentPadding(1000)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0600
     * @tc.name testTreeSortLogicDevice0006
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicDevice0006', 0, async (done: Function) => {
      await runCase('testTreeSortLogicDevice0006', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0700
     * @tc.name testTreeSortLogicSpec0007
     * @tc.desc Verify logic spec behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicSpec0007', 0, async (done: Function) => {
      await runCase('testTreeSortLogicSpec0007', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create([
          'Documents', 'Reports', 'Images', 'Photo.png', 'Downloads', 'Archive.zip'
        ]);
        expect(specs.length).assertEqual(6);
        expect(TreeSpecUtils.rootCount(specs)).assertEqual(2);
        expect(TreeSpecUtils.childCount(specs, 0)).assertEqual(2);
        expect(TreeSpecUtils.childCount(specs, 2)).assertEqual(1);
        const node = TreeSpecUtils.nodeById(specs, 5);
        expect(node === undefined).assertFalse();
        expect(node?.parentId).assertEqual(4);
        expect(TreeSpecUtils.nodeById(specs, 99) === undefined).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_LOGIC_0800
     * @tc.name testTreeSortLogicRefreshSession0008
     * @tc.desc Verify logic refresh session behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLogicRefreshSession0008', 0, async (done: Function) => {
      await runCase('testTreeSortLogicRefreshSession0008', async () => {
        const session = new RefreshSession();
        expect(session.count()).assertEqual(0);
        expect(session.begin()).assertTrue();
        expect(session.begin()).assertFalse();
        expect(session.complete()).assertEqual(1);
        expect(session.complete()).assertEqual(1);
        expect(session.count()).assertEqual(1);
        expect(session.begin()).assertTrue();
        expect(session.stop()).assertEqual(1);
        expect(session.isLoading()).assertFalse();
        session.reset();
        expect(session.count()).assertEqual(0);
      }, done);
    });
    /**
     * @tc.number SUB_TREESORT_BOUNDARY_0100
     * @tc.name testTreeSortBoundary0009
     * @tc.desc Verify boundary values and fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortBoundary0009', 0, async (done: Function) => {
      await runCase('testTreeSortBoundary0009', async () => {
              const session = new RefreshSession();
              expect(session.count()).assertEqual(0);
              expect(session.begin()).assertTrue();
              expect(session.begin()).assertFalse();
              expect(session.complete()).assertEqual(1);
              expect(session.complete()).assertEqual(1);
              expect(session.begin()).assertTrue();
              expect(session.stop()).assertEqual(1);
              expect(session.isLoading()).assertFalse();
              session.reset();
              expect(session.count()).assertEqual(0);
              expect(TreeSpecUtils.create([]).length).assertEqual(0);
              expect(TreeSpecUtils.rootCount([])).assertEqual(0);
              expect(TreeSpecUtils.childCount([], 0)).assertEqual(0);
              expect(TreeSpecUtils.nodeById([], 0) === undefined).assertTrue();
              expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
              expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
              expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
              expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
      }, done);
    });
        /**
     * @tc.number SUB_TREESORT_LIMIT_0100
     * @tc.name testTreeSortLimit0010
     * @tc.desc Verify additional boundary and empty-state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLimit0010', 0, async (done: Function) => {
      await runCase('testTreeSortLimit0010', async () => {
              const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C']);
              expect(TreeSpecUtils.childCount(specs, -1)).assertEqual(2);
              expect(TreeSpecUtils.childCount(specs, 99)).assertEqual(0);
              expect(TreeSortUtils.nextSpanStyle(false)).assertTrue();
              expect(TreeSortUtils.formStatus(0, '')).assertEqual('code=0, formId=none');
              const session = new RefreshSession();
              expect(session.stop()).assertEqual(0);
              expect(session.isLoading()).assertFalse();
              session.begin();
              expect(session.begin()).assertFalse();
              session.reset();
              expect(session.count()).assertEqual(0);
      }, done);
    });
      });
}
