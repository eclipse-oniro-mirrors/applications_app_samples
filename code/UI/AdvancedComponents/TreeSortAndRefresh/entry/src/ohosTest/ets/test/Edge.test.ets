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
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitText,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.treesortandrefresh';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('TreeSortEdgeTest', () => {
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
     * @tc.number SUB_TREESORT_EDGE_0100
     * @tc.name testTreeSortEdgeTree0001
     * @tc.desc Verify short, single-node, and oversized tree specifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortEdgeTree0001', 0, async (done: Function) => {
      await runCase('testTreeSortEdgeTree0001', async () => {
        const shortSpecs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C']);
        expect(shortSpecs.length).assertEqual(3);
        expect(TreeSpecUtils.rootCount(shortSpecs)).assertEqual(1);
        expect(TreeSpecUtils.childCount(shortSpecs, 0)).assertEqual(2);
        expect(TreeSpecUtils.childCount(shortSpecs, 2)).assertEqual(0);
        expect(TreeSpecUtils.nodeById(shortSpecs, 2)?.isFolder).assertTrue();
        expect(TreeSpecUtils.nodeById(shortSpecs, -1) === undefined).assertTrue();
        const singleSpecs: TreeNodeSpec[] = TreeSpecUtils.create(['Only']);
        expect(singleSpecs.length).assertEqual(1);
        expect(TreeSpecUtils.rootCount(singleSpecs)).assertEqual(1);
        expect(TreeSpecUtils.childCount(singleSpecs, 0)).assertEqual(0);
        const longSpecs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']);
        expect(longSpecs.length).assertEqual(6);
        expect(TreeSpecUtils.rootCount(longSpecs)).assertEqual(2);
        expect(TreeSpecUtils.childCount(longSpecs, 4)).assertEqual(1);
        expect(TreeSpecUtils.nodeById(longSpecs, 5)?.parentId).assertEqual(4);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EDGE_0200
     * @tc.name testTreeSortEdgeRefresh0002
     * @tc.desc Verify idle completion, stop, and reset transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortEdgeRefresh0002', 0, async (done: Function) => {
      await runCase('testTreeSortEdgeRefresh0002', async () => {
        const session = new RefreshSession();
        expect(session.complete()).assertEqual(0);
        expect(session.isLoading()).assertFalse();
        expect(session.stop()).assertEqual(0);
        expect(session.begin()).assertTrue();
        expect(session.stop()).assertEqual(0);
        expect(session.isLoading()).assertFalse();
        expect(session.begin()).assertTrue();
        expect(session.complete()).assertEqual(1);
        expect(session.complete()).assertEqual(1);
        expect(session.begin()).assertTrue();
        session.reset();
        expect(session.count()).assertEqual(0);
        expect(session.isLoading()).assertFalse();
        expect(session.complete()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EDGE_0300
     * @tc.name testTreeSortEdgeSummary0003
     * @tc.desc Verify empty selections, repeated style toggles, and empty titles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortEdgeSummary0003', 0, async (done: Function) => {
      await runCase('testTreeSortEdgeSummary0003', async () => {
        const items: SortItemLike[] = [
          { id: 0, selected: false, order: 0 },
          { id: 1, selected: false, order: 1 }
        ];
        expect(TreeSortUtils.countSelected(items)).assertEqual(0);
        expect(TreeSortUtils.sortSummary(0, 0)).assertEqual('selected=0, unselected=0');
        expect(TreeSortUtils.nextSpanStyle(TreeSortUtils.nextSpanStyle(true))).assertTrue();
        expect(TreeSortUtils.nextSpanStyle(TreeSortUtils.nextSpanStyle(false))).assertFalse();
        expect(TreeSortUtils.formStatus(0, '')).assertEqual('code=0, formId=none');
        expect(TreeSortUtils.formStatus(-1, 'abc')).assertEqual('code=-1, formId=abc');
        expect(TreeSortUtils.treeStatus(-1, '')).assertEqual('node=-1, title=');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EDGE_0400
     * @tc.name testTreeSortEdgeHistory0004
     * @tc.desc Verify tree action history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortEdgeHistory0004', 0, async (done: Function) => {
      await runCase('testTreeSortEdgeHistory0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTree');
        await clickId('treeReset');
        expect(await textOfId('treeEventCount')).assertEqual('1');
        await scrollToId('treeClearHistory');
        await clickId('treeClearHistory');
        await waitText('No actions yet');
        expect(await existsId('treeHistory')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0100
     * @tc.name testTreeSortMatrixSpec0005
     * @tc.desc Verify empty, partial, and oversized tree specifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixSpec0005', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixSpec0005', async () => {
        const emptySpecs: TreeNodeSpec[] = TreeSpecUtils.create([]);
        expect(emptySpecs.length).assertEqual(0);
        expect(TreeSpecUtils.rootCount(emptySpecs)).assertEqual(0);
        expect(TreeSpecUtils.nodeById(emptySpecs, 0) === undefined).assertTrue();
        const fourSpecs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C', 'D']);
        expect(fourSpecs.length).assertEqual(4);
        expect(TreeSpecUtils.rootCount(fourSpecs)).assertEqual(1);
        expect(TreeSpecUtils.childCount(fourSpecs, 0)).assertEqual(2);
        expect(TreeSpecUtils.childCount(fourSpecs, 2)).assertEqual(1);
        const fiveSpecs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C', 'D', 'E']);
        expect(TreeSpecUtils.rootCount(fiveSpecs)).assertEqual(2);
        expect(TreeSpecUtils.childCount(fiveSpecs, 4)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0200
     * @tc.name testTreeSortMatrixSort0006
     * @tc.desc Verify all-selected, none-selected, and repeated style calculations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixSort0006', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixSort0006', async () => {
        const allSelected: SortItemLike[] = [
          { id: 0, selected: true, order: 0 },
          { id: 1, selected: true, order: 1 }
        ];
        const noneSelected: SortItemLike[] = [
          { id: 0, selected: false, order: 0 },
          { id: 1, selected: false, order: 1 }
        ];
        expect(TreeSortUtils.countSelected(allSelected)).assertEqual(2);
        expect(TreeSortUtils.countSelected(noneSelected)).assertEqual(0);
        expect(TreeSortUtils.sortSummary(0, 0)).assertEqual('selected=0, unselected=0');
        expect(TreeSortUtils.sortSummary(5, 0)).assertEqual('selected=5, unselected=0');
        expect(TreeSortUtils.nextSpanStyle(TreeSortUtils.nextSpanStyle(TreeSortUtils.nextSpanStyle(true))))
          .assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0300
     * @tc.name testTreeSortMatrixRefresh0007
     * @tc.desc Verify idle completion, repeated stop, and reset transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixRefresh0007', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixRefresh0007', async () => {
        const session = new RefreshSession();
        expect(session.complete()).assertEqual(0);
        expect(session.stop()).assertEqual(0);
        expect(session.begin()).assertTrue();
        expect(session.complete()).assertEqual(1);
        expect(session.stop()).assertEqual(1);
        expect(session.begin()).assertTrue();
        session.reset();
        expect(session.count()).assertEqual(0);
        expect(session.isLoading()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0400
     * @tc.name testTreeSortMatrixStatus0008
     * @tc.desc Verify status formatting for empty and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixStatus0008', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixStatus0008', async () => {
        expect(TreeSortUtils.refreshStatus(0, false)).assertEqual('count=0, loading=false');
        expect(TreeSortUtils.refreshStatus(3, true)).assertEqual('count=3, loading=true');
        expect(TreeSortUtils.treeStatus(-1, '')).assertEqual('node=-1, title=');
        expect(TreeSortUtils.formStatus(0, '')).assertEqual('code=0, formId=none');
        expect(TreeSortUtils.formStatus(1, 'abc')).assertEqual('code=1, formId=abc');
        expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0500
     * @tc.name testTreeSortMatrixTree0009
     * @tc.desc Verify node lookup and child counts at non-root parents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixTree0009', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixTree0009', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C', 'D', 'E', 'F']);
        expect(TreeSpecUtils.nodeById(specs, 0)?.isFolder).assertTrue();
        expect(TreeSpecUtils.nodeById(specs, 1)?.isFolder).assertFalse();
        expect(TreeSpecUtils.nodeById(specs, 5)?.parentId).assertEqual(4);
        expect(TreeSpecUtils.childCount(specs, 2)).assertEqual(1);
        expect(TreeSpecUtils.childCount(specs, 4)).assertEqual(1);
        expect(TreeSpecUtils.childCount(specs, 99)).assertEqual(0);
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_MATRIX_0600
     * @tc.name testTreeSortMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixBreakpointBounds0012', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0700
     * @tc.name testTreeSortMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixGridBounds0013', async () => {
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0800
     * @tc.name testTreeSortMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_0900
     * @tc.name testTreeSortMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixDeviceInfo0015', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_MATRIX_1000
     * @tc.name testTreeSortMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testTreeSortMatrixCustom0016', async () => {
        expect(BreakpointUtils.contentPadding(500)).assertEqual(16);
        expect(BreakpointUtils.contentPadding(700)).assertEqual(24);
        expect(BreakpointUtils.contentPadding(1000)).assertEqual(32);
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_EXTRA_1100
     * @tc.name testTreeSortExtraSpecA0020
     * @tc.desc Verify tree specs stop at the declared titles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraSpecA0020', 0, async (done: Function) => {
      await runCase('testTreeSortExtraSpecA0020', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B']);
        expect(specs.length).assertEqual(2);
        expect(TreeSpecUtils.rootCount(specs)).assertEqual(1);
        expect(TreeSpecUtils.childCount(specs, 0)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1200
     * @tc.name testTreeSortExtraSpecB0021
     * @tc.desc Verify six titles expose two roots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraSpecB0021', 0, async (done: Function) => {
      await runCase('testTreeSortExtraSpecB0021', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C', 'D', 'E', 'F']);
        expect(specs.length).assertEqual(6);
        expect(TreeSpecUtils.rootCount(specs)).assertEqual(2);
        expect(TreeSpecUtils.childCount(specs, 4)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1300
     * @tc.name testTreeSortExtraSpecC0022
     * @tc.desc Verify node lookup returns undefined for invalid ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraSpecC0022', 0, async (done: Function) => {
      await runCase('testTreeSortExtraSpecC0022', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B', 'C']);
        expect(TreeSpecUtils.nodeById(specs, 0)?.isFolder).assertTrue();
        expect(TreeSpecUtils.nodeById(specs, 1)?.isFolder).assertFalse();
        expect(TreeSpecUtils.nodeById(specs, 99) === undefined).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1400
     * @tc.name testTreeSortExtraSortA0023
     * @tc.desc Verify selection counting handles empty and full sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraSortA0023', 0, async (done: Function) => {
      await runCase('testTreeSortExtraSortA0023', async () => {
        const empty: SortItemLike[] = [];
        expect(TreeSortUtils.countSelected(empty)).assertEqual(0);
        const all: SortItemLike[] = [{ id: 0, selected: true, order: 0 }, 
          { id: 1, selected: true, order: 1 }];
        expect(TreeSortUtils.countSelected(all)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1500
     * @tc.name testTreeSortExtraSortB0024
     * @tc.desc Verify sort summaries keep both counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraSortB0024', 0, async (done: Function) => {
      await runCase('testTreeSortExtraSortB0024', async () => {
        expect(TreeSortUtils.sortSummary(0, 1)).assertEqual('selected=0, unselected=1');
        expect(TreeSortUtils.sortSummary(3, 2)).assertEqual('selected=3, unselected=2');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1600
     * @tc.name testTreeSortExtraRefreshA0025
     * @tc.desc Verify refresh session completes one cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraRefreshA0025', 0, async (done: Function) => {
      await runCase('testTreeSortExtraRefreshA0025', async () => {
        const session = new RefreshSession();
        expect(session.begin()).assertTrue();
        expect(session.complete()).assertEqual(1);
        expect(session.isLoading()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1700
     * @tc.name testTreeSortExtraRefreshB0026
     * @tc.desc Verify refresh session ignores duplicate begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraRefreshB0026', 0, async (done: Function) => {
      await runCase('testTreeSortExtraRefreshB0026', async () => {
        const session = new RefreshSession();
        expect(session.begin()).assertTrue();
        expect(session.begin()).assertFalse();
        expect(session.complete()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1800
     * @tc.name testTreeSortExtraRefreshC0027
     * @tc.desc Verify refresh session stop keeps the count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraRefreshC0027', 0, async (done: Function) => {
      await runCase('testTreeSortExtraRefreshC0027', async () => {
        const session = new RefreshSession();
        session.begin();
        session.complete();
        session.begin();
        expect(session.stop()).assertEqual(1);
        expect(session.isLoading()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_1900
     * @tc.name testTreeSortExtraStatus0028
     * @tc.desc Verify status formatting keeps empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraStatus0028', 0, async (done: Function) => {
      await runCase('testTreeSortExtraStatus0028', async () => {
        expect(TreeSortUtils.refreshStatus(0, false)).assertEqual('count=0, loading=false');
        expect(TreeSortUtils.treeStatus(0, '')).assertEqual('node=0, title=');
        expect(TreeSortUtils.formStatus(0, '')).assertEqual('code=0, formId=none');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_EXTRA_2000
     * @tc.name testTreeSortExtraStyle0029
     * @tc.desc Verify span styles alternate deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortExtraStyle0029', 0, async (done: Function) => {
      await runCase('testTreeSortExtraStyle0029', async () => {
        expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
        expect(TreeSortUtils.spanStyle(false)).assertEqual('style=light');
        expect(TreeSortUtils.nextSpanStyle(true)).assertFalse();
        expect(TreeSortUtils.nextSpanStyle(false)).assertTrue();
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_DEEP_1100
     * @tc.name testTreeSortDeepSpecA0030
     * @tc.desc Verify empty title list creates no nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepSpecA0030', 0, async (done: Function) => {
      await runCase('testTreeSortDeepSpecA0030', async () => {
        expect(TreeSpecUtils.create([]).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1200
     * @tc.name testTreeSortDeepSpecB0031
     * @tc.desc Verify single title creates one root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepSpecB0031', 0, async (done: Function) => {
      await runCase('testTreeSortDeepSpecB0031', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A']);
        expect(TreeSpecUtils.rootCount(specs)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1300
     * @tc.name testTreeSortDeepSpecC0032
     * @tc.desc Verify orphan parent count is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepSpecC0032', 0, async (done: Function) => {
      await runCase('testTreeSortDeepSpecC0032', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B']);
        expect(TreeSpecUtils.childCount(specs, 99)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1400
     * @tc.name testTreeSortDeepSortA0033
     * @tc.desc Verify empty list has no selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepSortA0033', 0, async (done: Function) => {
      await runCase('testTreeSortDeepSortA0033', async () => {
        expect(TreeSortUtils.countSelected([])).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1500
     * @tc.name testTreeSortDeepSortB0034
     * @tc.desc Verify summary keeps zero counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepSortB0034', 0, async (done: Function) => {
      await runCase('testTreeSortDeepSortB0034', async () => {
        expect(TreeSortUtils.sortSummary(0, 0)).assertEqual('selected=0, unselected=0');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1600
     * @tc.name testTreeSortDeepRefreshA0035
     * @tc.desc Verify idle complete does not increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepRefreshA0035', 0, async (done: Function) => {
      await runCase('testTreeSortDeepRefreshA0035', async () => {
        const session = new RefreshSession();
        expect(session.complete()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1700
     * @tc.name testTreeSortDeepRefreshB0036
     * @tc.desc Verify stop while idle keeps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepRefreshB0036', 0, async (done: Function) => {
      await runCase('testTreeSortDeepRefreshB0036', async () => {
        const session = new RefreshSession();
        expect(session.stop()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1800
     * @tc.name testTreeSortDeepRefreshC0037
     * @tc.desc Verify reset clears a completed cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepRefreshC0037', 0, async (done: Function) => {
      await runCase('testTreeSortDeepRefreshC0037', async () => {
        const session = new RefreshSession();
        session.begin();
        session.complete();
        session.reset();
        expect(session.count()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_1900
     * @tc.name testTreeSortDeepStatus0038
     * @tc.desc Verify refresh status keeps booleans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepStatus0038', 0, async (done: Function) => {
      await runCase('testTreeSortDeepStatus0038', async () => {
        expect(TreeSortUtils.refreshStatus(1, true)).assertEqual('count=1, loading=true');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_DEEP_2000
     * @tc.name testTreeSortDeepStyle0039
     * @tc.desc Verify dark style is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortDeepStyle0039', 0, async (done: Function) => {
      await runCase('testTreeSortDeepStyle0039', async () => {
        expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_FINAL_1100
     * @tc.name testTreeSortFinalA0040
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalA0040', 0, async (done: Function) => {
      await runCase('testTreeSortFinalA0040', async () => {
        expect(TreeSpecUtils.create([]).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1200
     * @tc.name testTreeSortFinalB0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalB0041', 0, async (done: Function) => {
      await runCase('testTreeSortFinalB0041', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A']);
        expect(TreeSpecUtils.rootCount(specs)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1300
     * @tc.name testTreeSortFinalC0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalC0042', 0, async (done: Function) => {
      await runCase('testTreeSortFinalC0042', async () => {
        const specs: TreeNodeSpec[] = TreeSpecUtils.create(['A', 'B']);
        expect(TreeSpecUtils.childCount(specs, 99)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1400
     * @tc.name testTreeSortFinalD0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalD0043', 0, async (done: Function) => {
      await runCase('testTreeSortFinalD0043', async () => {
        expect(TreeSortUtils.countSelected([])).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1500
     * @tc.name testTreeSortFinalE0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalE0044', 0, async (done: Function) => {
      await runCase('testTreeSortFinalE0044', async () => {
        expect(TreeSortUtils.sortSummary(0, 0)).assertEqual('selected=0, unselected=0');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1600
     * @tc.name testTreeSortFinalF0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalF0045', 0, async (done: Function) => {
      await runCase('testTreeSortFinalF0045', async () => {
        const session = new RefreshSession();
        expect(session.complete()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1700
     * @tc.name testTreeSortFinalG0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalG0046', 0, async (done: Function) => {
      await runCase('testTreeSortFinalG0046', async () => {
        const session = new RefreshSession();
        expect(session.stop()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1800
     * @tc.name testTreeSortFinalH0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalH0047', 0, async (done: Function) => {
      await runCase('testTreeSortFinalH0047', async () => {
        const session = new RefreshSession();
        session.begin();
        session.complete();
        session.reset();
        expect(session.count()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_1900
     * @tc.name testTreeSortFinalI0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalI0048', 0, async (done: Function) => {
      await runCase('testTreeSortFinalI0048', async () => {
        expect(TreeSortUtils.refreshStatus(1, true)).assertEqual('count=1, loading=true');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_FINAL_2000
     * @tc.name testTreeSortFinalJ0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortFinalJ0049', 0, async (done: Function) => {
      await runCase('testTreeSortFinalJ0049', async () => {
        expect(TreeSortUtils.spanStyle(true)).assertEqual('style=dark');
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_WIDTH_0100
     * @tc.name testTreeSortWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0001', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0001', async () => {
        expect(BreakpointUtils.resolve(-100)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(-100)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(-100)).assertEqual(16);
        expect(BreakpointUtils.columnCount(-100)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(-100)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(-100)).assertFalse();
        expect(BreakpointUtils.describe(-100)).assertEqual('width=-100vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0200
     * @tc.name testTreeSortWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0002', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0002', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(0)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(0)).assertEqual(16);
        expect(BreakpointUtils.columnCount(0)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(0)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(0)).assertFalse();
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0300
     * @tc.name testTreeSortWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0003', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0003', async () => {
        expect(BreakpointUtils.resolve(1)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(1)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(1)).assertEqual(16);
        expect(BreakpointUtils.columnCount(1)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(1)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(1)).assertFalse();
        expect(BreakpointUtils.describe(1)).assertEqual('width=1vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0400
     * @tc.name testTreeSortWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0004', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0004', async () => {
        expect(BreakpointUtils.resolve(320)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(320)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(320)).assertEqual(16);
        expect(BreakpointUtils.columnCount(320)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(320)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(320)).assertFalse();
        expect(BreakpointUtils.describe(320)).assertEqual('width=320vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0500
     * @tc.name testTreeSortWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0005', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0005', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(599)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(599)).assertEqual(16);
        expect(BreakpointUtils.columnCount(599)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(599)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(599)).assertFalse();
        expect(BreakpointUtils.describe(599)).assertEqual('width=599vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0600
     * @tc.name testTreeSortWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0006', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0006', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0700
     * @tc.name testTreeSortWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0007', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0007', async () => {
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(601)).assertTrue();
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0800
     * @tc.name testTreeSortWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0008', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0008', async () => {
        expect(BreakpointUtils.resolve(700)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(700)).assertEqual(24);
        expect(BreakpointUtils.columnCount(700)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(700)).assertTrue();
        expect(BreakpointUtils.describe(700)).assertEqual('width=700vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_0900
     * @tc.name testTreeSortWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0009', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0009', async () => {
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(839)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(839)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(839)).assertTrue();
        expect(BreakpointUtils.describe(839)).assertEqual('width=839vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1000
     * @tc.name testTreeSortWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0010', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0010', async () => {
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
        expect(BreakpointUtils.columnCount(840)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(840)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(840)).assertTrue();
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1100
     * @tc.name testTreeSortWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0011', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0011', async () => {
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(841)).assertTrue();
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1200
     * @tc.name testTreeSortWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0012', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0012', async () => {
        expect(BreakpointUtils.resolve(900)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(900)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(900)).assertEqual(32);
        expect(BreakpointUtils.columnCount(900)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(900)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(900)).assertTrue();
        expect(BreakpointUtils.describe(900)).assertEqual('width=900vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1300
     * @tc.name testTreeSortWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0013', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0013', async () => {
        expect(BreakpointUtils.resolve(1000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1000)).assertTrue();
        expect(BreakpointUtils.describe(1000)).assertEqual('width=1000vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1400
     * @tc.name testTreeSortWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0014', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0014', async () => {
        expect(BreakpointUtils.resolve(1200)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1200)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1200)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1200)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1200)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1200)).assertTrue();
        expect(BreakpointUtils.describe(1200)).assertEqual('width=1200vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1500
     * @tc.name testTreeSortWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0015', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0015', async () => {
        expect(BreakpointUtils.resolve(1440)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1440)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1440)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1440)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1440)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1440)).assertTrue();
        expect(BreakpointUtils.describe(1440)).assertEqual('width=1440vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1600
     * @tc.name testTreeSortWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0016', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0016', async () => {
        expect(BreakpointUtils.resolve(1920)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1920)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1920)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1920)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1920)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1920)).assertTrue();
        expect(BreakpointUtils.describe(1920)).assertEqual('width=1920vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_WIDTH_1700
     * @tc.name testTreeSortWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortWidth0017', 0, async (done: Function) => {
      await runCase('testTreeSortWidth0017', async () => {
        expect(BreakpointUtils.resolve(2000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(2000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(2000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(2000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(2000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(2000)).assertTrue();
        expect(BreakpointUtils.describe(2000)).assertEqual('width=2000vp, breakpoint=lg');
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_REAL_0100
     * @tc.name testTreeSortRealTreeV2Back0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRealTreeV2Back0001', 0, async (done: Function) => {
      await runCase('testTreeSortRealTreeV2Back0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        await waitId('treeV2PageTitle');
        await clickId('treeV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_REAL_0200
     * @tc.name testTreeSortRealRefreshBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRealRefreshBack0002', 0, async (done: Function) => {
      await runCase('testTreeSortRealRefreshBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await waitId('refreshPageTitle');
        await clickId('refreshBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_REAL_0300
     * @tc.name testTreeSortRealFormBack0003
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRealFormBack0003', 0, async (done: Function) => {
      await runCase('testTreeSortRealFormBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardForm');
        await waitId('formPageTitle');
        await clickId('formBack');
        await waitId('pageTitle');
      }, done);
    });


    /**
     * @tc.number SUB_TREESORT_SCENE_0100
     * @tc.name testTreeSortSceneTreeV2Reset0001
     * @tc.desc Verify TreeViewV2 reset restores the ready state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortSceneTreeV2Reset0001', 0, async (done: Function) => {
      await runCase('testTreeSortSceneTreeV2Reset0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        await waitId('treeViewV2');
        await clickId('treeV2Reset');
        expect(await textOfId('treeV2Status')).assertContain('ready');
        await clickId('treeV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_SCENE_0200
     * @tc.name testTreeSortSceneSpanToggle0002
     * @tc.desc Verify container span toggles dark and light twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortSceneSpanToggle0002', 0, async (done: Function) => {
      await runCase('testTreeSortSceneSpanToggle0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSpan');
        expect(await textOfId('spanStatus')).assertContain('style=dark');
        await clickId('spanToggle');
        expect(await textOfId('spanStatus')).assertContain('style=light');
        await clickId('spanToggle');
        expect(await textOfId('spanStatus')).assertContain('style=dark');
        await clickId('spanBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_SCENE_0300
     * @tc.name testTreeSortSceneRefreshStop0003
     * @tc.desc Verify swipe refresh starts and stops cleanly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortSceneRefreshStop0003', 0, async (done: Function) => {
      await runCase('testTreeSortSceneRefreshStop0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await waitId('swipeRefresher');
        await clickId('refreshStart');
        expect(await textOfId('refreshStatus')).assertContain('loading=true');
        await clickId('refreshStop');
        expect(await textOfId('refreshStatus')).assertContain('loading=false');
        await clickId('refreshBack');
        await waitId('pageTitle');
      }, done);
    });

  });
}
