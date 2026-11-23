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
import { beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.examples.ndknotification';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'EntrySmokeTest';

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

export default function abilityTest(): void {
  describe('EntrySmokeTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0301
     * @tc.name      testEntrySmoke0301
     * @tc.desc      Verify the sample ability starts without throwing errors.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0301 begin');
      let started: boolean = true;
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('startAbility failed: ' + String(error));
        started = false;
      }
      await sleep(1200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue started=${started}`);
      expect(started).assertTrue();
      log('testEntrySmoke0301 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0302
     * @tc.name      testEntrySmoke0302
     * @tc.desc      Verify the entry page root container is present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0302 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual1: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = await exists(driver, 'indexRoot');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'indexRoot')=${actual2}`);
      expect(actual2).assertTrue();
      log('testEntrySmoke0302 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0303
     * @tc.name      testEntrySmoke0303
     * @tc.desc      Verify the entry page title component is present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0303 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual3: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'pageTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pageTitle')=${actual4}`);
      expect(actual4).assertTrue();
      log('testEntrySmoke0303 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0304
     * @tc.name      testEntrySmoke0304
     * @tc.desc      Verify the check button component is present on entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0304 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual5: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'checkButton')=${actual6}`);
      expect(actual6).assertTrue();
      log('testEntrySmoke0304 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0305
     * @tc.name      testEntrySmoke0305
     * @tc.desc      Verify the check button renders with a non-zero area.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0305 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual7: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const button: Component = await driver.findComponent(ON.id('checkButton'));
      const rect: Rect = await button.getBounds();
      const area: number = (rect.left - rect.right) * (rect.top - rect.bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue area !== 0=${area !== 0}`);
      expect(area !== 0).assertTrue();
      log('testEntrySmoke0305 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0306
     * @tc.name      testEntrySmoke0306
     * @tc.desc      Verify the full query dialog close flow works from entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0306 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual8: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const actual9: boolean = await clickId(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'checkButton')=${actual9}`);
      expect(actual9).assertTrue();
      await sleep(500);
      const actual10: boolean = await exists(driver, 'dialogTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'dialogTitle')=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await clickId(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'dialogOkButton')=${actual11}`);
      expect(actual11).assertTrue();
      await sleep(500);
      const actual12: boolean = await exists(driver, 'dialogOkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'dialogOkButton')=${actual12}`);
      expect(actual12).assertFalse();
      log('testEntrySmoke0306 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0307
     * @tc.name      testEntrySmoke0307
     * @tc.desc      Verify a repeated startAbility round keeps the page usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0307 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual13: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual13}`);
      expect(actual13).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual14: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await exists(driver, 'checkButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'checkButton')=${actual15}`);
      expect(actual15).assertTrue();
      log('testEntrySmoke0307 end');
    })

    /**
     * @tc.number    SUB_NDKNOTIFICATION_ENTRYSMOKE_0308
     * @tc.name      testEntrySmoke0308
     * @tc.desc      Verify the entry title keeps the sample display text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testEntrySmoke0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testEntrySmoke0308 begin');
      const driver: Driver = Driver.create();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual16: boolean = await ensureMainPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureMainPage(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const title: Component = await driver.findComponent(ON.id('pageTitle'));
      const text: string = await title.getText();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual text=${text}, expected='Native Notification Sample'`);
      expect(text).assertEqual('Native Notification Sample');
      log('testEntrySmoke0308 end');
    })
  })
}
