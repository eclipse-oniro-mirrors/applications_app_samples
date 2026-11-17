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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import bundleManager from '@ohos.bundle.bundleManager';
import resourceManager from '@ohos.resourceManager';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  ID_PLAY,
  ID_SELECT_ANIMATION,
  ID_SPEED,
  SETTLE_UI,
  TAB_INDEX_CYCLE,
  TAB_INDEX_POSITION,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  findById,
  getAppResourceManager,
  getAppStringByName,
  launchApp,
  pageAlive,
  scrollPageToBottom,
  scrollPageToTop,
  selectAnimation,
  sleep,
  switchTab,
  tapById,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.PERFORMANCE;

const LAUNCH_BUDGET_MS: number = 8000;
const MENU_BUDGET_MS: number = 3000;
const SELECT_BUDGET_MS: number = 4000;
const TOGGLE_BUDGET_MS: number = 8000;
const TAB_BUDGET_MS: number = 12000;
const QUERY_BUDGET_MS: number = 5000;
const SCROLL_BUDGET_MS: number = 8000;
const STRING_SAMPLE_COUNT: number = 50;
const BUNDLE_SAMPLE_COUNT: number = 20;
const LOOKUP_SAMPLE_COUNT: number = 20;

/**
 * Coarse performance guard rails for the page. The budgets are intentionally
 * generous: the goal is to catch a pathological regression such as a blocked
 * main thread or a runaway redraw, not to benchmark the device.
 */
export default function performanceTest(): void {
  describe('LottiePerformanceTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PERFORMANCE_0100
     * @tc.name launchToVisibleWithinBudget001
     * @tc.desc Verify a launch request makes the page visible within the launch budget
     * @tc.size MediumTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it(BUNDLE + 'launchToVisibleWithinBudget_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'launchToVisibleWithinBudget_001 begin');
      const start: number = Date.now();
      await launchApp();
      const visible: boolean = await waitForText(driver, UiText.PAGE_TITLE, LAUNCH_BUDGET_MS);
      const elapsed: number = Date.now() - start;
      const check01: boolean = visible;
      Logger.info(TAG, 'launchToVisibleWithinBudget_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = elapsed < LAUNCH_BUDGET_MS;
      Logger.info(TAG, 'launchToVisibleWithinBudget_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'launchToVisibleWithinBudget_001 elapsed=' + elapsed);
      Logger.info(TAG, 'launchToVisibleWithinBudget_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PERFORMANCE_0200
     * @tc.name selectorMenuWithinBudget002
     * @tc.desc Verify the selector popup opens within the interaction budget
     * @tc.size MediumTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it(BUNDLE + 'selectorMenuWithinBudget_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'selectorMenuWithinBudget_002 begin');
      const start: number = Date.now();
      const opened: boolean = await tapById(driver, ID_SELECT_ANIMATION);
      const visible: boolean = opened && await waitForText(driver, UiText.MENU_GRUNT, MENU_BUDGET_MS);
      const elapsed: number = Date.now() - start;
      const check01: boolean = visible;
      Logger.info(TAG, 'selectorMenuWithinBudget_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = elapsed < MENU_BUDGET_MS;
      Logger.info(TAG, 'selectorMenuWithinBudget_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      Logger.info(TAG, 'selectorMenuWithinBudget_002 elapsed=' + elapsed);
      Logger.info(TAG, 'selectorMenuWithinBudget_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PERFORMANCE_0300
     * @tc.name bundleQueriesWithinBudget003
     * @tc.desc Verify twenty self bundle queries complete within the query budget
     * @tc.size MediumTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it(BUNDLE + 'bundleQueriesWithinBudget_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bundleQueriesWithinBudget_003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const start: number = Date.now();
      for (let index: number = 0; index < BUNDLE_SAMPLE_COUNT; index++) {
        const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(flags);
        if (info.name.length === 0) {
          const check01: boolean = false;
          Logger.info(TAG, 'bundleQueriesWithinBudget_003, check01=' + JSON.stringify(check01));
          expect(check01).assertTrue();
          return;
        }
      }
      const elapsed: number = Date.now() - start;
      const check02: boolean = elapsed < QUERY_BUDGET_MS;
      Logger.info(TAG, 'bundleQueriesWithinBudget_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'bundleQueriesWithinBudget_003 elapsed=' + elapsed);
      Logger.info(TAG, 'bundleQueriesWithinBudget_003 end');
    });
  });
}
