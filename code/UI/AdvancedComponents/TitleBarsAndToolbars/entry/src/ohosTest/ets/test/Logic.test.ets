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
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('TitleBarsLogicTest', () => {
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
     * @tc.number SUB_TITLEBARS_LOGIC_0100
     * @tc.name testTitleBarsLogicIndex0001
     * @tc.desc Verify logic index behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicIndex0001', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicIndex0001', async () => {
        expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
        expect(TitleBarUtils.clampIndex(1, 3)).assertEqual(1);
        expect(TitleBarUtils.clampIndex(5, 3)).assertEqual(2);
        expect(TitleBarUtils.clampIndex(0, 0)).assertEqual(0);
        expect(TitleBarUtils.nextIndex(0, 3)).assertEqual(1);
        expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_LOGIC_0200
     * @tc.name testTitleBarsLogicBadge0002
     * @tc.desc Verify logic badge behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicBadge0002', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicBadge0002', async () => {
        expect(TitleBarUtils.badgeText(0)).assertEqual('');
        expect(TitleBarUtils.badgeText(5)).assertEqual('5');
        expect(TitleBarUtils.badgeText(99)).assertEqual('99');
        expect(TitleBarUtils.badgeText(120)).assertEqual('99+');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_LOGIC_0300
     * @tc.name testTitleBarsLogicDescribe0003
     * @tc.desc Verify logic describe behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicDescribe0003', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicDescribe0003', async () => {
        expect(TitleBarUtils.formatAction('save', 2)).assertEqual('action=save, count=2');
        expect(TitleBarUtils.describeIndex('selected', 1, 3)).assertEqual('selected=1/3');
        expect(TitleBarUtils.describeTab(1, 'Details')).assertEqual('tab=1, title=Details');
        expect(TitleBarUtils.describeToolbar(2, 'Share', 3)).assertEqual('index=2, label=Share, count=3');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_LOGIC_0400
     * @tc.name testTitleBarsLogicBreakpoint0004
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicBreakpoint0004', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicBreakpoint0004', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.contentMaxWidth(500)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
        expect(BreakpointUtils.contentMaxWidth(1000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(500)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(700)).assertEqual(24);
        expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_LOGIC_0500
     * @tc.name testTitleBarsLogicDevice0005
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicDevice0005', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicDevice0005', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_LOGIC_0600
     * @tc.name testTitleBarsLogicActions0006
     * @tc.desc Verify logic actions behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLogicActions0006', 0, async (done: Function) => {
      await runCase('testTitleBarsLogicActions0006', async () => {
        const actions = new TitleBarActions('LogicTest');
        expect(actions.summary()).assertEqual('save=0, cancel=0, menu=0');
        expect(actions.save()).assertEqual('save=1, cancel=0, menu=0');
        expect(actions.save()).assertEqual('save=2, cancel=0, menu=0');
        expect(actions.cancel()).assertEqual('save=2, cancel=1, menu=0');
        expect(actions.menu()).assertEqual('save=2, cancel=1, menu=1');
        expect(actions.reset()).assertEqual('save=0, cancel=0, menu=0');
      }, done);
    });
    /**
     * @tc.number SUB_TITLEBARS_BOUNDARY_0100
     * @tc.name testTitleBarsBoundary0007
     * @tc.desc Verify boundary values and fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsBoundary0007', 0, async (done: Function) => {
      await runCase('testTitleBarsBoundary0007', async () => {
              expect(TitleBarUtils.clampIndex(-1, 3)).assertEqual(0);
              expect(TitleBarUtils.clampIndex(2, 3)).assertEqual(2);
              expect(TitleBarUtils.clampIndex(3, 3)).assertEqual(2);
              expect(TitleBarUtils.clampIndex(0, 0)).assertEqual(0);
              expect(TitleBarUtils.nextIndex(2, 3)).assertEqual(0);
              expect(TitleBarUtils.nextIndex(-1, 3)).assertEqual(1);
              expect(TitleBarUtils.nextIndex(0, 0)).assertEqual(0);
              expect(TitleBarUtils.badgeText(-1)).assertEqual('');
              expect(TitleBarUtils.badgeText(0)).assertEqual('');
              expect(TitleBarUtils.badgeText(1)).assertEqual('1');
              expect(TitleBarUtils.badgeText(99)).assertEqual('99');
              expect(TitleBarUtils.badgeText(99.4)).assertEqual('99');
              expect(TitleBarUtils.badgeText(99.6)).assertEqual('99+');
              expect(TitleBarUtils.badgeText(100)).assertEqual('99+');
              expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
              expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
              expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
              expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
      }, done);
    });
        /**
     * @tc.number SUB_TITLEBARS_LIMIT_0100
     * @tc.name testTitleBarsLimit0008
     * @tc.desc Verify additional boundary and empty-state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLimit0008', 0, async (done: Function) => {
      await runCase('testTitleBarsLimit0008', async () => {
              expect(TitleBarUtils.nextIndex(2, 1)).assertEqual(0);
              expect(TitleBarUtils.nextIndex(0, 1)).assertEqual(0);
              expect(TitleBarUtils.clampIndex(-2, 2)).assertEqual(0);
              expect(TitleBarUtils.badgeText(1000)).assertEqual('99+');
              expect(TitleBarUtils.describeTab(5, 'Overflow')).assertEqual('tab=2, title=Overflow');
              expect(TitleBarUtils.describeToolbar(9, 'Overflow', 1)).assertEqual('index=9, label=Overflow, count=1');
              expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
              expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
              expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
              expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });
      });
}
