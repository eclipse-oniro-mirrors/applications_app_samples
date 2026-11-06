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
  pressBack,
  resetToIndex,
  runCase,
  selectValue,
  startApp,
  textOfId
} from '../testkit/SharedDriver';

const BUNDLE_NAME = 'com.samples.pluginandskill';
const ABILITY_NAME = 'EntryAbility';
const BATCH_MODULE_SELECT = 'batch_module_select';

export default function skillBatchTest(): void {
  describe('SkillBatchTest', () => {
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

    // ==================== 批量技能操作页面验证（5 条） ====================

    /*
     * @tc.number: SUB_SKILL_BATCH_0100
     * @tc.name: testSkillBatch0001
     * @tc.desc: Verify SkillBatchPage loads with all expected UI elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillBatch0001', 0, async (done: Function) => {
      await runCase('testSkillBatch0001', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('skill_batch_page_title')).assertTrue();
        expect(await existsId('skill_batch_page_description')).assertTrue();
        expect(await existsId('batch_module_label')).assertTrue();
        expect(await existsId('batch_module_select')).assertTrue();
        expect(await existsId('batch_select_skills_label')).assertTrue();
        expect(await existsId('batch_select_all_toggle')).assertTrue();
        expect(await existsId('batch_execute_button')).assertTrue();
        expect(await existsId('batch_clear_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_BATCH_0200
     * @tc.name: testSkillBatch0002
     * @tc.desc: Verify skill toggles are present for each skill.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillBatch0002', 0, async (done: Function) => {
      await runCase('testSkillBatch0002', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('batch_skill_toggle_0')).assertTrue();
        expect(await existsId('batch_skill_toggle_1')).assertTrue();
        expect(await existsId('batch_skill_toggle_2')).assertTrue();
        expect(await existsId('batch_skill_toggle_3')).assertTrue();
        expect(await existsId('batch_skill_toggle_4')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_BATCH_0300
     * @tc.name: testSkillBatch0003
     * @tc.desc: Execute batch with all skills selected and verify results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillBatch0003', 0, async (done: Function) => {
      await runCase('testSkillBatch0003', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('skill_batch_page_title')).assertTrue();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        const resultText = await textOfId('batch_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('batch_operation_result')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_BATCH_0400
     * @tc.name: testSkillBatch0004
     * @tc.desc: Verify navigation round trip to SkillBatchPage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillBatch0004', 0, async (done: Function) => {
      await runCase('testSkillBatch0004', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('skill_batch_page_title')).assertTrue();
        expect(await existsId('skill_batch_page_description')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_batch_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_BATCH_0500
     * @tc.name: testSkillBatch0005
     * @tc.desc: Clear batch results and verify reset state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillBatch0005', 0, async (done: Function) => {
      await runCase('testSkillBatch0005', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('skill_batch_page_title')).assertTrue();
        await selectValue(BATCH_MODULE_SELECT, 'entry');
        await clickId('batch_select_all_toggle');
        await clickId('batch_execute_button');
        await clickId('batch_clear_button');
        const resultText = await textOfId('batch_operation_result');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('batch_clear_button')).assertTrue();
      }, done);
    });
  })
}
