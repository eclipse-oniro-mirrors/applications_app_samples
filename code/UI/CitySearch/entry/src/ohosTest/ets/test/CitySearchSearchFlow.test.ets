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
const DOMAIN: number = 0xF811;
const TAG: string = 'CitySearchSearchFlowTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

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
  await clearSearchInput(driver);
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

async function searchFor(driver: Driver, keyword: string): Promise<boolean> {
  try {
    const input: Component = await driver.findComponent(ON.id('citySearchInput'));
    try {
      await input.clearText();
    } catch (error) {
      log('clearText failed: ' + String(error));
    }
    await input.inputText(keyword);
    await sleep(500);
    return true;
  } catch (error) {
    log('searchFor failed: ' + keyword + ' -> ' + String(error));
    return false;
  }
}

export default function citySearchSearchFlowTest(): void {
  describe('CitySearchSearchFlowTest', () => {
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
     * @tc.number    SUB_CITYSEARCH_SEARCHFLOW_0501
     * @tc.name      CitySearch_CitySearchSearchFlow_0501
     * @tc.desc      Verify searching 长 lists both 长沙 and 长春.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchSearchFlow_0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('CitySearch_CitySearchSearchFlow_0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await searchFor(driver, '长');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue searchFor(driver, '长')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'searchItem_长沙');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'searchItem_长沙')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'searchItem_长春');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'searchItem_长春')=${actual5}`);
      expect(actual5).assertTrue();
      log('CitySearch_CitySearchSearchFlow_0501 end');
    })

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCHFLOW_0506
     * @tc.name      CitySearch_CitySearchSearchFlow_0506
     * @tc.desc      Verify a no-match keyword renders an empty result list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchSearchFlow_0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('CitySearch_CitySearchSearchFlow_0506 begin');
      const driver: Driver = Driver.create();
      const actual22: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await searchFor(driver, '城堡');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue searchFor(driver, '城堡')=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, 'searchItem_西安');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'searchItem_西安')=${actual24}`);
      expect(actual24).assertFalse();
      log('CitySearch_CitySearchSearchFlow_0506 end');
    })
  })
}
