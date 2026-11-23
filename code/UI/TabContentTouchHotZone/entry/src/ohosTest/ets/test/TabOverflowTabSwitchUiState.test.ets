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
const TAG: string = 'TabOverflowTabSwitchUiState';

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

export default function tabOverflowTabSwitchUiStateTest(): void {
  describe('TabOverflowTabSwitchUiStateTest', () => {
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
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0601
     * @tc.name      testTabOverflowTabSwitch0601
     * @tc.desc      Verify all four bottom tab items are exposed on the tab bar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'tabItem0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabItem0')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'tabItem1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabItem1')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'tabItem2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabItem2')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'tabItem3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabItem3')=${actual6}`);
      expect(actual6).assertTrue();
      log('testTabOverflowTabSwitch0601 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0602
     * @tc.name      testTabOverflowTabSwitch0602
     * @tc.desc      Verify clicking the homepage tab renders the homepage text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0602 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await clickId(driver, 'tabItem0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem0')=${actual8}`);
      expect(actual8).assertTrue();
      await sleep(600);
      const actual9: boolean = await exists(driver, 'homepageText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'homepageText')=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual10}`);
      expect(actual10).assertTrue();
      log('testTabOverflowTabSwitch0602 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0603
     * @tc.name      testTabOverflowTabSwitch0603
     * @tc.desc      Verify clicking the mall tab renders the mall text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0603 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, 'tabItem2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem2')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(600);
      const actual13: boolean = await exists(driver, 'mallText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mallText')=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual14}`);
      expect(actual14).assertTrue();
      log('testTabOverflowTabSwitch0603 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0604
     * @tc.name      testTabOverflowTabSwitch0604
     * @tc.desc      Verify clicking the mine tab renders the mine text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0604 begin');
      const driver: Driver = Driver.create();
      const actual15: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await clickId(driver, 'tabItem3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem3')=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(600);
      const actual17: boolean = await exists(driver, 'mineText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mineText')=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual18}`);
      expect(actual18).assertTrue();
      log('testTabOverflowTabSwitch0604 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0605
     * @tc.name      testTabOverflowTabSwitch0605
     * @tc.desc      Verify clicking the video tab renders the video player area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0605 begin');
      const driver: Driver = Driver.create();
      const actual19: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'tabItem0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem0')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(600);
      const actual21: boolean = await clickId(driver, 'tabItem1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem1')=${actual21}`);
      expect(actual21).assertTrue();
      await sleep(600);
      const actual22: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual23}`);
      expect(actual23).assertTrue();
      log('testTabOverflowTabSwitch0605 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0606
     * @tc.name      testTabOverflowTabSwitch0606
     * @tc.desc      Verify a full tab round trip renders each tab content in order.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0606 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, 'tabItem0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem0')=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(600);
      const actual26: boolean = await exists(driver, 'homepageText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'homepageText')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await clickId(driver, 'tabItem2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem2')=${actual27}`);
      expect(actual27).assertTrue();
      await sleep(600);
      const actual28: boolean = await exists(driver, 'mallText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mallText')=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await clickId(driver, 'tabItem3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem3')=${actual29}`);
      expect(actual29).assertTrue();
      await sleep(600);
      const actual30: boolean = await exists(driver, 'mineText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'mineText')=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await clickId(driver, 'tabItem1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem1')=${actual31}`);
      expect(actual31).assertTrue();
      await sleep(600);
      const actual32: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual32}`);
      expect(actual32).assertTrue();
      log('testTabOverflowTabSwitch0606 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0607
     * @tc.name      testTabOverflowTabSwitch0607
     * @tc.desc      Verify repeated switches between homepage and video stay stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0607 begin');
      const driver: Driver = Driver.create();
      const actual33: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual33}`);
      expect(actual33).assertTrue();
      for (let i: number = 0; i < 3; i++) {
        const actual34: boolean = await clickId(driver, 'tabItem0');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem0')=${actual34}`);
        expect(actual34).assertTrue();
        await sleep(500);
        const actual35: boolean = await exists(driver, 'homepageText');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'homepageText')=${actual35}`);
        expect(actual35).assertTrue();
        const actual36: boolean = await clickId(driver, 'tabItem1');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem1')=${actual36}`);
        expect(actual36).assertTrue();
        await sleep(500);
        const actual37: boolean = await exists(driver, 'video');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual37}`);
        expect(actual37).assertTrue();
      }
      log('testTabOverflowTabSwitch0607 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TABSWITCH_0608
     * @tc.name      testTabOverflowTabSwitch0608
     * @tc.desc      Verify clicking the already active video tab keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTabSwitch0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTabSwitch0608 begin');
      const driver: Driver = Driver.create();
      const actual38: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual38}`);
      expect(actual38).assertTrue();
      const actual39: boolean = await clickId(driver, 'tabItem1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'tabItem1')=${actual39}`);
      expect(actual39).assertTrue();
      await sleep(600);
      const actual40: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual40}`);
      expect(actual40).assertTrue();
      const actual41: boolean = await exists(driver, 'image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'image')=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await exists(driver, 'tabbar');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'tabbar')=${actual42}`);
      expect(actual42).assertTrue();
      log('testTabOverflowTabSwitch0608 end');
    })
  })
}
