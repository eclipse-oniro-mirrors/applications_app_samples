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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.immersive';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'NavHomeUiStateTest';

const HOME_BANNER_ID: string = 'banner';
const HOME_SEARCH_BAR_ID: string = 'immersiveSearchBar';
const HOME_GOODS_ITEM_0_ID: string = 'goodsItem0';

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

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function getBoundsOf(driver: Driver, id: string): Promise<number[]> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    const bounds = await component.getBounds();
    return [bounds.left, bounds.top, bounds.right, bounds.bottom];
  } catch (error) {
    log('getBoundsOf failed: ' + id + ' -> ' + String(error));
    return [];
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensureHomePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, HOME_BANNER_ID)) {
      return true;
    }
    await driver.pressBack();
    await sleep(600);
    if (await exists(driver, HOME_BANNER_ID)) {
      return true;
    }
    await startMainAbility();
  }
  return await exists(driver, HOME_BANNER_ID);
}

async function prepare(driver: Driver): Promise<boolean> {
  await startMainAbility();
  if (!await ensureHomePage(driver)) {
    log('prepare: home page is not available');
    return false;
  }
  return true;
}

export default function navHomeUiStateTest(): void {
  describe('NavHomeUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensureHomePage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0401
     * @tc.name      testHomeUi0401
     * @tc.desc      Verify the home page exposes the immersive banner.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0401 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_BANNER_ID)=${actual3}`);
      expect(actual3).assertTrue();
      log('testHomeUi0401 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0402
     * @tc.name      testHomeUi0402
     * @tc.desc      Verify the home page exposes the immersive search bar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0402 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, HOME_SEARCH_BAR_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_SEARCH_BAR_ID)=${actual5}`);
      expect(actual5).assertTrue();
      log('testHomeUi0402 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0403
     * @tc.name      testHomeUi0403
     * @tc.desc      Verify the first goods card is rendered on the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0403 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_GOODS_ITEM_0_ID)=${actual7}`);
      expect(actual7).assertTrue();
      log('testHomeUi0403 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0405
     * @tc.name      testHomeUi0405
     * @tc.desc      Verify banner, search bar and goods card coexist on home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0405 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_BANNER_ID)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, HOME_SEARCH_BAR_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_SEARCH_BAR_ID)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_GOODS_ITEM_0_ID)=${actual14}`);
      expect(actual14).assertTrue();
      log('testHomeUi0405 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0406
     * @tc.name      testHomeUi0406
     * @tc.desc      Verify the banner has valid non-empty bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0406 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const bounds: number[] = await getBoundsOf(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bounds.length=${bounds.length}, expected=4`);
      expect(bounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[2] > bounds[0]=${bounds[2] > bounds[0]}`);
      expect(bounds[2] > bounds[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[3] > bounds[1]=${bounds[3] > bounds[1]}`);
      expect(bounds[3] > bounds[1]).assertTrue();
      log('testHomeUi0406 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0407
     * @tc.name      testHomeUi0407
     * @tc.desc      Verify the first goods card has valid non-empty bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0407 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const bounds: number[] = await getBoundsOf(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bounds.length=${bounds.length}, expected=4`);
      expect(bounds.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[2] > bounds[0]=${bounds[2] > bounds[0]}`);
      expect(bounds[2] > bounds[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue bounds[3] > bounds[1]=${bounds[3] > bounds[1]}`);
      expect(bounds[3] > bounds[1]).assertTrue();
      log('testHomeUi0407 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_HOMEUI_0408
     * @tc.name      testHomeUi0408
     * @tc.desc      Verify repeated prepares keep the home page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testHomeUi0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testHomeUi0408 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_BANNER_ID)=${actual19}`);
      expect(actual19).assertTrue();
      log('testHomeUi0408 end');
    })
  })
}
