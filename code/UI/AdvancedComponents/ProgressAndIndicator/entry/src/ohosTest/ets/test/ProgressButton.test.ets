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

export default function progressButtonTest() {
  describe('ProgressButtonTest', () => {
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
     * @tc.number SUB_PROGRESS_PROGRESSBUTTON_0100
     * @tc.name testProgressPbPage0001
     * @tc.desc Verify pb page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressPbPage0001', 0, async (done: Function) => {
      await runCase('testProgressPbPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await waitId('progressButton');
        expect(await textOfId('pbProgress')).assertContain('0%');
        expect(await textOfId('pbState')).assertContain('state=idle');
        expect(await textOfId('pbEnabled')).assertContain('enabled=true');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_PROGRESSBUTTON_0200
     * @tc.name testProgressPbStart0002
     * @tc.desc Verify pb start behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressPbStart0002', 0, async (done: Function) => {
      await runCase('testProgressPbStart0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await clickId('pbStart');
        await waitIdContains('pbState', 'state=completed', 8000);
        expect(await textOfId('pbProgress')).assertContain('100%');
        expect(await textOfId('pbEnabled')).assertContain('enabled=true');
        expect(await textOfId('pbEvent')).assertContain('event=completed');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_PROGRESSBUTTON_0300
     * @tc.name testProgressPbReset0003
     * @tc.desc Verify pb reset behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressPbReset0003', 0, async (done: Function) => {
      await runCase('testProgressPbReset0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await clickId('pbStart');
        await waitIdContains('pbState', 'state=running');
        await clickId('pbReset');
        expect(await textOfId('pbProgress')).assertContain('0%');
        expect(await textOfId('pbState')).assertContain('state=idle');
        expect(await textOfId('pbEvent')).assertContain('event=reset');
      }, done);
    });

    /**
     * @tc.number SUB_PROGRESS_PROGRESSBUTTON_0400
     * @tc.name testProgressPbToggle0004
     * @tc.desc Verify pb toggle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressPbToggle0004', 0, async (done: Function) => {
      await runCase('testProgressPbToggle0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardProgressButton');
        await clickId('pbToggle');
        expect(await textOfId('pbEnabled')).assertContain('enabled=false');
        await clickId('pbToggle');
        expect(await textOfId('pbEnabled')).assertContain('enabled=true');
      }, done);
    });
    
    /**
     * @tc.number SUB_PROGRESS_PROGRESSBUTTON_0500
     * @tc.name testProgressPbDisabledStart0005
     * @tc.desc Verify the remaining interaction and boundary behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testProgressPbDisabledStart0005', 0, async (done: Function) => {
      await runCase('testProgressPbDisabledStart0005', async () => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
      await clickId('cardProgressButton');
      await clickId('pbToggle');
      await clickId('pbStart');
      expect(await textOfId('pbProgress')).assertContain('0%');
      expect(await textOfId('pbState')).assertContain('state=idle');
      }, done);
    });
      });
}
