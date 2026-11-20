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
import { clickId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.progressandindicator';
const ABILITY_NAME: string = 'EntryAbility';

export default function arcSliderTest() {
  describe('ArcSliderTest', () => {
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
     * @tc.number SUB_PROGRESS_ARCSLIDER_0100
     * @tc.name testProgressArcPage0001
     * @tc.desc Verify arc page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressArcPage0001', 0, async (done: Function) => {
      await runCase('testProgressArcPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await waitId('arcSlider');
        expect(await textOfId('arcProgress')).assertContain('progress=40');
        expect(await textOfId('arcEnlarged')).assertContain('enlarged=false');
        expect(await textOfId('arcEvent')).assertContain('event=ready');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ARCSLIDER_0200
     * @tc.name testProgressArcStep0002
     * @tc.desc Verify arc step behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressArcStep0002', 0, async (done: Function) => {
      await runCase('testProgressArcStep0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await clickId('arcMinus');
        expect(await textOfId('arcProgress')).assertContain('progress=30');
        await clickId('arcPlus');
        expect(await textOfId('arcProgress')).assertContain('progress=40');
        await clickId('arcSetHigh');
        expect(await textOfId('arcProgress')).assertContain('progress=80');
        expect(await textOfId('arcEvent')).assertContain('set=80');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_ARCSLIDER_0300
     * @tc.name testProgressArcReset0003
     * @tc.desc Verify arc reset behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressArcReset0003', 0, async (done: Function) => {
      await runCase('testProgressArcReset0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardArcSlider');
        await clickId('arcPlus');
        await clickId('arcReset');
        expect(await textOfId('arcProgress')).assertContain('progress=40');
        expect(await textOfId('arcEvent')).assertContain('set=40');
      }, done);
    });
  });
}
