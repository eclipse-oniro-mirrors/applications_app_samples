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
import { MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { FoldConfigUtils } from '../../../main/ets/utils/FoldConfigUtils';
import { NavigationUtils } from '../../../main/ets/utils/NavigationUtils';
import { WindowUtils } from '../../../main/ets/utils/WindowUtils';
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

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0100
     * @tc.name testNavigationMatrixBreakpoint0007
     * @tc.desc Verify 599, 839, and oversized widths across breakpoint helpers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixBreakpoint0007', 0, async (done: Function) => {
      await runCase('testNavigationMatrixBreakpoint0007', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(10000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(599)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(839)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(599)).assertEqual('1fr');
        expect(BreakpointUtils.describe(839)).assertEqual('width=839vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0200
     * @tc.name testNavigationMatrixFoldValues0008
     * @tc.desc Verify custom ratios, unknown positions, and false option summaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixFoldValues0008', 0, async (done: Function) => {
      await runCase('testNavigationMatrixFoldValues0008', async () => {
        expect(FoldConfigUtils.ratioName(0.3333333333333333)).assertEqual('custom');
        expect(FoldConfigUtils.ratioName(0.666)).assertEqual('custom');
        expect(FoldConfigUtils.positionName(-1)).assertEqual('UNKNOWN');
        expect(FoldConfigUtils.positionName(99)).assertEqual('UNKNOWN');
        expect(FoldConfigUtils.summary('custom', 'UNKNOWN', false, false, false, 'custom', false))
          .assertEqual('ratio=custom, position=UNKNOWN, animation=false, ' +
            'perp=false, showExtra=false, foldedRatio=custom, extra=false');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0300
     * @tc.name testNavigationMatrixPathValues0009
     * @tc.desc Verify path summaries for empty, single, and repeated names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixPathValues0009', 0, async (done: Function) => {
      await runCase('testNavigationMatrixPathValues0009', async () => {
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
        expect(NavigationUtils.pathSummary(['A'])).assertEqual('A');
        expect(NavigationUtils.pathSummary(['A', 'B', 'C'])).assertEqual('A > B > C');
        expect(NavigationUtils.pathSummary(['A', 'A', 'A'])).assertEqual('A > A > A');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0400
     * @tc.name testNavigationMatrixWindowValues0010
     * @tc.desc Verify screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixWindowValues0010', 0, async (done: Function) => {
      await runCase('testNavigationMatrixWindowValues0010', async () => {
        const screen = WindowUtils.screenInfo();
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(WindowUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0500
     * @tc.name testNavigationMatrixNegativeWidths0011
     * @tc.desc Verify negative widths stay on the small breakpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixNegativeWidths0011', 0, async (done: Function) => {
      await runCase('testNavigationMatrixNegativeWidths0011', async () => {
        expect(BreakpointUtils.resolve(-100)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(-100)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(-100)).assertEqual(16);
        expect(BreakpointUtils.columnCount(-100)).assertEqual(1);
        expect(BreakpointUtils.isWide(-100)).assertFalse();
        expect(BreakpointUtils.describe(-1)).assertEqual('width=-1vp, breakpoint=sm');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0600
     * @tc.name testNavigationMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testNavigationMatrixBreakpointBounds0012', async () => {
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
     * @tc.number SUB_NAVIGATION_MATRIX_0700
     * @tc.name testNavigationMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testNavigationMatrixGridBounds0013', async () => {
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
     * @tc.number SUB_NAVIGATION_MATRIX_0800
     * @tc.name testNavigationMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testNavigationMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_0900
     * @tc.name testNavigationMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testNavigationMatrixDeviceInfo0015', async () => {
        const screen = WindowUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(WindowUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MATRIX_1000
     * @tc.name testNavigationMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testNavigationMatrixCustom0016', async () => {
        expect(FoldConfigUtils.ratioName(1)).assertEqual('1V1');
        expect(FoldConfigUtils.ratioName(0.6666666666666666)).assertEqual('2V3');
        expect(FoldConfigUtils.ratioName(1.5)).assertEqual('3V2');
        expect(FoldConfigUtils.positionName(1)).assertEqual('TOP');
        expect(FoldConfigUtils.positionName(2)).assertEqual('BOTTOM');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1100
     * @tc.name testNavigationExtraStackEmpty0032
     * @tc.desc Verify empty path stack reports no routes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraStackEmpty0032', 0, async (done: Function) => {
      await runCase('testNavigationExtraStackEmpty0032', async () => {
        const stack = new MultiNavPathStack();
        expect(stack.size()).assertEqual(0);
        expect(stack.getAllPathName().length).assertEqual(0);
        expect(NavigationUtils.stackSummary(stack)).assertEqual('(empty)');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1200
     * @tc.name testNavigationExtraStackPush0033
     * @tc.desc Verify pushed routes are visible in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraStackPush0033', 0, async (done: Function) => {
      await runCase('testNavigationExtraStackPush0033', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.pushPathByName('DetailPage', 'detail', false, SplitPolicy.DETAIL_PAGE);
        expect(stack.size()).assertEqual(2);
        expect(stack.getAllPathName().join('>')).assertEqual('HomePage>DetailPage');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1300
     * @tc.name testNavigationExtraStackReplace0034
     * @tc.desc Verify replace keeps stack size and changes route name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraStackReplace0034', 0, async (done: Function) => {
      await runCase('testNavigationExtraStackReplace0034', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.pushPathByName('DetailPage', 'detail', false, SplitPolicy.DETAIL_PAGE);
        stack.replacePathByName('FullPage', 'full', false);
        expect(stack.size()).assertEqual(2);
        expect(stack.getAllPathName().includes('FullPage')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1400
     * @tc.name testNavigationExtraStackPop0035
     * @tc.desc Verify pop removes the top route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraStackPop0035', 0, async (done: Function) => {
      await runCase('testNavigationExtraStackPop0035', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.pushPathByName('DetailPage', 'detail', false, SplitPolicy.DETAIL_PAGE);
        stack.pop();
        expect(stack.size()).assertEqual(1);
        expect(NavigationUtils.stackSummary(stack)).assertEqual('HomePage');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1500
     * @tc.name testNavigationExtraStackClear0036
     * @tc.desc Verify clear removes every route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraStackClear0036', 0, async (done: Function) => {
      await runCase('testNavigationExtraStackClear0036', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.pushPathByName('DetailPage', 'detail', false, SplitPolicy.DETAIL_PAGE);
        stack.clear(false);
        expect(stack.size()).assertEqual(0);
        expect(NavigationUtils.stackSummary(stack)).assertEqual('(empty)');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1600
     * @tc.name testNavigationExtraFoldSummary0037
     * @tc.desc Verify fold summary keeps all boolean options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraFoldSummary0037', 0, async (done: Function) => {
      await runCase('testNavigationExtraFoldSummary0037', async () => {
        expect(FoldConfigUtils.summary('1V1', 'TOP', true, true, true, '2V3', true))
          .assertEqual('ratio=1V1, position=TOP, animation=true, perp=true, showExtra=true, ' +
            'foldedRatio=2V3, extra=true');
        expect(FoldConfigUtils.summary('3V2', 'BOTTOM', false, false, false, '1V1', false))
          .assertEqual('ratio=3V2, position=BOTTOM, animation=false, perp=false, showExtra=false, ' +
            'foldedRatio=1V1, extra=false');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1700
     * @tc.name testNavigationExtraPolicy0038
     * @tc.desc Verify navigation policies keep their names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraPolicy0038', 0, async (done: Function) => {
      await runCase('testNavigationExtraPolicy0038', async () => {
        expect(NavigationUtils.policyName(SplitPolicy.HOME_PAGE)).assertEqual('HOME_PAGE');
        expect(NavigationUtils.policyName(SplitPolicy.DETAIL_PAGE)).assertEqual('DETAIL_PAGE');
        expect(NavigationUtils.policyName(SplitPolicy.FULL_PAGE)).assertEqual('FULL_PAGE');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1800
     * @tc.name testNavigationExtraPath0039
     * @tc.desc Verify path summaries keep separators and empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraPath0039', 0, async (done: Function) => {
      await runCase('testNavigationExtraPath0039', async () => {
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
        expect(NavigationUtils.pathSummary(['Home'])).assertEqual('Home');
        expect(NavigationUtils.pathSummary(['Home', 'Detail'])).assertEqual('Home > Detail');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_1900
     * @tc.name testNavigationExtraWindow0040
     * @tc.desc Verify window information exposes device and screen fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraWindow0040', 0, async (done: Function) => {
      await runCase('testNavigationExtraWindow0040', async () => {
        const info = WindowUtils.screenInfo();
        expect(info).assertContain('device=');
        expect(info).assertContain('width=');
        expect(info).assertContain('height=');
        expect(info).assertContain('density=');
        expect(info).assertContain('orientation=');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_EXTRA_2000
     * @tc.name testNavigationExtraBreakpoint0041
     * @tc.desc Verify extreme widths stay on known breakpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationExtraBreakpoint0041', 0, async (done: Function) => {
      await runCase('testNavigationExtraBreakpoint0041', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(10000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.columnCount(10000)).assertEqual(3);
        expect(BreakpointUtils.pagePadding(10000)).assertEqual(32);
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_DEEP_1100
     * @tc.name testNavigationDeepStackA0042
     * @tc.desc Verify two pushes then pop restores one route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepStackA0042', 0, async (done: Function) => {
      await runCase('testNavigationDeepStackA0042', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.pushPathByName('DetailPage', 'detail', false, SplitPolicy.DETAIL_PAGE);
        stack.pop();
        expect(stack.size()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1200
     * @tc.name testNavigationDeepStackB0043
     * @tc.desc Verify clear after pushes leaves an empty stack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepStackB0043', 0, async (done: Function) => {
      await runCase('testNavigationDeepStackB0043', async () => {
        const stack = new MultiNavPathStack();
        stack.pushPathByName('HomePage', 'home', false, SplitPolicy.HOME_PAGE);
        stack.clear(false);
        expect(NavigationUtils.stackSummary(stack)).assertEqual('(empty)');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1300
     * @tc.name testNavigationDeepBreakA0044
     * @tc.desc Verify width 599 stays small
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepBreakA0044', 0, async (done: Function) => {
      await runCase('testNavigationDeepBreakA0044', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.columnCount(599)).assertEqual(1);
        expect(BreakpointUtils.pagePadding(599)).assertEqual(16);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1400
     * @tc.name testNavigationDeepBreakB0045
     * @tc.desc Verify width 839 stays medium
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepBreakB0045', 0, async (done: Function) => {
      await runCase('testNavigationDeepBreakB0045', async () => {
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1500
     * @tc.name testNavigationDeepBreakC0046
     * @tc.desc Verify width 10000 is large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepBreakC0046', 0, async (done: Function) => {
      await runCase('testNavigationDeepBreakC0046', async () => {
        expect(BreakpointUtils.resolve(10000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.columnCount(10000)).assertEqual(3);
        expect(BreakpointUtils.pagePadding(10000)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1600
     * @tc.name testNavigationDeepFoldA0047
     * @tc.desc Verify ratio names cover all presets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepFoldA0047', 0, async (done: Function) => {
      await runCase('testNavigationDeepFoldA0047', async () => {
        expect(FoldConfigUtils.ratioName(1)).assertEqual('1V1');
        expect(FoldConfigUtils.ratioName(0.6666666666666666)).assertEqual('2V3');
        expect(FoldConfigUtils.ratioName(1.5)).assertEqual('3V2');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1700
     * @tc.name testNavigationDeepFoldB0048
     * @tc.desc Verify positions cover top and bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepFoldB0048', 0, async (done: Function) => {
      await runCase('testNavigationDeepFoldB0048', async () => {
        expect(FoldConfigUtils.positionName(1)).assertEqual('TOP');
        expect(FoldConfigUtils.positionName(2)).assertEqual('BOTTOM');
        expect(FoldConfigUtils.positionName(0)).assertEqual('UNKNOWN');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1800
     * @tc.name testNavigationDeepPathA0049
     * @tc.desc Verify path summary keeps all segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepPathA0049', 0, async (done: Function) => {
      await runCase('testNavigationDeepPathA0049', async () => {
        expect(NavigationUtils.pathSummary(['A', 'B', 'C'])).assertEqual('A > B > C');
        expect(NavigationUtils.pathSummary(['A'])).assertEqual('A');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_1900
     * @tc.name testNavigationDeepPathB0050
     * @tc.desc Verify empty path summary stays explicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepPathB0050', 0, async (done: Function) => {
      await runCase('testNavigationDeepPathB0050', async () => {
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_DEEP_2000
     * @tc.name testNavigationDeepWindow0051
     * @tc.desc Verify window data contains all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationDeepWindow0051', 0, async (done: Function) => {
      await runCase('testNavigationDeepWindow0051', async () => {
        const screen = WindowUtils.screenInfo();
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_FINAL_1100
     * @tc.name testNavigationFinalA0052
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalA0052', 0, async (done: Function) => {
      await runCase('testNavigationFinalA0052', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.columnCount(0)).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1200
     * @tc.name testNavigationFinalB0053
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalB0053', 0, async (done: Function) => {
      await runCase('testNavigationFinalB0053', async () => {
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1300
     * @tc.name testNavigationFinalC0054
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalC0054', 0, async (done: Function) => {
      await runCase('testNavigationFinalC0054', async () => {
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1400
     * @tc.name testNavigationFinalD0055
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalD0055', 0, async (done: Function) => {
      await runCase('testNavigationFinalD0055', async () => {
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1500
     * @tc.name testNavigationFinalE0056
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalE0056', 0, async (done: Function) => {
      await runCase('testNavigationFinalE0056', async () => {
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1600
     * @tc.name testNavigationFinalF0057
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalF0057', 0, async (done: Function) => {
      await runCase('testNavigationFinalF0057', async () => {
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1700
     * @tc.name testNavigationFinalG0058
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalG0058', 0, async (done: Function) => {
      await runCase('testNavigationFinalG0058', async () => {
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1800
     * @tc.name testNavigationFinalH0059
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalH0059', 0, async (done: Function) => {
      await runCase('testNavigationFinalH0059', async () => {
        expect(FoldConfigUtils.positionName(1)).assertEqual('TOP');
        expect(FoldConfigUtils.positionName(2)).assertEqual('BOTTOM');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_1900
     * @tc.name testNavigationFinalI0060
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalI0060', 0, async (done: Function) => {
      await runCase('testNavigationFinalI0060', async () => {
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
        expect(NavigationUtils.pathSummary(['A'])).assertEqual('A');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_2000
     * @tc.name testNavigationFinalJ0061
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalJ0061', 0, async (done: Function) => {
      await runCase('testNavigationFinalJ0061', async () => {
        expect(WindowUtils.deviceType().length > 0).assertTrue();
        expect(WindowUtils.screenInfo()).assertContain('width=');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FINAL_2100
     * @tc.name testNavigationFinalK0062
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationFinalK0062', 0, async (done: Function) => {
      await runCase('testNavigationFinalK0062', async () => {
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_WIDTH_0100
     * @tc.name testNavigationWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0001', 0, async (done: Function) => {
      await runCase('testNavigationWidth0001', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0200
     * @tc.name testNavigationWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0002', 0, async (done: Function) => {
      await runCase('testNavigationWidth0002', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0300
     * @tc.name testNavigationWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0003', 0, async (done: Function) => {
      await runCase('testNavigationWidth0003', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0400
     * @tc.name testNavigationWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0004', 0, async (done: Function) => {
      await runCase('testNavigationWidth0004', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0500
     * @tc.name testNavigationWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0005', 0, async (done: Function) => {
      await runCase('testNavigationWidth0005', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0600
     * @tc.name testNavigationWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0006', 0, async (done: Function) => {
      await runCase('testNavigationWidth0006', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0700
     * @tc.name testNavigationWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0007', 0, async (done: Function) => {
      await runCase('testNavigationWidth0007', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0800
     * @tc.name testNavigationWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0008', 0, async (done: Function) => {
      await runCase('testNavigationWidth0008', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_0900
     * @tc.name testNavigationWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0009', 0, async (done: Function) => {
      await runCase('testNavigationWidth0009', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1000
     * @tc.name testNavigationWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0010', 0, async (done: Function) => {
      await runCase('testNavigationWidth0010', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1100
     * @tc.name testNavigationWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0011', 0, async (done: Function) => {
      await runCase('testNavigationWidth0011', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1200
     * @tc.name testNavigationWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0012', 0, async (done: Function) => {
      await runCase('testNavigationWidth0012', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1300
     * @tc.name testNavigationWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0013', 0, async (done: Function) => {
      await runCase('testNavigationWidth0013', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1400
     * @tc.name testNavigationWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0014', 0, async (done: Function) => {
      await runCase('testNavigationWidth0014', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1500
     * @tc.name testNavigationWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0015', 0, async (done: Function) => {
      await runCase('testNavigationWidth0015', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1600
     * @tc.name testNavigationWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0016', 0, async (done: Function) => {
      await runCase('testNavigationWidth0016', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1700
     * @tc.name testNavigationWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0017', 0, async (done: Function) => {
      await runCase('testNavigationWidth0017', async () => {
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
     * @tc.number SUB_NAVIGATION_WIDTH_1800
     * @tc.name testNavigationWidth0018
     * @tc.desc Verify breakpoint helpers at width 2560vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationWidth0018', 0, async (done: Function) => {
      await runCase('testNavigationWidth0018', async () => {
        expect(BreakpointUtils.resolve(2560)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(2560)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(2560)).assertEqual(32);
        expect(BreakpointUtils.columnCount(2560)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(2560)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(2560)).assertTrue();
        expect(BreakpointUtils.describe(2560)).assertEqual('width=2560vp, breakpoint=lg');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_REAL_0100
     * @tc.name testNavigationRealHspBack0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationRealHspBack0001', 0, async (done: Function) => {
      await runCase('testNavigationRealHspBack0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await waitId('hspTitle');
        await clickId('hspBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_REAL_0200
     * @tc.name testNavigationRealSplitBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationRealSplitBack0002', 0, async (done: Function) => {
      await runCase('testNavigationRealSplitBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSplit');
        await waitId('splitTitle');
        await clickId('splitBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_REAL_0300
     * @tc.name testNavigationRealStackBack0003
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationRealStackBack0003', 0, async (done: Function) => {
      await runCase('testNavigationRealStackBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await clickId('stackBack');
        await waitId('pageTitle');
      }, done);
    });


    /**
     * @tc.number SUB_NAVIGATION_SCENE_0100
     * @tc.name testNavigationSceneMultiBack0001
     * @tc.desc Verify multi navigation detail back and page back sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationSceneMultiBack0001', 0, async (done: Function) => {
      await runCase('testNavigationSceneMultiBack0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        await clickId('detailBack');
        await waitId('homeItem_1');
        await clickId('multiBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_SCENE_0200
     * @tc.name testNavigationSceneStackLog0002
     * @tc.desc Verify stack action, clear log, and page back sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationSceneStackLog0002', 0, async (done: Function) => {
      await runCase('testNavigationSceneStackLog0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackPushOptions');
        await clickId('stackPushOptions');
        expect(await textOfId('stackLog')).assertContain('pushPathOptions');
        await clickId('stackClearLog');
        expect(await textOfId('stackLog')).assertEqual('idle');
        await clickId('stackBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_SCENE_0300
     * @tc.name testNavigationSceneSplitOptional0003
     * @tc.desc Verify split preview and optional region toggle sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationSceneSplitOptional0003', 0, async (done: Function) => {
      await runCase('testNavigationSceneSplitOptional0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSplit');
        await waitId('splitTitle');
        await clickId('preview500');
        expect(await textOfId('splitPreviewLabel')).assertContain('500vp');
        await scrollToId('splitToggleOptional');
        await clickId('splitToggleOptional');
        expect(await textOfId('splitOptionalState')).assertEqual('primary only');
        await clickId('splitToggleOptional');
        expect(await textOfId('splitOptionalState')).assertEqual('full text');
        await clickId('splitBack');
        await waitId('pageTitle');
      }, done);
    });

  });
}
