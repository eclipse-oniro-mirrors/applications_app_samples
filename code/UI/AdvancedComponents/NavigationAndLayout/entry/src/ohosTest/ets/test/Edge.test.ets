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
import { FoldConfigUtils } from '../../../main/ets/utils/FoldConfigUtils';
import { NavigationUtils } from '../../../main/ets/utils/NavigationUtils';
import {
  clickId,
  existsId,
  pressBack,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('NavigationEdgeTest', () => {
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
     * @tc.number SUB_NAVIGATION_EDGE_0100
     * @tc.name testNavigationEdgeBreakpoint0001
     * @tc.desc Verify negative, zero, and oversized width boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationEdgeBreakpoint0001', 0, async (done: Function) => {
      await runCase('testNavigationEdgeBreakpoint0001', async () => {
        expect(BreakpointUtils.resolve(-1)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(2000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(-1)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(0)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(2000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(-1)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(0)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(2000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.columnCount(840)).assertEqual(2);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(840)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(0)).assertFalse();
        expect(BreakpointUtils.isWide(2000)).assertTrue();
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(2000)).assertEqual('width=2000vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EDGE_0200
     * @tc.name testNavigationEdgeFold0002
     * @tc.desc Verify unknown fold values and empty or repeated path summaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationEdgeFold0002', 0, async (done: Function) => {
      await runCase('testNavigationEdgeFold0002', async () => {
        expect(FoldConfigUtils.ratioName(0)).assertEqual('custom');
        expect(FoldConfigUtils.ratioName(-1)).assertEqual('custom');
        expect(FoldConfigUtils.ratioName(1.0000001)).assertEqual('custom');
        expect(FoldConfigUtils.positionName(-1)).assertEqual('UNKNOWN');
        expect(FoldConfigUtils.positionName(3)).assertEqual('UNKNOWN');
        expect(FoldConfigUtils.summary('1V1', 'BOTTOM', false, true, false, 'custom', false))
          .assertEqual('ratio=1V1, position=BOTTOM, animation=false, ' +
            'perp=true, showExtra=false, foldedRatio=custom, extra=false');
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
        expect(NavigationUtils.pathSummary(['Home'])).assertEqual('Home');
        expect(NavigationUtils.pathSummary(['Home', 'Home', 'Detail'])).assertEqual('Home > Home > Detail');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EDGE_0300
     * @tc.name testNavigationEdgeSplitPreview0004
     * @tc.desc Verify the 500vp preview and repeated optional-region toggles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationEdgeSplitPreview0004', 0, async (done: Function) => {
      await runCase('testNavigationEdgeSplitPreview0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSplit');
        await clickId('preview500');
        expect(await textOfId('splitPreviewLabel')).assertContain('500vp');
        await scrollToId('splitToggleOptional');
        await clickId('splitToggleOptional');
        expect(await textOfId('splitOptionalState')).assertEqual('primary only');
        await clickId('splitToggleOptional');
        expect(await textOfId('splitOptionalState')).assertEqual('full text');
        expect(await existsId('splitPreview')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EDGE_0400
     * @tc.name testNavigationEdgeMultiHistory0005
     * @tc.desc Verify multi navigation action history and clearing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationEdgeMultiHistory0005', 0, async (done: Function) => {
      await runCase('testNavigationEdgeMultiHistory0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        expect(await existsId('multiPath')).assertTrue();
        await clickId('detailBack');
        await waitId('homeItem_1');
        expect(await textOfId('multiOperationCount')).assertContain('#2');
        await scrollToId('multiClearHistory');
        await clickId('multiClearHistory');
        await waitText('No actions yet');
        expect(await existsId('multiHistory')).assertTrue();
        await pressBack();
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EDGE_0500
     * @tc.name testNavigationEdgeStackLog0006
     * @tc.desc Verify stack result logging, log clearing, resetting, and back navigation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationEdgeStackLog0006', 0, async (done: Function) => {
      await runCase('testNavigationEdgeStackLog0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackPushOptions');
        await clickId('stackPushOptions');
        expect(await textOfId('stackLog')).assertContain('pushPathOptions');
        await scrollToId('stackPopToNameResult');
        await clickId('stackPopToNameResult');
        expect(await textOfId('stackLog')).assertContain('popToNameResult');
        await clickId('stackClearLog');
        expect(await textOfId('stackLog')).assertEqual('idle');
        await clickId('stackReset');
        expect(await textOfId('stackLog')).assertContain('reset stack');
        await clickId('stackBack');
        await waitId('pageTitle');
      }, done);
    });
  });
}
