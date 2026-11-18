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
import { clickAnyText, clickId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.titlebarsandtoolbars';
const ABILITY_NAME: string = 'EntryAbility';

export default function toolbarTest() {
  describe('ToolBarV2Test', () => {
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
     * @tc.number SUB_TITLEBARS_TOOLBARV2_0100
     * @tc.name testTitleBarsToolbarPage0001
     * @tc.desc Verify toolbar page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsToolbarPage0001', 0, async (done: Function) => {
      await runCase('testTitleBarsToolbarPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        await waitId('toolBar');
        expect(await textOfId('toolbarActive')).assertContain('active=-1');
        expect(await textOfId('toolbarStatus')).assertContain('count=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_TOOLBARV2_0200
     * @tc.name testTitleBarsToolbarEdit0002
     * @tc.desc Verify toolbar edit behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsToolbarEdit0002', 0, async (done: Function) => {
      await runCase('testTitleBarsToolbarEdit0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        expect(await clickAnyText(['Edit', '编辑'])).assertTrue();
        expect(await textOfId('toolbarStatus')).assertContain('index=1');
        expect(await textOfId('toolbarStatus')).assertContain('label=Edit');
        expect(await textOfId('toolbarStatus')).assertContain('count=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_TOOLBARV2_0300
     * @tc.name testTitleBarsToolbarShare0003
     * @tc.desc Verify toolbar share behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsToolbarShare0003', 0, async (done: Function) => {
      await runCase('testTitleBarsToolbarShare0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        expect(await clickAnyText(['Share', '分享'])).assertTrue();
        expect(await textOfId('toolbarStatus')).assertContain('index=2');
        expect(await textOfId('toolbarStatus')).assertContain('label=Share');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_TOOLBARV2_0400
     * @tc.name testTitleBarsToolbarDisabled0004
     * @tc.desc Verify toolbar disabled behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsToolbarDisabled0004', 0, async (done: Function) => {
      await runCase('testTitleBarsToolbarDisabled0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        expect(await clickAnyText(['More', '更多'])).assertTrue();
        expect(await textOfId('toolbarStatus')).assertContain('count=0');
        expect(await textOfId('toolbarActive')).assertContain('active=-1');
      }, done);
    });
  });
}
