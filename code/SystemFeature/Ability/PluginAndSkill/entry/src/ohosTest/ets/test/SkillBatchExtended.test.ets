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
  addLog,
  addLogNumber,
  clickId,
  countComponentsById,
  existsId,
  navigateToSkillBatch,
  resetToIndex,
  runCase,
  scrollToId,
  scrollToTop,
  selectValue,
  startApp,
  textOfId,
  waitId,
  waitIdContains
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const BATCH_MODULE_SELECT: string = 'batch_module_select';

export default function skillBatchExtendedTest(): void {
  describe('SkillBatchExtendedTest', () => {
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
    })

    beforeEach(async (): Promise<void> => {
      await resetToIndex();
    })

    afterEach(async (): Promise<void> => {
      await scrollToTop()
      await resetToIndex();
    })

    afterAll(async (): Promise<void> => {
      await resetToIndex();
    })

    // ==================== 单独选择执行 (3 用例) ====================

    /*
     * @tc.number: SUB_BATCH_EXT_0100
     * @tc.name: testBatchIndividualSelect0001
     * @tc.desc: Select only second skill toggle (skill-test), execute, verify record count is 1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchIndividualSelect0001', 0, async (done: Function) => {
      await runCase('testBatchIndividualSelect0001', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_1');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_record_0');
        const recordCount: number = await countComponentsById('batch_record_0');
        expect(recordCount).assertEqual(1);
        const resultText: string = await textOfId('batch_operation_result');
        expect(resultText).assertContain('Batch completed');
        expect(resultText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0200
     * @tc.name: testBatchIndividualSelect0002
     * @tc.desc: Select two individual skills, execute, verify at least 2 records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchIndividualSelect0002', 0, async (done: Function) => {
      await runCase('testBatchIndividualSelect0002', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_1');
        await clickId('batch_skill_toggle_2');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_record_0');
        expect(await existsId('batch_record_0')).assertTrue();
        expect(await existsId('batch_summary_card')).assertTrue();
        const totalCount: string = await textOfId('batch_total_count');
        expect(Number(totalCount)).assertEqual(2);
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0300
     * @tc.name: testBatchIndividualSelect0003
     * @tc.desc: Execute without selecting any skill runs all skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchIndividualSelect0003', 0, async (done: Function) => {
      await runCase('testBatchIndividualSelect0003', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        const totalCount: string = await textOfId('batch_total_count');
        expect(Number(totalCount)).assertEqual(5);
        expect(await existsId('batch_summary_card')).assertTrue();
        await scrollToId('batch_record_0');
        expect(await existsId('batch_record_0')).assertTrue();
      }, done);
    });

    // ==================== Summary 卡片验证 (3 用例) ====================

    /*
     * @tc.number: SUB_BATCH_EXT_0400
     * @tc.name: testBatchSummaryCard0004
     * @tc.desc: Verify summary card shows total, success, failed, and time after execution.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testBatchSummaryCard0004', 0, async (done: Function) => {
      await runCase('testBatchSummaryCard0004', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_total_time');
        expect(await existsId('batch_total_count')).assertTrue();
        expect(await existsId('batch_success_count')).assertTrue();
        expect(await existsId('batch_failed_count')).assertTrue();
        expect(await existsId('batch_total_time')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0500
     * @tc.name: testBatchSummaryCard0005
     * @tc.desc: Verify success + failed equals total count after batch execution.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchSummaryCard0005', 0, async (done: Function) => {
      await runCase('testBatchSummaryCard0005', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_failed_count');
        const totalStr: string = await textOfId('batch_total_count');
        const successStr: string = await textOfId('batch_success_count');
        const failedStr: string = await textOfId('batch_failed_count');
        const total: number = Number(totalStr);
        const success: number = Number(successStr);
        const failed: number = Number(failedStr);
        expect(success + failed).assertEqual(total);
        expect(total).assertEqual(5);
        expect(success).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0600
     * @tc.name: testBatchSummaryCard0006
     * @tc.desc: Verify total time is a non-negative number after execution.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchSummaryCard0006', 0, async (done: Function) => {
      await runCase('testBatchSummaryCard0006', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_total_time');
        const timeStr: string = await textOfId('batch_total_time');
        const timeVal: number = Number(timeStr.replace('ms', ''));
        expect(timeVal).assertLarger(-1);
        expect(timeStr).assertContain('ms');
        expect(await existsId('batch_summary_title')).assertTrue();
      }, done);
    });

    // ==================== Record 卡片字段验证 (3 用例) ====================

    /*
     * @tc.number: SUB_BATCH_EXT_0700
     * @tc.name: testBatchRecordFields0007
     * @tc.desc: Verify first record card shows module, status, and duration fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testBatchRecordFields0007', 0, async (done: Function) => {
      await runCase('testBatchRecordFields0007', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_0');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_duration_0');
        expect(await existsId('batch_module_0')).assertTrue();
        expect(await existsId('batch_status_0')).assertTrue();
        expect(await existsId('batch_duration_0')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0800
     * @tc.name: testBatchRecordFields0008
     * @tc.desc: Verify record card shows bundle name for successful execution.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchRecordFields0008', 0, async (done: Function) => {
      await runCase('testBatchRecordFields0008', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_1');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_record_0');
        const bundleText: string = await textOfId('batch_bundle_0');
        expect(bundleText.length).assertLarger(0);
        expect(await existsId('batch_record_0')).assertTrue();
        expect(await existsId('batch_records_title')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_0900
     * @tc.name: testBatchRecordFields0009
     * @tc.desc: Verify multiple record cards when executing 3 selected skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchRecordFields0009', 0, async (done: Function) => {
      await runCase('testBatchRecordFields0009', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_skill_toggle_0');
        await clickId('batch_skill_toggle_1');
        await clickId('batch_skill_toggle_2');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_record_2');
        expect(await existsId('batch_record_0')).assertTrue();
        expect(await existsId('batch_record_1')).assertTrue();
        expect(await existsId('batch_record_2')).assertTrue();
      }, done);
    });

    // ==================== 选择与取消 (3 用例) ====================

    /*
     * @tc.number: SUB_BATCH_EXT_1000
     * @tc.name: testBatchSelectToggle0010
     * @tc.desc: Select all then deselect one skill, verify toggle states.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchSelectToggle0010', 0, async (done: Function) => {
      await runCase('testBatchSelectToggle0010', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_skill_toggle_0');
        expect(await existsId('batch_skill_toggle_0')).assertTrue();
        expect(await existsId('batch_skill_toggle_1')).assertTrue();
        expect(await existsId('batch_execute_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_1100
     * @tc.name: testBatchSelectToggle0011
     * @tc.desc: Clear results resets summary and records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchSelectToggle0011', 0, async (done: Function) => {
      await runCase('testBatchSelectToggle0011', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        expect(await existsId('batch_summary_card')).assertTrue();
        await clickId('batch_clear_button');
        const summaryExists: boolean = await existsId('batch_summary_card');
        expect(summaryExists).assertFalse();
        const resultText: string = await textOfId('batch_operation_result');
        expect(resultText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_BATCH_EXT_1200
     * @tc.name: testBatchSelectToggle0012
     * @tc.desc: Execute with nonexistent_module and verify failure results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testBatchSelectToggle0012', 0, async (done: Function) => {
      await runCase('testBatchSelectToggle0012', async (): Promise<void> => {
        await navigateToSkillBatch();
        await selectValue(BATCH_MODULE_SELECT, 'nonexistent_module');
        await clickId('batch_skill_toggle_0');
        await clickId('batch_execute_button');
        await waitIdContains('batch_operation_result', 'Batch completed', 15000);
        await scrollToId('batch_failed_count');
        const failedStr: string = await textOfId('batch_failed_count');
        expect(Number(failedStr)).assertLarger(0);
        expect(await existsId('batch_record_0')).assertTrue();
        expect(await existsId('batch_summary_card')).assertTrue();
      }, done);
    });
  })
}
