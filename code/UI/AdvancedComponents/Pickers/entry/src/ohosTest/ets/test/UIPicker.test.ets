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
import { clickId, runCase, startApp, swipeOnId, textOfId, waitId, waitIdContains } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pickers';
const ABILITY_NAME: string = 'EntryAbility';

export default function uiPickerTest() {
  describe('UIPickerComponentTest', () => {
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
     * @tc.number SUB_PICKERS_UIPICKER_0100
     * @tc.name testPickersUiPage0001
     * @tc.desc Verify ui page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiPage0001', 0, async (done: Function) => {
      await runCase('testPickersUiPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await waitId('uiPicker');
        expect(await textOfId('uiSelected')).assertContain('Todo');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_UIPICKER_0200
     * @tc.name testPickersUiNext0002
     * @tc.desc Verify ui next behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiNext0002', 0, async (done: Function) => {
      await runCase('testPickersUiNext0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await clickId('uiNext');
        expect(await textOfId('uiSelected')).assertContain('In progress');
        expect(await textOfId('uiChangeDesc')).assertContain('on change');
        await clickId('uiNext');
        expect(await textOfId('uiSelected')).assertContain('Done');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_UIPICKER_0300
     * @tc.name testPickersUiPrevious0003
     * @tc.desc Verify ui previous behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiPrevious0003', 0, async (done: Function) => {
      await runCase('testPickersUiPrevious0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await clickId('uiNext');
        await clickId('uiPrevious');
        expect(await textOfId('uiSelected')).assertContain('Todo');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_UIPICKER_0400
     * @tc.name testPickersUiBounds0004
     * @tc.desc Verify ui bounds behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiBounds0004', 0, async (done: Function) => {
      await runCase('testPickersUiBounds0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await clickId('uiLoopToggle');
        await clickId('uiPrevious');
        expect(await textOfId('uiSelected')).assertContain('Todo');
        for (let i = 0; i < 6; i++) {
          await clickId('uiNext');
        }
        expect(await textOfId('uiSelected')).assertContain('Review');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_UIPICKER_0500
     * @tc.name testPickersUiSwipe0005
     * @tc.desc Verify ui swipe behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiSwipe0005', 0, async (done: Function) => {
      await runCase('testPickersUiSwipe0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await clickId('uiLoopToggle');
        await swipeOnId('uiPicker');
        await waitIdContains('uiScrollStopDesc', 'on scroll stop');
        expect(await textOfId('uiScrollStopDesc')).assertContain('on scroll stop');
      }, done);
    });
    
    /**
     * @tc.number SUB_PICKERS_UIPICKER_0600
     * @tc.name testPickersUiLoop0006
     * @tc.desc Verify the remaining interaction and boundary behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersUiLoop0006', 0, async (done: Function) => {
      await runCase('testPickersUiLoop0006', async () => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
      await clickId('cardUIPicker');
      for (let i = 0; i < 5; i++) {
        await clickId('uiNext');
      }
      expect(await textOfId('uiSelected')).assertContain('Todo');
      await clickId('uiLoopToggle');
      await clickId('uiPrevious');
      expect(await textOfId('uiSelected')).assertContain('Todo');
      }, done);
    });
      });
}
