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
import { clickId, existsId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.listperformance';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('ListPerformanceAbilityTest', () => {
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
     * @tc.number SUB_LISTPERF_ABILITY_0100
     * @tc.name testListPerformanceLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLaunch0001', 0, async (done: Function) => {
      await runCase('testListPerformanceLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardPlaceholder')).assertTrue();
        expect(await existsId('cardPrefetch')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_ABILITY_0200
     * @tc.name testListPerformanceBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceBreakpoint0002', 0, async (done: Function) => {
      await runCase('testListPerformanceBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_ABILITY_0300
     * @tc.name testListPerformanceOpenPlaceholder0003
     * @tc.desc Verify open placeholder behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceOpenPlaceholder0003', 0, async (done: Function) => {
      await runCase('testListPerformanceOpenPlaceholder0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await waitId('placeholderPageTitle');
        await clickId('placeholderBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_ABILITY_0400
     * @tc.name testListPerformanceOpenPrefetch0004
     * @tc.desc Verify open prefetch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceOpenPrefetch0004', 0, async (done: Function) => {
      await runCase('testListPerformanceOpenPrefetch0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchPageTitle');
        await clickId('prefetchBack');
        await waitId('pageTitle');
      }, done);
    });
  });
}
