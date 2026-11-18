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
const TAG: string = 'SystemBarUiStateTest';

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

async function getTextById(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return '';
    }
    return await component.getText();
  } catch (err) {
    log('getTextById failed: ' + id + ' -> ' + String(err));
    return '';
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

async function ensureSystemBarPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'getPropsButton')) {
      return true;
    }
    if (!await ensureHomePage(driver)) {
      return false;
    }
    await clickId(driver, 'systemBarPageButton');
    await sleep(900);
  }
  return await exists(driver, 'getPropsButton');
}

async function prepareSystemBarPage(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureSystemBarPage(driver);
}

export default function systemBarUiStateTest(): void {
  describe('SystemBarUiStateTest', () => {
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
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0701
     * @tc.name      testSystemBarUiState0701
     * @tc.desc      Verify the system bar page is reachable with button and text visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0701 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'getPropsButton')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'propertiesText')=${actual4}`);
      expect(actual4).assertTrue();
      log('testSystemBarUiState0701 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0702
     * @tc.name      testSystemBarUiState0702
     * @tc.desc      Verify the properties text is empty before any query is triggered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0702 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const text: string = await getTextById(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=''`);
      expect(text).assertEqual('');
      log('testSystemBarUiState0702 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0703
     * @tc.name      testSystemBarUiState0703
     * @tc.desc      Verify tapping the query button fills the properties text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0703 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual7}`);
      expect(actual7).assertTrue();
      await sleep(700);
      const text: string = await getTextById(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text !== ''=${text !== ''}`);
      expect(text !== '').assertTrue();
      log('testSystemBarUiState0703 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0704
     * @tc.name      testSystemBarUiState0704
     * @tc.desc      Verify repeated query taps keep the properties text filled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0704 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(700);
      const actual10: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(700);
      const text: string = await getTextById(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue text !== ''=${text !== ''}`);
      expect(text !== '').assertTrue();
      log('testSystemBarUiState0704 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0705
     * @tc.name      testSystemBarUiState0705
     * @tc.desc      Verify re-entering the page resets the properties text to empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0705 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(700);
      const actual13: boolean = await getTextById(driver, 'propertiesText') !== '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue getTextById(driver, 'propertiesText') !== ''=${actual13}`);
      expect(actual13).assertTrue();
      await pressBack(driver);
      const actual14: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await clickId(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual15}`);
      expect(actual15).assertTrue();
      await sleep(900);
      const actual16: boolean = await exists(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'propertiesText')=${actual16}`);
      expect(actual16).assertTrue();
      const text: string = await getTextById(driver, 'propertiesText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected=''`);
      expect(text).assertEqual('');
      log('testSystemBarUiState0705 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0706
     * @tc.name      testSystemBarUiState0706
     * @tc.desc      Verify the properties text can be filled again after a reset.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0706 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual18}`);
      expect(actual18).assertTrue();
      await sleep(700);
      const actual19: boolean = await getTextById(driver, 'propertiesText') !== '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue getTextById(driver, 'propertiesText') !== ''=${actual19}`);
      expect(actual19).assertTrue();
      await pressBack(driver);
      const actual20: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await ensureSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureSystemBarPage(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await clickId(driver, 'getPropsButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'getPropsButton')=${actual22}`);
      expect(actual22).assertTrue();
      await sleep(700);
      const actual23: boolean = await getTextById(driver, 'propertiesText') !== '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue getTextById(driver, 'propertiesText') !== ''=${actual23}`);
      expect(actual23).assertTrue();
      log('testSystemBarUiState0706 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0707
     * @tc.name      testSystemBarUiState0707
     * @tc.desc      Verify pressing back on the system bar page returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0707 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual24}`);
      expect(actual24).assertTrue();
      await pressBack(driver);
      const actual25: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual27}`);
      expect(actual27).assertTrue();
      log('testSystemBarUiState0707 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_SYSTEMBARUI_0708
     * @tc.name      testSystemBarUiState0708
     * @tc.desc      Verify repeated system bar page entries stay stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSystemBarUiState0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testSystemBarUiState0708 begin');
      const driver: Driver = Driver.create();
      const actual28: boolean = await prepareSystemBarPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareSystemBarPage(driver)=${actual28}`);
      expect(actual28).assertTrue();
      for (let i: number = 0; i < 2; i++) {
        await pressBack(driver);
        const actual29: boolean = await ensureHomePage(driver);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual29}`);
        expect(actual29).assertTrue();
        const actual30: boolean = await clickId(driver, 'systemBarPageButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'systemBarPageButton')=${actual30}`);
        expect(actual30).assertTrue();
        await sleep(900);
        const actual31: boolean = await exists(driver, 'getPropsButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'getPropsButton')=${actual31}`);
        expect(actual31).assertTrue();
        const actual32: boolean = await exists(driver, 'propertiesText');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'propertiesText')=${actual32}`);
        expect(actual32).assertTrue();
      }
      log('testSystemBarUiState0708 end');
    })
  })
}
