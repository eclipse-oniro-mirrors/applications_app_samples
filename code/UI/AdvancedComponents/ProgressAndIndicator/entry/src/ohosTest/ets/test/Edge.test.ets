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
import { DownloadSession } from '../../../main/ets/utils/DownloadController';
import { ProgressUtils } from '../../../main/ets/utils/ProgressUtils';
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
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
  });
}
