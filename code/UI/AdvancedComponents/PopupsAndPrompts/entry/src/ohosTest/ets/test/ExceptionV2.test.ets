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
import { clickId, clickText, runCase, scrollToId, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.popupsandprompts';
const ABILITY_NAME: string = 'EntryAbility';

export default function exceptionV2Test() {
  describe('ExceptionPromptV2Test', () => {
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
     * @tc.number SUB_POPUPS_EXCEPTIONV2_0100
     * @tc.name testPopupsExceptionV2Page0001
     * @tc.desc Verify exception v2 page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExceptionV2Page0001', 0, async (done: Function) => {
      await runCase('testPopupsExceptionV2Page0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardExceptionV2');
        await waitId('exceptionV2Status');
        expect(await textOfId('exceptionV2Status')).assertContain('status=ready');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXCEPTIONV2_0200
     * @tc.name testPopupsExceptionV2Action0002
     * @tc.desc Verify exception v2 action behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExceptionV2Action0002', 0, async (done: Function) => {
      await runCase('testPopupsExceptionV2Action0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardExceptionV2');
        await clickText('Settings');
        expect(await textOfId('exceptionV2Status')).assertContain('status=action');
        expect(await textOfId('exceptionV2Status')).assertContain('action=1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXCEPTIONV2_0300
     * @tc.name testPopupsExceptionV2Toggle0003
     * @tc.desc Verify exception v2 toggle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExceptionV2Toggle0003', 0, async (done: Function) => {
      await runCase('testPopupsExceptionV2Toggle0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardExceptionV2');
        await scrollToId('exceptionV2Hide');
        await clickId('exceptionV2Hide');
        expect(await textOfId('exceptionV2Status')).assertContain('status=hidden');
        await scrollToId('exceptionV2Show');
        await clickId('exceptionV2Show');
        expect(await textOfId('exceptionV2Status')).assertContain('status=shown');
      }, done);
    });
  });
}
