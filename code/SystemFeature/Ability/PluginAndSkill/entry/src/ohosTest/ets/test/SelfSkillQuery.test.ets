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
const MODULE_SELECT_ID = 'skill_module_select';
const SKILL_SELECT_ID = 'skill_name_select';
const FLAG_SELECT_ID = 'skill_flag_select';
const SKILL_NAME = 'skill-test';

export default function selfSkillQueryTest(): void {
  describe('SelfSkillQueryTest', () => {
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
      if (await existsId('self_skill_page_title')) {
        await pressBack();
      }
    })

    // ==================== 参数校验（3 条） ====================

    /*
     * @tc.number: SUB_SELF_SKILL_0100
     * @tc.name: testSelfSkillQuery0001
     * @tc.desc: Query an own skill with module set but skill name empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0001', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0001', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_0200
     * @tc.name: testSelfSkillQuery0002
     * @tc.desc: Query an own skill with skill name set but module empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0002', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0002', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_0300
     * @tc.name: testSelfSkillQuery0003
     * @tc.desc: Query an own skill with both module and skill name empty, expect no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0003', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0003', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    // ==================== 成功场景（4 条） ====================

    /*
     * @tc.number: SUB_SELF_SKILL_0400
     * @tc.name: testSelfSkillQuery0004
     * @tc.desc: Query a specified own skill with valid module and skill name, expect success.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0004', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0004', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await assertTextExists('testSelfSkillQuery0004', 'skill-test');
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_0500
     * @tc.name: testSelfSkillQuery0005
     * @tc.desc: Query a different own skill (skill-echo) with valid module and skill name, expect success.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0005', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0005', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-echo');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await assertTextExists('testSelfSkillQuery0005', 'skill-echo');
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_0600
     * @tc.name: testSelfSkillQuery0006
     * @tc.desc: Query own skill skill-calculator with valid module and skill name, expect success.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0006', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0006', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-calculator');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await assertTextExists('testSelfSkillQuery0006', 'skill-calculator');
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_0700
     * @tc.name: testSelfSkillQuery0007
     * @tc.desc: Query own skill skill-validation with valid module and skill name, expect success.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0007', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0007', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-validation');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        await assertTextExists('testSelfSkillQuery0007', 'skill-validation');
        await pressBack();
      }, done);
    });

    // ==================== 全部查询（1 条） ====================

    /*
     * @tc.number: SUB_SELF_SKILL_0800
     * @tc.name: testSelfSkillQuery0008
     * @tc.desc: Query all own skills with both module and skill name empty, expect results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSelfSkillQuery0008', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0008', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_self_skills_button');
        expect(await existsId('skill_result_name_0')).assertTrue();
        expect(await existsId('skill_results_title')).assertTrue();
        expect(await existsId('self_skill_page_title')).assertTrue();
        await assertTextExists('testSelfSkillQuery0008', 'skill-test');
        await pressBack();
      }, done);
    });

    // ==================== 异常场景（2 条） ====================

    /*
     * @tc.number: SUB_SELF_SKILL_0900
     * @tc.name: testSelfSkillQuery0009
     * @tc.desc: Query own skill with non-existent moduleName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0009', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0009', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, SKILL_NAME);
        await clickId('query_self_skill_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_1000
     * @tc.name: testSelfSkillQuery0010
     * @tc.desc: Query own skill with non-existent skillName, expect error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0010', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0010', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-nonexistent');
        await clickId('query_self_skill_button');
        expect(await textOfId('skill_operation_result')).assertContain('BusinessError');
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('skill_operation_result')).assertTrue();
        await pressBack();
      }, done);
    });

    // ==================== Flag 验证（6 条） ====================

    /*
     * @tc.number: SUB_SELF_SKILL_1100
     * @tc.name: testSelfSkillQuery0011
     * @tc.desc: Query own skill with Default flag, expect description is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0011', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0011', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(FLAG_SELECT_ID, 'Default');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        expect(await textOfId('skill_result_description_0_value')).assertEqual('-');
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_1200
     * @tc.name: testSelfSkillQuery0012
     * @tc.desc: Query own skill with Description flag, expect description populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0012', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0012', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Description');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_description_0_value');
        const text = await textOfId('skill_result_description_0_value');
        expect(text.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_1300
     * @tc.name: testSelfSkillQuery0013
     * @tc.desc: Query own skill with SrcEntries flag, expect srcEntries populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0013', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0013', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ SrcEntries');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_src_entries_0_value');
        const srcEntriesText = await textOfId('skill_result_src_entries_0_value');
        expect(srcEntriesText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_1400
     * @tc.name: testSelfSkillQuery0014
     * @tc.desc: Query own skill with Permissions flag, expect permissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0014', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0014', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ Permissions');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_permissions_0_value');
        const permissionsText = await textOfId('skill_result_permissions_0_value');
        expect(permissionsText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });

    /*
     * @tc.number: SUB_SELF_SKILL_1500
     * @tc.name: testSelfSkillQuery0015
     * @tc.desc: Query own skill with RequestPermissions flag, expect requestPermissions populated.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSelfSkillQuery0015', 0, async (done: Function) => {
      await runCase('testSelfSkillQuery0015', async (): Promise<void> => {
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(FLAG_SELECT_ID, '+ RequestPermissions');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await scrollToId('skill_result_request_permissions_0_value');
        const requestPermissionsText = await textOfId('skill_result_request_permissions_0_value');
        expect(requestPermissionsText.length).assertLarger(1);
        expect(await existsId('skill_results_title')).assertTrue();
        await pressBack();
      }, done);
    });
  });
}
