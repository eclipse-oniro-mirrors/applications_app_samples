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
  navigateToAllSkillsQuery,
  navigateToBundleSkillQuery,
  navigateToSelfSkillQuery,
  pressBack,
  resetToIndex,
  runCase,
  scrollToId,
  scrollToTop,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME = 'com.samples.pluginandskill';
const ABILITY_NAME = 'EntryAbility';
const MODULE_SELECT_ID = 'skill_module_select';
const SKILL_SELECT_ID = 'skill_name_select';
const BUNDLE_SELECT_ID = 'skill_bundle_select';
const FLAG_SELECT_ID = 'skill_flag_select';
const SKILL_NAME = 'skill-test';
const MODULE_NAME = 'entry';

export default function resultFieldValidationTest(): void {
  describe('ResultFieldValidationTest', () => {
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
    })

    beforeEach(async (): Promise<void> => {
      await resetToIndex();
    })

    afterEach(async (): Promise<void> => {
      await scrollToTop();
      await resetToIndex();
    })

    afterAll(async (): Promise<void> => {
      await resetToIndex();
    })

    // ==================== SelfSkillQuery 结果卡片字段验证（8 条） ====================

    /*
     * @tc.number: SUB_RESULT_FIELD_0100
     * @tc.name: testResultField0001
     * @tc.desc: SelfSkillQuery result card displays skillName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0001', 0, async (done: Function) => {
      await runCase('testResultField0001', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        await assertTextExists('testResultField0001', SKILL_NAME);
        const nameText = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual(SKILL_NAME);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0200
     * @tc.name: testResultField0002
     * @tc.desc: SelfSkillQuery result card displays bundleName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0002', 0, async (done: Function) => {
      await runCase('testResultField0002', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_bundle_0_value');
        const bundleText = await textOfId('skill_result_bundle_0_value');
        expect(bundleText).assertEqual(BUNDLE_NAME);
        expect(bundleText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0300
     * @tc.name: testResultField0003
     * @tc.desc: SelfSkillQuery result card displays moduleName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0003', 0, async (done: Function) => {
      await runCase('testResultField0003', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_module_0_value');
        const moduleText = await textOfId('skill_result_module_0_value');
        expect(moduleText).assertEqual(MODULE_NAME);
        expect(moduleText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0400
     * @tc.name: testResultField0004
     * @tc.desc: SelfSkillQuery result card displays skillType correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0004', 0, async (done: Function) => {
      await runCase('testResultField0004', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_type_0_value');
        const typeText = await textOfId('skill_result_type_0_value');
        expect(typeText.length).assertLarger(0);
        expect(typeText).assertContain('0');
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0500
     * @tc.name: testResultField0005
     * @tc.desc: SelfSkillQuery result card displays skillPath correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0005', 0, async (done: Function) => {
      await runCase('testResultField0005', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_path_0_value');
        const pathText = await textOfId('skill_result_path_0_value');
        expect(pathText.length).assertLarger(0);
        expect(pathText).assertContain('skill');
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0600
     * @tc.name: testResultField0006
     * @tc.desc: SelfSkillQuery result card displays abilityName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0006', 0, async (done: Function) => {
      await runCase('testResultField0006', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_ability_0_value');
        const abilityText = await textOfId('skill_result_ability_0_value');
        expect(abilityText.length).assertLarger(0);
        expect(await existsId('skill_result_ability_0_value')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0700
     * @tc.name: testResultField0007
     * @tc.desc: SelfSkillQuery result card displays versionCode correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0007', 0, async (done: Function) => {
      await runCase('testResultField0007', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_version_code_0_value');
        const versionCodeText = await textOfId('skill_result_version_code_0_value');
        expect(versionCodeText.length).assertLarger(0);
        expect(await existsId('skill_result_version_code_0_value')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_0800
     * @tc.name: testResultField0008
     * @tc.desc: SelfSkillQuery with Default flag shows '-' for description and srcEntries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testResultField0008', 0, async (done: Function) => {
      await runCase('testResultField0008', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(FLAG_SELECT_ID, 'Default');
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        const descText = await textOfId('skill_result_description_0_value');
        expect(descText).assertEqual('-');
        await scrollToId('skill_result_src_entries_0_value');
        const srcText = await textOfId('skill_result_src_entries_0_value');
        expect(srcText).assertEqual('-');
      }, done);
    });

    // ==================== BundleSkillQuery 结果卡片字段验证（6 条） ====================

    /*
     * @tc.number: SUB_RESULT_FIELD_0900
     * @tc.name: testResultField0009
     * @tc.desc: BundleSkillQuery result card displays skillName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0009', 0, async (done: Function) => {
      await runCase('testResultField0009', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        const nameText = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual(SKILL_NAME);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1000
     * @tc.name: testResultField0010
     * @tc.desc: BundleSkillQuery result card displays bundleName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0010', 0, async (done: Function) => {
      await runCase('testResultField0010', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_bundle_0_value');
        const bundleText = await textOfId('skill_result_bundle_0_value');
        expect(bundleText).assertEqual(BUNDLE_NAME);
        expect(bundleText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1100
     * @tc.name: testResultField0011
     * @tc.desc: BundleSkillQuery result card displays moduleName correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0011', 0, async (done: Function) => {
      await runCase('testResultField0011', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_module_0_value');
        const moduleText = await textOfId('skill_result_module_0_value');
        expect(moduleText).assertEqual(MODULE_NAME);
        expect(moduleText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1200
     * @tc.name: testResultField0012
     * @tc.desc: BundleSkillQuery result card displays skillPath with content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0012', 0, async (done: Function) => {
      await runCase('testResultField0012', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_path_0_value');
        const pathText = await textOfId('skill_result_path_0_value');
        expect(pathText.length).assertLarger(0);
        expect(pathText).assertContain('skills');
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1300
     * @tc.name: testResultField0013
     * @tc.desc: BundleSkillQuery result card displays versionCode as a number.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0013', 0, async (done: Function) => {
      await runCase('testResultField0013', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_version_code_0_value');
        const versionCodeText = await textOfId('skill_result_version_code_0_value');
        expect(versionCodeText.length).assertLarger(0);
        expect(await existsId('skill_result_version_code_0_value')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1400
     * @tc.name: testResultField0014
     * @tc.desc: BundleSkillQuery with Default flag shows '-' for srcEntries.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testResultField0014', 0, async (done: Function) => {
      await runCase('testResultField0014', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(FLAG_SELECT_ID, 'Default');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        const srcText = await textOfId('skill_result_src_entries_0_value');
        expect(srcText).assertEqual('-');
        expect(srcText.length).assertEqual(1);
      }, done);
    });

    // ==================== AllSkillsQuery 结果卡片字段验证（6 条） ====================

    /*
     * @tc.number: SUB_RESULT_FIELD_1500
     * @tc.name: testResultField0015
     * @tc.desc: AllSkillsQuery result card displays skillName for first result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0015', 0, async (done: Function) => {
      await runCase('testResultField0015', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        const nameText = await textOfId('skill_result_name_0');
        expect(nameText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1600
     * @tc.name: testResultField0016
     * @tc.desc: AllSkillsQuery result card displays bundleName for first result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0016', 0, async (done: Function) => {
      await runCase('testResultField0016', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_bundle_0_value');
        const bundleText = await textOfId('skill_result_bundle_0_value');
        expect(bundleText.length).assertLarger(0);
        expect(bundleText).assertContain('.');
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1700
     * @tc.name: testResultField0017
     * @tc.desc: AllSkillsQuery result card displays moduleName for first result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testResultField0017', 0, async (done: Function) => {
      await runCase('testResultField0017', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_module_0_value');
        const moduleText = await textOfId('skill_result_module_0_value');
        expect(moduleText.length).assertLarger(0);
        expect(moduleText).assertEqual('entry');
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1800
     * @tc.name: testResultField0018
     * @tc.desc: AllSkillsQuery with All flags shows description content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testResultField0018', 0, async (done: Function) => {
      await runCase('testResultField0018', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await selectValue('skill_flag_select', 'All flags');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        const descText = await textOfId('skill_result_description_0_value');
        expect(descText.length).assertLarger(0);
        expect(await existsId('skill_result_description_0_value')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_1900
     * @tc.name: testResultField0019
     * @tc.desc: AllSkillsQuery with All flags shows srcEntries content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testResultField0019', 0, async (done: Function) => {
      await runCase('testResultField0019', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await selectValue('skill_flag_select', 'All flags');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        const srcText = await textOfId('skill_result_src_entries_0_value');
        expect(srcText.length).assertLarger(0);
        expect(await existsId('skill_result_src_entries_0_value')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_RESULT_FIELD_2000
     * @tc.name: testResultField0020
     * @tc.desc: AllSkillsQuery with All flags shows permissions content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testResultField0020', 0, async (done: Function) => {
      await runCase('testResultField0020', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await selectValue('skill_flag_select', 'All flags');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_permissions_0_value');
        const permText = await textOfId('skill_result_permissions_0_value');
        expect(permText.length).assertLarger(0);
        await scrollToId('skill_result_request_permissions_0_value');
        const reqPermText = await textOfId('skill_result_request_permissions_0_value');
        expect(reqPermText.length).assertLarger(0);
      }, done);
    });
  });
}
