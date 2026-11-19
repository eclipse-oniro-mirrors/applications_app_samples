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

const BUNDLE: string = 'ohos.samples.componentcollection';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexUiStateTest';

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
    await sleep(500);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'tabBar0')) {
      return true;
    }
    if (await exists(driver, 'backBtn')) {
      await clickId(driver, 'backBtn');
      await sleep(500);
    }
  }
  return await exists(driver, 'tabBar0');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureMainPage(driver);
}

export default function indexUiStateTest(): void {
  describe('IndexUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0601
     * @tc.name      testIndexUiState0601
     * @tc.desc      Verify the main page exposes the four bottom tab bars.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'tabBar0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabBar0')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'tabBar1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabBar1')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'tabBar2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabBar2')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'tabBar3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabBar3')=${actual6}`);
      expect(actual6).assertTrue();
      log('testIndexUiState0601 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0602
     * @tc.name      testIndexUiState0602
     * @tc.desc      Verify the main page exposes the category list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0602 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual8}`);
      expect(actual8).assertTrue();
      log('testIndexUiState0602 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0603
     * @tc.name      testIndexUiState0603
     * @tc.desc      Verify the components tab shows the first category row.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0603 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'secondLevelMenu00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'secondLevelMenu00')=${actual10}`);
      expect(actual10).assertTrue();
      log('testIndexUiState0603 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0604
     * @tc.name      testIndexUiState0604
     * @tc.desc      Verify switching to the universal tab shows the first group.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0604 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, 'tabBar1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar1')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const actual13: boolean = await exists(driver, 'ListItem0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'ListItem0')=${actual13}`);
      expect(actual13).assertTrue();
      log('testIndexUiState0604 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0606
     * @tc.name      testIndexUiState0606
     * @tc.desc      Verify switching to the animation tab keeps the list mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0606 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await clickId(driver, 'tabBar2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar2')=${actual18}`);
      expect(actual18).assertTrue();
      await sleep(500);
      const actual19: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual19}`);
      expect(actual19).assertTrue();
      log('testIndexUiState0606 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0607
     * @tc.name      testIndexUiState0607
     * @tc.desc      Verify switching to the global method tab keeps the list mounted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0607 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await clickId(driver, 'tabBar3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar3')=${actual21}`);
      expect(actual21).assertTrue();
      await sleep(500);
      const actual22: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual22}`);
      expect(actual22).assertTrue();
      log('testIndexUiState0607 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0608
     * @tc.name      testIndexUiState0608
     * @tc.desc      Verify switching to universal and back restores the components tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0608 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await clickId(driver, 'tabBar1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar1')=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, 'tabBar0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar0')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'secondLevelMenu00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'secondLevelMenu00')=${actual27}`);
      expect(actual27).assertTrue();
      log('testIndexUiState0608 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0609
     * @tc.name      testIndexUiState0609
     * @tc.desc      Verify a full tab switch cycle through all four tabs works.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0609 begin');
      const driver: Driver = Driver.create();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await clickId(driver, 'tabBar1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar1')=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await clickId(driver, 'tabBar2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar2')=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await clickId(driver, 'tabBar3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar3')=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await clickId(driver, 'tabBar0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabBar0')=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual33}`);
      expect(actual33).assertTrue();
      log('testIndexUiState0609 end');
    })

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_INDEXUI_0610
     * @tc.name      testIndexUiState0610
     * @tc.desc      Verify re-launching the ability keeps the main page available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0610 begin');
      const driver: Driver = Driver.create();
      const actual34: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual34}`);
      expect(actual34).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual35: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await exists(driver, 'list_001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'list_001')=${actual36}`);
      expect(actual36).assertTrue();
      log('testIndexUiState0610 end');
    })
  })
}
