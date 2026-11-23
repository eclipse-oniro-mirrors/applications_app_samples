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
const TAG: string = 'TabOverflowTopViewUiState';

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

async function getTextById(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  return await component.getText();
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

export default function tabOverflowTopViewUiStateTest(): void {
  describe('TabOverflowTopViewUiStateTest', () => {
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
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0801
     * @tc.name      testTabOverflowTopViewUi0801
     * @tc.desc      Verify the search icon is rendered in the top view.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0801 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'searchImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'searchImage')=${actual3}`);
      expect(actual3).assertTrue();
      log('testTabOverflowTopViewUi0801 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0802
     * @tc.name      testTabOverflowTopViewUi0802
     * @tc.desc      Verify the follow and selected labels are rendered in the top view.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0802 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'followText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'followText')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'selectedText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'selectedText')=${actual6}`);
      expect(actual6).assertTrue();
      log('testTabOverflowTopViewUi0802 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0803
     * @tc.name      testTabOverflowTopViewUi0803
     * @tc.desc      Verify the recommendation and screening hall labels are rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0803 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'recommendationText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'recommendationText')=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await exists(driver, 'screeningHallText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'screeningHallText')=${actual9}`);
      expect(actual9).assertTrue();
      log('testTabOverflowTopViewUi0803 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0804
     * @tc.name      testTabOverflowTopViewUi0804
     * @tc.desc      Verify the add icon is rendered in the top view.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0804 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'addImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'addImage')=${actual11}`);
      expect(actual11).assertTrue();
      log('testTabOverflowTopViewUi0804 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0805
     * @tc.name      testTabOverflowTopViewUi0805
     * @tc.desc      Verify the video author name text equals the preset value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0805 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await exists(driver, 'nameText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'nameText')=${actual13}`);
      expect(actual13).assertTrue();
      const nameText: string = await getTextById(driver, 'nameText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nameText=${nameText}, expected='@北大是只猫'`);
      expect(nameText).assertEqual('@北大是只猫');
      log('testTabOverflowTopViewUi0805 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0806
     * @tc.name      testTabOverflowTopViewUi0806
     * @tc.desc      Verify the description and publish time are rendered in the video area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0806 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'descriptionText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'descriptionText')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, 'timeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'timeText')=${actual16}`);
      expect(actual16).assertTrue();
      log('testTabOverflowTopViewUi0806 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0807
     * @tc.name      testTabOverflowTopViewUi0807
     * @tc.desc      Verify the hotspot background, icon and title are rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0807 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await exists(driver, 'grayBackGround');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'grayBackGround')=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'hotImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'hotImage')=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await exists(driver, 'hotText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'hotText')=${actual20}`);
      expect(actual20).assertTrue();
      log('testTabOverflowTopViewUi0807 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_TOPVIEWUI_0808
     * @tc.name      testTabOverflowTopViewUi0808
     * @tc.desc      Verify the hotspot text, online people row and arrow are rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowTopViewUi0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowTopViewUi0808 begin');
      const driver: Driver = Driver.create();
      const actual21: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'hotSpot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'hotSpot')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'peopleNum');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'peopleNum')=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, 'peopleNumArrow');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'peopleNumArrow')=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, 'searchImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'searchImage')=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(400);
      const actual26: boolean = await exists(driver, 'topView');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'topView')=${actual26}`);
      expect(actual26).assertTrue();
      log('testTabOverflowTopViewUi0808 end');
    })
  })
}
