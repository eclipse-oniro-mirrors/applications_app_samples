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
import { clickChildButton, clickId, runCase, startApp, textOfId, waitId, waitText } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.titlebarsandtoolbars';
const ABILITY_NAME: string = 'EntryAbility';

export default function editableTest() {
  describe('EditableTitleBarTest', () => {
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
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBAR_0100
     * @tc.name testTitleBarsEditPage0001
     * @tc.desc Verify edit page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditPage0001', 0, async (done: Function) => {
      await runCase('testTitleBarsEditPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await waitId('editableTitleBar');
        await waitText('Edit profile');
        expect(await textOfId('editableCounts')).assertContain('save=0, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBAR_0200
     * @tc.name testTitleBarsEditSave0002
     * @tc.desc Verify edit save behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditSave0002', 0, async (done: Function) => {
      await runCase('testTitleBarsEditSave0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await clickChildButton('editableTitleBar', -1);
        expect(await textOfId('editableCounts')).assertContain('save=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBAR_0300
     * @tc.name testTitleBarsEditCancel0003
     * @tc.desc Verify edit cancel behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditCancel0003', 0, async (done: Function) => {
      await runCase('testTitleBarsEditCancel0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await clickChildButton('editableTitleBar', 0);
        expect(await textOfId('editableCounts')).assertContain('cancel=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBAR_0400
     * @tc.name testTitleBarsEditSubtitle0004
     * @tc.desc Verify edit subtitle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditSubtitle0004', 0, async (done: Function) => {
      await runCase('testTitleBarsEditSubtitle0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        expect(await textOfId('editableSubtitle')).assertContain('shown');
        await clickId('editableToggle');
        expect(await textOfId('editableSubtitle')).assertContain('hidden');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBAR_0500
     * @tc.name testTitleBarsEditMenu0005
     * @tc.desc Verify edit menu behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditMenu0005', 0, async (done: Function) => {
      await runCase('testTitleBarsEditMenu0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await clickChildButton('editableTitleBar', 1);
        expect(await textOfId('editableCounts')).assertContain('menu=1');
      }, done);
    });
  });
}
