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
  waitText
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
  });
}
