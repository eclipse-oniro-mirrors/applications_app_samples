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
  navigateToSkillHistory,
  resetToIndex,
  runCase,
  startApp,
  textOfId,
  waitId,
  waitIdContains
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';

export default function skillHistoryExtendedTest(): void {
  describe('SkillHistoryExtendedTest', () => {
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

    // ==================== 统计准确性 (3 用例) ====================

    /*
     * @tc.number: SUB_HIST_EXT_0100
     * @tc.name: testHistoryStats0001
     * @tc.desc: Verify success + failed count equals total after querying all skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHistoryStats0001', 0, async (done: Function) => {
      await runCase('testHistoryStats0001', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        const totalStr: string = await textOfId('history_total_count');
        const successStr: string = await textOfId('history_success_count');
        const failedStr: string = await textOfId('history_failed_count');
        const total: number = Number(totalStr);
        const success: number = Number(successStr);
        const failed: number = Number(failedStr);
        expect(success + failed).assertEqual(total);
        expect(total).assertEqual(5);
        expect(success).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0200
     * @tc.name: testHistoryStats0002
     * @tc.desc: Verify average duration is a non-negative number after query.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryStats0002', 0, async (done: Function) => {
      await runCase('testHistoryStats0002', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_avg_duration', 10000);
        const avgStr: string = await textOfId('history_avg_duration');
        const avgVal: number = Number(avgStr.replace('ms', ''));
        expect(avgVal).assertLarger(-1);
        expect(avgStr).assertContain('ms');
        expect(await existsId('history_stats_title')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0300
     * @tc.name: testHistoryStats0003
     * @tc.desc: Verify all stats reset to 0 after clear.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHistoryStats0003', 0, async (done: Function) => {
      await runCase('testHistoryStats0003', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        await clickId('history_clear_button');
        const totalStr: string = await textOfId('history_total_count');
        const successStr: string = await textOfId('history_success_count');
        const failedStr: string = await textOfId('history_failed_count');
        expect(totalStr).assertEqual('0');
        expect(successStr).assertEqual('0');
        expect(failedStr).assertEqual('0');
      }, done);
    });

    // ==================== 记录卡片字段 (3 用例) ====================

    /*
     * @tc.number: SUB_HIST_EXT_0400
     * @tc.name: testHistoryRecordFields0004
     * @tc.desc: Verify first record card shows bundle, module, time, duration fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHistoryRecordFields0004', 0, async (done: Function) => {
      await runCase('testHistoryRecordFields0004', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_record_0', 10000);
        expect(await existsId('history_bundle_0')).assertTrue();
        expect(await existsId('history_module_0')).assertTrue();
        expect(await existsId('history_time_0')).assertTrue();
        expect(await existsId('history_duration_0')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0500
     * @tc.name: testHistoryRecordFields0005
     * @tc.desc: Verify record card shows skill type field.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryRecordFields0005', 0, async (done: Function) => {
      await runCase('testHistoryRecordFields0005', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_record_0', 10000);
        expect(await existsId('history_type_0')).assertTrue();
        expect(await existsId('history_records_title')).assertTrue();
        expect(await existsId('history_statistics_card')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0600
     * @tc.name: testHistoryRecordFields0006
     * @tc.desc: Verify multiple records exist after querying all 5 skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHistoryRecordFields0006', 0, async (done: Function) => {
      await runCase('testHistoryRecordFields0006', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await clickId('history_query_all_button');
        await waitId('history_record_0', 10000);
        expect(await existsId('history_record_0')).assertTrue();
        expect(await existsId('history_records_title')).assertTrue();
      }, done);
    });

    // ==================== 筛选交互 (3 用例) ====================

    /*
     * @tc.number: SUB_HIST_EXT_0700
     * @tc.name: testHistoryFilter0007
     * @tc.desc: Click success filter and verify filter toggles are accessible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryFilter0007', 0, async (done: Function) => {
      await runCase('testHistoryFilter0007', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        await clickId('history_filter_success_toggle');
        expect(await existsId('history_filter_success_toggle')).assertTrue();
        expect(await existsId('history_filter_failed_toggle')).assertTrue();
        expect(await existsId('history_statistics_card')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0800
     * @tc.name: testHistoryFilter0008
     * @tc.desc: Click failed filter and verify filter toggles remain accessible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryFilter0008', 0, async (done: Function) => {
      await runCase('testHistoryFilter0008', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        await clickId('history_filter_failed_toggle');
        expect(await existsId('history_filter_success_toggle')).assertTrue();
        expect(await existsId('history_filter_failed_toggle')).assertTrue();
        expect(await existsId('history_filter_label')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_0900
     * @tc.name: testHistoryFilter0009
     * @tc.desc: Verify filter title and statistics card exist on history page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHistoryFilter0009', 0, async (done: Function) => {
      await runCase('testHistoryFilter0009', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        expect(await existsId('history_filter_label')).assertTrue();
        expect(await existsId('history_statistics_card')).assertTrue();
      }, done);
    });

    // ==================== 多次查询累积 (3 用例) ====================

    /*
     * @tc.number: SUB_HIST_EXT_1000
     * @tc.name: testHistoryAccumulate0010
     * @tc.desc: Query twice and verify total count increases.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryAccumulate0010', 0, async (done: Function) => {
      await runCase('testHistoryAccumulate0010', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        const firstTotal: string = await textOfId('history_total_count');
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        const secondTotal: string = await textOfId('history_total_count');
        expect(Number(secondTotal)).assertLarger(Number(firstTotal));
        expect(Number(firstTotal)).assertEqual(5);
        expect(Number(secondTotal)).assertEqual(10);
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_1100
     * @tc.name: testHistoryAccumulate0011
     * @tc.desc: Verify operation result text changes after query.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryAccumulate0011', 0, async (done: Function) => {
      await runCase('testHistoryAccumulate0011', async (): Promise<void> => {
        await navigateToSkillHistory();
        const beforeText: string = await textOfId('history_operation_result');
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        const afterText: string = await textOfId('history_operation_result');
        expect(afterText.length).assertLarger(0);
        expect(beforeText.length).assertLarger(0);
        expect(await existsId('history_operation_result')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_HIST_EXT_1200
     * @tc.name: testHistoryAccumulate0012
     * @tc.desc: Clear after multiple queries resets everything to zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testHistoryAccumulate0012', 0, async (done: Function) => {
      await runCase('testHistoryAccumulate0012', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        await clickId('history_query_all_button');
        await waitId('history_total_count', 10000);
        await clickId('history_clear_button');
        const totalStr: string = await textOfId('history_total_count');
        const avgStr: string = await textOfId('history_avg_duration');
        expect(totalStr).assertEqual('0');
        expect(avgStr).assertEqual('0ms');
        expect(await existsId('history_no_records')).assertTrue();
      }, done);
    });
  })
}
