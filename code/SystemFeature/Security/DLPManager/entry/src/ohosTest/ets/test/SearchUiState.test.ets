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
      const assertOk1: boolean = await exists(driver, 'moreIcon');
      log('testLaunchApp0001 check1: await exists(driver, \'moreIcon\') = ' + String(assertOk1));
      expect(assertOk1).assertTrue();
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
      const assertOk2: boolean = await exists(driver, 'search_files_entry');
      log('testOpenHomeMenu0002 check2: await exists(driver, \'search_files_entry\') = ' + String(assertOk2));
      expect(assertOk2).assertTrue();
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
      const assertOk3: boolean = opened;
      log('testOpenSearchPage0003 check3: opened = ' + String(assertOk3));
      expect(assertOk3).assertTrue();
      const assertOk4: boolean = await exists(driver, 'search_input');
      log('testOpenSearchPage0003 check4: await exists(driver, \'search_input\') = ' + String(assertOk4));
      expect(assertOk4).assertTrue();
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
      const assertOk5: boolean = await exists(driver, 'moreIcon');
      log('testSearchBack0004 check5: await exists(driver, \'moreIcon\') = ' + String(assertOk5));
      expect(assertOk5).assertTrue();
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
      const assertOk6: boolean = await exists(driver, 'filter_all');
      log('testKindChips0005 check6: await exists(driver, \'filter_all\') = ' + String(assertOk6));
      expect(assertOk6).assertTrue();
      const assertOk7: boolean = await exists(driver, 'filter_text');
      log('testKindChips0005 check7: await exists(driver, \'filter_text\') = ' + String(assertOk7));
      expect(assertOk7).assertTrue();
      const assertOk8: boolean = await exists(driver, 'filter_document');
      log('testKindChips0005 check8: await exists(driver, \'filter_document\') = ' + String(assertOk8));
      expect(assertOk8).assertTrue();
      const assertOk9: boolean = await exists(driver, 'filter_image');
      log('testKindChips0005 check9: await exists(driver, \'filter_image\') = ' + String(assertOk9));
      expect(assertOk9).assertTrue();
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
      const assertOk10: boolean = await exists(driver, 'filter_dlp');
      log('testDlpChip0006 check10: await exists(driver, \'filter_dlp\') = ' + String(assertOk10));
      expect(assertOk10).assertTrue();
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
      const assertOk11: boolean = await exists(driver, 'sort_name');
      log('testSortItems0007 check11: await exists(driver, \'sort_name\') = ' + String(assertOk11));
      expect(assertOk11).assertTrue();
      const assertOk12: boolean = await exists(driver, 'sort_size');
      log('testSortItems0007 check12: await exists(driver, \'sort_size\') = ' + String(assertOk12));
      expect(assertOk12).assertTrue();
      const assertOk13: boolean = await exists(driver, 'sort_time');
      log('testSortItems0007 check13: await exists(driver, \'sort_time\') = ' + String(assertOk13));
      expect(assertOk13).assertTrue();
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
      const assertOk14: boolean = await exists(driver, 'search_input');
      log('testFilterText0008 check14: await exists(driver, \'search_input\') = ' + String(assertOk14));
      expect(assertOk14).assertTrue();
      const assertOk15: boolean = await exists(driver, 'search_total');
      log('testFilterText0008 check15: await exists(driver, \'search_total\') = ' + String(assertOk15));
      expect(assertOk15).assertTrue();
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
      const assertOk16: boolean = await exists(driver, 'search_total');
      log('testFilterDocument0009 check16: await exists(driver, \'search_total\') = ' + String(assertOk16));
      expect(assertOk16).assertTrue();
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
      const assertOk17: boolean = await exists(driver, 'search_total');
      log('testFilterImage0010 check17: await exists(driver, \'search_total\') = ' + String(assertOk17));
      expect(assertOk17).assertTrue();
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
      const assertOk18: boolean = await exists(driver, 'search_total');
      log('testFilterAll0011 check18: await exists(driver, \'search_total\') = ' + String(assertOk18));
      expect(assertOk18).assertTrue();
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
      const assertOk19: boolean = await exists(driver, 'search_input');
      log('testDlpToggle0012 check19: await exists(driver, \'search_input\') = ' + String(assertOk19));
      expect(assertOk19).assertTrue();
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
      const assertOk20: boolean = await exists(driver, 'search_total');
      log('testSortSize0013 check20: await exists(driver, \'search_total\') = ' + String(assertOk20));
      expect(assertOk20).assertTrue();
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
      const assertOk21: boolean = await exists(driver, 'search_total');
      log('testSortTime0014 check21: await exists(driver, \'search_total\') = ' + String(assertOk21));
      expect(assertOk21).assertTrue();
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
      const assertOk22: boolean = await exists(driver, 'search_total');
      log('testSortCycle0015 check22: await exists(driver, \'search_total\') = ' + String(assertOk22));
      expect(assertOk22).assertTrue();
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
      const assertOk23: boolean = await exists(driver, 'search_input');
      log('testMultiSelectToggle0016 check23: await exists(driver, \'search_input\') = ' + String(assertOk23));
      expect(assertOk23).assertTrue();
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
      const assertOk24: boolean = empty || first;
      log('testEmptyOrList0017 check24: empty || first = ' + String(assertOk24));
      expect(assertOk24).assertTrue();
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
      const assertOk25: boolean = await exists(driver, 'search_total');
      log('testTotalText0018 check25: await exists(driver, \'search_total\') = ' + String(assertOk25));
      expect(assertOk25).assertTrue();
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
      const assertOk26: boolean = await exists(driver, 'search_total');
      log('testInputKeyword0019 check26: await exists(driver, \'search_total\') = ' + String(assertOk26));
      expect(assertOk26).assertTrue();
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
        const assertOk27: boolean = await exists(driver, 'detail_title');
        log('testOpenDetail0020 check27: await exists(driver, \'detail_title\') = ' + String(assertOk27));
        expect(assertOk27).assertTrue();
      } else {
        const assertOk28: boolean = await exists(driver, 'search_empty');
        log('testOpenDetail0020 check28: await exists(driver, \'search_empty\') = ' + String(assertOk28));
        expect(assertOk28).assertTrue();
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
        const assertOk29: boolean = await exists(driver, 'detail_row_0');
        log('testDetailRows0021 check29: await exists(driver, \'detail_row_0\') = ' + String(assertOk29));
        expect(assertOk29).assertTrue();
        const assertOk30: boolean = await exists(driver, 'detail_row_3');
        log('testDetailRows0021 check30: await exists(driver, \'detail_row_3\') = ' + String(assertOk30));
        expect(assertOk30).assertTrue();
      } else {
        const assertOk31: boolean = await exists(driver, 'search_empty');
        log('testDetailRows0021 check31: await exists(driver, \'search_empty\') = ' + String(assertOk31));
        expect(assertOk31).assertTrue();
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
        const assertOk32: boolean = await exists(driver, 'search_input');
        log('testDetailBack0022 check32: await exists(driver, \'search_input\') = ' + String(assertOk32));
        expect(assertOk32).assertTrue();
      } else {
        const assertOk33: boolean = await exists(driver, 'search_empty');
        log('testDetailBack0022 check33: await exists(driver, \'search_empty\') = ' + String(assertOk33));
        expect(assertOk33).assertTrue();
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
        const assertOk34: boolean = await exists(driver, 'batch_count');
        log('testSelectionFlow0023 check34: await exists(driver, \'batch_count\') = ' + String(assertOk34));
        expect(assertOk34).assertTrue();
      } else {
        const assertOk35: boolean = await exists(driver, 'search_empty');
        log('testSelectionFlow0023 check35: await exists(driver, \'search_empty\') = ' + String(assertOk35));
        expect(assertOk35).assertTrue();
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
        const assertOk36: boolean = await exists(driver, 'batch_count');
        log('testBatchCancel0024 check36: await exists(driver, \'batch_count\') = ' + String(assertOk36));
        expect(assertOk36).assertFalse();
      } else {
        const assertOk37: boolean = await exists(driver, 'search_empty');
        log('testBatchCancel0024 check37: await exists(driver, \'search_empty\') = ' + String(assertOk37));
        expect(assertOk37).assertTrue();
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
        const assertOk38: boolean = await exists(driver, 'batch_count');
        log('testBatchAuthorize0025 check38: await exists(driver, \'batch_count\') = ' + String(assertOk38));
        expect(assertOk38).assertFalse();
      } else {
        const assertOk39: boolean = await exists(driver, 'search_empty');
        log('testBatchAuthorize0025 check39: await exists(driver, \'search_empty\') = ' + String(assertOk39));
        expect(assertOk39).assertTrue();
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
      const assertOk40: boolean = await exists(driver, 'search_input');
      log('testEnterTwice0026 check40: await exists(driver, \'search_input\') = ' + String(assertOk40));
      expect(assertOk40).assertTrue();
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
      const assertOk41: boolean = await exists(driver, 'obtain_visit_record');
      log('testMenuStillWorks0027 check41: await exists(driver, \'obtain_visit_record\') = ' + String(assertOk41));
      expect(assertOk41).assertTrue();
      const assertOk42: boolean = await exists(driver, 'obtain_sandbox_retention_information');
      log('testMenuStillWorks0027 check42: await exists(driver, \'obtain_sandbox_retention_information\') = ' +
        String(assertOk42));
      expect(assertOk42).assertTrue();
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
      const assertOk43: boolean = await exists(driver, 'search_total');
      log('testFilterThenSort0028 check43: await exists(driver, \'search_total\') = ' + String(assertOk43));
      expect(assertOk43).assertTrue();
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
      const assertOk44: boolean = await exists(driver, 'search_total');
      log('testEmptyKeywordReset0029 check44: await exists(driver, \'search_total\') = ' + String(assertOk44));
      expect(assertOk44).assertTrue();
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
      const assertOk45: boolean = await exists(driver, 'moreIcon');
      log('testBackAfterFilter0030 check45: await exists(driver, \'moreIcon\') = ' + String(assertOk45));
      expect(assertOk45).assertTrue();
    })
  });
}
