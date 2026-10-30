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
import { TitleBarActions } from '../../../main/ets/utils/TitleBarActions';
import { TitleBarUtils } from '../../../main/ets/utils/TitleBarUtils';
import {
  clickChildButton,
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.titlebarsandtoolbars';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('TitleBarsEdgeTest', () => {
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
     * @tc.number SUB_TITLEBARS_EDGE_0100
     * @tc.name testTitleBarsEdgeBadge0001
     * @tc.desc Verify badge rounding around zero and the maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEdgeBadge0001', 0, async (done: Function) => {
      await runCase('testTitleBarsEdgeBadge0001', async () => {
        expect(TitleBarUtils.badgeText(0.4)).assertEqual('');
        expect(TitleBarUtils.badgeText(0.5)).assertEqual('1');
        expect(TitleBarUtils.badgeText(0.6)).assertEqual('1');
        expect(TitleBarUtils.badgeText(1.4)).assertEqual('1');
        expect(TitleBarUtils.badgeText(99.4)).assertEqual('99');
        expect(TitleBarUtils.badgeText(99.5)).assertEqual('99+');
        expect(TitleBarUtils.badgeText(100.4)).assertEqual('99+');
        expect(TitleBarUtils.badgeText(-0.5)).assertEqual('');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDGE_0200
     * @tc.name testTitleBarsEdgeIndex0002
     * @tc.desc Verify negative lengths and oversized indexes for title bar helpers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEdgeIndex0002', 0, async (done: Function) => {
      await runCase('testTitleBarsEdgeIndex0002', async () => {
        expect(TitleBarUtils.clampIndex(-100, 5)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(100, 5)).assertEqual(4);
        expect(TitleBarUtils.clampIndex(0, -1)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(-100, 5)).assertEqual(1);
        expect(TitleBarUtils.nextIndex(100, 5)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(0, -1)).assertEqual(0);
        expect(TitleBarUtils.describeIndex('x', 100, 5)).assertEqual('x=4/5');
        expect(TitleBarUtils.describeIndex('x', 0, 0)).assertEqual('x=0/0');
        expect(TitleBarUtils.describeTab(-1, 'A')).assertEqual('tab=0, title=A');
        expect(TitleBarUtils.describeTab(99, 'B')).assertEqual('tab=2, title=B');
        expect(TitleBarUtils.describeToolbar(-1, '', 0)).assertEqual('index=-1, label=, count=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDGE_0300
     * @tc.name testTitleBarsEdgeActions0003
     * @tc.desc Verify repeated resets and independent action counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEdgeActions0003', 0, async (done: Function) => {
      await runCase('testTitleBarsEdgeActions0003', async () => {
        const first = new TitleBarActions('EdgeFirst');
        first.cancel();
        first.cancel();
        expect(first.summary()).assertEqual('save=0, cancel=2, menu=0');
        first.menu();
        first.save();
        expect(first.summary()).assertEqual('save=1, cancel=2, menu=1');
        expect(first.reset()).assertEqual('save=0, cancel=0, menu=0');
        expect(first.reset()).assertEqual('save=0, cancel=0, menu=0');
        const second = new TitleBarActions('EdgeSecond');
        second.save();
        expect(second.summary()).assertEqual('save=1, cancel=0, menu=0');
        expect(first.summary()).assertEqual('save=0, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDGE_0400
     * @tc.name testTitleBarsEdgeHistory0004
     * @tc.desc Verify editable title bar action history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEdgeHistory0004', 0, async (done: Function) => {
      await runCase('testTitleBarsEdgeHistory0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await clickChildButton('editableTitleBar', -1);
        expect(await textOfId('editableEvents')).assertEqual('1');
        await scrollToId('editableClearHistory');
        await clickId('editableClearHistory');
        await waitText('No actions yet');
        expect(await existsId('editableHistory')).assertTrue();
      }, done);
    });
  });
}
