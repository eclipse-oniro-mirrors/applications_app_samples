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

const BUNDLE: string = 'com.samples.expandtitle';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexUiStateTest';

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
  return true;
}

export default function indexUiStateTest(): void {
  describe('IndexUiStateTest', () => {
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
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0701
     * @tc.name      testIndexUiState0701
     * @tc.desc      Verify the expandable title container is exposed on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0701 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual3}`);
      expect(actual3).assertTrue();
      log('testIndexUiState0701 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0702
     * @tc.name      testIndexUiState0702
     * @tc.desc      Verify the main title text is rendered on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0702 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual5}`);
      expect(actual5).assertTrue();
      log('testIndexUiState0702 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0703
     * @tc.name      testIndexUiState0703
     * @tc.desc      Verify the sub title text is rendered on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0703 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'titleSubText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleSubText')=${actual7}`);
      expect(actual7).assertTrue();
      log('testIndexUiState0703 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0704
     * @tc.name      testIndexUiState0704
     * @tc.desc      Verify the menu container is rendered on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0704 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'titleImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleImage')=${actual9}`);
      expect(actual9).assertTrue();
      log('testIndexUiState0704 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0705
     * @tc.name      testIndexUiState0705
     * @tc.desc      Verify the content list is rendered on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0705 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual11}`);
      expect(actual11).assertTrue();
      log('testIndexUiState0705 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0706
     * @tc.name      testIndexUiState0706
     * @tc.desc      Verify the memo search box is rendered on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0706 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'memoSearch');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'memoSearch')=${actual13}`);
      expect(actual13).assertTrue();
      log('testIndexUiState0706 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0707
     * @tc.name      testIndexUiState0707
     * @tc.desc      Verify the first memo item is rendered in the content list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0707 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'memoItem_1646121972443');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'memoItem_1646121972443')=${actual15}`);
      expect(actual15).assertTrue();
      log('testIndexUiState0707 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0708
     * @tc.name      testIndexUiState0708
     * @tc.desc      Verify the second imageless memo item is rendered in the content list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0708 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'memoItem_1646121972444');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'memoItem_1646121972444')=${actual17}`);
      expect(actual17).assertTrue();
      log('testIndexUiState0708 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0709
     * @tc.name      testIndexUiState0709
     * @tc.desc      Verify the main page state stays stable across repeated launches.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0709 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'titleMainText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'titleMainText')=${actual22}`);
      expect(actual22).assertTrue();
      log('testIndexUiState0709 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_INDEXUI_0710
     * @tc.name      testIndexUiState0710
     * @tc.desc      Verify clicking a memo item keeps the main page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0710 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await clickId(driver, 'memoItem_1646121972443');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'memoItem_1646121972443')=${actual24}`);
      expect(actual24).assertTrue();
      await sleep(500);
      const actual25: boolean = await exists(driver, 'title');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'title')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'contentList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'contentList')=${actual26}`);
      expect(actual26).assertTrue();
      log('testIndexUiState0710 end');
    })
  })
}
