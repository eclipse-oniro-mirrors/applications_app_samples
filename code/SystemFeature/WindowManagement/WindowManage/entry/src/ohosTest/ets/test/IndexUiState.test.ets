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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'ohos.samples.windowcomponent';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexUiStateTest';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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
  } catch (err) {
    log('exists failed: ' + id + ' -> ' + String(err));
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
  } catch (err) {
    log('clickId failed: ' + id + ' -> ' + String(err));
    return false;
  }
}

async function pressBack(driver: Driver): Promise<void> {
  try {
    await driver.pressBack();
  } catch (err) {
    log('pressBack failed: ' + String(err));
  }
  await sleep(500);
}

async function ensureHomePage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'videoPageButton')) {
      return true;
    }
    await pressBack(driver);
  }
  if (!await exists(driver, 'videoPageButton')) {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, 'videoPageButton');
}

async function prepareHomePage(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureHomePage(driver);
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
      const actual1: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0501
     * @tc.name      testIndexUiState0501
     * @tc.desc      Verify the home page exposes all three navigation buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0501 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual5}`);
      expect(actual5).assertTrue();
      log('testIndexUiState0501 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0502
     * @tc.name      testIndexUiState0502
     * @tc.desc      Verify tapping the video button opens the window video page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0502 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await clickId(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'videoPageButton')=${actual7}`);
      expect(actual7).assertTrue();
      await sleep(800);
      const actual8: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual8}`);
      expect(actual8).assertTrue();
      log('testIndexUiState0502 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0503
     * @tc.name      testIndexUiState0503
     * @tc.desc      Verify the video page navigation works again after returning home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0503 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await clickId(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'videoPageButton')=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(800);
      const actual11: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual11}`);
      expect(actual11).assertTrue();
      await pressBack(driver);
      const actual12: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await clickId(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'videoPageButton')=${actual13}`);
      expect(actual13).assertTrue();
      await sleep(800);
      const actual14: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual14}`);
      expect(actual14).assertTrue();
      log('testIndexUiState0503 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0504
     * @tc.name      testIndexUiState0504
     * @tc.desc      Verify tapping the system bar button opens the system bar page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0504 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await clickId(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(800);
      const actual17: boolean = await exists(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'getPropsButton')=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'propertiesText')=${actual18}`);
      expect(actual18).assertTrue();
      log('testIndexUiState0504 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0505
     * @tc.name      testIndexUiState0505
     * @tc.desc      Verify the system bar navigation works again after returning home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0505 begin');
      const driver: Driver = Driver.create();
      const actual19: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(800);
      const actual21: boolean = await exists(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'getPropsButton')=${actual21}`);
      expect(actual21).assertTrue();
      await pressBack(driver);
      const actual22: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await clickId(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual23}`);
      expect(actual23).assertTrue();
      await sleep(800);
      const actual24: boolean = await exists(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'getPropsButton')=${actual24}`);
      expect(actual24).assertTrue();
      log('testIndexUiState0505 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0506
     * @tc.name      testIndexUiState0506
     * @tc.desc      Verify tapping the touchable area button opens the touchable page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0506 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await clickId(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'touchablePageButton')=${actual26}`);
      expect(actual26).assertTrue();
      await sleep(800);
      const actual27: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'area4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area4')=${actual28}`);
      expect(actual28).assertTrue();
      log('testIndexUiState0506 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0507
     * @tc.name      testIndexUiState0507
     * @tc.desc      Verify the touchable page navigation works again after returning home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0507 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await clickId(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'touchablePageButton')=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(800);
      const actual31: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual31}`);
      expect(actual31).assertTrue();
      await pressBack(driver);
      const actual32: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await clickId(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'touchablePageButton')=${actual33}`);
      expect(actual33).assertTrue();
      await sleep(800);
      const actual34: boolean = await exists(driver, 'area1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'area1')=${actual34}`);
      expect(actual34).assertTrue();
      log('testIndexUiState0507 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0508
     * @tc.name      testIndexUiState0508
     * @tc.desc      Verify visiting all three pages in sequence keeps the home page intact.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0508 begin');
      const driver: Driver = Driver.create();
      const actual35: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual35}`);
      expect(actual35).assertTrue();
      const actual36: boolean = await clickId(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'videoPageButton')=${actual36}`);
      expect(actual36).assertTrue();
      await sleep(600);
      await pressBack(driver);
      const actual37: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await clickId(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual38}`);
      expect(actual38).assertTrue();
      await sleep(600);
      await pressBack(driver);
      const actual39: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await clickId(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'touchablePageButton')=${actual40}`);
      expect(actual40).assertTrue();
      await sleep(600);
      await pressBack(driver);
      const actual41: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual42}`);
      expect(actual42).assertTrue();
      const actual43: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual43}`);
      expect(actual43).assertTrue();
      log('testIndexUiState0508 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0509
     * @tc.name      testIndexUiState0509
     * @tc.desc      Verify repeated entry into the system bar page stays stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0509 begin');
      const driver: Driver = Driver.create();
      const actual44: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual44}`);
      expect(actual44).assertTrue();
      for (let i: number = 0; i < 2; i++) {
        const actual45: boolean = await clickId(driver, 'systemBarPageButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual45}`);
        expect(actual45).assertTrue();
        await sleep(600);
        const actual46: boolean = await exists(driver, 'propertiesText');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'propertiesText')=${actual46}`);
        expect(actual46).assertTrue();
        await pressBack(driver);
        const actual47: boolean = await ensureHomePage(driver);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual47}`);
        expect(actual47).assertTrue();
      }
      log('testIndexUiState0509 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_INDEXUI_0510
     * @tc.name      testIndexUiState0510
     * @tc.desc      Verify starting the ability again keeps the home page buttons visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0510 begin');
      const driver: Driver = Driver.create();
      const actual48: boolean = await prepareHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareHomePage(driver)=${actual48}`);
      expect(actual48).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual49: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual49}`);
      expect(actual49).assertTrue();
      const actual50: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual50}`);
      expect(actual50).assertTrue();
      const actual51: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual51}`);
      expect(actual51).assertTrue();
      log('testIndexUiState0510 end');
    })
  })
}
