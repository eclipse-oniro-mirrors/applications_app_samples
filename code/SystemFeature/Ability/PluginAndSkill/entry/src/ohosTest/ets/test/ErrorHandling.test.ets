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
  navigateToBundleSkillQuery,
  navigateToSelfSkillQuery,
  resetToIndex,
  runCase,
  selectValue,
  startApp,
  textOfId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';
const MODULE_SELECT_ID: string = 'skill_module_select';
const SKILL_SELECT_ID: string = 'skill_name_select';
const BUNDLE_SELECT_ID: string = 'skill_bundle_select';
const FLAG_SELECT_ID: string = 'skill_flag_select';

export default function errorHandlingTest(): void {
  describe('ErrorHandlingTest', () => {
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

    // ==================== 错误信息验证（4 条） ====================

    /*
     * @tc.number: SUB_ERROR_0100
     * @tc.name: testErrorHandling0001
     * @tc.desc: SelfSkillQuery with non-existent module shows BusinessError in result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0001', 0, async (done: Function) => {
      await runCase('testErrorHandling0001', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        const resultText: string = await textOfId('skill_operation_result');
        expect(resultText).assertContain('BusinessError');
        expect(resultText.length).assertLarger(15);
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0200
     * @tc.name: testErrorHandling0002
     * @tc.desc: SelfSkillQuery with non-existent skill shows BusinessError in result.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0002', 0, async (done: Function) => {
      await runCase('testErrorHandling0002', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-nonexistent');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        const resultText: string = await textOfId('skill_operation_result');
        expect(resultText).assertContain('BusinessError');
        expect(resultText).assertContain('17700093');
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0300
     * @tc.name: testErrorHandling0003
     * @tc.desc: BundleSkillQuery with non-existent bundle shows BusinessError.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0003', 0, async (done: Function) => {
      await runCase('testErrorHandling0003', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, 'com.nonexistent.bundle');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        const resultText: string = await textOfId('skill_operation_result');
        expect(resultText).assertContain('BusinessError');
        expect(resultText.length).assertLarger(15);
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0400
     * @tc.name: testErrorHandling0004
     * @tc.desc: BundleSkillQuery with non-existent module shows BusinessError.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0004', 0, async (done: Function) => {
      await runCase('testErrorHandling0004', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_operation_result')).assertTrue();
        const resultText: string = await textOfId('skill_operation_result');
        expect(resultText).assertContain('BusinessError');
        expect(resultText).assertContain(':');
      }, done);
    });

    // ==================== 空参数验证（3 条） ====================

    /*
     * @tc.number: SUB_ERROR_0500
     * @tc.name: testErrorHandling0005
     * @tc.desc: SelfSkillQuery with all empty parameters shows no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testErrorHandling0005', 0, async (done: Function) => {
      await runCase('testErrorHandling0005', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
        expect(await existsId('skill_card_0')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0600
     * @tc.name: testErrorHandling0006
     * @tc.desc: BundleSkillQuery with all empty parameters shows no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testErrorHandling0006', 0, async (done: Function) => {
      await runCase('testErrorHandling0006', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, '');
        await selectValue(MODULE_SELECT_ID, '');
        await selectValue(SKILL_SELECT_ID, '');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
        expect(await existsId('skill_card_0')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0700
     * @tc.name: testErrorHandling0007
     * @tc.desc: BundleSkillQuery query all with empty bundle shows no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testErrorHandling0007', 0, async (done: Function) => {
      await runCase('testErrorHandling0007', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, '');
        await clickId('query_bundle_skills_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_card_0')).assertFalse();
        expect(await existsId('skill_results_title')).assertTrue();
      }, done);
    });

    // ==================== 错误恢复验证（3 条） ====================

    /*
     * @tc.number: SUB_ERROR_0800
     * @tc.name: testErrorHandling0008
     * @tc.desc: After error, correcting parameters allows successful query on SelfSkillQuery.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0008', 0, async (done: Function) => {
      await runCase('testErrorHandling0008', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        const errorText: string = await textOfId('skill_operation_result');
        expect(errorText).assertContain('BusinessError');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const nameText: string = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual('skill-test');
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_0900
     * @tc.name: testErrorHandling0009
     * @tc.desc: After error, correcting parameters allows successful query on BundleSkillQuery.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0009', 0, async (done: Function) => {
      await runCase('testErrorHandling0009', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, 'com.nonexistent.bundle');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        const errorText: string = await textOfId('skill_operation_result');
        expect(errorText).assertContain('BusinessError');
        await selectValue(BUNDLE_SELECT_ID, BUNDLE_NAME);
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const nameText: string = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual('skill-test');
      }, done);
    });

    /*
     * @tc.number: SUB_ERROR_1000
     * @tc.name: testErrorHandling0010
     * @tc.desc: Error result text contains error code and message format.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testErrorHandling0010', 0, async (done: Function) => {
      await runCase('testErrorHandling0010', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'nonexistent_module');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        const resultText: string = await textOfId('skill_operation_result');
        expect(resultText).assertContain(':');
        expect(resultText.length).assertLarger(10);
        expect(await existsId('skill_no_results')).assertTrue();
      }, done);
    });
  });
}
