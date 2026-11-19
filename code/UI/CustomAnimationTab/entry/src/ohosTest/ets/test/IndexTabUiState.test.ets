/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

const BUNDLE: string = 'com.samples.customanimationtab';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexTabUiStateTest';

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

async function backToFirstTab(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await clickId(driver, '0')) {
      await sleep(300);
      return true;
    }
    await sleep(300);
  }
  return false;
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (await exists(driver, 'customAnimationTabRoot') || await exists(driver, 'baseTabContent')) {
    return true;
  }
  log('prepare: custom animation tab page is not available');
  return false;
}

export default function indexTabUiStateTest(): void {
  describe('IndexTabUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await backToFirstTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue backToFirstTab(driver)=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists(driver, 'baseTabContent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'baseTabContent')=${actual2}`);
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDEXUI_0801
     * @tc.name      testIndexTabUiState0801
     * @tc.desc      Verify the page exposes the core tab components.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexTabUiState0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexTabUiState0801 begin');
      const driver: Driver = Driver.create();
      const actual3: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'tabItems');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabItems')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'backgroundBar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backgroundBar')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'baseTabContent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'baseTabContent')=${actual6}`);
      expect(actual6).assertTrue();
      log('testIndexTabUiState0801 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDEXUI_0802
     * @tc.name      testIndexTabUiState0802
     * @tc.desc      Verify the first three bar items are locatable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexTabUiState0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexTabUiState0802 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, '0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, '0')=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, '1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, '1')=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, '2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, '2')=${actual10}`);
      expect(actual10).assertTrue();
      log('testIndexTabUiState0802 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDEXUI_0803
     * @tc.name      testIndexTabUiState0803
     * @tc.desc      Verify clicking bar item 1 shows the UI layout page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexTabUiState0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexTabUiState0803 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, '1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, '1')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const actual13: boolean = await exists(driver, 'uiTabContent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'uiTabContent')=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, 'backgroundBar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'backgroundBar')=${actual14}`);
      expect(actual14).assertTrue();
      log('testIndexTabUiState0803 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_INDEXUI_0810
     * @tc.name      testIndexTabUiState0810
     * @tc.desc      Verify the swiper container survives a tab switch.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexTabUiState0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexTabUiState0810 begin');
      const driver: Driver = Driver.create();
      const actual44: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual44}`);
      expect(actual44).assertTrue();
      const actual45: boolean = await exists(driver, 'tabContent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabContent')=${actual45}`);
      expect(actual45).assertTrue();
      const actual46: boolean = await clickId(driver, '1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, '1')=${actual46}`);
      expect(actual46).assertTrue();
      await sleep(500);
      const actual47: boolean = await exists(driver, 'tabContent');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabContent')=${actual47}`);
      expect(actual47).assertTrue();
      log('testIndexTabUiState0810 end');
    })
  })
}
