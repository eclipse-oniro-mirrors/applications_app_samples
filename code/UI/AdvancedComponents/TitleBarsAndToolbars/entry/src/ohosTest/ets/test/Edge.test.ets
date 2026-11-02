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
import { TitleBarActions } from '../../../main/ets/utils/TitleBarActions';
import { TitleBarUtils } from '../../../main/ets/utils/TitleBarUtils';
import {
  clickAnyText,
  clickChildButton,
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitText,
  waitId
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

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0100
     * @tc.name testTitleBarsMatrixBadge0005
     * @tc.desc Verify badge rounding at zero, one, and the maximum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixBadge0005', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixBadge0005', async () => {
        expect(TitleBarUtils.badgeText(0.49)).assertEqual('');
        expect(TitleBarUtils.badgeText(1.49)).assertEqual('1');
        expect(TitleBarUtils.badgeText(1.5)).assertEqual('2');
        expect(TitleBarUtils.badgeText(98.5)).assertEqual('99');
        expect(TitleBarUtils.badgeText(99.49)).assertEqual('99');
        expect(TitleBarUtils.badgeText(99.5)).assertEqual('99+');
        expect(TitleBarUtils.badgeText(150)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0200
     * @tc.name testTitleBarsMatrixIndex0006
     * @tc.desc Verify one-item and negative-length index behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixIndex0006', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixIndex0006', async () => {
        expect(TitleBarUtils.clampIndex(0, 1)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(1, 1)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(-1, 1)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(0, 1)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(1, 1)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(-100, 1)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0300
     * @tc.name testTitleBarsMatrixDescribe0007
     * @tc.desc Verify descriptions clamp indexes and tab overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixDescribe0007', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixDescribe0007', async () => {
        expect(TitleBarUtils.describeIndex('a', -5, 3)).assertEqual('a=0/3');
        expect(TitleBarUtils.describeIndex('a', 5, 3)).assertEqual('a=2/3');
        expect(TitleBarUtils.describeTab(-5, 'T')).assertEqual('tab=0, title=T');
        expect(TitleBarUtils.describeTab(5, 'T')).assertEqual('tab=2, title=T');
        expect(TitleBarUtils.formatAction('', 0)).assertEqual('action=, count=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0400
     * @tc.name testTitleBarsMatrixActions0008
     * @tc.desc Verify repeated actions and independent action counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixActions0008', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixActions0008', async () => {
        const actions = new TitleBarActions('Matrix');
        actions.save();
        actions.save();
        actions.save();
        actions.cancel();
        actions.menu();
        actions.menu();
        expect(actions.summary()).assertEqual('save=3, cancel=1, menu=2');
        const other = new TitleBarActions('Other');
        expect(other.summary()).assertEqual('save=0, cancel=0, menu=0');
        expect(actions.reset()).assertEqual('save=0, cancel=0, menu=0');
        expect(other.summary()).assertEqual('save=0, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0500
     * @tc.name testTitleBarsMatrixTab0009
     * @tc.desc Verify all tab indexes including overflow stay within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixTab0009', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixTab0009', async () => {
        expect(TitleBarUtils.describeTab(0, 'A')).assertEqual('tab=0, title=A');
        expect(TitleBarUtils.describeTab(1, 'B')).assertEqual('tab=1, title=B');
        expect(TitleBarUtils.describeTab(2, 'C')).assertEqual('tab=2, title=C');
        expect(TitleBarUtils.describeTab(3, 'D')).assertEqual('tab=2, title=D');
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0600
     * @tc.name testTitleBarsMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixBreakpointBounds0012', async () => {
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
     * @tc.number SUB_TITLEBARS_MATRIX_0700
     * @tc.name testTitleBarsMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixGridBounds0013', async () => {
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
     * @tc.number SUB_TITLEBARS_MATRIX_0800
     * @tc.name testTitleBarsMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_MATRIX_0900
     * @tc.name testTitleBarsMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixDeviceInfo0015', async () => {
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
     * @tc.number SUB_TITLEBARS_MATRIX_1000
     * @tc.name testTitleBarsMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testTitleBarsMatrixCustom0016', async () => {
        expect(TitleBarUtils.nextIndex(0, 2)).assertEqual(1);
        expect(TitleBarUtils.nextIndex(1, 2)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(2, 2)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(-1, 2)).assertEqual(1);
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1100
     * @tc.name testTitleBarsExtraBadgeA0020
     * @tc.desc Verify badge values cover zero, one, and ninety-nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraBadgeA0020', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraBadgeA0020', async () => {
        expect(TitleBarUtils.badgeText(0)).assertEqual('');
        expect(TitleBarUtils.badgeText(1)).assertEqual('1');
        expect(TitleBarUtils.badgeText(99)).assertEqual('99');
        expect(TitleBarUtils.badgeText(100)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1200
     * @tc.name testTitleBarsExtraBadgeB0021
     * @tc.desc Verify badge rounds fractions before formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraBadgeB0021', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraBadgeB0021', async () => {
        expect(TitleBarUtils.badgeText(1.4)).assertEqual('1');
        expect(TitleBarUtils.badgeText(1.5)).assertEqual('2');
        expect(TitleBarUtils.badgeText(99.4)).assertEqual('99');
        expect(TitleBarUtils.badgeText(99.5)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1300
     * @tc.name testTitleBarsExtraIndexA0022
     * @tc.desc Verify index clamps to the available range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraIndexA0022', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraIndexA0022', async () => {
        expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(0, 3)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(2, 3)).assertEqual(2);
        expect(TitleBarUtils.clampIndex(3, 3)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1400
     * @tc.name testTitleBarsExtraIndexB0023
     * @tc.desc Verify next index wraps and handles empty length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraIndexB0023', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraIndexB0023', async () => {
        expect(TitleBarUtils.nextIndex(0, 3)).assertEqual(1);
        expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(0, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1500
     * @tc.name testTitleBarsExtraActionsA0024
     * @tc.desc Verify action counters accumulate independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraActionsA0024', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraActionsA0024', async () => {
        const actions = new TitleBarActions('ExtraA');
        expect(actions.save()).assertEqual('save=1, cancel=0, menu=0');
        expect(actions.cancel()).assertEqual('save=1, cancel=1, menu=0');
        expect(actions.menu()).assertEqual('save=1, cancel=1, menu=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1600
     * @tc.name testTitleBarsExtraActionsB0025
     * @tc.desc Verify reset clears every action counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraActionsB0025', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraActionsB0025', async () => {
        const actions = new TitleBarActions('ExtraB');
        actions.save();
        actions.cancel();
        actions.menu();
        expect(actions.reset()).assertEqual('save=0, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1700
     * @tc.name testTitleBarsExtraTab0026
     * @tc.desc Verify tab descriptions clamp overflow indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraTab0026', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraTab0026', async () => {
        expect(TitleBarUtils.describeTab(0, 'A')).assertEqual('tab=0, title=A');
        expect(TitleBarUtils.describeTab(2, 'C')).assertEqual('tab=2, title=C');
        expect(TitleBarUtils.describeTab(3, 'D')).assertEqual('tab=2, title=D');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1800
     * @tc.name testTitleBarsExtraToolbar0027
     * @tc.desc Verify toolbar descriptions keep raw index and label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraToolbar0027', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraToolbar0027', async () => {
        expect(TitleBarUtils.describeToolbar(0, 'Edit', 2)).assertEqual('index=0, label=Edit, count=2');
        expect(TitleBarUtils.describeToolbar(9, '', 0)).assertEqual('index=9, label=, count=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_1900
     * @tc.name testTitleBarsExtraFormat0028
     * @tc.desc Verify action formatting supports empty names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraFormat0028', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraFormat0028', async () => {
        expect(TitleBarUtils.formatAction('', 0)).assertEqual('action=, count=0');
        expect(TitleBarUtils.formatAction('save', 3)).assertEqual('action=save, count=3');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EXTRA_2000
     * @tc.name testTitleBarsExtraDescribe0029
     * @tc.desc Verify index descriptions clamp negative and oversized values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsExtraDescribe0029', 0, async (done: Function) => {
      await runCase('testTitleBarsExtraDescribe0029', async () => {
        expect(TitleBarUtils.describeIndex('x', -1, 3)).assertEqual('x=0/3');
        expect(TitleBarUtils.describeIndex('x', 3, 3)).assertEqual('x=2/3');
        expect(TitleBarUtils.describeIndex('x', 0, 0)).assertEqual('x=0/0');
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_DEEP_1100
     * @tc.name testTitleBarsDeepBadgeA0030
     * @tc.desc Verify zero badge is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepBadgeA0030', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepBadgeA0030', async () => {
        expect(TitleBarUtils.badgeText(0)).assertEqual('');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1200
     * @tc.name testTitleBarsDeepBadgeB0031
     * @tc.desc Verify maximum badge is capped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepBadgeB0031', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepBadgeB0031', async () => {
        expect(TitleBarUtils.badgeText(100)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1300
     * @tc.name testTitleBarsDeepIndexA0032
     * @tc.desc Verify negative index clamps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepIndexA0032', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepIndexA0032', async () => {
        expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1400
     * @tc.name testTitleBarsDeepIndexB0033
     * @tc.desc Verify oversized index clamps to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepIndexB0033', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepIndexB0033', async () => {
        expect(TitleBarUtils.clampIndex(5, 3)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1500
     * @tc.name testTitleBarsDeepNextA0034
     * @tc.desc Verify next index wraps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepNextA0034', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepNextA0034', async () => {
        expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1600
     * @tc.name testTitleBarsDeepNextB0035
     * @tc.desc Verify next index handles empty length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepNextB0035', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepNextB0035', async () => {
        expect(TitleBarUtils.nextIndex(0, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1700
     * @tc.name testTitleBarsDeepActionsA0036
     * @tc.desc Verify save increments once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepActionsA0036', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepActionsA0036', async () => {
        const actions = new TitleBarActions('DeepA');
        expect(actions.save()).assertEqual('save=1, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1800
     * @tc.name testTitleBarsDeepActionsB0037
     * @tc.desc Verify cancel increments once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepActionsB0037', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepActionsB0037', async () => {
        const actions = new TitleBarActions('DeepB');
        expect(actions.cancel()).assertEqual('save=0, cancel=1, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_1900
     * @tc.name testTitleBarsDeepTab0038
     * @tc.desc Verify tab description clamps overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepTab0038', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepTab0038', async () => {
        expect(TitleBarUtils.describeTab(5, 'T')).assertEqual('tab=2, title=T');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_DEEP_2000
     * @tc.name testTitleBarsDeepToolbar0039
     * @tc.desc Verify toolbar description keeps index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsDeepToolbar0039', 0, async (done: Function) => {
      await runCase('testTitleBarsDeepToolbar0039', async () => {
        expect(TitleBarUtils.describeToolbar(1, 'Edit', 2)).assertEqual('index=1, label=Edit, count=2');
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_FINAL_1100
     * @tc.name testTitleBarsFinalA0040
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalA0040', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalA0040', async () => {
        expect(TitleBarUtils.badgeText(0)).assertEqual('');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1200
     * @tc.name testTitleBarsFinalB0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalB0041', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalB0041', async () => {
        expect(TitleBarUtils.badgeText(100)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1300
     * @tc.name testTitleBarsFinalC0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalC0042', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalC0042', async () => {
        expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1400
     * @tc.name testTitleBarsFinalD0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalD0043', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalD0043', async () => {
        expect(TitleBarUtils.clampIndex(3, 3)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1500
     * @tc.name testTitleBarsFinalE0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalE0044', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalE0044', async () => {
        expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1600
     * @tc.name testTitleBarsFinalF0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalF0045', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalF0045', async () => {
        expect(TitleBarUtils.nextIndex(0, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1700
     * @tc.name testTitleBarsFinalG0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalG0046', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalG0046', async () => {
        const actions = new TitleBarActions('F');
        expect(actions.save()).assertEqual('save=1, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1800
     * @tc.name testTitleBarsFinalH0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalH0047', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalH0047', async () => {
        const actions = new TitleBarActions('G');
        expect(actions.cancel()).assertEqual('save=0, cancel=1, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_1900
     * @tc.name testTitleBarsFinalI0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalI0048', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalI0048', async () => {
        expect(TitleBarUtils.describeTab(5, 'T')).assertEqual('tab=2, title=T');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_FINAL_2000
     * @tc.name testTitleBarsFinalJ0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsFinalJ0049', 0, async (done: Function) => {
      await runCase('testTitleBarsFinalJ0049', async () => {
        expect(TitleBarUtils.describeToolbar(1, 'E', 2)).assertEqual('index=1, label=E, count=2');
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_WIDTH_0100
     * @tc.name testTitleBarsWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0001', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0001', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0200
     * @tc.name testTitleBarsWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0002', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0002', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0300
     * @tc.name testTitleBarsWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0003', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0003', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0400
     * @tc.name testTitleBarsWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0004', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0004', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0500
     * @tc.name testTitleBarsWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0005', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0005', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0600
     * @tc.name testTitleBarsWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0006', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0006', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0700
     * @tc.name testTitleBarsWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0007', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0007', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0800
     * @tc.name testTitleBarsWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0008', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0008', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_0900
     * @tc.name testTitleBarsWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0009', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0009', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1000
     * @tc.name testTitleBarsWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0010', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0010', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1100
     * @tc.name testTitleBarsWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0011', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0011', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1200
     * @tc.name testTitleBarsWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0012', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0012', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1300
     * @tc.name testTitleBarsWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0013', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0013', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1400
     * @tc.name testTitleBarsWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0014', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0014', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1500
     * @tc.name testTitleBarsWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0015', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0015', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1600
     * @tc.name testTitleBarsWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0016', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0016', async () => {
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
     * @tc.number SUB_TITLEBARS_WIDTH_1700
     * @tc.name testTitleBarsWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsWidth0017', 0, async (done: Function) => {
      await runCase('testTitleBarsWidth0017', async () => {
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
     * @tc.number SUB_TITLEBARS_REAL_0100
     * @tc.name testTitleBarsRealEditableV2Back0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsRealEditableV2Back0001', 0, async (done: Function) => {
      await runCase('testTitleBarsRealEditableV2Back0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await waitId('editableV2PageTitle');
        await clickId('editableV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_REAL_0200
     * @tc.name testTitleBarsRealSelectBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsRealSelectBack0002', 0, async (done: Function) => {
      await runCase('testTitleBarsRealSelectBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await waitId('selectPageTitle');
        await clickId('selectBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_REAL_0300
     * @tc.name testTitleBarsRealToolbarBack0003
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsRealToolbarBack0003', 0, async (done: Function) => {
      await runCase('testTitleBarsRealToolbarBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        await waitId('toolbarPageTitle');
        await clickId('toolbarBack');
        await waitId('pageTitle');
      }, done);
    });


    /**
     * @tc.number SUB_TITLEBARS_SCENE_0100
     * @tc.name testTitleBarsSceneEditableV2Actions0001
     * @tc.desc Verify editable title bar V2 save, cancel, and menu actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSceneEditableV2Actions0001', 0, async (done: Function) => {
      await runCase('testTitleBarsSceneEditableV2Actions0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await clickChildButton('editableTitleBarV2', -1);
        expect(await textOfId('editableV2Counts')).assertContain('save=1');
        await clickChildButton('editableTitleBarV2', 0);
        expect(await textOfId('editableV2Counts')).assertContain('cancel=1');
        await clickChildButton('editableTitleBarV2', 1);
        expect(await textOfId('editableV2Counts')).assertContain('menu=1');
        await clickId('editableV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_SCENE_0200
     * @tc.name testTitleBarsSceneSelectReset0002
     * @tc.desc Verify select title bar advances twice and resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSceneSelectReset0002', 0, async (done: Function) => {
      await runCase('testTitleBarsSceneSelectReset0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await clickId('selectNext');
        await clickId('selectNext');
        expect(await textOfId('selectStatus')).assertContain('selected=2/3');
        await clickId('selectReset');
        expect(await textOfId('selectStatus')).assertContain('selected=0/3');
        await clickId('selectBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_SCENE_0300
     * @tc.name testTitleBarsSceneToolbarShare0003
     * @tc.desc Verify toolbar share action and page back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSceneToolbarShare0003', 0, async (done: Function) => {
      await runCase('testTitleBarsSceneToolbarShare0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        expect(await clickAnyText(['Share', '分享'])).assertTrue();
        expect(await textOfId('toolbarStatus')).assertContain('label=Share');
        await clickId('toolbarBack');
        await waitId('pageTitle');
      }, done);
    });

  });
}
