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
import { beforeEach, beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { Component, Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.pageloading';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'PageLoadingEntrySmokeTest';

const INDEX_ROOT_ID: string = 'indexRootColumn';
const STACK_ID: string = 'pageLoadingStack';
const LOADING_HUD_ID: string = 'loadingHUD';
const LIST_ID: string = 'commodity_list';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

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

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function forceReset(): Promise<void> {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  if (ability.context.abilityInfo.name === ABILITY) {
    await ability.context.terminateSelf();
    await sleep(600);
  }
  await startMainAbility();
}

async function waitLoaded(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 16; i++) {
    if (await exists(driver, LIST_ID)) {
      return true;
    }
    await sleep(600);
  }
  return await exists(driver, LIST_ID);
}

async function ensurePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, STACK_ID)) {
      return true;
    }
    await startMainAbility();
  }
  return await exists(driver, STACK_ID);
}

export default function abilityTest() {
  describe('PageLoadingEntrySmokeTest', () => {
    beforeEach(yieldToEventLoop);
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await ensurePage(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensurePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0901
     * @tc.name      testEntrySmoke0901
     * @tc.desc      Verify launching the sample brings EntryAbility to the top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0901 begin');
      await startMainAbility();
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${ability !== undefined && ability !== null}`);
      expect(ability !== undefined && ability !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ability.context.abilityInfo.name}, expected=ABILITY`);
      expect(ability.context.abilityInfo.name).assertEqual(ABILITY);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${ability.context.abilityInfo.bundleName}`);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE);
      log('testEntrySmoke0901 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0902
     * @tc.name      testEntrySmoke0902
     * @tc.desc      Verify the page exposes its root column and the loading stack.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0902 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await ensurePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePage(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, INDEX_ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_ROOT_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual4}`);
      expect(actual4).assertTrue();
      log('testEntrySmoke0902 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0903
     * @tc.name      testEntrySmoke0903
     * @tc.desc      Verify a fresh launch starts in the loading phase with the HUD visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0903 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual5: boolean = await exists(driver, LOADING_HUD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LOADING_HUD_ID)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, LIST_ID)=${actual6}`);
      expect(actual6).assertFalse();
      const actual7: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual7}`);
      expect(actual7).assertTrue();
      log('testEntrySmoke0903 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0904
     * @tc.name      testEntrySmoke0904
     * @tc.desc      Verify the HUD disappears and the commodity list appears after loading.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0904 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual8: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, LOADING_HUD_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, LOADING_HUD_ID)=${actual9}`);
      expect(actual9).assertFalse();
      const actual10: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LIST_ID)=${actual10}`);
      expect(actual10).assertTrue();
      log('testEntrySmoke0904 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0905
     * @tc.name      testEntrySmoke0905
     * @tc.desc      Verify the loaded page shows the banner and the goods title.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0905 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual11: boolean = await waitLoaded(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitLoaded(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, 'commodityBanner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'commodityBanner')=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'commodityGoodsTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'commodityGoodsTitle')=${actual13}`);
      expect(actual13).assertTrue();
      log('testEntrySmoke0905 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_ENTRYSMOKE_0906
     * @tc.name      testEntrySmoke0906
     * @tc.desc      Verify repeated launches keep the page reachable and stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0906 begin');
      const driver: Driver = Driver.create();
      await forceReset();
      const actual14: boolean = await ensurePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePage(driver)=${actual14}`);
      expect(actual14).assertTrue();
      await forceReset();
      const actual15: boolean = await ensurePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePage(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, INDEX_ROOT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, INDEX_ROOT_ID)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual17}`);
      expect(actual17).assertTrue();
      log('testEntrySmoke0906 end');
    })
  })
}
