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
import { PromptUtils } from '../../../main/ets/utils/PromptUtils';
import {
  clickId,
  clickText,
  existsId,
  pressBack,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.popupsandprompts';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('PopupsEdgeTest', () => {
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
     * @tc.number SUB_POPUPS_EDGE_0100
     * @tc.name testPopupsEdgeRange0001
     * @tc.desc Verify zero, negative, reversed, and single-item range boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeRange0001', 0, async (done: Function) => {
      await runCase('testPopupsEdgeRange0001', async () => {
        expect(PromptUtils.clampRange(0, 0, 0).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(-1, -2, 10).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(10, 20, 10).join('-')).assertEqual('10-10');
        expect(PromptUtils.clampRange(20, 10, 10).join('-')).assertEqual('10-10');
        expect(PromptUtils.clampRange(0, 10, 1).join('-')).assertEqual('0-1');
        expect(PromptUtils.clampRange(1, 0, 1).join('-')).assertEqual('0-1');
        expect(PromptUtils.clampRange(2, 8, 8).join('-')).assertEqual('2-8');
        expect(PromptUtils.selectionSummary(0, 0, 0)).assertEqual('selected 0-0 of 0');
        expect(PromptUtils.selectionSummary(9, 2, 5)).assertEqual('selected 2-5 of 5');
        expect(PromptUtils.selectionSummary(5, 5, 5)).assertEqual('selected 5-5 of 5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EDGE_0200
     * @tc.name testPopupsEdgeSummary0002
     * @tc.desc Verify empty labels, negative counters, and repeated toggle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeSummary0002', 0, async (done: Function) => {
      await runCase('testPopupsEdgeSummary0002', async () => {
        expect(PromptUtils.formatCount('', 0)).assertEqual(': 0');
        expect(PromptUtils.formatCount('x', -1)).assertEqual('x: -1');
        expect(PromptUtils.actionSummary('', 0)).assertEqual(' x0');
        expect(PromptUtils.actionSummary('menu', -2)).assertEqual('menu x-2');
        expect(PromptUtils.describeRange(-3, -1)).assertEqual('range=-3--1');
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(true))).assertTrue();
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(false))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EDGE_0300
     * @tc.name testPopupsEdgeBacks0003
     * @tc.desc Verify exception prompt pages return through their back buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeBacks0003', 0, async (done: Function) => {
      await runCase('testPopupsEdgeBacks0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardException');
        await waitId('exceptionStatus');
        await clickId('exceptionBack');
        await waitId('pageTitle');
        await clickId('cardExceptionV2');
        await waitId('exceptionV2Status');
        await clickId('exceptionV2Back');
        await waitId('pageTitle');
      }, done);
    });
  });
}
