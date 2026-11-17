/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.sample.dlpmanager';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'SearchUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function findUi(driver: Driver, matcher: On, timeout: number): Promise<Component | null> {
  try {
    const component: Component = await driver.waitForComponent(matcher, timeout);
    return component !== undefined && component !== null ? component : null;
  } catch (error) {
    return null;
  }
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  return component !== null;
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleep(250);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

const ALLOW_TEXTS: string[] = ['允许', '允许本次使用', '仅使用期间允许', '始终允许', 'Allow'];

async function clickAllowIfPresent(driver: Driver): Promise<boolean> {
  for (let index = 0; index < ALLOW_TEXTS.length; index++) {
    try {
      const button: Component = await driver.waitForComponent(ON.text(ALLOW_TEXTS[index]), 150);
      if (button !== undefined && button !== null) {
        await button.click();
        await sleep(250);
        return true;
      }
    } catch (error) {
      continue;
    }
  }
  return false;
}

async function resetToHome(driver: Driver): Promise<boolean> {
  let probed: boolean = false;
  for (let attempt = 0; attempt < 4; attempt++) {
    if (await exists(driver, 'moreIcon')) {
      if (await exists(driver, 'index_menu_12')) {
        await driver.pressBack();
        await sleep(150);
      }
      return true;
    }
    if (!probed) {
      probed = true;
      if (await clickAllowIfPresent(driver)) {
        continue;
      }
    }
    await driver.pressBack();
    await sleep(200);
  }
  return await exists(driver, 'moreIcon');
}

async function launchApp(driver: Driver): Promise<void> {
  if (await exists(driver, 'moreIcon')) {
    return;
  }
  if (await resetToHome(driver)) {
    return;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(900);
  if (await resetToHome(driver)) {
    return;
  }
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  await resetToHome(driver);
}

async function openSearchPage(driver: Driver): Promise<boolean> {
  if (!(await exists(driver, 'moreIcon'))) {
    return false;
  }
  if (!(await exists(driver, 'index_menu_12'))) {
    await clickId(driver, 'moreIcon');
    await sleep(200);
  }
  if (!(await exists(driver, 'search_files_entry'))) {
    await clickId(driver, 'moreIcon');
    await sleep(200);
  }
  const opened: boolean = await clickId(driver, 'search_files_entry');
  await sleep(400);
  return opened;
}

async function backToIndex(driver: Driver): Promise<void> {
  await clickId(driver, 'search_back');
  await sleep(300);
}

export default function searchUiStateTest(): void {
  describe('SearchUiStateTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0001
     * @tc.name      testLaunchApp0001
     * @tc.desc      application launches and shows the home entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLaunchApp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLaunchApp0001 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await driver.delayMs(800);
      expect(await exists(driver, 'moreIcon')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0002
     * @tc.name      testOpenHomeMenu0002
     * @tc.desc      home menu opens with the search entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenHomeMenu0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOpenHomeMenu0002 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await clickId(driver, 'moreIcon');
      await driver.delayMs(500);
      expect(await exists(driver, 'search_files_entry')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0003
     * @tc.name      testOpenSearchPage0003
     * @tc.desc      search entry opens the search page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenSearchPage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOpenSearchPage0003 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      const opened: boolean = await openSearchPage(driver);
      expect(opened).assertTrue();
      expect(await exists(driver, 'search_input')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0004
     * @tc.name      testSearchBack0004
     * @tc.desc      back button returns to the home page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSearchBack0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSearchBack0004 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await backToIndex(driver);
      expect(await exists(driver, 'moreIcon')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0005
     * @tc.name      testKindChips0005
     * @tc.desc      kind filter chips are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKindChips0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testKindChips0005 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      expect(await exists(driver, 'filter_all')).assertTrue();
      expect(await exists(driver, 'filter_text')).assertTrue();
      expect(await exists(driver, 'filter_document')).assertTrue();
      expect(await exists(driver, 'filter_image')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0006
     * @tc.name      testDlpChip0006
     * @tc.desc      dlp filter chip is rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpChip0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDlpChip0006 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      expect(await exists(driver, 'filter_dlp')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0007
     * @tc.name      testSortItems0007
     * @tc.desc      sort options are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortItems0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSortItems0007 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      expect(await exists(driver, 'sort_name')).assertTrue();
      expect(await exists(driver, 'sort_size')).assertTrue();
      expect(await exists(driver, 'sort_time')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0008
     * @tc.name      testFilterText0008
     * @tc.desc      text filter keeps the page responsive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFilterText0008 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_text');
      expect(await exists(driver, 'search_input')).assertTrue();
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0009
     * @tc.name      testFilterDocument0009
     * @tc.desc      document filter keeps the page responsive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterDocument0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFilterDocument0009 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_document');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0010
     * @tc.name      testFilterImage0010
     * @tc.desc      image filter keeps the page responsive
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterImage0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFilterImage0010 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_image');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0011
     * @tc.name      testFilterAll0011
     * @tc.desc      all filter restores the full list
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterAll0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFilterAll0011 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_image');
      await clickId(driver, 'filter_all');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0012
     * @tc.name      testDlpToggle0012
     * @tc.desc      dlp filter can be toggled twice
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDlpToggle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDlpToggle0012 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_dlp');
      await clickId(driver, 'filter_dlp');
      expect(await exists(driver, 'search_input')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0013
     * @tc.name      testSortSize0013
     * @tc.desc      size sort is selectable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortSize0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSortSize0013 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'sort_size');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0014
     * @tc.name      testSortTime0014
     * @tc.desc      time sort is selectable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSortTime0014 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'sort_time');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0015
     * @tc.name      testSortCycle0015
     * @tc.desc      sort options can be cycled back to name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSortCycle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSortCycle0015 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'sort_size');
      await clickId(driver, 'sort_time');
      await clickId(driver, 'sort_name');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0016
     * @tc.name      testMultiSelectToggle0016
     * @tc.desc      multi select mode toggles without leaving the page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMultiSelectToggle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMultiSelectToggle0016 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'search_multi_select');
      await clickId(driver, 'search_multi_select');
      expect(await exists(driver, 'search_input')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0017
     * @tc.name      testEmptyOrList0017
     * @tc.desc      the result area shows either files or the empty hint
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyOrList0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEmptyOrList0017 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      const empty: boolean = await exists(driver, 'search_empty');
      const first: boolean = await exists(driver, 'search_item_0');
      expect(empty || first).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0018
     * @tc.name      testTotalText0018
     * @tc.desc      the total counter is displayed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTotalText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testTotalText0018 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0019
     * @tc.name      testInputKeyword0019
     * @tc.desc      typing a keyword keeps the page usable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInputKeyword0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testInputKeyword0019 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      const input: Component = await driver.findComponent(ON.id('search_input'));
      if (input !== undefined && input !== null) {
        await input.inputText('txt');
        await sleep(400);
      }
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0020
     * @tc.name      testOpenDetail0020
     * @tc.desc      clicking a result opens the detail page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenDetail0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testOpenDetail0020 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        expect(await exists(driver, 'detail_title')).assertTrue();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0021
     * @tc.name      testDetailRows0021
     * @tc.desc      detail page renders the primary rows
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailRows0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDetailRows0021 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        expect(await exists(driver, 'detail_row_0')).assertTrue();
        expect(await exists(driver, 'detail_row_3')).assertTrue();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0022
     * @tc.name      testDetailBack0022
     * @tc.desc      detail back returns to the search page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDetailBack0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDetailBack0022 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        await clickId(driver, 'detail_back');
        expect(await exists(driver, 'search_input')).assertTrue();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0023
     * @tc.name      testSelectionFlow0023
     * @tc.desc      selecting a file shows the batch bar
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectionFlow0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testSelectionFlow0023 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'search_multi_select');
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        expect(await exists(driver, 'batch_count')).assertTrue();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0024
     * @tc.name      testBatchCancel0024
     * @tc.desc      batch cancel hides the batch bar
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBatchCancel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBatchCancel0024 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'search_multi_select');
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        await clickId(driver, 'search_batch_cancel');
        expect(await exists(driver, 'batch_count')).assertFalse();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0025
     * @tc.name      testBatchAuthorize0025
     * @tc.desc      batch authorize clears the selection
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBatchAuthorize0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBatchAuthorize0025 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'search_multi_select');
      if (await exists(driver, 'search_item_0')) {
        await clickId(driver, 'search_item_0');
        await clickId(driver, 'search_batch_authorize');
        expect(await exists(driver, 'batch_count')).assertFalse();
      } else {
        expect(await exists(driver, 'search_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0026
     * @tc.name      testEnterTwice0026
     * @tc.desc      the search page can be opened repeatedly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnterTwice0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEnterTwice0026 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await backToIndex(driver);
      await openSearchPage(driver);
      expect(await exists(driver, 'search_input')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0027
     * @tc.name      testMenuStillWorks0027
     * @tc.desc      original menu entries remain available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMenuStillWorks0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMenuStillWorks0027 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await clickId(driver, 'moreIcon');
      await driver.delayMs(400);
      expect(await exists(driver, 'obtain_visit_record')).assertTrue();
      expect(await exists(driver, 'obtain_sandbox_retention_information')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0028
     * @tc.name      testFilterThenSort0028
     * @tc.desc      filter and sort can be combined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFilterThenSort0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFilterThenSort0028 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_text');
      await clickId(driver, 'sort_size');
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0029
     * @tc.name      testEmptyKeywordReset0029
     * @tc.desc      clearing the keyword keeps the result area stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyKeywordReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testEmptyKeywordReset0029 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      const input: Component = await driver.findComponent(ON.id('search_input'));
      if (input !== undefined && input !== null) {
        await input.inputText('');
        await sleep(300);
      }
      expect(await exists(driver, 'search_total')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SEARCHUI_0030
     * @tc.name      testBackAfterFilter0030
     * @tc.desc      back navigation works after filtering
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBackAfterFilter0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testBackAfterFilter0030 begin');
      const driver: Driver = Driver.create();
      await launchApp(driver);
      await openSearchPage(driver);
      await clickId(driver, 'filter_document');
      await backToIndex(driver);
      expect(await exists(driver, 'moreIcon')).assertTrue();
    })
  });
}
