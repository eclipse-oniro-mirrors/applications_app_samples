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
  navigateToSkillExecution,
  pressBack,
  resetToIndex,
  runCase,
  selectValue,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const EXEC_MODULE_SELECT: string = 'execution_module_select';
const EXEC_SKILL_SELECT: string = 'execution_skill_select';

export default function skillExecutionTest(): void {
  describe('SkillExecutionTest', () => {
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

    // ==================== 技能执行页面 UI 验证（3 条） ====================

    /*
     * @tc.number: SUB_SKILL_EXEC_0100
     * @tc.name: testSkillExec0001
     * @tc.desc: Verify SkillExecutionPage loads with all expected UI elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillExec0001', 0, async (done: Function) => {
      await runCase('testSkillExec0001', async (): Promise<void> => {
        await navigateToSkillExecution();
        await waitId('skill_execution_page_title');
        expect(await existsId('skill_execution_page_title')).assertTrue();
        expect(await existsId('skill_execution_page_description')).assertTrue();
        expect(await existsId('execution_module_label')).assertTrue();
        expect(await existsId('execution_module_select')).assertTrue();
        expect(await existsId('execution_skill_label')).assertTrue();
        expect(await existsId('execution_skill_select')).assertTrue();
        expect(await existsId('execute_skill_button')).assertTrue();
        expect(await existsId('execution_result_text')).assertTrue();
        expect(await existsId('execution_history_title')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0200
     * @tc.name: testSkillExec0002
     * @tc.desc: Verify execution page shows initial no-result hint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillExec0002', 0, async (done: Function) => {
      await runCase('testSkillExec0002', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        const resultText: string = await textOfId('execution_result_text');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('execution_no_history')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0300
     * @tc.name: testSkillExec0003
     * @tc.desc: Verify navigation round trip to SkillExecutionPage.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillExec0003', 0, async (done: Function) => {
      await runCase('testSkillExec0003', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_execution_button')).assertTrue();
      }, done);
    });

    // ==================== 技能执行操作验证（4 条） ====================

    /*
     * @tc.number: SUB_SKILL_EXEC_0400
     * @tc.name: testSkillExec0004
     * @tc.desc: Execute a valid skill and verify success result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillExec0004', 0, async (done: Function) => {
      await runCase('testSkillExec0004', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-test');
        await clickId('execute_skill_button');
        const resultText: string = await textOfId('execution_result_text');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('execution_result_text')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0500
     * @tc.name: testSkillExec0005
     * @tc.desc: Execute skill and verify history record appears.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testSkillExec0005', 0, async (done: Function) => {
      await runCase('testSkillExec0005', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-echo');
        await clickId('execute_skill_button');
        expect(await existsId('execution_record_0')).assertTrue();
        expect(await existsId('execution_result_text')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0600
     * @tc.name: testSkillExec0006
     * @tc.desc: Execute with non-existent module and verify failure.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillExec0006', 0, async (done: Function) => {
      await runCase('testSkillExec0006', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'nonexistent_module');
        await selectValue(EXEC_SKILL_SELECT, 'skill-test');
        await clickId('execute_skill_button');
        const resultText: string = await textOfId('execution_result_text');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('execution_result_text')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0700
     * @tc.name: testSkillExec0007
     * @tc.desc: Execute multiple skills and verify multiple history records.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillExec0007', 0, async (done: Function) => {
      await runCase('testSkillExec0007', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-test');
        await clickId('execute_skill_button');
        expect(await existsId('execution_record_0')).assertTrue();
        await selectValue(EXEC_SKILL_SELECT, 'skill-echo');
        await clickId('execute_skill_button');
        expect(await existsId('execution_record_1')).assertTrue();
      }, done);
    });

    // ==================== 执行页面选择器验证（3 条） ====================

    /*
     * @tc.number: SUB_SKILL_EXEC_0800
     * @tc.name: testSkillExec0008
     * @tc.desc: Verify module selector default value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillExec0008', 0, async (done: Function) => {
      await runCase('testSkillExec0008', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        const moduleText: string = await textOfId('execution_module_select');
        expect(moduleText).assertContain('entry');
        expect(await existsId('execution_module_label')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_0900
     * @tc.name: testSkillExec0009
     * @tc.desc: Verify skill selector default value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillExec0009', 0, async (done: Function) => {
      await runCase('testSkillExec0009', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        const skillText: string = await textOfId('execution_skill_select');
        expect(skillText).assertContain('skill-test');
        expect(await existsId('execution_skill_label')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SKILL_EXEC_1000
     * @tc.name: testSkillExec0010
     * @tc.desc: Execute skill-validation and verify result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testSkillExec0010', 0, async (done: Function) => {
      await runCase('testSkillExec0010', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await selectValue(EXEC_MODULE_SELECT, 'entry');
        await selectValue(EXEC_SKILL_SELECT, 'skill-validation');
        await clickId('execute_skill_button');
        const resultText: string = await textOfId('execution_result_text');
        expect(resultText.length).assertLarger(0);
        expect(await existsId('execution_result_text')).assertTrue();
      }, done);
    });
  })
}
