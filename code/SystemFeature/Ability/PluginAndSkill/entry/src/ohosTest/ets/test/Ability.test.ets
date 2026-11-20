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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { assertIdText, clickId, existsId, pressBack, runCase, startApp } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';


export default function abilityTest(): void {
  describe('PluginAndSkillAbilityTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
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

    /*
     * @tc.number: SUB_SKILLMANAGERHOME_ABILITY_0100
     * @tc.name: testSkillManagerHome0001
     * @tc.desc: Verify that the skill entry button exists on the main page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSkillManagerHome0001', 0, async (done: Function) => {
      await runCase('testSkillManagerHome0001', async (): Promise<void> => {
        expect(await existsId('skillButton')).assertTrue();
        expect(await existsId('EntryAbility_label')).assertTrue();
        expect(await existsId('home_description')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILLMANAGERHOME_ABILITY_0200
     * @tc.name: testSkillManagerHome0002
     * @tc.desc: Verify that the SkillManagerHome page displays all text elements and navigation buttons correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSkillManagerHome0002', 0, async (done: Function) => {
      await runCase('testSkillManagerHome0002', async (): Promise<void> => {
        // Verify page title and description text exist
        await clickId('skillButton');
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_page_description')).assertTrue();
        // Verify all navigation buttons exist
        expect(await existsId('self_skill_query_button')).assertTrue();
        expect(await existsId('bundle_skill_query_button')).assertTrue();
        expect(await existsId('all_skills_query_button')).assertTrue();
      }, done);
    });
  });
}
