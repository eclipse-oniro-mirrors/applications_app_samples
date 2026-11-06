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
  navigateToSkillCompare,
  navigateToSkillHistory,
  pressBack,
  resetToIndex,
  runCase,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME = 'com.samples.pluginandskill';
const ABILITY_NAME = 'EntryAbility';
const COMPARE_MODULE_A_SELECT = 'compare_module_a_select';
const COMPARE_SKILL_A_SELECT = 'compare_skill_a_select';
const COMPARE_MODULE_B_SELECT = 'compare_module_b_select';
const COMPARE_SKILL_B_SELECT = 'compare_skill_b_select';

export default function skillCompareAndHistoryTest(): void {
  describe('SkillCompareAndHistoryTest', () => {
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

    // ==================== 技能对比页面验证（5 条） ====================

    /*
     * @tc.number: SUB_SCH_0100
     * @tc.name: testSkillCompareAndHistory0001
     * @tc.desc: Verify SkillComparePage loads with all expected UI elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0001', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0001', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        expect(await existsId('skill_compare_page_description')).assertTrue();
        expect(await existsId('compare_skill_a_label')).assertTrue();
        expect(await existsId('compare_module_a_select')).assertTrue();
        expect(await existsId('compare_skill_a_select')).assertTrue();
        expect(await existsId('compare_skill_b_label')).assertTrue();
        expect(await existsId('compare_module_b_select')).assertTrue();
        expect(await existsId('compare_skill_b_select')).assertTrue();
        expect(await existsId('compare_skills_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0200
     * @tc.name: testSkillCompareAndHistory0002
     * @tc.desc: Compare two different skills and verify result appears.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0002', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0002', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-echo');
        await clickId('compare_skills_button');
        const resultText = await textOfId('compare_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('compare_operation_result')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0300
     * @tc.name: testSkillCompareAndHistory0003
     * @tc.desc: Compare same skill with itself and verify all fields match.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAndHistory0003', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0003', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-test');
        await clickId('compare_skills_button');
        expect(await existsId('compare_operation_result')).assertTrue();
        expect(await existsId('compare_match_rate')).assertTrue();
        const matchRate = await textOfId('compare_match_rate');
        expect(matchRate).assertContain('100%');
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0400
     * @tc.name: testSkillCompareAndHistory0004
     * @tc.desc: Verify navigation round trip to SkillComparePage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0004', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0004', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_compare_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0500
     * @tc.name: testSkillCompareAndHistory0005
     * @tc.desc: Verify compare summary fields appear after comparison.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAndHistory0005', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0005', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-echo');
        await clickId('compare_skills_button');
        expect(await existsId('compare_operation_result')).assertTrue();
        expect(await existsId('compare_result_title')).assertTrue();
        expect(await existsId('compare_total_fields')).assertTrue();
        expect(await existsId('compare_same_count')).assertTrue();
        expect(await existsId('compare_diff_count')).assertTrue();
        expect(await existsId('compare_match_rate')).assertTrue();
      }, done);
    });

    // ==================== 技能历史页面验证（5 条） ====================

    /*
     * @tc.number: SUB_SCH_0600
     * @tc.name: testSkillCompareAndHistory0006
     * @tc.desc: Verify SkillHistoryPage loads with all expected UI elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0006', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0006', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        expect(await existsId('skill_history_page_description')).assertTrue();
        expect(await existsId('history_query_all_button')).assertTrue();
        expect(await existsId('history_clear_button')).assertTrue();
        expect(await existsId('history_filter_label')).assertTrue();
        expect(await existsId('history_stats_title')).assertTrue();
        expect(await existsId('history_records_title')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0700
     * @tc.name: testSkillCompareAndHistory0007
     * @tc.desc: Query all skills and verify history records appear.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0007', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0007', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await clickId('history_query_all_button');
        const resultText = await textOfId('history_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('history_operation_result')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0800
     * @tc.name: testSkillCompareAndHistory0008
     * @tc.desc: Verify statistics update after querying all skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillCompareAndHistory0008', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0008', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await clickId('history_query_all_button');
        const totalCount = await textOfId('history_total_count');
        expect(Number(totalCount)).assertLarger(0);
        expect(await existsId('history_total_count')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_0900
     * @tc.name: testSkillCompareAndHistory0009
     * @tc.desc: Clear history and verify records are removed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAndHistory0009', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0009', async (): Promise<void> => {
        await navigateToSkillHistory();
        await clickId('history_query_all_button');
        await clickId('history_clear_button');
        expect(await existsId('skill_history_page_title')).assertTrue();
        const totalCount = await textOfId('history_total_count');
        expect(totalCount).assertEqual('0');
        expect(await existsId('history_no_records')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SCH_1000
     * @tc.name: testSkillCompareAndHistory0010
     * @tc.desc: Verify filter toggles are accessible on history page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillCompareAndHistory0010', 0, async (done: Function) => {
      await runCase('testSkillCompareAndHistory0010', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('history_filter_success_toggle')).assertTrue();
        expect(await existsId('history_filter_failed_toggle')).assertTrue();
        expect(await existsId('history_statistics_card')).assertTrue();
      }, done);
    });
  })
}
