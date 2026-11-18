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

const BUNDLE_NAME: string = 'com.samples.progressandindicator';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('ProgressAbilityTest', () => {
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
     * @tc.number SUB_PROGRESS_ABILITY_0100
     * @tc.name testProgressLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressLaunch0001', 0, async (done: Function) => {
      await runCase('testProgressLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardArcSlider')).assertTrue();
        expect(await existsId('cardProgressButton')).assertTrue();
        expect(await existsId('cardProgressButtonV2')).assertTrue();
        expect(await existsId('cardIndicator')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ABILITY_0200
     * @tc.name testProgressBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressBreakpoint0002', 0, async (done: Function) => {
      await runCase('testProgressBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ABILITY_0300
     * @tc.name testProgressOpenArc0003
     * @tc.desc Verify open arc behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressOpenArc0003', 0, async (done: Function) => {
      await runCase('testProgressOpenArc0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await waitId('arcTitle');
        await clickId('arcBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ABILITY_0400
     * @tc.name testProgressOpenPB0004
     * @tc.desc Verify open pb behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressOpenPB0004', 0, async (done: Function) => {
      await runCase('testProgressOpenPB0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await waitId('pbTitle');
        await clickId('pbBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ABILITY_0500
     * @tc.name testProgressOpenPBV20005
     * @tc.desc Verify open pbv2 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressOpenPBV20005', 0, async (done: Function) => {
      await runCase('testProgressOpenPBV20005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButtonV2');
        await waitId('pbv2Title');
        await clickId('pbv2Back');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ABILITY_0600
     * @tc.name testProgressOpenIndicator0006
     * @tc.desc Verify open indicator behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressOpenIndicator0006', 0, async (done: Function) => {
      await runCase('testProgressOpenIndicator0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardIndicator');
        await waitId('indicatorTitle');
        await clickId('indicatorBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
