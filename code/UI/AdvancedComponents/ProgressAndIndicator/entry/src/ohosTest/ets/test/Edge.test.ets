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
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.progressandindicator';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('ProgressEdgeTest', () => {
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
     * @tc.number SUB_PROGRESS_EDGE_0100
     * @tc.name testProgressEdgeClamp0001
     * @tc.desc Verify rounding boundaries and inverted custom ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressEdgeClamp0001', 0, async (done: Function) => {
      await runCase('testProgressEdgeClamp0001', async () => {
        expect(ProgressUtils.clamp(0.49)).assertEqual(0);
        expect(ProgressUtils.clamp(0.5)).assertEqual(1);
        expect(ProgressUtils.clamp(1.5)).assertEqual(2);
        expect(ProgressUtils.clamp(99.49)).assertEqual(99);
        expect(ProgressUtils.clamp(99.5)).assertEqual(100);
        expect(ProgressUtils.clamp(-0.1)).assertEqual(0);
        expect(ProgressUtils.clamp(10, 10, 20)).assertEqual(10);
        expect(ProgressUtils.clamp(20, 10, 20)).assertEqual(20);
        expect(ProgressUtils.clamp(30, 10, 20)).assertEqual(20);
        expect(ProgressUtils.clamp(5, 20, 10)).assertEqual(20);
        expect(ProgressUtils.clamp(15, 20, 10)).assertEqual(20);
        expect(ProgressUtils.step(10, 5, 10, 20)).assertEqual(15);
        expect(ProgressUtils.step(20, 5, 10, 20)).assertEqual(20);
        expect(ProgressUtils.step(10, -5, 10, 20)).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EDGE_0200
     * @tc.name testProgressEdgeSession0002
     * @tc.desc Verify restarting, resetting, and advancing a download session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressEdgeSession0002', 0, async (done: Function) => {
      await runCase('testProgressEdgeSession0002', async () => {
        const session = new DownloadSession();
        session.begin();
        expect(session.advance()).assertEqual(10);
        session.begin();
        expect(session.value()).assertEqual(0);
        expect(session.isRunning()).assertTrue();
        expect(session.isCompleted()).assertFalse();
        expect(session.advance()).assertEqual(10);
        for (let i = 0; i < 9; i++) {
          session.advance();
        }
        expect(session.value()).assertEqual(100);
        expect(session.isCompleted()).assertTrue();
        session.begin();
        expect(session.value()).assertEqual(0);
        expect(session.isRunning()).assertTrue();
        expect(session.isCompleted()).assertFalse();
        session.reset();
        expect(session.value()).assertEqual(0);
        expect(session.isRunning()).assertFalse();
        expect(session.isCompleted()).assertFalse();
        expect(session.advance()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EDGE_0300
     * @tc.name testProgressEdgeIndicator0003
     * @tc.desc Verify single-item, empty, and fractional progress boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressEdgeIndicator0003', 0, async (done: Function) => {
      await runCase('testProgressEdgeIndicator0003', async () => {
        expect(ProgressUtils.indicatorIndex(0, 1)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(1, 1)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(-1, 1)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(5, 1)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(0, -1)).assertEqual(0);
        expect(ProgressUtils.describeIndicator(5, 1, 'dot')).assertEqual('index=0/1, style=dot');
        expect(ProgressUtils.describeIndicator(-1, 0, 'digit')).assertEqual('index=0/0, style=digit');
        expect(ProgressUtils.formatPercent(0.5)).assertEqual('1%');
        expect(ProgressUtils.formatPercent(99.4)).assertEqual('99%');
        expect(ProgressUtils.formatPercent(99.5)).assertEqual('100%');
        expect(ProgressUtils.formatPercent(-0.5)).assertEqual('0%');
        expect(ProgressUtils.formatState(0.5)).assertEqual('progress=1, state=running');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EDGE_0400
     * @tc.name testProgressEdgeHistory0004
     * @tc.desc Verify progress button action history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressEdgeHistory0004', 0, async (done: Function) => {
      await runCase('testProgressEdgeHistory0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await clickId('pbReset');
        expect(await textOfId('pbActionCount')).assertEqual('1');
        await scrollToId('pbClearHistory');
        await clickId('pbClearHistory');
        await waitText('No actions yet');
        expect(await existsId('pbHistory')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0100
     * @tc.name testProgressMatrixClamp0005
     * @tc.desc Verify extreme values and equal custom bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixClamp0005', 0, async (done: Function) => {
      await runCase('testProgressMatrixClamp0005', async () => {
        expect(ProgressUtils.clamp(-100)).assertEqual(0);
        expect(ProgressUtils.clamp(0)).assertEqual(0);
        expect(ProgressUtils.clamp(100)).assertEqual(100);
        expect(ProgressUtils.clamp(200)).assertEqual(100);
        expect(ProgressUtils.clamp(10, 10, 10)).assertEqual(10);
        expect(ProgressUtils.step(0, 0)).assertEqual(0);
        expect(ProgressUtils.formatPercent(0)).assertEqual('0%');
        expect(ProgressUtils.formatPercent(100)).assertEqual('100%');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0200
     * @tc.name testProgressMatrixState0006
     * @tc.desc Verify idle, running, and completed boundaries including rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixState0006', 0, async (done: Function) => {
      await runCase('testProgressMatrixState0006', async () => {
        expect(ProgressUtils.state(-1)).assertEqual('idle');
        expect(ProgressUtils.state(0)).assertEqual('idle');
        expect(ProgressUtils.state(0.4)).assertEqual('idle');
        expect(ProgressUtils.state(0.5)).assertEqual('running');
        expect(ProgressUtils.state(99.4)).assertEqual('running');
        expect(ProgressUtils.state(99.5)).assertEqual('completed');
        expect(ProgressUtils.state(101)).assertEqual('completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0300
     * @tc.name testProgressMatrixIndicator0007
     * @tc.desc Verify indicator clamping for extreme and empty counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixIndicator0007', 0, async (done: Function) => {
      await runCase('testProgressMatrixIndicator0007', async () => {
        expect(ProgressUtils.indicatorIndex(-100, 5)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(100, 5)).assertEqual(4);
        expect(ProgressUtils.indicatorIndex(0, -5)).assertEqual(0);
        expect(ProgressUtils.describeIndicator(100, 5, 'dot')).assertEqual('index=4/5, style=dot');
        expect(ProgressUtils.describeIndicator(-100, 5, 'digit')).assertEqual('index=0/5, style=digit');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0400
     * @tc.name testProgressMatrixSession0008
     * @tc.desc Verify repeated restart and completion cycles of a download session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixSession0008', 0, async (done: Function) => {
      await runCase('testProgressMatrixSession0008', async () => {
        const session = new DownloadSession();
        session.begin();
        session.begin();
        for (let i = 0; i < 5; i++) {
          session.advance();
        }
        expect(session.value()).assertEqual(50);
        session.reset();
        session.begin();
        for (let i = 0; i < 10; i++) {
          session.advance();
        }
        expect(session.value()).assertEqual(100);
        expect(session.advance()).assertEqual(100);
        expect(session.isCompleted()).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0500
     * @tc.name testProgressMatrixFormat0009
     * @tc.desc Verify formatted state and percentage boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixFormat0009', 0, async (done: Function) => {
      await runCase('testProgressMatrixFormat0009', async () => {
        expect(ProgressUtils.formatState(-5)).assertEqual('progress=0, state=idle');
        expect(ProgressUtils.formatState(0.5)).assertEqual('progress=1, state=running');
        expect(ProgressUtils.formatState(99.5)).assertEqual('progress=100, state=completed');
        expect(ProgressUtils.formatPercent(99.4)).assertEqual('99%');
        expect(ProgressUtils.formatPercent(99.5)).assertEqual('100%');
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_MATRIX_0600
     * @tc.name testProgressMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testProgressMatrixBreakpointBounds0012', async () => {
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
     * @tc.number SUB_PROGRESS_MATRIX_0700
     * @tc.name testProgressMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testProgressMatrixGridBounds0013', async () => {
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
     * @tc.number SUB_PROGRESS_MATRIX_0800
     * @tc.name testProgressMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testProgressMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_MATRIX_0900
     * @tc.name testProgressMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testProgressMatrixDeviceInfo0015', async () => {
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
     * @tc.number SUB_PROGRESS_MATRIX_1000
     * @tc.name testProgressMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testProgressMatrixCustom0016', async () => {
        expect(ProgressUtils.step(0, 5, 10, 20)).assertEqual(10);
        expect(ProgressUtils.step(10, 5, 10, 20)).assertEqual(15);
        expect(ProgressUtils.step(15, 5, 10, 20)).assertEqual(20);
        expect(ProgressUtils.step(20, 5, 10, 20)).assertEqual(20);
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_EXTRA_1100
     * @tc.name testProgressExtraClampA0020
     * @tc.desc Verify clamp covers default and custom ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraClampA0020', 0, async (done: Function) => {
      await runCase('testProgressExtraClampA0020', async () => {
        expect(ProgressUtils.clamp(-1)).assertEqual(0);
        expect(ProgressUtils.clamp(50)).assertEqual(50);
        expect(ProgressUtils.clamp(101)).assertEqual(100);
        expect(ProgressUtils.clamp(5, 10, 20)).assertEqual(10);
        expect(ProgressUtils.clamp(25, 10, 20)).assertEqual(20);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1200
     * @tc.name testProgressExtraClampB0021
     * @tc.desc Verify clamp rounds fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraClampB0021', 0, async (done: Function) => {
      await runCase('testProgressExtraClampB0021', async () => {
        expect(ProgressUtils.clamp(0.4)).assertEqual(0);
        expect(ProgressUtils.clamp(0.5)).assertEqual(1);
        expect(ProgressUtils.clamp(99.4)).assertEqual(99);
        expect(ProgressUtils.clamp(99.5)).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1300
     * @tc.name testProgressExtraStateA0022
     * @tc.desc Verify state distinguishes idle, running, and completed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraStateA0022', 0, async (done: Function) => {
      await runCase('testProgressExtraStateA0022', async () => {
        expect(ProgressUtils.state(-1)).assertEqual('idle');
        expect(ProgressUtils.state(1)).assertEqual('running');
        expect(ProgressUtils.state(99)).assertEqual('running');
        expect(ProgressUtils.state(100)).assertEqual('completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1400
     * @tc.name testProgressExtraStateB0023
     * @tc.desc Verify state rounds fractional boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraStateB0023', 0, async (done: Function) => {
      await runCase('testProgressExtraStateB0023', async () => {
        expect(ProgressUtils.state(0.4)).assertEqual('idle');
        expect(ProgressUtils.state(0.5)).assertEqual('running');
        expect(ProgressUtils.state(99.5)).assertEqual('completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1500
     * @tc.name testProgressExtraIndicatorA0024
     * @tc.desc Verify indicator index clamps to count range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraIndicatorA0024', 0, async (done: Function) => {
      await runCase('testProgressExtraIndicatorA0024', async () => {
        expect(ProgressUtils.indicatorIndex(-1, 3)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(0, 3)).assertEqual(0);
        expect(ProgressUtils.indicatorIndex(3, 3)).assertEqual(2);
        expect(ProgressUtils.indicatorIndex(100, 3)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1600
     * @tc.name testProgressExtraIndicatorB0025
     * @tc.desc Verify indicator descriptions keep count and style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraIndicatorB0025', 0, async (done: Function) => {
      await runCase('testProgressExtraIndicatorB0025', async () => {
        expect(ProgressUtils.describeIndicator(0, 3, 'dot')).assertEqual('index=0/3, style=dot');
        expect(ProgressUtils.describeIndicator(5, 3, 'digit')).assertEqual('index=2/3, style=digit');
        expect(ProgressUtils.describeIndicator(0, 0, 'dot')).assertEqual('index=0/0, style=dot');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1700
     * @tc.name testProgressExtraSessionA0026
     * @tc.desc Verify session advances and completes deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraSessionA0026', 0, async (done: Function) => {
      await runCase('testProgressExtraSessionA0026', async () => {
        const session = new DownloadSession();
        session.begin();
        expect(session.advance()).assertEqual(10);
        expect(session.advance()).assertEqual(20);
        expect(session.isRunning()).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1800
     * @tc.name testProgressExtraSessionB0027
     * @tc.desc Verify session reset restores idle state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraSessionB0027', 0, async (done: Function) => {
      await runCase('testProgressExtraSessionB0027', async () => {
        const session = new DownloadSession();
        session.begin();
        session.advance();
        session.reset();
        expect(session.value()).assertEqual(0);
        expect(session.isRunning()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_1900
     * @tc.name testProgressExtraSessionC0028
     * @tc.desc Verify session restart clears completed state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraSessionC0028', 0, async (done: Function) => {
      await runCase('testProgressExtraSessionC0028', async () => {
        const session = new DownloadSession();
        session.begin();
        for (let i = 0; i < 10; i++) {
          session.advance();
        }
        expect(session.isCompleted()).assertTrue();
        session.begin();
        expect(session.value()).assertEqual(0);
        expect(session.isCompleted()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_EXTRA_2000
     * @tc.name testProgressExtraFormat0029
     * @tc.desc Verify percentage and state formatting stay bounded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressExtraFormat0029', 0, async (done: Function) => {
      await runCase('testProgressExtraFormat0029', async () => {
        expect(ProgressUtils.formatPercent(-1)).assertEqual('0%');
        expect(ProgressUtils.formatPercent(50)).assertEqual('50%');
        expect(ProgressUtils.formatPercent(101)).assertEqual('100%');
        expect(ProgressUtils.formatState(0)).assertEqual('progress=0, state=idle');
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_DEEP_1100
     * @tc.name testProgressDeepClampA0030
     * @tc.desc Verify clamp keeps default lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepClampA0030', 0, async (done: Function) => {
      await runCase('testProgressDeepClampA0030', async () => {
        expect(ProgressUtils.clamp(-10)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1200
     * @tc.name testProgressDeepClampB0031
     * @tc.desc Verify clamp keeps default upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepClampB0031', 0, async (done: Function) => {
      await runCase('testProgressDeepClampB0031', async () => {
        expect(ProgressUtils.clamp(110)).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1300
     * @tc.name testProgressDeepStateA0032
     * @tc.desc Verify zero is idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepStateA0032', 0, async (done: Function) => {
      await runCase('testProgressDeepStateA0032', async () => {
        expect(ProgressUtils.state(0)).assertEqual('idle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1400
     * @tc.name testProgressDeepStateB0033
     * @tc.desc Verify hundred is completed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepStateB0033', 0, async (done: Function) => {
      await runCase('testProgressDeepStateB0033', async () => {
        expect(ProgressUtils.state(100)).assertEqual('completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1500
     * @tc.name testProgressDeepIndexA0034
     * @tc.desc Verify zero count clamps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepIndexA0034', 0, async (done: Function) => {
      await runCase('testProgressDeepIndexA0034', async () => {
        expect(ProgressUtils.indicatorIndex(1, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1600
     * @tc.name testProgressDeepIndexB0035
     * @tc.desc Verify single count clamps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepIndexB0035', 0, async (done: Function) => {
      await runCase('testProgressDeepIndexB0035', async () => {
        expect(ProgressUtils.indicatorIndex(5, 1)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1700
     * @tc.name testProgressDeepSessionA0036
     * @tc.desc Verify new session starts idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepSessionA0036', 0, async (done: Function) => {
      await runCase('testProgressDeepSessionA0036', async () => {
        const session = new DownloadSession();
        expect(session.isRunning()).assertFalse();
        expect(session.value()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1800
     * @tc.name testProgressDeepSessionB0037
     * @tc.desc Verify begin starts a session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepSessionB0037', 0, async (done: Function) => {
      await runCase('testProgressDeepSessionB0037', async () => {
        const session = new DownloadSession();
        session.begin();
        expect(session.isRunning()).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_1900
     * @tc.name testProgressDeepSessionC0038
     * @tc.desc Verify reset stops a running session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepSessionC0038', 0, async (done: Function) => {
      await runCase('testProgressDeepSessionC0038', async () => {
        const session = new DownloadSession();
        session.begin();
        session.reset();
        expect(session.isRunning()).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_DEEP_2000
     * @tc.name testProgressDeepFormatA0039
     * @tc.desc Verify format state keeps idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressDeepFormatA0039', 0, async (done: Function) => {
      await runCase('testProgressDeepFormatA0039', async () => {
        expect(ProgressUtils.formatState(0)).assertEqual('progress=0, state=idle');
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_FINAL_1100
     * @tc.name testProgressFinalA0040
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalA0040', 0, async (done: Function) => {
      await runCase('testProgressFinalA0040', async () => {
        expect(ProgressUtils.clamp(-1)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1200
     * @tc.name testProgressFinalB0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalB0041', 0, async (done: Function) => {
      await runCase('testProgressFinalB0041', async () => {
        expect(ProgressUtils.clamp(101)).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1300
     * @tc.name testProgressFinalC0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalC0042', 0, async (done: Function) => {
      await runCase('testProgressFinalC0042', async () => {
        expect(ProgressUtils.state(0)).assertEqual('idle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1400
     * @tc.name testProgressFinalD0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalD0043', 0, async (done: Function) => {
      await runCase('testProgressFinalD0043', async () => {
        expect(ProgressUtils.state(100)).assertEqual('completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1500
     * @tc.name testProgressFinalE0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalE0044', 0, async (done: Function) => {
      await runCase('testProgressFinalE0044', async () => {
        expect(ProgressUtils.indicatorIndex(-1, 3)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1600
     * @tc.name testProgressFinalF0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalF0045', 0, async (done: Function) => {
      await runCase('testProgressFinalF0045', async () => {
        expect(ProgressUtils.indicatorIndex(3, 3)).assertEqual(2);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1700
     * @tc.name testProgressFinalG0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalG0046', 0, async (done: Function) => {
      await runCase('testProgressFinalG0046', async () => {
        const session = new DownloadSession();
        session.begin();
        expect(session.advance()).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1800
     * @tc.name testProgressFinalH0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalH0047', 0, async (done: Function) => {
      await runCase('testProgressFinalH0047', async () => {
        const session = new DownloadSession();
        session.begin();
        session.reset();
        expect(session.value()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_1900
     * @tc.name testProgressFinalI0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalI0048', 0, async (done: Function) => {
      await runCase('testProgressFinalI0048', async () => {
        expect(ProgressUtils.formatPercent(101)).assertEqual('100%');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_FINAL_2000
     * @tc.name testProgressFinalJ0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressFinalJ0049', 0, async (done: Function) => {
      await runCase('testProgressFinalJ0049', async () => {
        expect(ProgressUtils.formatState(0)).assertEqual('progress=0, state=idle');
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_WIDTH_0100
     * @tc.name testProgressWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0001', 0, async (done: Function) => {
      await runCase('testProgressWidth0001', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0200
     * @tc.name testProgressWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0002', 0, async (done: Function) => {
      await runCase('testProgressWidth0002', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0300
     * @tc.name testProgressWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0003', 0, async (done: Function) => {
      await runCase('testProgressWidth0003', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0400
     * @tc.name testProgressWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0004', 0, async (done: Function) => {
      await runCase('testProgressWidth0004', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0500
     * @tc.name testProgressWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0005', 0, async (done: Function) => {
      await runCase('testProgressWidth0005', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0600
     * @tc.name testProgressWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0006', 0, async (done: Function) => {
      await runCase('testProgressWidth0006', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0700
     * @tc.name testProgressWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0007', 0, async (done: Function) => {
      await runCase('testProgressWidth0007', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0800
     * @tc.name testProgressWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0008', 0, async (done: Function) => {
      await runCase('testProgressWidth0008', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_0900
     * @tc.name testProgressWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0009', 0, async (done: Function) => {
      await runCase('testProgressWidth0009', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1000
     * @tc.name testProgressWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0010', 0, async (done: Function) => {
      await runCase('testProgressWidth0010', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1100
     * @tc.name testProgressWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0011', 0, async (done: Function) => {
      await runCase('testProgressWidth0011', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1200
     * @tc.name testProgressWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0012', 0, async (done: Function) => {
      await runCase('testProgressWidth0012', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1300
     * @tc.name testProgressWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0013', 0, async (done: Function) => {
      await runCase('testProgressWidth0013', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1400
     * @tc.name testProgressWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0014', 0, async (done: Function) => {
      await runCase('testProgressWidth0014', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1500
     * @tc.name testProgressWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0015', 0, async (done: Function) => {
      await runCase('testProgressWidth0015', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1600
     * @tc.name testProgressWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0016', 0, async (done: Function) => {
      await runCase('testProgressWidth0016', async () => {
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
     * @tc.number SUB_PROGRESS_WIDTH_1700
     * @tc.name testProgressWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressWidth0017', 0, async (done: Function) => {
      await runCase('testProgressWidth0017', async () => {
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
     * @tc.number SUB_PROGRESS_REAL_0100
     * @tc.name testProgressRealPbv2Back0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressRealPbv2Back0001', 0, async (done: Function) => {
      await runCase('testProgressRealPbv2Back0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButtonV2');
        await waitId('pbv2Title');
        await clickId('pbv2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_REAL_0200
     * @tc.name testProgressRealIndicatorBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressRealIndicatorBack0002', 0, async (done: Function) => {
      await runCase('testProgressRealIndicatorBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await waitId('indicatorTitle');
        await clickId('indicatorBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_REAL_0300
     * @tc.name testProgressRealArcBack0003
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressRealArcBack0003', 0, async (done: Function) => {
      await runCase('testProgressRealArcBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await waitId('arcTitle');
        await clickId('arcBack');
        await waitId('pageTitle');
      }, done);
    });


    /**
     * @tc.number SUB_PROGRESS_SCENE_0100
     * @tc.name testProgressSceneIndicatorSequence0001
     * @tc.desc Verify indicator jump, next, and previous sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressSceneIndicatorSequence0001', 0, async (done: Function) => {
      await runCase('testProgressSceneIndicatorSequence0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await clickId('indicatorJump');
        expect(await textOfId('indicatorPageTitle')).assertContain('Page 3');
        await clickId('indicatorNext');
        expect(await textOfId('indicatorStatus')).assertContain('index=2/3');
        await clickId('indicatorPrev');
        expect(await textOfId('indicatorStatus')).assertContain('index=1/3');
        await clickId('indicatorBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_SCENE_0200
     * @tc.name testProgressSceneArcSequence0002
     * @tc.desc Verify arc steps accumulate and reset to the initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressSceneArcSequence0002', 0, async (done: Function) => {
      await runCase('testProgressSceneArcSequence0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await clickId('arcPlus');
        await clickId('arcPlus');
        await clickId('arcPlus');
        expect(await textOfId('arcProgress')).assertContain('progress=70');
        await clickId('arcReset');
        expect(await textOfId('arcProgress')).assertContain('progress=40');
        await clickId('arcBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_SCENE_0300
     * @tc.name testProgressScenePbv2Toggle0003
     * @tc.desc Verify progress button V2 disable and enable sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressScenePbv2Toggle0003', 0, async (done: Function) => {
      await runCase('testProgressScenePbv2Toggle0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButtonV2');
        await clickId('pbv2Toggle');
        expect(await textOfId('pbv2Enabled')).assertContain('enabled=false');
        await clickId('pbv2Toggle');
        expect(await textOfId('pbv2Enabled')).assertContain('enabled=true');
        await clickId('pbv2Back');
        await waitId('pageTitle');
      }, done);
    });

  });
}
