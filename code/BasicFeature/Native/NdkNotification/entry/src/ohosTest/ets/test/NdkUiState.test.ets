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
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { notificationManager } from '@kit.NotificationKit';
import testNapi from 'libentry.so';

const BUNDLE: string = 'com.examples.ndknotification';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'NdkUiStateTest';
const RESULT_PREFIX: string = 'Current application notification enabled: ';

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
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return await component.getText();
  } catch (error) {
    log('getTextById failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function ensureMainPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'checkButton')) {
      return true;
    }
    if (await exists(driver, 'dialogOkButton')) {
      await clickId(driver, 'dialogOkButton');
      await sleep(300);
    }
  }
  return await exists(driver, 'checkButton');
}

async function closeDialogIfOpen(driver: Driver): Promise<void> {
  for (let i: number = 0; i < 3; i++) {
    if (!await exists(driver, 'dialogOkButton')) {
      return;
    }
    await clickId(driver, 'dialogOkButton');
    await sleep(300);
  }
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureMainPage(driver)) {
    log('prepare: main page is not available');
    return false;
  }
  return true;
}

export default function ndkUiStateTest(): void {
  describe('NdkUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await closeDialogIfOpen(driver);
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0201
     * @tc.name      testNdkUiState0201
     * @tc.desc      Verify the page exposes the title and the check button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0201 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'pageTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pageTitle')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'checkButton')=${actual4}`);
      expect(actual4).assertTrue();
      log('testNdkUiState0201 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0202
     * @tc.name      testNdkUiState0202
     * @tc.desc      Verify the check button owns a non-empty clickable area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0202 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const button: Component = await driver.findComponent(ON.id('checkButton'));
      const rect: Rect = await button.getBounds();
      const area: number = (rect.left - rect.right) * (rect.top - rect.bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue area !== 0=${area !== 0}`);
      expect(area !== 0).assertTrue();
      log('testNdkUiState0202 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0203
     * @tc.name      testNdkUiState0203
     * @tc.desc      Verify clicking the check button opens the result dialog title.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0203 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual7}`);
      expect(actual7).assertTrue();
      await sleep(500);
      const actual8: boolean = await exists(driver, 'dialogTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogTitle')=${actual8}`);
      expect(actual8).assertTrue();
      log('testNdkUiState0203 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0204
     * @tc.name      testNdkUiState0204
     * @tc.desc      Verify the dialog result text keeps the documented prefix.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0204 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual10}`);
      expect(actual10).assertTrue();
      await sleep(500);
      const text: string = await getTextById(driver, 'dialogResult');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${text.startsWith(RESULT_PREFIX)}`);
      expect(text.startsWith(RESULT_PREFIX)).assertTrue();
      log('testNdkUiState0204 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0205
     * @tc.name      testNdkUiState0205
     * @tc.desc      Verify the dialog result ends with an enabled boolean literal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0205 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const text: string = await getTextById(driver, 'dialogResult');
      const suffix: string = text.substring(RESULT_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${suffix === 'true' || suffix === 'false'}`);
      expect(suffix === 'true' || suffix === 'false').assertTrue();
      log('testNdkUiState0205 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0206
     * @tc.name      testNdkUiState0206
     * @tc.desc      Verify clicking OK closes the result dialog.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0206 begin');
      const driver: Driver = Driver.create();
      const actual13: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual13}`);
      expect(actual13).assertTrue();
      const actual14: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(500);
      const actual15: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogOkButton')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await clickId(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'dialogOkButton')=${actual16}`);
      expect(actual16).assertTrue();
      await sleep(500);
      const actual17: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'dialogOkButton')=${actual17}`);
      expect(actual17).assertFalse();
      log('testNdkUiState0206 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0207
     * @tc.name      testNdkUiState0207
     * @tc.desc      Verify the dialog reopens after a full query and close round.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0207 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual19}`);
      expect(actual19).assertTrue();
      await sleep(500);
      const actual20: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogOkButton')=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await clickId(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'dialogOkButton')=${actual21}`);
      expect(actual21).assertTrue();
      await sleep(500);
      const actual22: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'dialogOkButton')=${actual22}`);
      expect(actual22).assertFalse();
      const actual23: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual23}`);
      expect(actual23).assertTrue();
      await sleep(500);
      const actual24: boolean = await exists(driver, 'dialogTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogTitle')=${actual24}`);
      expect(actual24).assertTrue();
      log('testNdkUiState0207 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0208
     * @tc.name      testNdkUiState0208
     * @tc.desc      Verify three query close rounds keep the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0208 begin');
      const driver: Driver = Driver.create();
      const actual25: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual25}`);
      expect(actual25).assertTrue();
      for (let i: number = 0; i < 3; i++) {
        const actual26: boolean = await clickId(driver, 'checkButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual26}`);
        expect(actual26).assertTrue();
        await sleep(400);
        const actual27: boolean = await exists(driver, 'dialogOkButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogOkButton')=${actual27}`);
        expect(actual27).assertTrue();
        const actual28: boolean = await clickId(driver, 'dialogOkButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'dialogOkButton')=${actual28}`);
        expect(actual28).assertTrue();
        await sleep(400);
        const actual29: boolean = await exists(driver, 'dialogOkButton');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'dialogOkButton')=${actual29}`);
        expect(actual29).assertFalse();
      }
      const actual30: boolean = await exists(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'checkButton')=${actual30}`);
      expect(actual30).assertTrue();
      log('testNdkUiState0208 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0209
     * @tc.name      testNdkUiState0209
     * @tc.desc      Verify the open dialog shows title and result together.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0209 begin');
      const driver: Driver = Driver.create();
      const actual31: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual31}`);
      expect(actual31).assertTrue();
      const actual32: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual32}`);
      expect(actual32).assertTrue();
      await sleep(500);
      const actual33: boolean = await exists(driver, 'dialogTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogTitle')=${actual33}`);
      expect(actual33).assertTrue();
      const actual34: boolean = await exists(driver, 'dialogResult');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogResult')=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogOkButton')=${actual35}`);
      expect(actual35).assertTrue();
      log('testNdkUiState0209 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0210
     * @tc.name      testNdkUiState0210
     * @tc.desc      Verify the dialog text matches the native query value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0210 begin');
      const driver: Driver = Driver.create();
      const actual36: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual36}`);
      expect(actual36).assertTrue();
      const nativeValue: boolean = testNapi.isNotificationEnabled();
      const systemValue: boolean = await notificationManager.isNotificationEnabled();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual nativeValue=${nativeValue}, expected=systemValue`);
      expect(nativeValue).assertEqual(systemValue);
      const actual37: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual37}`);
      expect(actual37).assertTrue();
      await sleep(500);
      const text: string = await getTextById(driver, 'dialogResult');
      const suffix: string = text.substring(RESULT_PREFIX.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual suffix === 'true'=${suffix === 'true'}, expected=nativeValue`);
      expect(suffix === 'true').assertEqual(nativeValue);
      log('testNdkUiState0210 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0211
     * @tc.name      testNdkUiState0211
     * @tc.desc      Verify repeated prepare rounds keep the page usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0211 begin');
      const driver: Driver = Driver.create();
      const actual38: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual38}`);
      expect(actual38).assertTrue();
      const actual39: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await exists(driver, 'pageTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pageTitle')=${actual40}`);
      expect(actual40).assertTrue();
      const actual41: boolean = await exists(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'checkButton')=${actual41}`);
      expect(actual41).assertTrue();
      log('testNdkUiState0211 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_UISTATE_0212
     * @tc.name      testNdkUiState0212
     * @tc.desc      Verify the page title keeps the sample display text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkUiState0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testNdkUiState0212 begin');
      const driver: Driver = Driver.create();
      const actual42: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual42}`);
      expect(actual42).assertTrue();
      const text: string = await getTextById(driver, 'pageTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='Native Notification Sample'`);
      expect(text).assertEqual('Native Notification Sample');
      log('testNdkUiState0212 end');
    })
  })
}
