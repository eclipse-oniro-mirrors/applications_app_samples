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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { clickId, runCase, startAbility, startApp, waitId, existsId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.popupsandprompts';
const ABILITY_NAME: string = 'EntryAbility';
const LAUNCH_LIMIT: number = 15000;
const LOOP_COUNT: number = 2;

export default function stabilityTest() {
  describe('PopupsStabilityTest', () => {
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
     * @tc.number SUB_POPUPS_STABILITY_0100
     * @tc.name testPopupsLaunchTime0001
     * @tc.desc Verify launch time behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLaunchTime0001', 0, async (done: Function) => {
      await runCase('testPopupsLaunchTime0001', async () => {
        const startTime = Date.now();
        await startAbility(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle', 10000);
        const cost = Date.now() - startTime;
        hilog.info(0xF811, '[Sample_PopupsAndPrompts]', 'launch cost: %{public}d ms', cost);
        expect(cost < LAUNCH_LIMIT).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_STABILITY_0200
     * @tc.name testPopupsNavigationLoop0002
     * @tc.desc Verify navigation loop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsNavigationLoop0002', 0, async (done: Function) => {
      await runCase('testPopupsNavigationLoop0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        for (let i = 0; i < LOOP_COUNT; i++) {
          await clickId('cardPopupV2');
          await waitId('popupTitle');
          await clickId('popupBack');
          await waitId('pageTitle');
          await clickId('cardSelection');
          await waitId('selectionTitle');
          await clickId('selectionBack');
          await waitId('pageTitle');
        }
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
