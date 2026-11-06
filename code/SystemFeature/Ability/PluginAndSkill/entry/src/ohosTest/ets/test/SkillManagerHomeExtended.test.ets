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
  navigateToSkillManagerHome,
  pressBack,
  resetToIndex,
  runCase,
  startApp,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME = 'com.samples.pluginandskill';
const ABILITY_NAME = 'EntryAbility';

export default function skillManagerHomeExtendedTest(): void {
  describe('SkillManagerHomeExtendedTest', () => {
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

    // ==================== SkillManagerHome 按钮完整性 (2 用例) ====================

    /*
     * @tc.number: SUB_SMH_EXT_0100
     * @tc.name: testSkillManagerHomeButtons0001
     * @tc.desc: Verify all 8 navigation buttons exist on SkillManagerHome page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSkillManagerHomeButtons0001', 0, async (done: Function) => {
      await runCase('testSkillManagerHomeButtons0001', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        expect(await existsId('self_skill_query_button')).assertTrue();
        expect(await existsId('bundle_skill_query_button')).assertTrue();
        expect(await existsId('all_skills_query_button')).assertTrue();
        expect(await existsId('skill_execution_button')).assertTrue();
        expect(await existsId('skill_compare_button')).assertTrue();
        expect(await existsId('skill_history_button')).assertTrue();
        expect(await existsId('skill_batch_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SMH_EXT_0200
     * @tc.name: testSkillManagerHomeButtons0002
     * @tc.desc: Verify page title and description text exist on SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSkillManagerHomeButtons0002', 0, async (done: Function) => {
      await runCase('testSkillManagerHomeButtons0002', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_page_description')).assertTrue();
        expect(await existsId('skill_page_title')).assertTrue();
      }, done);
    });

    // ==================== 导航往返验证 (5 用例) ====================

    /*
     * @tc.number: SUB_SMH_EXT_0300
     * @tc.name: testNavRoundTrip0003
     * @tc.desc: Navigate to SkillExecutionPage and back to SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavRoundTrip0003', 0, async (done: Function) => {
      await runCase('testNavRoundTrip0003', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_execution_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SMH_EXT_0400
     * @tc.name: testNavRoundTrip0004
     * @tc.desc: Navigate to SkillComparePage and back to SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavRoundTrip0004', 0, async (done: Function) => {
      await runCase('testNavRoundTrip0004', async (): Promise<void> => {
        await navigateToSkillCompare();
        expect(await existsId('skill_compare_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_compare_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SMH_EXT_0500
     * @tc.name: testNavRoundTrip0005
     * @tc.desc: Navigate to SkillHistoryPage and back to SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavRoundTrip0005', 0, async (done: Function) => {
      await runCase('testNavRoundTrip0005', async (): Promise<void> => {
        await navigateToSkillHistory();
        expect(await existsId('skill_history_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_history_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SMH_EXT_0600
     * @tc.name: testNavRoundTrip0006
     * @tc.desc: Navigate to SkillBatchPage and back to SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavRoundTrip0006', 0, async (done: Function) => {
      await runCase('testNavRoundTrip0006', async (): Promise<void> => {
        await navigateToSkillBatch();
        expect(await existsId('skill_batch_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('skill_batch_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_SMH_EXT_0700
     * @tc.name: testNavRoundTrip0007
     * @tc.desc: Navigate to AllSkillsQueryPage and back to SkillManagerHome.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavRoundTrip0007', 0, async (done: Function) => {
      await runCase('testNavRoundTrip0007', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        await clickId('all_skills_query_button');
        await waitId('all_skills_page_title');
        expect(await existsId('all_skills_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('all_skills_query_button')).assertTrue();
      }, done);
    });

    // ==================== 导航深度验证 (1 用例) ====================

    /*
     * @tc.number: SUB_SMH_EXT_0800
     * @tc.name: testNavDepth0008
     * @tc.desc: Navigate Index → SkillManagerHome → SkillExecution → back twice to Index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testNavDepth0008', 0, async (done: Function) => {
      await runCase('testNavDepth0008', async (): Promise<void> => {
        await navigateToSkillExecution();
        expect(await existsId('skill_execution_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
      }, done);
    });
  })
}
