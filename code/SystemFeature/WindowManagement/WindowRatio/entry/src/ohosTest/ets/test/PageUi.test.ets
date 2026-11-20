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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.windowratio';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'WindowRatioPageUiTest';

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
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function startMain(): Promise<void> {
  await delegator.startAbility({
    bundleName: BUNDLE,
    abilityName: ABILITY
  });
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'selectRatio') && await exists(driver, 'changeRatio')) {
      return true;
    }
    await startMain();
    await sleep(800);
  }
  return await exists(driver, 'selectRatio') && await exists(driver, 'changeRatio');
}

async function prepare(driver: Driver): Promise<boolean> {
  await startMain();
  await sleep(1200);
  if (!await ensureMainPage(driver)) {
    log('prepare: main page is not available');
    return false;
  }
  return true;
}

export default function windowRatioPageUiTest(): void {
  describe('WindowRatioPageUiTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await startMain();
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await startMain();
      await sleep(800);
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0301
     * @tc.name      testPageUi0301
     * @tc.desc      Verify the page exposes the ratio select and confirm button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0301 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'selectRatio')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'changeRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'changeRatio')=${actual4}`);
      expect(actual4).assertTrue();
      log('testPageUi0301 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0302
     * @tc.name      testPageUi0302
     * @tc.desc      Verify the page exposes the current ratio text component.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0302 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'ratioText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'ratioText')=${actual6}`);
      expect(actual6).assertTrue();
      log('testPageUi0302 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0303
     * @tc.name      testPageUi0303
     * @tc.desc      Verify the page exposes the window width text component.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0303 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'widthText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'widthText')=${actual8}`);
      expect(actual8).assertTrue();
      log('testPageUi0303 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0304
     * @tc.name      testPageUi0304
     * @tc.desc      Verify the page exposes the window height text component.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0304 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'heightText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heightText')=${actual10}`);
      expect(actual10).assertTrue();
      log('testPageUi0304 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0305
     * @tc.name      testPageUi0305
     * @tc.desc      Verify clicking the confirm button succeeds on the main page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0305 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, 'changeRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'changeRatio')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      log('testPageUi0305 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0306
     * @tc.name      testPageUi0306
     * @tc.desc      Verify the page stays alive after the confirm button click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0306 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, 'changeRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'changeRatio')=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(500);
      const actual15: boolean = await exists(driver, 'changeRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'changeRatio')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'selectRatio')=${actual16}`);
      expect(actual16).assertTrue();
      log('testPageUi0306 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0307
     * @tc.name      testPageUi0307
     * @tc.desc      Verify clicking the ratio select component succeeds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0307 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await clickId(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'selectRatio')=${actual18}`);
      expect(actual18).assertTrue();
      await sleep(500);
      log('testPageUi0307 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0308
     * @tc.name      testPageUi0308
     * @tc.desc      Verify the page stays alive after the select component click.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0308 begin');
      const driver: Driver = Driver.create();
      const actual19: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'selectRatio')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(500);
      const actual21: boolean = await exists(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'selectRatio')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'changeRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'changeRatio')=${actual22}`);
      expect(actual22).assertTrue();
      log('testPageUi0308 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0309
     * @tc.name      testPageUi0309
     * @tc.desc      Verify MainAbility registers the windows key in AppStorage.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0309 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue AppStorage.has('windows')=${AppStorage.has('windows')}`);
      expect(AppStorage.has('windows')).assertTrue();
      log('testPageUi0309 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0310
     * @tc.name      testPageUi0310
     * @tc.desc      Verify the stored windows value resolves to an object.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0310 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const stored: Object | undefined = AppStorage.get<Object>('windows');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue stored !== undefined=${stored !== undefined}`);
      expect(stored !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof stored=${typeof stored}, expected='object'`);
      expect(typeof stored).assertEqual('object');
      log('testPageUi0310 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0311
     * @tc.name      testPageUi0311
     * @tc.desc      Verify repeated prepare keeps the main page reachable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0311 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'selectRatio');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'selectRatio')=${actual27}`);
      expect(actual27).assertTrue();
      log('testPageUi0311 end');
    })

    /**
     * @tc.number    SUB_WINDOWRATIO_PAGEUI_0312
     * @tc.name      testPageUi0312
     * @tc.desc      Verify restarting the ability keeps core components visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPageUi0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPageUi0312 begin');
      const driver: Driver = Driver.create();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      await startMain();
      await sleep(800);
      const actual29: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual29}`);
      expect(actual29).assertTrue();
      log('testPageUi0312 end');
    })
  })
}
