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

export default function editableV2Test() {
  describe('EditableTitleBarV2Test', () => {
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
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBARV2_0100
     * @tc.name testTitleBarsEditV2Page0001
     * @tc.desc Verify edit v2 page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditV2Page0001', 0, async (done: Function) => {
      await runCase('testTitleBarsEditV2Page0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await waitId('editableTitleBarV2');
        await waitText('Edit note');
        expect(await textOfId('editableV2Counts')).assertContain('save=0, cancel=0, menu=0');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBARV2_0200
     * @tc.name testTitleBarsEditV2Save0002
     * @tc.desc Verify edit v2 save behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditV2Save0002', 0, async (done: Function) => {
      await runCase('testTitleBarsEditV2Save0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await clickChildButton('editableTitleBarV2', -1);
        expect(await textOfId('editableV2Counts')).assertContain('save=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBARV2_0300
     * @tc.name testTitleBarsEditV2Cancel0003
     * @tc.desc Verify edit v2 cancel behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditV2Cancel0003', 0, async (done: Function) => {
      await runCase('testTitleBarsEditV2Cancel0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await clickChildButton('editableTitleBarV2', 0);
        expect(await textOfId('editableV2Counts')).assertContain('cancel=1');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_EDITABLETITLEBARV2_0400
     * @tc.name testTitleBarsEditV2Menu0004
     * @tc.desc Verify edit v2 menu behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsEditV2Menu0004', 0, async (done: Function) => {
      await runCase('testTitleBarsEditV2Menu0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await clickChildButton('editableTitleBarV2', 1);
        expect(await textOfId('editableV2Counts')).assertContain('menu=1');
      }, done);
    });
  });
}
