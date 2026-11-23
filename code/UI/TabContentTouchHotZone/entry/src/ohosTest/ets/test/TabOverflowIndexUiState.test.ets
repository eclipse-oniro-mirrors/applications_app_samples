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
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.tabcontenttouchhotzone';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'TabOverflowIndexUiState';

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

async function ensureVideoTab(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'video')) {
      return true;
    }
    if (await exists(driver, 'tabItem1')) {
      await clickId(driver, 'tabItem1');
      await sleep(500);
    } else {
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('startAbility failed: ' + String(error));
      }
      await sleep(1200);
    }
  }
  return await exists(driver, 'video');
}

async function prepare(driver: Driver): Promise<boolean> {
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  } catch (error) {
    log('startAbility failed: ' + String(error));
  }
  await sleep(1200);
  if (!await ensureVideoTab(driver)) {
    log('prepare: video tab is not available');
    return false;
  }
  return true;
}

export default function tabOverflowIndexUiStateTest(): void {
  describe('TabOverflowIndexUiStateTest', () => {
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
      const actual1: boolean = await ensureVideoTab(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureVideoTab(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0401
     * @tc.name      testTabOverflowIndexUi0401
     * @tc.desc      Verify the entry page root container is exposed after launch.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0401 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'indexRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'indexRoot')=${actual3}`);
      expect(actual3).assertTrue();
      log('testTabOverflowIndexUi0401 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0402
     * @tc.name      testTabOverflowIndexUi0402
     * @tc.desc      Verify the Tabs component is exposed on the entry page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0402 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'tabs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabs')=${actual5}`);
      expect(actual5).assertTrue();
      log('testTabOverflowIndexUi0402 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0403
     * @tc.name      testTabOverflowIndexUi0403
     * @tc.desc      Verify the bottom tab bar is exposed on the entry page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0403 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual7}`);
      expect(actual7).assertTrue();
      log('testTabOverflowIndexUi0403 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0404
     * @tc.name      testTabOverflowIndexUi0404
     * @tc.desc      Verify the video player area is rendered on the initial video tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0404 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual9}`);
      expect(actual9).assertTrue();
      log('testTabOverflowIndexUi0404 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0405
     * @tc.name      testTabOverflowIndexUi0405
     * @tc.desc      Verify the play button is rendered before the video starts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0405 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'image')=${actual11}`);
      expect(actual11).assertTrue();
      log('testTabOverflowIndexUi0405 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0406
     * @tc.name      testTabOverflowIndexUi0406
     * @tc.desc      Verify the side action panel is rendered on the video tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0406 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'side');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'side')=${actual13}`);
      expect(actual13).assertTrue();
      log('testTabOverflowIndexUi0406 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0407
     * @tc.name      testTabOverflowIndexUi0407
     * @tc.desc      Verify the video description area is rendered on the video tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0407 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'videoDes');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoDes')=${actual15}`);
      expect(actual15).assertTrue();
      log('testTabOverflowIndexUi0407 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0408
     * @tc.name      testTabOverflowIndexUi0408
     * @tc.desc      Verify the top view with search and tabs is rendered on the video tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0408 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'topView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'topView')=${actual17}`);
      expect(actual17).assertTrue();
      log('testTabOverflowIndexUi0408 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0409
     * @tc.name      testTabOverflowIndexUi0409
     * @tc.desc      Verify the progress bar container is rendered on the video tab.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0409 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'RelativeContainer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'RelativeContainer')=${actual19}`);
      expect(actual19).assertTrue();
      log('testTabOverflowIndexUi0409 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_INDEXUI_0410
     * @tc.name      testTabOverflowIndexUi0410
     * @tc.desc      Verify repeated preparation keeps the page state stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowIndexUi0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowIndexUi0410 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, 'side');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'side')=${actual24}`);
      expect(actual24).assertTrue();
      log('testTabOverflowIndexUi0410 end');
    })
  })
}
