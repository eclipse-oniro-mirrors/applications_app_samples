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
  navigateToSkillBatch,
  navigateToSkillCompare,
  navigateToSkillExecution,
  navigateToSkillHistory,
  resetToIndex,
  runCase,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const COMPARE_MODULE_A_SELECT: string = 'compare_module_a_select';
const COMPARE_SKILL_A_SELECT: string = 'compare_skill_a_select';
const COMPARE_MODULE_B_SELECT: string = 'compare_module_b_select';
const COMPARE_SKILL_B_SELECT: string = 'compare_skill_b_select';
const EXEC_MODULE_SELECT: string = 'execution_module_select';
const EXEC_SKILL_SELECT: string = 'execution_skill_select';
const BATCH_MODULE_SELECT: string = 'batch_module_select';

export default function advancedFeatureTest(): void {
  describe('AdvancedFeatureTest', () => {
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

    // ==================== 技能对比高级场景（2 条） ====================

    /*
     * @tc.number: SUB_ADV_0100
     * @tc.name: testSkillCompareAdv0001
     * @tc.desc: Compare different skill combinations and verify result output.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAdv0001', 0, async (done: Function) => {
      await runCase('testSkillCompareAdv0001', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-echo');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-validation');
        await clickId('compare_skills_button');
        const resultText: string = await textOfId('compare_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('compare_operation_result')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_ADV_0200
     * @tc.name: testSkillCompareAdv0002
     * @tc.desc: Compare skills and verify result details are displayed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAdv0002', 0, async (done: Function) => {
      await runCase('testSkillCompareAdv0002', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-echo');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-calculator');
        await clickId('compare_skills_button');
        await waitId('compare_operation_result');
        const resultText: string = await textOfId('compare_operation_result');
        expect(resultText.length).assertLarger(1);
        expect(await existsId('compare_result_title')).assertTrue();
        expect(await existsId('compare_total_fields')).assertTrue();
      }, done);
    });

    // ==================== 技能历史高级场景（2 条） ====================

    /*
     * @tc.number: SUB_ADV_0300
     * @tc.name: testSkillHistoryAdv0003
     * @tc.desc: Query all skills and verify first history record shows bundle info.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillHistoryAdv0003', 0, async (done: Function) => {
      await runCase('testSkillHistoryAdv0003', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await clickId('history_query_all_button');
        await waitId('history_record_0', 10000);
        expect(await existsId('history_bundle_0')).assertTrue();
        expect(await existsId('history_module_0')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_ADV_0400
     * @tc.name: testSkillHistoryAdv0004
     * @tc.desc: Query all skills and verify history record shows time and duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillHistoryAdv0004', 0, async (done: Function) => {
      await runCase('testSkillHistoryAdv0004', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await clickId('history_query_all_button');
        await waitId('history_record_0', 10000);
        expect(await existsId('history_time_0')).assertTrue();
        expect(await existsId('history_duration_0')).assertTrue();
      }, done);
    });

    // ==================== 批量操作高级场景（2 条） ====================

    /*
     * @tc.number: SUB_ADV_0500
     * @tc.name: testSkillBatchAdv0005
     * @tc.desc: Select individual skills without select-all and verify toggles exist.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillBatchAdv0005', 0, async (done: Function) => {
      await runCase('testSkillBatchAdv0005', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_0');
        await clickId('batch_skill_toggle_1');
        await clickId('batch_skill_toggle_2');
        await waitId('batch_skill_toggle_0');
        expect(await existsId('batch_skill_toggle_0')).assertTrue();
        expect(await existsId('batch_skill_toggle_1')).assertTrue();
        expect(await existsId('batch_skill_toggle_2')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_ADV_0600
     * @tc.name: testSkillBatchAdv0006
     * @tc.desc: Select all then deselect one skill and verify toggle states.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillBatchAdv0006', 0, async (done: Function) => {
      await runCase('testSkillBatchAdv0006', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_skill_toggle_0');
        await waitId('batch_skill_toggle_0');
        expect(await existsId('batch_skill_toggle_0')).assertTrue();
        expect(await existsId('batch_skill_toggle_1')).assertTrue();
        expect(await existsId('batch_execute_button')).assertTrue();
      }, done);
    });

    // ==================== 执行历史高级场景（2 条） ====================

    /*
     * @tc.number: SUB_ADV_0700
     * @tc.name: testExecHistoryAdv0007
     * @tc.desc: Execute skill and verify execution record card appears.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testExecHistoryAdv0007', 0, async (done: Function) => {
      await runCase('testExecHistoryAdv0007', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-test');
        await clickId('execute_skill_button');
        await waitId('execution_record_0', 10000);
        expect(await existsId('execution_record_0')).assertTrue();
        expect(await existsId('execution_result_text')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_ADV_0800
     * @tc.name: testExecHistoryAdv0008
     * @tc.desc: Execute two skills and verify multiple execution records exist.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testExecHistoryAdv0008', 0, async (done: Function) => {
      await runCase('testExecHistoryAdv0008', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-test');
        await clickId('execute_skill_button');
        await waitId('execution_record_0', 10000);
        expect(await existsId('execution_record_0')).assertTrue();
        await selectValue(EXEC_SKILL_SELECT, 'skill-echo');
        await clickId('execute_skill_button');
        await waitId('execution_record_1', 10000);
        expect(await existsId('execution_record_1')).assertTrue();
      }, done);
    });

  })
}
