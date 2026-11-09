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
  resetToIndex,
  runCase,
  scrollToTop,
  selectValue,
  startApp,
  textOfId,
  waitId,
  waitIdContains
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const COMPARE_MODULE_A_SELECT: string = 'compare_module_a_select';
const COMPARE_SKILL_A_SELECT: string = 'compare_skill_a_select';
const COMPARE_MODULE_B_SELECT: string = 'compare_module_b_select';
const COMPARE_SKILL_B_SELECT: string = 'compare_skill_b_select';

export default function skillCompareExtendedTest(): void {
  describe('SkillCompareExtendedTest', () => {
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

    // ==================== 相同技能对比 (2 用例) ====================

    /*
     * @tc.number: SUB_CMP_EXT_0100
     * @tc.name: testCompareSameSkill0001
     * @tc.desc: Compare same skill with itself, verify 100% match and 0 diff.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCompareSameSkill0001', 0, async (done: Function) => {
      await runCase('testCompareSameSkill0001', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-test');
        await clickId('compare_skills_button');
        await waitId('compare_match_rate', 10000);
        const matchRate: string = await textOfId('compare_match_rate');
        expect(matchRate).assertContain('100%');
        const diffCount: string = await textOfId('compare_diff_count');
        expect(diffCount).assertEqual('0');
        const totalFields: string = await textOfId('compare_total_fields');
        expect(Number(totalFields)).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_0200
     * @tc.name: testCompareSameSkill0002
     * @tc.desc: Compare same skill, verify same count equals total fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareSameSkill0002', 0, async (done: Function) => {
      await runCase('testCompareSameSkill0002', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-echo');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-echo');
        await clickId('compare_skills_button');
        await waitId('compare_match_rate', 10000);
        const sameCount: string = await textOfId('compare_same_count');
        const totalFields: string = await textOfId('compare_total_fields');
        expect(sameCount).assertEqual(totalFields);
        expect(Number(sameCount)).assertEqual(13);
        expect(await existsId('compare_result_title')).assertTrue();
      }, done);
    });

    // ==================== 不同技能对比 (3 用例) ====================

    /*
     * @tc.number: SUB_CMP_EXT_0300
     * @tc.name: testCompareDiffSkill0003
     * @tc.desc: Compare different skills, verify diff count > 0.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCompareDiffSkill0003', 0, async (done: Function) => {
      await runCase('testCompareDiffSkill0003', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-echo');
        await clickId('compare_skills_button');
        await waitId('compare_diff_count', 10000);
        const diffCount: string = await textOfId('compare_diff_count');
        expect(Number(diffCount)).assertLarger(0);
        const totalFields: string = await textOfId('compare_total_fields');
        expect(Number(totalFields)).assertEqual(13);
        expect(await existsId('compare_match_rate')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_0400
     * @tc.name: testCompareDiffSkill0004
     * @tc.desc: Compare calculator vs validation, verify match rate is not 100%.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareDiffSkill0004', 0, async (done: Function) => {
      await runCase('testCompareDiffSkill0004', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-calculator');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-validation');
        await clickId('compare_skills_button');
        await waitId('compare_match_rate', 10000);
        const matchRate: string = await textOfId('compare_match_rate');
        expect(matchRate !== '100%').assertTrue();
        expect(await existsId('compare_same_count')).assertTrue();
        expect(await existsId('compare_diff_count')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_0500
     * @tc.name: testCompareDiffSkill0005
     * @tc.desc: Verify same + diff equals total fields for different skills.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareDiffSkill0005', 0, async (done: Function) => {
      await runCase('testCompareDiffSkill0005', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-calculator');
        await clickId('compare_skills_button');
        await waitId('compare_total_fields', 10000);
        const sameStr: string = await textOfId('compare_same_count');
        const diffStr: string = await textOfId('compare_diff_count');
        const totalStr: string = await textOfId('compare_total_fields');
        expect(Number(sameStr) + Number(diffStr)).assertEqual(Number(totalStr));
        expect(Number(totalStr)).assertEqual(13);
        expect(await existsId('compare_operation_result')).assertTrue();
      }, done);
    });

    // ==================== 不存在技能对比 (2 用例) ====================

    /*
     * @tc.number: SUB_CMP_EXT_0600
     * @tc.name: testCompareNotFound0006
     * @tc.desc: Compare with nonexistent module for skill A, verify error message.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareNotFound0006', 0, async (done: Function) => {
      await runCase('testCompareNotFound0006', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'nonexistent_module');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-test');
        await clickId('compare_skills_button');
        await waitId('compare_operation_result', 10000);
        const resultText: string = await textOfId('compare_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('compare_skills_button')).assertTrue();
        expect(await existsId('compare_skill_a_label')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_0700
     * @tc.name: testCompareNotFound0007
     * @tc.desc: Compare with nonexistent skill, verify result shows error or not found.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareNotFound0007', 0, async (done: Function) => {
      await runCase('testCompareNotFound0007', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-nonexistent');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-test');
        await clickId('compare_skills_button');
        await waitIdContains('compare_operation_result', 'not found', 10000);
        const resultText: string = await textOfId('compare_operation_result');
        expect(resultText).assertContain('not found');
        expect(await existsId('compare_skills_button')).assertTrue();
        expect(await existsId('compare_skill_b_label')).assertTrue();
      }, done);
    });

    // ==================== 选择器与页面状态 (3 用例) ====================

    /*
     * @tc.number: SUB_CMP_EXT_0800
     * @tc.name: testCompareSelectors0008
     * @tc.desc: Verify all 4 selectors exist on compare page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCompareSelectors0008', 0, async (done: Function) => {
      await runCase('testCompareSelectors0008', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('compare_module_a_select')).assertTrue();
        expect(await existsId('compare_skill_a_select')).assertTrue();
        expect(await existsId('compare_module_b_select')).assertTrue();
        expect(await existsId('compare_skill_b_select')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_0900
     * @tc.name: testCompareSelectors0009
     * @tc.desc: Verify compare page labels for skill A and skill B sections.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCompareSelectors0009', 0, async (done: Function) => {
      await runCase('testCompareSelectors0009', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('compare_skill_a_label')).assertTrue();
        expect(await existsId('compare_skill_b_label')).assertTrue();
        expect(await existsId('compare_skills_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_CMP_EXT_1000
     * @tc.name: testCompareSelectors0010
     * @tc.desc: Compare different module combinations and verify result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCompareSelectors0010', 0, async (done: Function) => {
      await runCase('testCompareSelectors0010', async (): Promise<void> => {
        await navigateToSkillCompare();
        await selectValue(COMPARE_MODULE_A_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_A_SELECT, 'skill-test');
        await selectValue(COMPARE_MODULE_B_SELECT, 'entry');
        await selectValue(COMPARE_SKILL_B_SELECT, 'skill-validation');
        await clickId('compare_skills_button');
        await waitId('compare_total_fields', 10000);
        expect(await existsId('compare_total_fields')).assertTrue();
        expect(await existsId('compare_same_count')).assertTrue();
        expect(await existsId('compare_match_rate')).assertTrue();
      }, done);
    });
  })
}
