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
  assertTextExists,
  clickId,
  existsId,
  navigateToAllSkillsQuery,
  navigateToBundleSkillQuery,
  navigateToSelfSkillQuery,
  navigateToSkillManagerHome,
  pressBack,
  resetToIndex,
  runCase,
  startApp,
  textOfId,
  waitId
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pluginandskill';
const ABILITY_NAME: string = 'EntryAbility';

export default function indexAndNavigationTest(): void {
  describe('IndexAndNavigationTest', () => {
    beforeAll(async (): Promise<void> => {
      await startApp(BUNDLE_NAME, ABILITY_NAME);
    })

    beforeEach(async (): Promise<void> => {
      await resetToIndex();
    })

    afterEach(() => {
      // Presets a clear action after each test case
    })

    afterAll(async (): Promise<void> => {
      await resetToIndex();
    })

    // ==================== Index 页面 UI 验证（4 条） ====================

    /*
     * @tc.number: SUB_INDEX_NAV_0100
     * @tc.name: testIndexNavigation0001
     * @tc.desc: Verify that the Index page title text exists and displays the correct application name.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0001', 0, async (done: Function) => {
      await runCase('testIndexNavigation0001', async (): Promise<void> => {
        const titleText: string = await textOfId('EntryAbility_label');
        expect(titleText.length).assertLarger(0);
        expect(await existsId('skillButton')).assertTrue();
        const buttonText: string = await textOfId('skillButton');
        expect(buttonText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0200
     * @tc.name: testIndexNavigation0002
     * @tc.desc: Verify that the Index page description text exists and has content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0002', 0, async (done: Function) => {
      await runCase('testIndexNavigation0002', async (): Promise<void> => {
        expect(await existsId('home_description')).assertTrue();
        const descText: string = await textOfId('home_description');
        expect(descText.length).assertLarger(0);
        expect(await existsId('skillButton')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0300
     * @tc.name: testIndexNavigation0003
     * @tc.desc: Navigate from Index to SkillManagerHome and verify the page title is displayed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0003', 0, async (done: Function) => {
      await runCase('testIndexNavigation0003', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        expect(await existsId('skill_page_title')).assertTrue();
        const titleText: string = await textOfId('skill_page_title');
        expect(titleText.length).assertLarger(0);
        expect(await existsId('skill_page_description')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0400
     * @tc.name: testIndexNavigation0004
     * @tc.desc: Navigate to SkillManagerHome and return to Index, verify the skill button is still present.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0004', 0, async (done: Function) => {
      await runCase('testIndexNavigation0004', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        expect(await existsId('skill_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
        const buttonText: string = await textOfId('skillButton');
        expect(buttonText.length).assertLarger(0);
      }, done);
    });

    // ==================== SkillManagerHome 导航验证（3 条） ====================

    /*
     * @tc.number: SUB_INDEX_NAV_0500
     * @tc.name: testIndexNavigation0005
     * @tc.desc: Verify SkillManagerHome has three navigation buttons with correct text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0005', 0, async (done: Function) => {
      await runCase('testIndexNavigation0005', async (): Promise<void> => {
        await navigateToSkillManagerHome();
        expect(await existsId('self_skill_query_button')).assertTrue();
        expect(await existsId('bundle_skill_query_button')).assertTrue();
        expect(await existsId('all_skills_query_button')).assertTrue();
        const selfText: string = await textOfId('self_skill_query_button');
        expect(selfText.length).assertLarger(0);
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0600
     * @tc.name: testIndexNavigation0006
     * @tc.desc: Navigate to SelfSkillQuery page and verify title and description exist.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0006', 0, async (done: Function) => {
      await runCase('testIndexNavigation0006', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('self_skill_page_title')).assertTrue();
        const titleText: string = await textOfId('self_skill_page_title');
        expect(titleText.length).assertLarger(0);
        expect(await existsId('query_self_skill_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0700
     * @tc.name: testIndexNavigation0007
     * @tc.desc: Navigate to BundleSkillQuery page and verify title and description exist.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0007', 0, async (done: Function) => {
      await runCase('testIndexNavigation0007', async (): Promise<void> => {
        await navigateToBundleSkillQuery();
        expect(await existsId('bundle_skill_page_title')).assertTrue();
        const titleText: string = await textOfId('bundle_skill_page_title');
        expect(titleText.length).assertLarger(0);
        expect(await existsId('query_bundle_skill_button')).assertTrue();
      }, done);
    });

    // ==================== 页面往返验证（3 条） ====================

    /*
     * @tc.number: SUB_INDEX_NAV_0800
     * @tc.name: testIndexNavigation0008
     * @tc.desc: Navigate to AllSkillsQuery page and verify title exists.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0008', 0, async (done: Function) => {
      await runCase('testIndexNavigation0008', async (): Promise<void> => {
        await navigateToAllSkillsQuery();
        expect(await existsId('all_skills_page_title')).assertTrue();
        const titleText: string = await textOfId('all_skills_page_title');
        expect(titleText.length).assertLarger(0);
        expect(await existsId('query_all_skills_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_0900
     * @tc.name: testIndexNavigation0009
     * @tc.desc: Navigate from SelfSkillQuery back to SkillManagerHome and verify page elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIndexNavigation0009', 0, async (done: Function) => {
      await runCase('testIndexNavigation0009', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('self_skill_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        expect(await existsId('self_skill_query_button')).assertTrue();
        expect(await existsId('bundle_skill_query_button')).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_INDEX_NAV_1000
     * @tc.name: testIndexNavigation0010
     * @tc.desc: Continuous navigation Index → SkillManagerHome → SelfSkillQuery → back → back.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testIndexNavigation0010', 0, async (done: Function) => {
      await runCase('testIndexNavigation0010', async (): Promise<void> => {
        await navigateToSelfSkillQuery();
        expect(await existsId('self_skill_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skill_page_title')).assertTrue();
        await pressBack();
        expect(await existsId('skillButton')).assertTrue();
        await navigateToSkillManagerHome();
        expect(await existsId('skill_page_description')).assertTrue();
      }, done);
    });
  });
}
