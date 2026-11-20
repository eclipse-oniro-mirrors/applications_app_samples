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
const TAG: string = 'VideoPageUiTest';

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

async function ensureVideoPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'mainVideo')) {
      return true;
    }
    if (!await ensureHomePage(driver)) {
      return false;
    }
    await clickId(driver, 'videoPageButton');
    await sleep(900);
  }
  return await exists(driver, 'mainVideo');
}

async function prepareVideoPage(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  return await ensureVideoPage(driver);
}

export default function videoPageUiTest(): void {
  describe('VideoPageUiTest', () => {
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
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0601
     * @tc.name      testVideoPageUi0601
     * @tc.desc      Verify the video page is reachable and shows the main video.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual3}`);
      expect(actual3).assertTrue();
      log('testVideoPageUi0601 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0602
     * @tc.name      testVideoPageUi0602
     * @tc.desc      Verify the window direction button is present on the video page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0602 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'windowBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'windowBtn')=${actual5}`);
      expect(actual5).assertTrue();
      log('testVideoPageUi0602 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0603
     * @tc.name      testVideoPageUi0603
     * @tc.desc      Verify the focus state text component is present on the video page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0603 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'focus');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'focus')=${actual7}`);
      expect(actual7).assertTrue();
      log('testVideoPageUi0603 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0604
     * @tc.name      testVideoPageUi0604
     * @tc.desc      Verify main video, direction button and focus text coexist on the page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0604 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'windowBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'windowBtn')=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'focus');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'focus')=${actual11}`);
      expect(actual11).assertTrue();
      log('testVideoPageUi0604 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0605
     * @tc.name      testVideoPageUi0605
     * @tc.desc      Verify the video page can be re-entered after leaving it.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0605 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual12}`);
      expect(actual12).assertTrue();
      await pressBack(driver);
      const actual13: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await ensureVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureVideoPage(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'mainVideo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual15}`);
      expect(actual15).assertTrue();
      log('testVideoPageUi0605 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0606
     * @tc.name      testVideoPageUi0606
     * @tc.desc      Verify repeated video page entry keeps the main video present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0606 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual16}`);
      expect(actual16).assertTrue();
      for (let i: number = 0; i < 2; i++) {
        await pressBack(driver);
        const actual17: boolean = await ensureHomePage(driver);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual17}`);
        expect(actual17).assertTrue();
        const actual18: boolean = await clickId(driver, 'videoPageButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'videoPageButton')=${actual18}`);
        expect(actual18).assertTrue();
        await sleep(900);
        const actual19: boolean = await exists(driver, 'mainVideo');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mainVideo')=${actual19}`);
        expect(actual19).assertTrue();
      }
      log('testVideoPageUi0606 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0607
     * @tc.name      testVideoPageUi0607
     * @tc.desc      Verify pressing back on the video page returns to the home page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0607 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual20}`);
      expect(actual20).assertTrue();
      await pressBack(driver);
      const actual21: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual23}`);
      expect(actual23).assertTrue();
      log('testVideoPageUi0607 end');
    })

    /**
     * @tc.number    SUB_WINDOW_MANAGE_VIDEOUI_0608
     * @tc.name      testVideoPageUi0608
     * @tc.desc      Verify a full video page round trip keeps home page buttons visible.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testVideoPageUi0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testVideoPageUi0608 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepareVideoPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepareVideoPage(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await exists(driver, 'windowBtn');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'windowBtn')=${actual25}`);
      expect(actual25).assertTrue();
      await pressBack(driver);
      const actual26: boolean = await ensureHomePage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureHomePage(driver)=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'videoPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'videoPageButton')=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'systemBarPageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'systemBarPageButton')=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, 'touchablePageButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'touchablePageButton')=${actual29}`);
      expect(actual29).assertTrue();
      log('testVideoPageUi0608 end');
    })
  })
}
