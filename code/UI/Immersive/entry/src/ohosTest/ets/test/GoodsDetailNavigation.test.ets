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
const TAG: string = 'GoodsDetailNavigationTest';

const HOME_BANNER_ID: string = 'banner';
const HOME_GOODS_ITEM_0_ID: string = 'goodsItem0';
const DETAIL_BACK_ID: string = 'goodsDetailBack';
const DETAIL_IMAGE_ID: string = 'goodsDetailImage';
const DETAIL_PRICE_ID: string = 'goodsDetailPrice';
const DETAIL_ADD_CART_ID: string = 'goodsDetailAddCart';
const DETAIL_SETTLEMENT_ID: string = 'goodsDetailSettlement';
const DETAIL_MODEL_ENTRY_ID: string = 'goodsDetailModelEntry';

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

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
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

async function openDetailById(driver: Driver, goodsId: string): Promise<boolean> {
  if (!await clickId(driver, goodsId)) {
    return false;
  }
  await sleep(700);
  return await exists(driver, DETAIL_BACK_ID) && await exists(driver, DETAIL_IMAGE_ID);
}

async function backToHome(driver: Driver): Promise<boolean> {
  if (!await clickId(driver, DETAIL_BACK_ID)) {
    await driver.pressBack();
    await sleep(600);
  }
  await sleep(400);
  return await ensureHomePage(driver);
}

export default function goodsDetailNavigationTest(): void {
  describe('GoodsDetailNavigationTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensureHomePage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await backToHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToHome(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0501
     * @tc.name      testDetailNav0501
     * @tc.desc      Verify tapping the first goods card opens the detail page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, DETAIL_ADD_CART_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_ADD_CART_ID)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, DETAIL_SETTLEMENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_SETTLEMENT_ID)=${actual5}`);
      expect(actual5).assertTrue();
      log('testDetailNav0501 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0502
     * @tc.name      testDetailNav0502
     * @tc.desc      Verify the detail page exposes price and model entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0502 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, DETAIL_PRICE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_PRICE_ID)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, DETAIL_MODEL_ENTRY_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_MODEL_ENTRY_ID)=${actual9}`);
      expect(actual9).assertTrue();
      log('testDetailNav0502 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0503
     * @tc.name      testDetailNav0503
     * @tc.desc      Verify the detail back button returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0503 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await backToHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToHome(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_BANNER_ID)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, DETAIL_BACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, DETAIL_BACK_ID)=${actual14}`);
      expect(actual14).assertFalse();
      log('testDetailNav0503 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0505
     * @tc.name      testDetailNav0505
     * @tc.desc      Verify repeated enter and leave of detail stays stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0505 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await backToHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToHome(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await backToHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToHome(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, HOME_BANNER_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_BANNER_ID)=${actual23}`);
      expect(actual23).assertTrue();
      log('testDetailNav0505 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0506
     * @tc.name      testDetailNav0506
     * @tc.desc      Verify tapping add cart keeps the detail page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0506 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await clickId(driver, DETAIL_ADD_CART_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DETAIL_ADD_CART_ID)=${actual26}`);
      expect(actual26).assertTrue();
      await sleep(500);
      const actual27: boolean = await exists(driver, DETAIL_BACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_BACK_ID)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, DETAIL_IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_IMAGE_ID)=${actual28}`);
      expect(actual28).assertTrue();
      log('testDetailNav0506 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0507
     * @tc.name      testDetailNav0507
     * @tc.desc      Verify tapping settlement keeps the detail page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0507 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await clickId(driver, DETAIL_SETTLEMENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, DETAIL_SETTLEMENT_ID)=${actual31}`);
      expect(actual31).assertTrue();
      await sleep(500);
      const actual32: boolean = await exists(driver, DETAIL_BACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_BACK_ID)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, DETAIL_IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, DETAIL_IMAGE_ID)=${actual33}`);
      expect(actual33).assertTrue();
      log('testDetailNav0507 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_DETAILNAV_0508
     * @tc.name      testDetailNav0508
     * @tc.desc      Verify the first goods card stays clickable after returning.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testDetailNav0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testDetailNav0508 begin');
      const driver: Driver = Driver.create();
      const actual34: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await backToHome(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToHome(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await exists(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, HOME_GOODS_ITEM_0_ID)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await openDetailById(driver, HOME_GOODS_ITEM_0_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue openDetailById(driver, HOME_GOODS_ITEM_0_ID)=${actual38}`);
      expect(actual38).assertTrue();
      log('testDetailNav0508 end');
    })
  })
}
