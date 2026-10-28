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
import { clickId, runCase, startApp, textOfId, waitId, waitIdContains } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.progressandindicator';
const ABILITY_NAME: string = 'EntryAbility';

export default function indicatorTest() {
  describe('IndicatorTest', () => {
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
     * @tc.number SUB_PROGRESS_INDICATOR_0100
     * @tc.name testProgressIndicatorPage0001
     * @tc.desc Verify indicator page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressIndicatorPage0001', 0, async (done: Function) => {
      await runCase('testProgressIndicatorPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await waitId('indicatorComponent');
        expect(await textOfId('indicatorPageTitle')).assertContain('Page 1');
        expect(await textOfId('indicatorStatus')).assertContain('index=0/3');
        expect(await textOfId('indicatorStatus')).assertContain('style=dot');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_INDICATOR_0200
     * @tc.name testProgressIndicatorNextPrev0002
     * @tc.desc Verify indicator next prev behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressIndicatorNextPrev0002', 0, async (done: Function) => {
      await runCase('testProgressIndicatorNextPrev0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await clickId('indicatorNext');
        await waitIdContains('indicatorStatus', 'index=1/3');
        expect(await textOfId('indicatorPageTitle')).assertContain('Page 2');
        await clickId('indicatorNext');
        await waitIdContains('indicatorStatus', 'index=2/3');
        await clickId('indicatorPrev');
        await waitIdContains('indicatorStatus', 'index=1/3');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_INDICATOR_0300
     * @tc.name testProgressIndicatorJump0003
     * @tc.desc Verify indicator jump behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressIndicatorJump0003', 0, async (done: Function) => {
      await runCase('testProgressIndicatorJump0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await clickId('indicatorJump');
        await waitIdContains('indicatorStatus', 'index=2/3');
        expect(await textOfId('indicatorPageTitle')).assertContain('Page 3');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_INDICATOR_0400
     * @tc.name testProgressIndicatorStyle0004
     * @tc.desc Verify indicator style behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressIndicatorStyle0004', 0, async (done: Function) => {
      await runCase('testProgressIndicatorStyle0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await clickId('indicatorDigits');
        expect(await textOfId('indicatorStatus')).assertContain('style=digit');
        await clickId('indicatorDots');
        expect(await textOfId('indicatorStatus')).assertContain('style=dot');
      }, done);
    });
  });
}
