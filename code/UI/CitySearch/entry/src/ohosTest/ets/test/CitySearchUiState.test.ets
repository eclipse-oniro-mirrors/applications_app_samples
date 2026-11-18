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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.citysearch';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'CitySearchUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

const HOT_CITIES: string[] =
  ['北京', '上海', '广州', '深圳', '杭州', '南京', '苏州', '天津', '武汉', '长沙', '重庆', '成都'];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    return false;
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'citySearchInput')) {
      return true;
    }
    try {
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    } catch (error) {
      log('startAbility failed: ' + String(error));
    }
    await sleep(1200);
  }
  return await exists(driver, 'citySearchInput');
}

async function prepare(driver: Driver): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  } catch (error) {
    log('startAbility failed: ' + String(error));
  }
  await sleep(1200);
  if (!await ensureMainPage(driver)) {
    log('prepare: main page is not available');
    return false;
  }
  return true;
}

async function clearSearchInput(driver: Driver): Promise<void> {
  try {
    if (await exists(driver, 'citySearchInput')) {
      const input: Component = await driver.findComponent(ON.id('citySearchInput'));
      await input.clearText();
      await sleep(350);
    }
  } catch (error) {
    log('clearSearchInput failed: ' + String(error));
  }
}

export default function citySearchUiStateTest(): void {
  describe('CitySearchUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('startAbility failed: ' + String(error));
      }
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await clearSearchInput(driver);
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0401
     * @tc.name      testCitySearchUiState0401
     * @tc.desc      Verify the city search input is exposed on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0401 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'citySearchInput');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'citySearchInput')=${actual3}`);
      expect(actual3).assertTrue();
      log('testCitySearchUiState0401 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0402
     * @tc.name      testCitySearchUiState0402
     * @tc.desc      Verify the alphabet city list is visible in the default state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0402 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'cityAlphabetList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cityAlphabetList')=${actual5}`);
      expect(actual5).assertTrue();
      log('testCitySearchUiState0402 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0403
     * @tc.name      testCitySearchUiState0403
     * @tc.desc      Verify the alphabet indexer bar is exposed on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0403 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'cityAlphabetIndexer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cityAlphabetIndexer')=${actual7}`);
      expect(actual7).assertTrue();
      log('testCitySearchUiState0403 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0404
     * @tc.name      testCitySearchUiState0404
     * @tc.desc      Verify the first hot city label is rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0404 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'hotCity_北京');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'hotCity_北京')=${actual9}`);
      expect(actual9).assertTrue();
      log('testCitySearchUiState0404 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0405
     * @tc.name      testCitySearchUiState0405
     * @tc.desc      Verify the first city item of group A is rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0405 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'cityItem_阿尔山');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cityItem_阿尔山')=${actual11}`);
      expect(actual11).assertTrue();
      log('testCitySearchUiState0405 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0406
     * @tc.name      testCitySearchUiState0406
     * @tc.desc      Verify the search result list is hidden in the default state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0406 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'searchResultList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'searchResultList')=${actual13}`);
      expect(actual13).assertFalse();
      log('testCitySearchUiState0406 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0407
     * @tc.name      testCitySearchUiState0407
     * @tc.desc      Verify all twelve hot city labels are rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0407 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      for (const hotCity of HOT_CITIES) {
        const actual15: boolean = await exists(driver, 'hotCity_' + hotCity);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'hotCity_' + hotCity)=${actual15}`);
        expect(actual15).assertTrue();
      }
      log('testCitySearchUiState0407 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_UISTATE_0408
     * @tc.name      testCitySearchUiState0408
     * @tc.desc      Verify the main page state stays stable across repeated launches.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testCitySearchUiState0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testCitySearchUiState0408 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, 'citySearchInput');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'citySearchInput')=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'cityAlphabetList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cityAlphabetList')=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'cityAlphabetIndexer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cityAlphabetIndexer')=${actual20}`);
      expect(actual20).assertTrue();
      log('testCitySearchUiState0408 end');
    })
  })
}
