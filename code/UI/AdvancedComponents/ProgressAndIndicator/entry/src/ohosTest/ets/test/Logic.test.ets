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
import { DownloadSession } from '../../../main/ets/utils/DownloadController';
import { ProgressUtils } from '../../../main/ets/utils/ProgressUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('ProgressLogicTest', () => {
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
     * @tc.number SUB_PROGRESS_LOGIC_0100
     * @tc.name testProgressLogicClamp0001
     * @tc.desc Verify logic clamp behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicClamp0001', 0, async (done: Function) => {
      await runCase('testProgressLogicClamp0001', async () => {
        expect(ProgressUtils.clamp(-5)).assertEqual(0);
        expect(ProgressUtils.clamp(105)).assertEqual(100);
        expect(ProgressUtils.clamp(50)).assertEqual(50);
        expect(ProgressUtils.clamp(42.6)).assertEqual(43);
        expect(ProgressUtils.clamp(5, 10, 20)).assertEqual(10);
        expect(ProgressUtils.clamp(5, 20, 10)).assertEqual(20);
        expect(ProgressUtils.step(95, 10)).assertEqual(100);
        expect(ProgressUtils.step(5, -10)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_LOGIC_0200
     * @tc.name testProgressLogicState0002
     * @tc.desc Verify logic state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicState0002', 0, async (done: Function) => {
      await runCase('testProgressLogicState0002', async () => {
        expect(ProgressUtils.state(0)).assertEqual('idle');
        expect(ProgressUtils.state(1)).assertEqual('running');
        expect(ProgressUtils.state(99)).assertEqual('running');
        expect(ProgressUtils.state(100)).assertEqual('completed');
        expect(ProgressUtils.formatPercent(45)).assertEqual('45%');
        expect(ProgressUtils.formatState(100)).assertEqual('progress=100, state=completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_LOGIC_0300
     * @tc.name testProgressLogicIndicator0003
     * @tc.desc Verify logic indicator behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicIndicator0003', 0, async (done: Function) => {
      await runCase('testProgressLogicIndicator0003', async () => {
        expect(ProgressUtils.indicatorIndex(-1, 3)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(1, 3)).assertEqual(1);
        expect(ProgressUtils.indicatorIndex(5, 3)).assertEqual(2);
        expect(ProgressUtils.indicatorIndex(1, 0)).assertEqual(0);
        expect(ProgressUtils.describeIndicator(1, 3, 'dot')).assertEqual('index=1/3, style=dot');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_LOGIC_0400
     * @tc.name testProgressLogicBreakpoint0004
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicBreakpoint0004', 0, async (done: Function) => {
      await runCase('testProgressLogicBreakpoint0004', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_LOGIC_0500
     * @tc.name testProgressLogicDevice0005
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicDevice0005', 0, async (done: Function) => {
      await runCase('testProgressLogicDevice0005', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_LOGIC_0600
     * @tc.name testProgressLogicDownload0006
     * @tc.desc Verify logic download behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLogicDownload0006', 0, async (done: Function) => {
      await runCase('testProgressLogicDownload0006', async () => {
        const session = new DownloadSession();
        expect(session.value()).assertEqual(0);
        expect(session.isRunning()).assertFalse();
        expect(session.advance()).assertEqual(0);
        session.begin();
        expect(session.isRunning()).assertTrue();
        expect(session.advance()).assertEqual(10);
        for (let i = 0; i < 9; i++) {
          session.advance();
        }
        expect(session.value()).assertEqual(100);
        expect(session.isRunning()).assertFalse();
        expect(session.isCompleted()).assertTrue();
        expect(session.advance()).assertEqual(100);
        session.reset();
        expect(session.value()).assertEqual(0);
        expect(session.isCompleted()).assertFalse();
      }, done);
    });
    /**
     * @tc.number SUB_PROGRESS_BOUNDARY_0100
     * @tc.name testProgressBoundary0007
     * @tc.desc Verify boundary values and fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressBoundary0007', 0, async (done: Function) => {
      await runCase('testProgressBoundary0007', async () => {
              expect(ProgressUtils.clamp(-1)).assertEqual(0);
              expect(ProgressUtils.clamp(101)).assertEqual(100);
              expect(ProgressUtils.clamp(0.4)).assertEqual(0);
              expect(ProgressUtils.clamp(99.6)).assertEqual(100);
              expect(ProgressUtils.step(95, 10)).assertEqual(100);
              expect(ProgressUtils.step(5, -10)).assertEqual(0);
              expect(ProgressUtils.state(0)).assertEqual('idle');
              expect(ProgressUtils.state(1)).assertEqual('running');
              expect(ProgressUtils.state(99)).assertEqual('running');
              expect(ProgressUtils.state(100)).assertEqual('completed');
              expect(ProgressUtils.state(101)).assertEqual('completed');
              expect(ProgressUtils.indicatorIndex(-1, 3)).assertEqual(0);
              expect(ProgressUtils.indicatorIndex(3, 3)).assertEqual(2);
              expect(ProgressUtils.indicatorIndex(0, 0)).assertEqual(0);
              expect(ProgressUtils.indicatorIndex(0, 1)).assertEqual(0);
              expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });
        /**
     * @tc.number SUB_PROGRESS_LIMIT_0100
     * @tc.name testProgressLimit0008
     * @tc.desc Verify additional boundary and empty-state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLimit0008', 0, async (done: Function) => {
      await runCase('testProgressLimit0008', async () => {
              const session = new DownloadSession();
              session.begin();
              for (let i = 0; i < 10; i++) {
                session.advance();
              }
              expect(session.value()).assertEqual(100);
              expect(session.isCompleted()).assertTrue();
              expect(session.advance()).assertEqual(100);
              session.reset();
              expect(session.value()).assertEqual(0);
              expect(session.isRunning()).assertFalse();
              expect(ProgressUtils.formatPercent(-5)).assertEqual('0%');
              expect(ProgressUtils.formatPercent(105)).assertEqual('100%');
              expect(ProgressUtils.describeIndicator(2, 3, 'digit')).assertEqual('index=2/3, style=digit');
              expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
              expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
      }, done);
    });
      });
}
