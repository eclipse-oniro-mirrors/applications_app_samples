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
const TAG: string = 'TitleExpandUiStateTest';
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

async function swipeUpList(driver: Driver, distance: number): Promise<boolean> {
  try {
    const listComponent: Component = await driver.findComponent(ON.id('contentList'));
    const bounds: Rect = await listComponent.getBounds();
    const centerX: number = (bounds.left + bounds.right) / 2;
    const startY: number = bounds.bottom - 60;
    const endY: number = startY - distance;
    await driver.swipe(centerX, startY, centerX, endY, SWIPE_SPEED);
    await sleep(700);
    return true;
  } catch (error) {
    log('swipeUpList failed: ' + String(error));
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

export default function titleExpandUiStateTest(): void {
  describe('TitleExpandUiStateTest', () => {
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
      const actual47: boolean = await resetListToTop(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue resetListToTop(driver)=${actual47}`);
      expect(actual47).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0801
     * @tc.name      testTitleExpandUiState0801
     * @tc.desc      Verify the title container renders in the initial state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0801 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual4}`);
      expect(actual4).assertTrue();
      log('testTitleExpandUiState0801 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0802
     * @tc.name      testTitleExpandUiState0802
     * @tc.desc      Verify pulling down the list triggers the title expansion path.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0802 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await swipeDownList(driver, 300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 300)=${actual6}`);
      expect(actual6).assertTrue();
      await sleep(500);
      const actual7: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual8}`);
      expect(actual8).assertTrue();
      log('testTitleExpandUiState0802 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0803
     * @tc.name      testTitleExpandUiState0803
     * @tc.desc      Verify swiping up the list triggers the title collapse path.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0803 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await swipeUpList(driver, 300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 300)=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(500);
      const actual11: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual12}`);
      expect(actual12).assertTrue();
      log('testTitleExpandUiState0803 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0804
     * @tc.name      testTitleExpandUiState0804
     * @tc.desc      Verify pull down then swipe up returns the page to a stable state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0804 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await swipeDownList(driver, 250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 250)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await swipeUpList(driver, 250);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 250)=${actual15}`);
      expect(actual15).assertTrue();
      await sleep(500);
      const actual16: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual17}`);
      expect(actual17).assertTrue();
      log('testTitleExpandUiState0804 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0805
     * @tc.name      testTitleExpandUiState0805
     * @tc.desc      Verify repeated short pull downs keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0805 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await swipeDownList(driver, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 120)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await swipeDownList(driver, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 120)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await swipeDownList(driver, 120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 120)=${actual21}`);
      expect(actual21).assertTrue();
      await sleep(500);
      const actual22: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'titleSubText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleSubText')=${actual23}`);
      expect(actual23).assertTrue();
      log('testTitleExpandUiState0805 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0806
     * @tc.name      testTitleExpandUiState0806
     * @tc.desc      Verify a long pull down beyond the threshold keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0806 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await swipeDownList(driver, 500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 500)=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(500);
      const actual26: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'titleImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleImage')=${actual27}`);
      expect(actual27).assertTrue();
      log('testTitleExpandUiState0806 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0807
     * @tc.name      testTitleExpandUiState0807
     * @tc.desc      Verify the main title stays rendered after gesture animations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0807 begin');
      const driver: Driver = Driver.create();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await swipeDownList(driver, 300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 300)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await swipeUpList(driver, 400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 400)=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(500);
      const actual31: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual31}`);
      expect(actual31).assertTrue();
      log('testTitleExpandUiState0807 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0808
     * @tc.name      testTitleExpandUiState0808
     * @tc.desc      Verify the sub title stays rendered after gesture animations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0808 begin');
      const driver: Driver = Driver.create();
      const actual32: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await swipeDownList(driver, 300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 300)=${actual33}`);
      expect(actual33).assertTrue();
      const actual34: boolean = await swipeUpList(driver, 400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 400)=${actual34}`);
      expect(actual34).assertTrue();
      await sleep(500);
      const actual35: boolean = await exists(driver, 'titleSubText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleSubText')=${actual35}`);
      expect(actual35).assertTrue();
      log('testTitleExpandUiState0808 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0809
     * @tc.name      testTitleExpandUiState0809
     * @tc.desc      Verify the content list stays interactive after gesture animations and can return to the top.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0809 begin');
      const driver: Driver = Driver.create();
      const actual36: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await swipeDownList(driver, 300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 300)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await swipeUpList(driver, 400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 400)=${actual38}`);
      expect(actual38).assertTrue();
      await sleep(500);
      const actual39: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await resetListToTop(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue resetListToTop(driver)=${actual40}`);
      expect(actual40).assertTrue();
      log('testTitleExpandUiState0809 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_EXPANDUI_0810
     * @tc.name      testTitleExpandUiState0810
     * @tc.desc      Verify long scroll down and pull back keeps the title rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTitleExpandUiState0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTitleExpandUiState0810 begin');
      const driver: Driver = Driver.create();
      const actual41: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await swipeUpList(driver, 600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeUpList(driver, 600)=${actual42}`);
      expect(actual42).assertTrue();
      const actual43: boolean = await swipeDownList(driver, 600);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue swipeDownList(driver, 600)=${actual43}`);
      expect(actual43).assertTrue();
      await sleep(700);
      const actual44: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual44}`);
      expect(actual44).assertTrue();
      const actual45: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual45}`);
      expect(actual45).assertTrue();
      const actual46: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual46}`);
      expect(actual46).assertTrue();
      log('testTitleExpandUiState0810 end');
    })
  })
}
