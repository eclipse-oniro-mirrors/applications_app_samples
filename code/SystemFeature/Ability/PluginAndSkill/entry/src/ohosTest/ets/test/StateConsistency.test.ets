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
  clickId,
  existsId,
  navigateToAllSkillsQuery,
  navigateToBundleSkillQuery,
  navigateToSelfSkillQuery,
  pressBack,
  resetToIndex,
  runCase,
  scrollToId,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const MODULE_SELECT_ID: string = 'skill_module_select';
const SKILL_SELECT_ID: string = 'skill_name_select';
const BUNDLE_SELECT_ID: string = 'skill_bundle_select';
const FLAG_SELECT_ID: string = 'skill_flag_select';

export default function stateConsistencyTest(): void {
  describe('StateConsistencyTest', () => {
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
    })

    beforeEach(async (): Promise<void> => {
      await resetToIndex();
    })

    afterEach(async (): Promise<void> => {
      await resetToIndex();
    })

    afterAll(async (): Promise<void> => {
      await resetToIndex();
    })

    // ==================== 选择器状态验证（4 条） ====================

    /*
     * @tc.number: SUB_STATE_0100
     * @tc.name: testStateConsistency0001
     * @tc.desc: SelfSkillQuery page selector retains selected value after query.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStateConsistency0001', 0, async (done: Function) => {
      await runCase('testStateConsistency0001', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const moduleText: string = await textOfId('skill_module_select');
        expect(moduleText).assertEqual('entry');
        const skillText: string = await textOfId('skill_name_select');
        expect(skillText).assertEqual('skill-test');
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0200
     * @tc.name: testStateConsistency0002
     * @tc.desc: BundleSkillQuery page selector retains selected values after query.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testStateConsistency0002', 0, async (done: Function) => {
      await runCase('testStateConsistency0002', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const bundleText: string = await textOfId('skill_bundle_select');
        expect(bundleText).assertEqual(BUNDLE_NAME);
        const moduleText: string = await textOfId('skill_module_select');
        expect(moduleText).assertEqual('entry');
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0300
     * @tc.name: testStateConsistency0003
     * @tc.desc: Flag selector retains selected value across queries on SelfSkillQuery.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0003', 0, async (done: Function) => {
      await runCase('testStateConsistency0003', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(FLAG_SELECT_ID, '+ Description');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const flagText: string = await textOfId(FLAG_SELECT_ID);
        expect(flagText).assertEqual('+ Description');
        await clickId('query_self_skill_button');
        const flagTextAfter: string = await textOfId(FLAG_SELECT_ID);
        expect(flagTextAfter).assertEqual('+ Description');
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0400
     * @tc.name: testStateConsistency0004
     * @tc.desc: Flag selector retains selected value across queries on AllSkillsQuery.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0004', 0, async (done: Function) => {
      await runCase('testStateConsistency0004', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await selectValue(FLAG_SELECT_ID, '+ SrcEntries');
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const flagText: string = await textOfId(FLAG_SELECT_ID);
        expect(flagText).assertEqual('+ SrcEntries');
        await clickId('query_all_skills_button');
        const flagTextAfter: string = await textOfId(FLAG_SELECT_ID);
        expect(flagTextAfter).assertEqual('+ SrcEntries');
      }, done);
    });

    // ==================== 结果卡片状态验证（3 条） ====================

    /*
     * @tc.number: SUB_STATE_0500
     * @tc.name: testStateConsistency0005
     * @tc.desc: SelfSkillQuery result card disappears when parameter is cleared.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0005', 0, async (done: Function) => {
      await runCase('testStateConsistency0005', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        expect(await existsId('skill_result_name_0')).assertTrue();
        await pressBack();
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        await selectValue(MODULE_SELECT_ID, '');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0600
     * @tc.name: testStateConsistency0006
     * @tc.desc: SelfSkillQuery query all shows results then single query updates card.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0006', 0, async (done: Function) => {
      await runCase('testStateConsistency0006', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_self_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-echo');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const nameText: string = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual('skill-echo');
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0700
     * @tc.name: testStateConsistency0007
     * @tc.desc: BundleSkillQuery query all shows results then single query updates card.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0007', 0, async (done: Function) => {
      await runCase('testStateConsistency0007', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await clickId('query_bundle_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-calculator');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const nameText: string = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual('skill-calculator');
      }, done);
    });

    // ==================== 跨页面状态隔离（3 条） ====================

    /*
     * @tc.number: SUB_STATE_0800
     * @tc.name: testStateConsistency0008
     * @tc.desc: SelfSkillQuery state is reset when navigating back and re-entering.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0008', 0, async (done: Function) => {
      await runCase('testStateConsistency0008', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await pressBack();
        await clickId('self_skill_query_button');
        await waitId('self_skill_page_title');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_0900
     * @tc.name: testStateConsistency0009
     * @tc.desc: BundleSkillQuery state is reset when navigating back and re-entering.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0009', 0, async (done: Function) => {
      await runCase('testStateConsistency0009', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await pressBack();
        await clickId('bundle_skill_query_button');
        await waitId('bundle_skill_page_title');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_STATE_1000
     * @tc.name: testStateConsistency0010
     * @tc.desc: AllSkillsQuery state is reset when navigating back and re-entering.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testStateConsistency0010', 0, async (done: Function) => {
      await runCase('testStateConsistency0010', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        await clickId('query_all_skills_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await pressBack();
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
      }, done);
    });
  });
}
