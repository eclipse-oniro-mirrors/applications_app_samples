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
import { display, SplitPolicy } from '@kit.ArkUI';
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { NavigationUtils } from '../../../main/ets/utils/NavigationUtils';
import { DeviceUtils } from '../../../main/ets/utils/DeviceUtils';
import { FoldConfigUtils } from '../../../main/ets/utils/FoldConfigUtils';
import { WindowUtils } from '../../../main/ets/utils/WindowUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('NavigationLogicTest', () => {
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
     * @tc.number SUB_NAVIGATION_LOGIC_0100
     * @tc.name testNavigationAndLayoutLogicBreakpoint0001
     * @tc.desc Verify navigation and layout logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicBreakpoint0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicBreakpoint0001', async () => {
        expect(BreakpointUtils.resolve(320)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.columnCount(500)).assertEqual(1);
        expect(BreakpointUtils.columnCount(700)).assertEqual(2);
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_LOGIC_0200
     * @tc.name testNavigationAndLayoutLogicStack0002
     * @tc.desc Verify navigation and layout logic stack behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicStack0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicStack0002', async () => {
        expect(NavigationUtils.policyName(SplitPolicy.HOME_PAGE)).assertEqual('HOME_PAGE');
        expect(NavigationUtils.policyName(SplitPolicy.DETAIL_PAGE)).assertEqual('DETAIL_PAGE');
        expect(NavigationUtils.policyName(SplitPolicy.FULL_PAGE)).assertEqual('FULL_PAGE');
        expect(NavigationUtils.pathSummary([])).assertEqual('(empty)');
        expect(NavigationUtils.pathSummary(['home', 'detail'])).assertEqual('home > detail');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_LOGIC_0300
     * @tc.name testNavigationAndLayoutLogicFold0003
     * @tc.desc Verify navigation and layout logic fold behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicFold0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicFold0003', async () => {
        expect(DeviceUtils.foldStatusName(display.FoldStatus.FOLD_STATUS_FOLDED)).assertEqual('folded');
        expect(DeviceUtils.foldStatusName(display.FoldStatus.FOLD_STATUS_HALF_FOLDED)).assertEqual('half-folded');
        expect(DeviceUtils.foldStatusName(display.FoldStatus.FOLD_STATUS_EXPANDED)).assertEqual('expanded');
        expect(DeviceUtils.foldStatusName(display.FoldStatus.FOLD_STATUS_UNKNOWN)).assertEqual('unknown');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_LOGIC_0400
     * @tc.name testNavigationAndLayoutLogicResponsive0004
     * @tc.desc Verify navigation and layout logic responsive behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicResponsive0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicResponsive0004', async () => {
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
        expect(BreakpointUtils.describe(700)).assertContain('breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_LOGIC_0500
     * @tc.name testNavigationAndLayoutLogicFoldConfig0005
     * @tc.desc Verify navigation and layout logic fold config behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicFoldConfig0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicFoldConfig0005', async () => {
        expect(FoldConfigUtils.ratioName(1)).assertEqual('1V1');
        expect(FoldConfigUtils.ratioName(0.6666666666666666)).assertEqual('2V3');
        expect(FoldConfigUtils.ratioName(1.5)).assertEqual('3V2');
        expect(FoldConfigUtils.positionName(1)).assertEqual('TOP');
        expect(FoldConfigUtils.positionName(2)).assertEqual('BOTTOM');
        expect(FoldConfigUtils.summary('3V2', 'TOP', true, false, true, '1V1', true))
          .assertContain('animation=true');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_LOGIC_0600
     * @tc.name testNavigationAndLayoutLogicWindow0006
     * @tc.desc Verify navigation and layout logic window behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLogicWindow0006', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLogicWindow0006', async () => {
        const screen = WindowUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(WindowUtils.deviceType().length > 0).assertTrue();
      }, done);
    });
  });
}
