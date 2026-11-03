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
import {
  assertTextExists,
  clickId,
  existsId,
  pressBack,
  runCase,
  scrollToId,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME = 'com.samples.pluginandskill';
const ABILITY_NAME = 'EntryAbility';
const SKILL_NAME = 'skill-test';
const FLAG_SELECT_ID = 'skill_flag_select';

export default function allSkillsQueryTest(): void {
  describe('AllSkillsQueryTest', () => {
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
      await clickId('skillButton');
      await waitId('skill_page_title');
    })

    beforeEach(() => {
      // Presets an action before each test case
    })

    afterEach(() => {
      // Presets a clear action after each test case
    })

    afterAll(async (): Promise<void> => {
      // Return to skill manager home
      if (await existsId('all_skills_page_title')) {
        await pressBack();
      }
    })

    // ==================== 基础查询（2 条） ====================

    /*
     * @tc.number: SUB_ALL_SKILLS_0100
     * @tc.name: testAllSkillsQuery0001
     * @tc.desc: Query all device skills, expect results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAllSkillsQuery0001', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0001', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0200
     * @tc.name: testAllSkillsQuery0002
     * @tc.desc: Query all device skills, expect skill-test in results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testAllSkillsQuery0002', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0002', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await clickId('query_all_skills_button');
        await assertTextExists('testAllSkillsQuery0002', SKILL_NAME);
        await pressBack();
      }, done);
    });

    // ==================== Flag 验证（6 条） ====================

    /*
     * @tc.number: SUB_ALL_SKILLS_0300
     * @tc.name: testAllSkillsQuery0003
     * @tc.desc: Query all device skills with Default flag, expect srcEntries is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0003', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0003', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, 'Default');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        expect(await textOfId('skill_result_src_entries_0_value')).assertEqual('-');
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0400
     * @tc.name: testAllSkillsQuery0004
     * @tc.desc: Query all device skills with SrcEntries flag, expect srcEntries populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0004', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0004', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, '+ SrcEntries');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        const srcEntriesText = await textOfId('skill_result_src_entries_0_value');
        expect(srcEntriesText.length).assertLarger(1);
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0500
     * @tc.name: testAllSkillsQuery0005
     * @tc.desc: Query all device skills with Description flag, expect description populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0005', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0005', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Description');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        const descText = await textOfId('skill_result_description_0_value');
        expect(descText.length).assertLarger(1);
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0600
     * @tc.name: testAllSkillsQuery0006
     * @tc.desc: Query all device skills with Permissions flag, expect permissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0006', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0006', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Permissions');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_permissions_0_value');
        const permissionsText = await textOfId('skill_result_permissions_0_value');
        expect(permissionsText.length).assertLarger(1);
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0700
     * @tc.name: testAllSkillsQuery0007
     * @tc.desc: Query all device skills with RequestPermissions flag, expect requestPermissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0007', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0007', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, '+ RequestPermissions');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_request_permissions_0_value');
        const reqPermText = await textOfId('skill_result_request_permissions_0_value');
        expect(reqPermText.length).assertLarger(1);
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_ALL_SKILLS_0800
     * @tc.name: testAllSkillsQuery0008
     * @tc.desc: Query all device skills with all flags, expect all fields populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testAllSkillsQuery0008', 0, async (done: Function) => {
      await runCase('testAllSkillsQuery0008', async (): Promise<void> => {
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        await selectValue(FLAG_SELECT_ID, 'All flags');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const descText = await textOfId('skill_result_description_0_value');
        expect(descText.length).assertLarger(1);
        const srcText = await textOfId('skill_result_src_entries_0_value');
        expect(srcText.length).assertLarger(1);
        const permText = await textOfId('skill_result_permissions_0_value');
        expect(permText.length).assertLarger(1);
        await scrollToId('skill_result_request_permissions_0_value');
        const reqPermText = await textOfId('skill_result_request_permissions_0_value');
        expect(reqPermText.length).assertLarger(1);
        await pressBack();
      }, done);
    });
  });
}
