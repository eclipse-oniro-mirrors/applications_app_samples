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
const TAG: string = 'TabOverflowSideUiState';

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

export default function tabOverflowSideUiStateTest(): void {
  describe('TabOverflowSideUiStateTest', () => {
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
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0701
     * @tc.name      testTabOverflowSideUi0701
     * @tc.desc      Verify the author head image is rendered in the side panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0701 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'headImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'headImage')=${actual3}`);
      expect(actual3).assertTrue();
      log('testTabOverflowSideUi0701 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0702
     * @tc.name      testTabOverflowSideUi0702
     * @tc.desc      Verify clicking the focus icon toggles state and keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0702 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'focusImage')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await clickId(driver, 'focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'focusImage')=${actual6}`);
      expect(actual6).assertTrue();
      await sleep(500);
      const actual7: boolean = await exists(driver, 'focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'focusImage')=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await clickId(driver, 'focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'focusImage')=${actual8}`);
      expect(actual8).assertTrue();
      await sleep(500);
      const actual9: boolean = await exists(driver, 'focusImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'focusImage')=${actual9}`);
      expect(actual9).assertTrue();
      log('testTabOverflowSideUi0702 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0703
     * @tc.name      testTabOverflowSideUi0703
     * @tc.desc      Verify the like icon and like count are rendered in the side panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0703 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'likeImage')=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await exists(driver, 'likeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'likeText')=${actual12}`);
      expect(actual12).assertTrue();
      log('testTabOverflowSideUi0703 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0704
     * @tc.name      testTabOverflowSideUi0704
     * @tc.desc      Verify the initial like count text equals 1234.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0704 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const likeText: string = await getTextById(driver, 'likeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual likeText=${likeText}, expected='1234'`);
      expect(likeText).assertEqual('1234');
      log('testTabOverflowSideUi0704 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0705
     * @tc.name      testTabOverflowSideUi0705
     * @tc.desc      Verify one like click increments the count to 1235.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0705 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await clickId(driver, 'likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'likeImage')=${actual15}`);
      expect(actual15).assertTrue();
      await sleep(600);
      const likeText: string = await getTextById(driver, 'likeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual likeText=${likeText}, expected='1235'`);
      expect(likeText).assertEqual('1235');
      const actual16: boolean = await clickId(driver, 'likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'likeImage')=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(600);
      log('testTabOverflowSideUi0705 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0706
     * @tc.name      testTabOverflowSideUi0706
     * @tc.desc      Verify two like clicks restore the count back to 1234.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0706 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const actual18: boolean = await clickId(driver, 'likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'likeImage')=${actual18}`);
      expect(actual18).assertTrue();
      await sleep(600);
      const actual19: boolean = await clickId(driver, 'likeImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'likeImage')=${actual19}`);
      expect(actual19).assertTrue();
      await sleep(600);
      const likeText: string = await getTextById(driver, 'likeText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual likeText=${likeText}, expected='1234'`);
      expect(likeText).assertEqual('1234');
      log('testTabOverflowSideUi0706 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0707
     * @tc.name      testTabOverflowSideUi0707
     * @tc.desc      Verify the comment icon and initial comment count 2234 are rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0707 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, 'commentImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'commentImage')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'commentText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'commentText')=${actual22}`);
      expect(actual22).assertTrue();
      const commentText: string = await getTextById(driver, 'commentText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual commentText=${commentText}, expected='2234'`);
      expect(commentText).assertEqual('2234');
      log('testTabOverflowSideUi0707 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0708
     * @tc.name      testTabOverflowSideUi0708
     * @tc.desc      Verify one favorite click increments the count to 3235 and resets after.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0708 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await exists(driver, 'favoriteImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'favoriteImage')=${actual24}`);
      expect(actual24).assertTrue();
      const before: string = await getTextById(driver, 'favoriteText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual before=${before}, expected='3234'`);
      expect(before).assertEqual('3234');
      const actual25: boolean = await clickId(driver, 'favoriteImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'favoriteImage')=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(600);
      const after: string = await getTextById(driver, 'favoriteText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual after=${after}, expected='3235'`);
      expect(after).assertEqual('3235');
      const actual26: boolean = await clickId(driver, 'favoriteImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'favoriteImage')=${actual26}`);
      expect(actual26).assertTrue();
      await sleep(600);
      log('testTabOverflowSideUi0708 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0709
     * @tc.name      testTabOverflowSideUi0709
     * @tc.desc      Verify the share icon and share label are rendered in the side panel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0709 begin');
      const driver: Driver = Driver.create();
      const actual27: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'shareImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'shareImage')=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await exists(driver, 'shareText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'shareText')=${actual29}`);
      expect(actual29).assertTrue();
      log('testTabOverflowSideUi0709 end');
    })

    /**
     * @tc.number    SUB_TABCONTENTTOUCHHOTZONE_SIDEUI_0710
     * @tc.name      testTabOverflowSideUi0710
     * @tc.desc      Verify clicking the head image shows the toast and keeps the page alive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testTabOverflowSideUi0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testTabOverflowSideUi0710 begin');
      const driver: Driver = Driver.create();
      const actual30: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual30}`);
      expect(actual30).assertTrue();
      const actual31: boolean = await clickId(driver, 'headImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'headImage')=${actual31}`);
      expect(actual31).assertTrue();
      await sleep(600);
      const actual32: boolean = await exists(driver, 'headImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'headImage')=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, 'video');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'video')=${actual33}`);
      expect(actual33).assertTrue();
      log('testTabOverflowSideUi0710 end');
    })
  })
}
