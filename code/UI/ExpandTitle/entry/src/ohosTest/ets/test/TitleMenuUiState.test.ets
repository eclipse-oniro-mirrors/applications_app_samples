/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.expandtitle';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'TitleMenuUiStateTest';
const SWIPE_SPEED: number = 1600;

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

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'title')) {
      return true;
    }
    try {
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    } catch (error) {
      log('startAbility failed: ' + String(error));
    }
    await sleep(1200);
  }
  return await exists(driver, 'title');
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
  return await resetListToTop(driver);
}

async function swipeDownList(driver: Driver, distance: number): Promise<boolean> {
  try {
    const listComponent: Component = await driver.findComponent(ON.id('contentList'));
    const bounds: Rect = await listComponent.getBounds();
    const centerX: number = (bounds.left + bounds.right) / 2;
    const startY: number = bounds.top + 60;
    const endY: number = startY + distance;
    await driver.swipe(centerX, startY, centerX, endY, SWIPE_SPEED);
    await sleep(700);
    return true;
  } catch (error) {
    log('swipeDownList failed: ' + String(error));
    return false;
  }
}

async function resetListToTop(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 8; i++) {
    if (await exists(driver, 'memoSearch')) {
      return true;
    }
    if (!await swipeDownList(driver, 400)) {
      return false;
    }
  }
  return await exists(driver, 'memoSearch');
}

export default function titleMenuUiStateTest(): void {
  describe('TitleMenuUiStateTest', () => {
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
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
      const actual32: boolean = await resetListToTop(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue resetListToTop(driver)=${actual32}`);
      expect(actual32).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0901
     * @tc.name      testTitleMenuUiState0901
     * @tc.desc      Verify the add menu button is exposed in the title bar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0901 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'menuAddImage')=${actual3}`);
      expect(actual3).assertTrue();
      log('testTitleMenuUiState0901 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0902
     * @tc.name      testTitleMenuUiState0902
     * @tc.desc      Verify the more menu button is exposed in the title bar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0902 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'menuMoreImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'menuMoreImage')=${actual5}`);
      expect(actual5).assertTrue();
      log('testTitleMenuUiState0902 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0903
     * @tc.name      testTitleMenuUiState0903
     * @tc.desc      Verify the add menu button responds to a single click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0903 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await clickId(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuAddImage')=${actual7}`);
      expect(actual7).assertTrue();
      await sleep(500);
      const actual8: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual8}`);
      expect(actual8).assertTrue();
      log('testTitleMenuUiState0903 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0904
     * @tc.name      testTitleMenuUiState0904
     * @tc.desc      Verify the more menu button responds to a single click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0904 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await clickId(driver, 'menuMoreImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuMoreImage')=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(500);
      const actual11: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual11}`);
      expect(actual11).assertTrue();
      log('testTitleMenuUiState0904 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0905
     * @tc.name      testTitleMenuUiState0905
     * @tc.desc      Verify repeated add button clicks keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0905 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await clickId(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuAddImage')=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuAddImage')=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await clickId(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuAddImage')=${actual15}`);
      expect(actual15).assertTrue();
      await sleep(500);
      const actual16: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual17}`);
      expect(actual17).assertTrue();
      log('testTitleMenuUiState0905 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0906
     * @tc.name      testTitleMenuUiState0906
     * @tc.desc      Verify add then more clicks keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0906 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await clickId(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuAddImage')=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'menuMoreImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuMoreImage')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(500);
      const actual21: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'menuAddImage')=${actual22}`);
      expect(actual22).assertTrue();
      log('testTitleMenuUiState0906 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0907
     * @tc.name      testTitleMenuUiState0907
     * @tc.desc      Verify menu clicks do not remove the memo list from the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0907 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await clickId(driver, 'menuMoreImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'menuMoreImage')=${actual24}`);
      expect(actual24).assertTrue();
      await sleep(500);
      const actual25: boolean = await exists(driver, 'memoItem_1646121972443');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'memoItem_1646121972443')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'memoSearch');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'memoSearch')=${actual26}`);
      expect(actual26).assertTrue();
      log('testTitleMenuUiState0907 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_MENUUI_0908
     * @tc.name      testTitleMenuUiState0908
     * @tc.desc      Verify menu buttons stay available across repeated launches.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleMenuUiState0908', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleMenuUiState0908 begin');
      const driver: Driver = Driver.create();
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, 'menuAddImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'menuAddImage')=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await exists(driver, 'menuMoreImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'menuMoreImage')=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await exists(driver, 'titleImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleImage')=${actual31}`);
      expect(actual31).assertTrue();
      log('testTitleMenuUiState0908 end');
    })
  })
}
