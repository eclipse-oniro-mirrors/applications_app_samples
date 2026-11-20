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
import { PromptUtils } from '../../../main/ets/utils/PromptUtils';
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('PopupsLogicTest', () => {
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
     * @tc.number SUB_POPUPS_LOGIC_0100
     * @tc.name testPopupsLogicPrompt0001
     * @tc.desc Verify logic prompt behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLogicPrompt0001', 0, async (done: Function) => {
      await runCase('testPopupsLogicPrompt0001', async () => {
        expect(PromptUtils.formatCount('confirm', 2)).assertEqual('confirm: 2');
        expect(PromptUtils.toggleShown(true)).assertFalse();
        expect(PromptUtils.toggleShown(false)).assertTrue();
        expect(PromptUtils.describeRange(1, 5)).assertEqual('range=1-5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_LOGIC_0200
     * @tc.name testPopupsLogicRange0002
     * @tc.desc Verify logic range behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLogicRange0002', 0, async (done: Function) => {
      await runCase('testPopupsLogicRange0002', async () => {
        expect(PromptUtils.clampRange(-2, 5, 10).join('-')).assertEqual('0-5');
        expect(PromptUtils.clampRange(8, 20, 10).join('-')).assertEqual('8-10');
        expect(PromptUtils.clampRange(6, 2, 10).join('-')).assertEqual('2-6');
        expect(PromptUtils.clampRange(0, 0, 0).join('-')).assertEqual('0-0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_LOGIC_0300
     * @tc.name testPopupsLogicBreakpoint0003
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLogicBreakpoint0003', 0, async (done: Function) => {
      await runCase('testPopupsLogicBreakpoint0003', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_LOGIC_0400
     * @tc.name testPopupsLogicSelection0004
     * @tc.desc Verify logic selection behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLogicSelection0004', 0, async (done: Function) => {
      await runCase('testPopupsLogicSelection0004', async () => {
        expect(PromptUtils.selectionSummary(2, 5, 10)).assertEqual('selected 2-5 of 10');
        expect(PromptUtils.selectionSummary(-1, 20, 10)).assertEqual('selected 0-10 of 10');
        expect(PromptUtils.actionSummary('confirm', 3)).assertEqual('confirm x3');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_LOGIC_0500
     * @tc.name testPopupsLogicDevice0005
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLogicDevice0005', 0, async (done: Function) => {
      await runCase('testPopupsLogicDevice0005', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });
    /**
     * @tc.number SUB_POPUPS_BOUNDARY_0100
     * @tc.name testPopupsBoundary0006
     * @tc.desc Verify boundary values and fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsBoundary0006', 0, async (done: Function) => {
      await runCase('testPopupsBoundary0006', async () => {
              expect(PromptUtils.clampRange(-5, -1, 10).join('-')).assertEqual('0-0');
              expect(PromptUtils.clampRange(8, 2, 10).join('-')).assertEqual('2-8');
              expect(PromptUtils.clampRange(0, 20, 10).join('-')).assertEqual('0-10');
              expect(PromptUtils.clampRange(5, 5, 10).join('-')).assertEqual('5-5');
              expect(PromptUtils.selectionSummary(-5, 20, 10)).assertEqual('selected 0-10 of 10');
              expect(PromptUtils.toggleShown(true)).assertFalse();
              expect(PromptUtils.toggleShown(false)).assertTrue();
              expect(PromptUtils.actionSummary('save', 0)).assertEqual('save x0');
              expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
              expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
      }, done);
    });
        /**
     * @tc.number SUB_POPUPS_LIMIT_0100
     * @tc.name testPopupsLimit0007
     * @tc.desc Verify additional boundary and empty-state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLimit0007', 0, async (done: Function) => {
      await runCase('testPopupsLimit0007', async () => {
              expect(PromptUtils.clampRange(10, 0, 0).join('-')).assertEqual('0-0');
              expect(PromptUtils.clampRange(2, 8, 8).join('-')).assertEqual('2-8');
              expect(PromptUtils.selectionSummary(8, 2, 10)).assertEqual('selected 2-8 of 10');
              expect(PromptUtils.formatCount('item', 0)).assertEqual('item: 0');
              expect(PromptUtils.describeRange(-1, 1)).assertEqual('range=-1-1');
              expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
              expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
              expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
              expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });
      });
}
