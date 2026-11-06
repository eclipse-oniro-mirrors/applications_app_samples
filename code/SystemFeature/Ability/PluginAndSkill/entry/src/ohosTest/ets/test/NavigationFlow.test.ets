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
  navigateToSkillManagerHome,
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
const MODULE_SELECT_ID = 'skill_module_select';
const SKILL_SELECT_ID = 'skill_name_select';
const BUNDLE_SELECT_ID = 'skill_bundle_select';

export default function navigationFlowTest(): void {
  describe('NavigationFlowTest', () => {
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

    // ==================== 导航流程验证（4 条） ====================

    /*
     * @tc.number: SUB_NAV_FLOW_0100
     * @tc.name: testNavFlow0001
     * @tc.desc: Complete round trip Index → SelfSkillQuery → SkillManagerHome → Index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0001', 0, async (done: Function) => {
      await runCase('testNavFlow0001', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('self_skill_page_title')).assertTrue();
        expect(await existsId('query_self_skill_button')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('self_skill_query_button')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0200
     * @tc.name: testNavFlow0002
     * @tc.desc: Complete round trip Index → BundleSkillQuery → SkillManagerHome → Index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0002', 0, async (done: Function) => {
      await runCase('testNavFlow0002', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        expect(await existsId('query_bundle_skill_button')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('bundle_skill_query_button')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0300
     * @tc.name: testNavFlow0003
     * @tc.desc: Complete round trip Index → AllSkillsQuery → SkillManagerHome → Index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0003', 0, async (done: Function) => {
      await runCase('testNavFlow0003', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        expect(await existsId('all_skills_page_title')).assertTrue();
        expect(await existsId('query_all_skills_button')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('all_skills_query_button')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0400
     * @tc.name: testNavFlow0004
     * @tc.desc: Press back multiple times to verify page stack exits correctly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNavFlow0004', 0, async (done: Function) => {
      await runCase('testNavFlow0004', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('self_skill_page_title')).assertTrue();
        await pressBack();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
        const buttonText = await textOfId('skillButton');
        expect(buttonText.length).assertLarger(0);
      }, done);
    });

    // ==================== 按钮状态验证（3 条） ====================

    /*
     * @tc.number: SUB_NAV_FLOW_0500
     * @tc.name: testNavFlow0005
     * @tc.desc: SelfSkillQuery page query buttons are present and accessible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0005', 0, async (done: Function) => {
      await runCase('testNavFlow0005', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('query_self_skill_button')).assertTrue();
        expect(await existsId('query_self_skills_button')).assertTrue();
        expect(await existsId('skill_module_select')).assertTrue();
        expect(await existsId('skill_name_select')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0600
     * @tc.name: testNavFlow0006
     * @tc.desc: BundleSkillQuery page query buttons are present and accessible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0006', 0, async (done: Function) => {
      await runCase('testNavFlow0006', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        expect(await existsId('query_bundle_skill_button')).assertTrue();
        expect(await existsId('query_bundle_skills_button')).assertTrue();
        expect(await existsId('skill_bundle_select')).assertTrue();
        expect(await existsId('skill_module_select')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0700
     * @tc.name: testNavFlow0007
     * @tc.desc: AllSkillsQuery page query button and flag select are present.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testNavFlow0007', 0, async (done: Function) => {
      await runCase('testNavFlow0007', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        expect(await existsId('query_all_skills_button')).assertTrue();
        expect(await existsId('skill_flag_select')).assertTrue();
        expect(await existsId('all_skills_page_title')).assertTrue();
      }, done);
    });

    // ==================== 边界场景（3 条） ====================

    /*
     * @tc.number: SUB_NAV_FLOW_0800
     * @tc.name: testNavFlow0008
     * @tc.desc: SelfSkillQuery result card updates when parameters change.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNavFlow0008', 0, async (done: Function) => {
      await runCase('testNavFlow0008', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const firstName = await textOfId('skill_result_name_0');
        expect(firstName).assertEqual('skill-test');
        await selectValue(SKILL_SELECT_ID, 'skill-echo');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const secondName = await textOfId('skill_result_name_0');
        expect(secondName).assertEqual('skill-echo');
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_0900
     * @tc.name: testNavFlow0009
     * @tc.desc: BundleSkillQuery with empty bundle shows no results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNavFlow0009', 0, async (done: Function) => {
      await runCase('testNavFlow0009', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        await selectValue(BUNDLE_SELECT_ID, '');
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_bundle_skill_button');
        expect(await existsId('skill_no_results')).assertTrue();
        expect(await existsId('skill_result_name_0')).assertFalse();
        expect(await existsId('skill_page_title')).assertFalse();
      }, done);
    });

    /*
     * @tc.number: SUB_NAV_FLOW_1000
     * @tc.name: testNavFlow0010
     * @tc.desc: Query result page can re-query and overwrite old results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testNavFlow0010', 0, async (done: Function) => {
      await runCase('testNavFlow0010', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        await selectValue(MODULE_SELECT_ID, 'entry');
        await selectValue(SKILL_SELECT_ID, 'skill-test');
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        await clickId('query_self_skill_button');
        expect(await existsId('skill_no_results')).assertFalse();
        const nameText = await textOfId('skill_result_name_0');
        expect(nameText).assertEqual('skill-test');
      }, done);
    });
  });
}
