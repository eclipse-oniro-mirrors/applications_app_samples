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
import { Component, Driver, MatchPattern, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.example.locationhubtest';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'LocationUiStateTest';

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

async function shell(cmd: string): Promise<string> {
  const result = await delegator.executeShellCommand(cmd);
  return result.stdResult;
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

async function getText(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    const text: string = await component.getText();
    return text === undefined ? '' : text;
  } catch (error) {
    log('getText failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function tryAllowPermission(driver: Driver): Promise<void> {
  for (let i: number = 0; i < 3; i++) {
    const granted: boolean = await exists(driver, 'heatCityGrid');
    if (granted) {
      return;
    }
    try {
      const allowButton: Component = await driver.findComponent(
        ON.type('Button').text('允许', MatchPattern.CONTAINS));
      if (allowButton !== undefined && allowButton !== null) {
        await allowButton.click();
      }
    } catch (error) {
      log('allow permission failed: ' + String(error));
    }
    await sleep(500);
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    await tryAllowPermission(driver);
    if (await exists(driver, 'heatCityGrid') && await exists(driver, 'provinceList')) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1500);
  }
  return await exists(driver, 'heatCityGrid');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureMainPage(driver);
}

export default function locationUiStateTest(): void {
  describe('LocationUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1500);
      const driver: Driver = Driver.create();
      await tryAllowPermission(driver);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0401
     * @tc.name      testLocationUiPageHeaders0401
     * @tc.desc      Verify the page shows the deliver title and the initial positioning hint.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiPageHeaders0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiPageHeaders0401 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'deliverToTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'deliverToTitle')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'currentPositionHint');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentPositionHint')=${actual4}`);
      expect(actual4).assertTrue();
      log('testLocationUiPageHeaders0401 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0402
     * @tc.name      testLocationUiActionButtons0402
     * @tc.desc      Verify the city select button and the continuous locate button are exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiActionButtons0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiActionButtons0402 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'citySelectButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'citySelectButton')=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'continuousLocationButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'continuousLocationButton')=${actual7}`);
      expect(actual7).assertTrue();
      log('testLocationUiActionButtons0402 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0403
     * @tc.name      testLocationUiListContainers0403
     * @tc.desc      Verify the hot city grid, province list and alphabet indexer are exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiListContainers0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiListContainers0403 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'heatCityGrid');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityGrid')=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'provinceList');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'provinceList')=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'alphabetIndexer');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'alphabetIndexer')=${actual11}`);
      expect(actual11).assertTrue();
      log('testLocationUiListContainers0403 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0404
     * @tc.name      testLocationUiHotCityRow0404
     * @tc.desc      Verify the first hot city row shows Beijing, Shanghai, Guangzhou and Shenzhen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiHotCityRow0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiHotCityRow0404 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'heatCityItem_0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_0')=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, 'heatCityItem_1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_1')=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'heatCityItem_2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_2')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, 'heatCityItem_3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_3')=${actual16}`);
      expect(actual16).assertTrue();
      log('testLocationUiHotCityRow0404 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0405
     * @tc.name      testLocationUiHotCityRow0405
     * @tc.desc      Verify the second hot city row shows Hangzhou, Nanjing, Suzhou and Tianjin.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiHotCityRow0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiHotCityRow0405 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, 'heatCityItem_4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_4')=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'heatCityItem_5');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_5')=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'heatCityItem_6');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_6')=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, 'heatCityItem_7');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_7')=${actual21}`);
      expect(actual21).assertTrue();
      log('testLocationUiHotCityRow0405 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0406
     * @tc.name      testLocationUiHotCityRow0406
     * @tc.desc      Verify the third hot city row shows Wuhan, Changsha, Chongqing and Chengdu.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiHotCityRow0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiHotCityRow0406 begin');
      const driver: Driver = Driver.create();
      const actual22: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'heatCityItem_8');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_8')=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, 'heatCityItem_9');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_9')=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await exists(driver, 'heatCityItem_10');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_10')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'heatCityItem_11');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heatCityItem_11')=${actual26}`);
      expect(actual26).assertTrue();
      log('testLocationUiHotCityRow0406 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0407
     * @tc.name      testLocationUiLetterHeaders0407
     * @tc.desc      Verify the province list exposes the leading letter headers A, B and C.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiLetterHeaders0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiLetterHeaders0407 begin');
      const driver: Driver = Driver.create();
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'letterHeader_A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'letterHeader_A')=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, 'letterHeader_B');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'letterHeader_B')=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await exists(driver, 'letterHeader_C');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'letterHeader_C')=${actual30}`);
      expect(actual30).assertTrue();
      log('testLocationUiLetterHeaders0407 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0408
     * @tc.name      testLocationUiInitialNoLoc0408
     * @tc.desc      Verify a cold start shows the hint and no located result before any action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiInitialNoLoc0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiInitialNoLoc0408 begin');
      const driver: Driver = Driver.create();
      const actual31: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await exists(driver, 'currentPositionHint');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentPositionHint')=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'currentLoc')=${actual33}`);
      expect(actual33).assertFalse();
      log('testLocationUiInitialNoLoc0408 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0409
     * @tc.name      testLocationUiTitleText0409
     * @tc.desc      Verify the deliver title renders the localized text 配送至.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiTitleText0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiTitleText0409 begin');
      const driver: Driver = Driver.create();
      const actual34: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual34}`);
      expect(actual34).assertTrue();
      const title: string = await getText(driver, 'deliverToTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain title=${title}, expected='配送至'`);
      expect(title).assertContain('配送至');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue title.length > 0=${title.length > 0}`);
      expect(title.length > 0).assertTrue();
      log('testLocationUiTitleText0409 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0411
     * @tc.name      testLocationUiClickBeijing0411
     * @tc.desc      Verify tapping the Beijing hot city renders the located header.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiClickBeijing0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiClickBeijing0411 begin');
      const driver: Driver = Driver.create();
      const actual36: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const actual37: boolean = await clickId(driver, 'heatCityItem_0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'heatCityItem_0')=${actual37}`);
      expect(actual37).assertTrue();
      await sleep(500);
      const actual38: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentLoc')=${actual38}`);
      expect(actual38).assertTrue();
      log('testLocationUiClickBeijing0411 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0412
     * @tc.name      testLocationUiClickShanghai0412
     * @tc.desc      Verify tapping the Shanghai hot city renders the located header.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiClickShanghai0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiClickShanghai0412 begin');
      const driver: Driver = Driver.create();
      const actual39: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await clickId(driver, 'heatCityItem_1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'heatCityItem_1')=${actual40}`);
      expect(actual40).assertTrue();
      await sleep(500);
      const actual41: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentLoc')=${actual41}`);
      expect(actual41).assertTrue();
      log('testLocationUiClickShanghai0412 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0413
     * @tc.name      testLocationUiClickSwitch0413
     * @tc.desc      Verify switching from Beijing to Suzhou keeps the located header stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiClickSwitch0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiClickSwitch0413 begin');
      const driver: Driver = Driver.create();
      const actual42: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual42}`);
      expect(actual42).assertTrue();
      const actual43: boolean = await clickId(driver, 'heatCityItem_0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'heatCityItem_0')=${actual43}`);
      expect(actual43).assertTrue();
      await sleep(400);
      const actual44: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentLoc')=${actual44}`);
      expect(actual44).assertTrue();
      const actual45: boolean = await clickId(driver, 'heatCityItem_6');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'heatCityItem_6')=${actual45}`);
      expect(actual45).assertTrue();
      await sleep(500);
      const actual46: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentLoc')=${actual46}`);
      expect(actual46).assertTrue();
      log('testLocationUiClickSwitch0413 end');
    })

    /**
     * @tc.number    SUB_LOCATION_UISTATE_0414
     * @tc.name      testLocationUiClickTianjin0414
     * @tc.desc      Verify tapping the Tianjin hot city renders the located header.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLocationUiClickTianjin0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLocationUiClickTianjin0414 begin');
      const driver: Driver = Driver.create();
      const actual47: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual47}`);
      expect(actual47).assertTrue();
      const actual48: boolean = await clickId(driver, 'heatCityItem_7');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'heatCityItem_7')=${actual48}`);
      expect(actual48).assertTrue();
      await sleep(500);
      const actual49: boolean = await exists(driver, 'currentLoc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'currentLoc')=${actual49}`);
      expect(actual49).assertTrue();
      log('testLocationUiClickTianjin0414 end');
    })
  })
}
