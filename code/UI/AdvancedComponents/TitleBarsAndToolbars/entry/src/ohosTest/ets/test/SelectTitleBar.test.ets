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

const BUNDLE_NAME: string = 'com.samples.titlebarsandtoolbars';
const ABILITY_NAME: string = 'EntryAbility';

export default function selectTest() {
  describe('SelectTitleBarTest', () => {
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
     * @tc.number SUB_TITLEBARS_SELECTTITLEBAR_0100
     * @tc.name testTitleBarsSelectPage0001
     * @tc.desc Verify select page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSelectPage0001', 0, async (done: Function) => {
      await runCase('testTitleBarsSelectPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await waitId('selectTitleBar');
        expect(await textOfId('selectStatus')).assertContain('selected=0/3');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_SELECTTITLEBAR_0200
     * @tc.name testTitleBarsSelectNext0002
     * @tc.desc Verify select next behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSelectNext0002', 0, async (done: Function) => {
      await runCase('testTitleBarsSelectNext0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await clickId('selectNext');
        expect(await textOfId('selectStatus')).assertContain('selected=1/3');
        await clickId('selectNext');
        expect(await textOfId('selectStatus')).assertContain('selected=2/3');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_SELECTTITLEBAR_0300
     * @tc.name testTitleBarsSelectReset0003
     * @tc.desc Verify select reset behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsSelectReset0003', 0, async (done: Function) => {
      await runCase('testTitleBarsSelectReset0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await clickId('selectNext');
        await clickId('selectReset');
        expect(await textOfId('selectStatus')).assertContain('selected=0/3');
      }, done);
    });
  });
}
