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

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const MODULE_NAME: string = 'entry';
const SKILL_NAME: string = 'skill-test';
const BUNDLE_SELECT_ID: string = 'skill_bundle_select';
const MODULE_SELECT_ID: string = 'skill_module_select';
const SKILL_SELECT_ID: string = 'skill_name_select';
const FLAG_SELECT_ID: string = 'skill_flag_select';

export default function bundleSkillQueryTest(): void {
  describe('BundleSkillQueryTest', () => {
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
      if (await existsId('bundle_skill_page_title')) {
        await pressBack();
      }
    })

    // ==================== 参数校验（4 条） ====================

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0100
     * @tc.name: testBundleSkillQuery0001
     * @tc.desc: Query an application skill with bundle, module and skill name all empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0001', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0001', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        expect(await existsId('skill_no_results')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0200
     * @tc.name: testBundleSkillQuery0002
     * @tc.desc: Query an application skill with bundle empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0002', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0002', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        await selectValue(BUNDLE_SELECT_ID, '')
        await selectValue(MODULE_SELECT_ID, MODULE_NAME)
        await selectValue(SKILL_SELECT_ID, 'skill-test')
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        expect(await existsId('skill_no_results')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0300
     * @tc.name: testBundleSkillQuery0003
     * @tc.desc: Query an application skill with module empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0003', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0003', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME)
        await selectValue(MODULE_SELECT_ID, '')
        await selectValue(SKILL_SELECT_ID, 'skill-test')
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        expect(await existsId('skill_no_results')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0400
     * @tc.name: testBundleSkillQuery0004
     * @tc.desc: Query an application skill with skill name empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0004', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0004', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME)
        await selectValue(MODULE_SELECT_ID, MODULE_NAME)
        await selectValue(SKILL_SELECT_ID, '')
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        expect(await existsId('skill_no_results')).assertTrue();
        await pressBack();
      }, done);
    });

    // ==================== 成功场景（1 条） ====================

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0500
     * @tc.name: testBundleSkillQuery0005
     * @tc.desc: Query a specified application skill with all selects set, expect success.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0005', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0005', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME)
        await selectValue(MODULE_SELECT_ID, MODULE_NAME)
        await selectValue(SKILL_SELECT_ID, SKILL_NAME)
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await assertTextExists('testBundleSkillQuery0005', SKILL_NAME)
        await pressBack();
      }, done);
    });

    // ==================== 全部查询（2 条） ====================

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0600
     * @tc.name: testBundleSkillQuery0006
     * @tc.desc: Query all application skills with bundle set, expect results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0006', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0006', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME)
        await clickId('query_bundle_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0700
     * @tc.name: testBundleSkillQuery0007
     * @tc.desc: Query all application skills with bundle empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBundleSkillQuery0007', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0007', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, '')
        await clickId('query_bundle_skills_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    // ==================== 异常场景（4 条） ====================

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0800
     * @tc.name: testBundleSkillQuery0008
     * @tc.desc: Query application skill with non-existent bundleName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0008', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0008', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, 'com.nonexistent.bundle');
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_0900
     * @tc.name: testBundleSkillQuery0009
     * @tc.desc: Query application skill with non-existent moduleName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0009', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0009', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1000
     * @tc.name: testBundleSkillQuery0010
     * @tc.desc: Query application skill with non-existent skillName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0010', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0010', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, 'skill-nonexistent');
        await clickId('query_bundle_skill_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1100
     * @tc.name: testBundleSkillQuery0011
     * @tc.desc: Query all application skills with non-existent bundleName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0011', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0011', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(BUNDLE_SELECT_ID, 'com.nonexistent.bundle');
        await clickId('query_bundle_skills_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    // ==================== Flag 验证（6 条） ====================

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1200
     * @tc.name: testBundleSkillQuery0012
     * @tc.desc: Query application skill with Default flag, expect srcEntries is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0012', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0012', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, 'Default');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        expect(await textOfId('skill_result_src_entries_0_value')).assertEqual('-');
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1300
     * @tc.name: testBundleSkillQuery0013
     * @tc.desc: Query application skill with SrcEntries flag, expect srcEntries populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0013', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0013', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ SrcEntries');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        const srcEntriesText: string = await textOfId('skill_result_src_entries_0_value');
        expect(srcEntriesText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1400
     * @tc.name: testBundleSkillQuery0014
     * @tc.desc: Query application skill with Description flag, expect description populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0014', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0014', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Description');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        const descText: string = await textOfId('skill_result_description_0_value');
        expect(descText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1500
     * @tc.name: testBundleSkillQuery0015
     * @tc.desc: Query application skill with Permissions flag, expect permissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0015', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0015', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Permissions');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_permissions_0_value');
        const permissionsText: string = await textOfId('skill_result_permissions_0_value');
        expect(permissionsText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1600
     * @tc.name: testBundleSkillQuery0016
     * @tc.desc: Query application skill with RequestPermissions flag, expect requestPermissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0016', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0016', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ RequestPermissions');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_request_permissions_0_value');
        const reqPermText: string = await textOfId('skill_result_request_permissions_0_value');
        expect(reqPermText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_BUNDLE_SKILL_1700
     * @tc.name: testBundleSkillQuery0017
     * @tc.desc: Query application skill with all flags, expect all fields populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBundleSkillQuery0017', 0, async (done: Function) => {
      await runCase('testBundleSkillQuery0017', async (): Promise<void> => {
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        await selectValue(FLAG_SELECT_ID, 'All flags');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, MODULE_NAME);
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_request_permissions_0_value');
        const descText: string = await textOfId('skill_result_description_0_value');
        expect(descText.length).assertLarger(1);
        const srcText: string = await textOfId('skill_result_src_entries_0_value');
        expect(srcText.length).assertLarger(1);
        const permText: string = await textOfId('skill_result_permissions_0_value');
        expect(permText.length).assertLarger(1);
        const reqPermText: string = await textOfId('skill_result_request_permissions_0_value');
        expect(reqPermText.length).assertLarger(1);
        await pressBack();
      }, done);
    });
  });
}
