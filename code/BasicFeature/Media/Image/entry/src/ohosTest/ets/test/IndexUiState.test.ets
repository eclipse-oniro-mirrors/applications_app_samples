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
import { beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { dismissPermissionDialog } from '../utils/ResourceUtil';

const BUNDLE: string = 'ohos.samples.image';
const ABILITY: string = 'MainAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexUiStateTest';

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

async function typeInto(driver: Driver, id: string, text: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.inputText(text);
    await sleep(500);
    return true;
  } catch (error) {
    log('typeInto failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function startMainAbility(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'picture_operate')) {
      return true;
    }
    await driver.pressBack();
    await sleep(600);
    await startMainAbility();
    await dismissPermissionDialog(driver);
  }
  return await exists(driver, 'picture_operate');
}

async function prepare(driver: Driver): Promise<boolean> {
  await startMainAbility();
  await dismissPermissionDialog(driver);
  if (!await ensureIndexPage(driver)) {
    log('prepare: index page is not available');
    return false;
  }
  return true;
}

export default function indexUiStateTest(): void {
  describe('IndexUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await dismissPermissionDialog(driver);
      log('beforeAll end');
    });

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0001
     * @tc.name      testIndexUiState0001
     * @tc.desc      Verify the index page exposes the picture operate entry after launch.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0001 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'picture_operate')=${actual3}`);
      expect(actual3).assertTrue();
      log('testIndexUiState0001 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0002
     * @tc.name      testIndexUiState0002
     * @tc.desc      Verify the index page shows the picture area, either add entry or photo grid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0002 begin');
      const driver: Driver = Driver.create();
      const actual4: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual4}`);
      expect(actual4).assertTrue();
      const hasAdd: boolean = await exists(driver, 'add');
      const hasPhoto: boolean = await exists(driver, 'Photo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasAdd || hasPhoto=${hasAdd || hasPhoto}`);
      expect(hasAdd || hasPhoto).assertTrue();
      log('testIndexUiState0002 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0003
     * @tc.name      testIndexUiState0003
     * @tc.desc      Verify the index page exposes the comment input box.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0003 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'index_text_area_12');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'index_text_area_12')=${actual6}`);
      expect(actual6).assertTrue();
      log('testIndexUiState0003 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0004
     * @tc.name      testIndexUiState0004
     * @tc.desc      Verify the index page exposes the submit button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0004 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await exists(driver, 'index_button_6');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'index_button_6')=${actual8}`);
      expect(actual8).assertTrue();
      log('testIndexUiState0004 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0005
     * @tc.name      testIndexUiState0005
     * @tc.desc      Verify the comment icon shows when the comment input is empty on entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0005 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'index_image_13');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'index_image_13')=${actual10}`);
      expect(actual10).assertTrue();
      log('testIndexUiState0005 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0006
     * @tc.name      testIndexUiState0006
     * @tc.desc      Verify typing a comment hides the comment icon.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0006 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const actual12: boolean = await typeInto(driver, 'index_text_area_12', 'hello image');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue typeInto(driver, 'index_text_area_12', 'hello image')=${actual12}`);
      expect(actual12).assertTrue();
      await sleep(500);
      const actual13: boolean = await exists(driver, 'index_image_13');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'index_image_13')=${actual13}`);
      expect(actual13).assertFalse();
      log('testIndexUiState0006 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0007
     * @tc.name      testIndexUiState0007
     * @tc.desc      Verify clearing the comment input shows the comment icon again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0007 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await typeInto(driver, 'index_text_area_12', 'temporary');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue typeInto(driver, 'index_text_area_12', 'temporary')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, 'index_image_13');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'index_image_13')=${actual16}`);
      expect(actual16).assertFalse();
      const actual17: boolean = await typeInto(driver, 'index_text_area_12', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue typeInto(driver, 'index_text_area_12', '')=${actual17}`);
      expect(actual17).assertTrue();
      await sleep(500);
      const actual18: boolean = await exists(driver, 'index_image_13');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'index_image_13')=${actual18}`);
      expect(actual18).assertTrue();
      log('testIndexUiState0007 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0008
     * @tc.name      testIndexUiState0008
     * @tc.desc      Verify clicking picture operate opens the multi picture options page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0008 begin');
      const driver: Driver = Driver.create();
      const actual19: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const actual20: boolean = await clickId(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'picture_operate')=${actual20}`);
      expect(actual20).assertTrue();
      await sleep(800);
      const actual21: boolean = await exists(driver, 'external');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'external')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'inner')=${actual22}`);
      expect(actual22).assertTrue();
      log('testIndexUiState0008 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0009
     * @tc.name      testIndexUiState0009
     * @tc.desc      Verify the multi picture options page exposes back and both interface tabs.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0009 begin');
      const driver: Driver = Driver.create();
      const actual23: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual23}`);
      expect(actual23).assertTrue();
      const actual24: boolean = await clickId(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'picture_operate')=${actual24}`);
      expect(actual24).assertTrue();
      await sleep(800);
      const actual25: boolean = await exists(driver, 'back');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'back')=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await exists(driver, 'external');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'external')=${actual26}`);
      expect(actual26).assertTrue();
      const actual27: boolean = await exists(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'inner')=${actual27}`);
      expect(actual27).assertTrue();
      await driver.pressBack();
      await sleep(600);
      log('testIndexUiState0009 end');
    })

    /**
     * @tc.number    SUB_IMAGE_INDEXUI_0010
     * @tc.name      testIndexUiState0010
     * @tc.desc      Verify back navigation from the options page restores the index page.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0010 begin');
      const driver: Driver = Driver.create();
      const actual28: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual28}`);
      expect(actual28).assertTrue();
      const actual29: boolean = await clickId(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'picture_operate')=${actual29}`);
      expect(actual29).assertTrue();
      await sleep(800);
      const actual30: boolean = await clickId(driver, 'back');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'back')=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(800);
      const actual31: boolean = await exists(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'picture_operate')=${actual31}`);
      expect(actual31).assertTrue();
      log('testIndexUiState0010 end');
    })
  })
}
