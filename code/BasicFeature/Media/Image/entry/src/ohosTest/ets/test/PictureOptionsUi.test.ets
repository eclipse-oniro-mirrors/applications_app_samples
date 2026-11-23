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
const TAG: string = 'PictureOptionsUiTest';

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

async function ensureOptionsPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'external')) {
      return true;
    }
    if (await exists(driver, 'picture_operate')) {
      await clickId(driver, 'picture_operate');
      await sleep(800);
      continue;
    }
    await driver.pressBack();
    await sleep(600);
    await startMainAbility();
    await dismissPermissionDialog(driver);
  }
  return await exists(driver, 'external');
}

async function backToFirstLevel(driver: Driver): Promise<void> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'decodingJs') || await exists(driver, 'decodingNdk')) {
      return;
    }
    if (!await clickId(driver, 'cancel')) {
      await clickId(driver, 'ok');
    }
    await sleep(500);
  }
}

async function prepare(driver: Driver): Promise<boolean> {
  if (await exists(driver, 'external')) {
    await backToFirstLevel(driver);
  }
  if (!await ensureIndexPage(driver)) {
    log('prepare: index page is not available');
    return false;
  }
  if (!await ensureOptionsPage(driver)) {
    log('prepare: picture options page is not available');
    return false;
  }
  return true;
}

export default function pictureOptionsUiTest(): void {
  describe('PictureOptionsUiTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      const driver: Driver = Driver.create();
      await startMainAbility();
      await dismissPermissionDialog(driver);
      log('beforeAll end');
    });

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0001
     * @tc.name      testPictureOptionsUi0001
     * @tc.desc      Verify the options page shows the js adjust toolbar and interface tabs.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0001 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingJs')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'external');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'external')=${actual5}`);
      expect(actual5).assertTrue();
      const actual6: boolean = await exists(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'inner')=${actual6}`);
      expect(actual6).assertTrue();
      log('testPictureOptionsUi0001 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0002
     * @tc.name      testPictureOptionsUi0002
     * @tc.desc      Verify switching to native tab shows the native decode and encode items.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0002 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const actual8: boolean = await clickId(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual8}`);
      expect(actual8).assertTrue();
      await sleep(500);
      const actual9: boolean = await exists(driver, 'decodingNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingNdk')=${actual9}`);
      expect(actual9).assertTrue();
      const actual10: boolean = await exists(driver, 'encodingNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingNdk')=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'decodingJs')=${actual11}`);
      expect(actual11).assertFalse();
      log('testPictureOptionsUi0002 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0003
     * @tc.name      testPictureOptionsUi0003
     * @tc.desc      Verify switching back to js tab restores the js adjust toolbar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0003 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await clickId(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual13}`);
      expect(actual13).assertTrue();
      await sleep(500);
      const actual14: boolean = await clickId(driver, 'external');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'external')=${actual14}`);
      expect(actual14).assertTrue();
      await sleep(500);
      const actual15: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await exists(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingJs')=${actual16}`);
      expect(actual16).assertTrue();
      const actual17: boolean = await exists(driver, 'decodingNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse exists(driver, 'decodingNdk')=${actual17}`);
      expect(actual17).assertFalse();
      log('testPictureOptionsUi0003 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0004
     * @tc.name      testPictureOptionsUi0004
     * @tc.desc      Verify opening js decode exposes jpeg and heif options with confirm buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0004 begin');
      const driver: Driver = Driver.create();
      const actual18: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await clickId(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'decodingJs')=${actual19}`);
      expect(actual19).assertTrue();
      await sleep(500);
      const actual20: boolean = await exists(driver, 'jpegJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'jpegJs')=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await exists(driver, 'heifJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heifJs')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, 'cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'cancel')=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, 'ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'ok')=${actual23}`);
      expect(actual23).assertTrue();
      log('testPictureOptionsUi0004 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0005
     * @tc.name      testPictureOptionsUi0005
     * @tc.desc      Verify cancel in js decode menu returns to the adjust first level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0005 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const actual25: boolean = await clickId(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'decodingJs')=${actual25}`);
      expect(actual25).assertTrue();
      await sleep(500);
      const actual26: boolean = await clickId(driver, 'cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'cancel')=${actual26}`);
      expect(actual26).assertTrue();
      await sleep(500);
      const actual27: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual27}`);
      expect(actual27).assertTrue();
      const actual28: boolean = await exists(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingJs')=${actual28}`);
      expect(actual28).assertTrue();
      log('testPictureOptionsUi0005 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0006
     * @tc.name      testPictureOptionsUi0006
     * @tc.desc      Verify ok in js decode menu returns to the adjust first level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0006 begin');
      const driver: Driver = Driver.create();
      const actual29: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual29}`);
      expect(actual29).assertTrue();
      const actual30: boolean = await clickId(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'decodingJs')=${actual30}`);
      expect(actual30).assertTrue();
      await sleep(500);
      const actual31: boolean = await clickId(driver, 'ok');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'ok')=${actual31}`);
      expect(actual31).assertTrue();
      await sleep(500);
      const actual32: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual32}`);
      expect(actual32).assertTrue();
      const actual33: boolean = await exists(driver, 'external');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'external')=${actual33}`);
      expect(actual33).assertTrue();
      log('testPictureOptionsUi0006 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0007
     * @tc.name      testPictureOptionsUi0007
     * @tc.desc      Verify js jpeg decode keeps the source and result image views rendered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0007 begin');
      const driver: Driver = Driver.create();
      const actual34: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual34}`);
      expect(actual34).assertTrue();
      const actual35: boolean = await clickId(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'decodingJs')=${actual35}`);
      expect(actual35).assertTrue();
      await sleep(500);
      const actual36: boolean = await clickId(driver, 'jpegJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'jpegJs')=${actual36}`);
      expect(actual36).assertTrue();
      await sleep(2000);
      const actual37: boolean = await exists(driver, 'id_sourceImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'id_sourceImage')=${actual37}`);
      expect(actual37).assertTrue();
      const actual38: boolean = await exists(driver, 'id_resultImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'id_resultImage')=${actual38}`);
      expect(actual38).assertTrue();
      log('testPictureOptionsUi0007 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0008
     * @tc.name      testPictureOptionsUi0008
     * @tc.desc      Verify opening js encode exposes all four packing mode options.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0008 begin');
      const driver: Driver = Driver.create();
      const actual39: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual39}`);
      expect(actual39).assertTrue();
      const actual40: boolean = await clickId(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'encodingJs')=${actual40}`);
      expect(actual40).assertTrue();
      await sleep(500);
      const actual41: boolean = await exists(driver, 'sourceToDataJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'sourceToDataJs')=${actual41}`);
      expect(actual41).assertTrue();
      const actual42: boolean = await exists(driver, 'sourceToFileJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'sourceToFileJs')=${actual42}`);
      expect(actual42).assertTrue();
      const actual43: boolean = await exists(driver, 'pictureToDataJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pictureToDataJs')=${actual43}`);
      expect(actual43).assertTrue();
      const actual44: boolean = await exists(driver, 'pictureToFileJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pictureToFileJs')=${actual44}`);
      expect(actual44).assertTrue();
      log('testPictureOptionsUi0008 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0009
     * @tc.name      testPictureOptionsUi0009
     * @tc.desc      Verify cancel in js encode menu returns to the adjust first level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0009 begin');
      const driver: Driver = Driver.create();
      const actual45: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual45}`);
      expect(actual45).assertTrue();
      const actual46: boolean = await clickId(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'encodingJs')=${actual46}`);
      expect(actual46).assertTrue();
      await sleep(500);
      const actual47: boolean = await clickId(driver, 'cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'cancel')=${actual47}`);
      expect(actual47).assertTrue();
      await sleep(500);
      const actual48: boolean = await exists(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingJs')=${actual48}`);
      expect(actual48).assertTrue();
      log('testPictureOptionsUi0009 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0010
     * @tc.name      testPictureOptionsUi0010
     * @tc.desc      Verify opening native decode exposes jpeg and heif options.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0010 begin');
      const driver: Driver = Driver.create();
      const actual49: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual49}`);
      expect(actual49).assertTrue();
      const actual50: boolean = await clickId(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual50}`);
      expect(actual50).assertTrue();
      await sleep(500);
      const actual51: boolean = await clickId(driver, 'decodingNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'decodingNdk')=${actual51}`);
      expect(actual51).assertTrue();
      await sleep(500);
      const actual52: boolean = await exists(driver, 'jpegNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'jpegNdk')=${actual52}`);
      expect(actual52).assertTrue();
      const actual53: boolean = await exists(driver, 'heifNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'heifNdk')=${actual53}`);
      expect(actual53).assertTrue();
      log('testPictureOptionsUi0010 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0011
     * @tc.name      testPictureOptionsUi0011
     * @tc.desc      Verify opening native encode exposes all four packing mode options.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0011 begin');
      const driver: Driver = Driver.create();
      const actual54: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual54}`);
      expect(actual54).assertTrue();
      const actual55: boolean = await clickId(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual55}`);
      expect(actual55).assertTrue();
      await sleep(500);
      const actual56: boolean = await clickId(driver, 'encodingNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'encodingNdk')=${actual56}`);
      expect(actual56).assertTrue();
      await sleep(500);
      const actual57: boolean = await exists(driver, 'sourceToDataNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'sourceToDataNdk')=${actual57}`);
      expect(actual57).assertTrue();
      const actual58: boolean = await exists(driver, 'sourceToFileNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'sourceToFileNdk')=${actual58}`);
      expect(actual58).assertTrue();
      const actual59: boolean = await exists(driver, 'pictureToDataNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pictureToDataNdk')=${actual59}`);
      expect(actual59).assertTrue();
      const actual60: boolean = await exists(driver, 'pictureToFileNdk');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'pictureToFileNdk')=${actual60}`);
      expect(actual60).assertTrue();
      log('testPictureOptionsUi0011 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0012
     * @tc.name      testPictureOptionsUi0012
     * @tc.desc      Verify js source to file packing runs and the page stays interactive.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0012 begin');
      const driver: Driver = Driver.create();
      const actual61: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual61}`);
      expect(actual61).assertTrue();
      const actual62: boolean = await clickId(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'encodingJs')=${actual62}`);
      expect(actual62).assertTrue();
      await sleep(500);
      const actual63: boolean = await clickId(driver, 'sourceToFileJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'sourceToFileJs')=${actual63}`);
      expect(actual63).assertTrue();
      await sleep(2000);
      const actual64: boolean = await exists(driver, 'back');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'back')=${actual64}`);
      expect(actual64).assertTrue();
      const actual65: boolean = await exists(driver, 'id_sourceImage');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'id_sourceImage')=${actual65}`);
      expect(actual65).assertTrue();
      log('testPictureOptionsUi0012 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0013
     * @tc.name      testPictureOptionsUi0013
     * @tc.desc      Verify repeated tab switching keeps the toolbar state consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0013 begin');
      const driver: Driver = Driver.create();
      const actual66: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual66}`);
      expect(actual66).assertTrue();
      for (let i: number = 0; i < 3; i++) {
        const actual67: boolean = await clickId(driver, 'inner');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual67}`);
        expect(actual67).assertTrue();
        await sleep(400);
        const actual68: boolean = await exists(driver, 'decodingNdk');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingNdk')=${actual68}`);
        expect(actual68).assertTrue();
        const actual69: boolean = await clickId(driver, 'external');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'external')=${actual69}`);
        expect(actual69).assertTrue();
        await sleep(400);
        const actual70: boolean = await exists(driver, 'decodingJs');
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual70}`);
        expect(actual70).assertTrue();
      }
      log('testPictureOptionsUi0013 end');
    })

    /**
     * @tc.number    SUB_IMAGE_PICOPTUI_0014
     * @tc.name      testPictureOptionsUi0014
     * @tc.desc      Verify leaving and reopening the options page restores the default toolbar.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPictureOptionsUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPictureOptionsUi0014 begin');
      const driver: Driver = Driver.create();
      const actual71: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual71}`);
      expect(actual71).assertTrue();
      const actual72: boolean = await clickId(driver, 'inner');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'inner')=${actual72}`);
      expect(actual72).assertTrue();
      await sleep(500);
      await driver.pressBack();
      await sleep(800);
      const actual73: boolean = await exists(driver, 'picture_operate');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'picture_operate')=${actual73}`);
      expect(actual73).assertTrue();
      const actual74: boolean = await ensureOptionsPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureOptionsPage(driver)=${actual74}`);
      expect(actual74).assertTrue();
      const actual75: boolean = await exists(driver, 'decodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'decodingJs')=${actual75}`);
      expect(actual75).assertTrue();
      const actual76: boolean = await exists(driver, 'encodingJs');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'encodingJs')=${actual76}`);
      expect(actual76).assertTrue();
      log('testPictureOptionsUi0014 end');
    })
  })
}
