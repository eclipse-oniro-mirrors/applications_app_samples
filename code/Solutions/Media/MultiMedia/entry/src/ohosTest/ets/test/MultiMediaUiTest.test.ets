/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { Driver, ON, Component, On } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../utils/Logger';
import { getString } from '../utils/ResourceUtil';
import MediaUtils, { AlbumInfo } from '../../../main/ets/model/MediaUtils';
import common from '@ohos.app.ability.common';

const TAG: string = 'MultiMediaUiTest';
const DOMAIN = 0xF811;
const BUNDLE = 'MultiMedia_';
const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function getAlbums(): Promise<AlbumInfo[]> {
  Logger.info(TAG, 'getAlbums start');
  const context: common.Context = abilityDelegator.getAppContext();
  const mediaUtils = MediaUtils.getInstance(context);
  const albums: AlbumInfo[] = await mediaUtils.getAlbums(context);
  Logger.info(TAG, 'getAlbums end');
  return albums;
}

async function bringAppToFront(): Promise<void> {
  try {
    await abilityDelegator.startAbility({
      bundleName: 'ohos.samples.multimedia',
      abilityName: 'MainAbility'
    });
  } catch (err) {
    Logger.info(TAG, 'app is already foreground');
  }
}

async function openAddMenu(driver: Driver): Promise<void> {
  let addBtnReady = false;
  for (let i = 0; i < 3 && !addBtnReady; i++) {
    try {
      await driver.assertComponentExist(ON.id('addBtn'));
      addBtnReady = true;
    } catch (err) {
      await driver.pressBack();
      await driver.delayMs(1000);
      await bringAppToFront();
      await driver.delayMs(2500);
    }
  }
  await driver.assertComponentExist(ON.id('addBtn'));
  for (let attempt = 0; attempt < 2; attempt++) {
    const addBtn: Component = await driver.findComponent(ON.id('addBtn'));
    await addBtn.click();
    await driver.delayMs(1200);
    try {
      await driver.assertComponentExist(ON.id('document'));
      return;
    } catch (err) {
      Logger.info(TAG, 'menu toggled closed, retry');
    }
  }
  await driver.assertComponentExist(ON.id('document'));
}

async function ensureHome(driver: Driver): Promise<void> {
  for (let i = 0; i < 4; i++) {
    if (await componentExists(driver, ON.id('mediaType0'), 1)) {
      return;
    }
    await bringAppToFront();
    await driver.delayMs(3000);
    if (await componentExists(driver, ON.id('mediaType0'), 1)) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(1500);
  }
  await driver.assertComponentExist(ON.id('mediaType0'));
}

async function waitForComponent(driver: Driver, match: On, tries: number = 6, label: string = ''): Promise<Component> {
  let lastErr: Error = new Error('not found');
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        return found;
      }
      lastErr = new Error(`component is null [${label}]`);
    } catch (err) {
      lastErr = new Error(String(err));
    }
    await driver.delayMs(1000);
  }
  throw lastErr;
}

async function componentExists(driver: Driver, match: On, tries: number = 2): Promise<boolean> {
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        return true;
      }
    } catch (err) {
      Logger.info(TAG, `component lookup failed: ${String(err)}`);
    }
    await driver.delayMs(1000);
  }
  return false;
}

async function clickIfExist(driver: Driver, match: On): Promise<boolean> {
  try {
    const component: Component | null = await driver.findComponent(match);
    if (component === null || component === undefined) {
      return false;
    }
    await component.click();
    await driver.delayMs(1000);
    return true;
  } catch (err) {
    return false;
  }
}

async function dismissPermissionDialogs(driver: Driver): Promise<void> {
  for (let i = 0; i < 9; i++) {
    const clickedZh = await clickIfExist(driver, ON.text('允许'));
    const clickedEn = clickedZh ? true : await clickIfExist(driver, ON.text('Allow'));
    const clickedLower = clickedEn ? true : await clickIfExist(driver, ON.text('allow'));
    if (!clickedZh && !clickedEn && !clickedLower) {
      break;
    }
  }
}

export default function MultiMediaUiTest(): void {
  describe('MultiMediaUiTest', () => {
    beforeAll((): void => {
      const context: common.Context = abilityDelegator.getAppContext();
      const names: string[] = fileIo.listFileSync(context.filesDir);
      if (names.some((name: string): boolean => name.endsWith('.txt'))) {
        throw new Error('UI tests require an empty Documents sandbox; use an isolated test installation.');
      }
    });

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0100
     * @tc.name      testMultiMediaStartAbility0001
     * @tc.desc      Launching MainAbility brings up the album home page with the add button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaStartAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility begin');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'ohos.samples.multimedia',
          abilityName: 'MainAbility'
        })
      } catch (err) {
        expect(0).assertEqual(err.code);
      }
      const driver = Driver.create();
      await driver.delayMs(3000);
      await dismissPermissionDialogs(driver);
      expect(await componentExists(driver, ON.id('addBtn'), 3)).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0200
     * @tc.name      testMultiMediaPageEntry0002
     * @tc.desc      Tapping add expands the camera, record and document entries.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaPageEntry0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'PageEntry begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      await openAddMenu(driver);
      expect(await componentExists(driver, ON.id('camera'), 2)).assertTrue();
      expect(await componentExists(driver, ON.id('record'), 2)).assertTrue();
      expect(await componentExists(driver, ON.id('document'), 2)).assertTrue();
      Logger.info(TAG, BUNDLE + 'PageEntry end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0300
     * @tc.name      testMultiMediaTxtEdit0003
     * @tc.desc      Saving a document creates a txt file and grows the Documents album by one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaTxtEdit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'TxtEdit begin');
      const before = await getAlbums();
      const driver = Driver.create();
      await driver.delayMs(1000);
      await openAddMenu(driver);
      const document: Component = await waitForComponent(driver, ON.id('document'));
      await document.click();
      await driver.delayMs(1000);
      const textArea: Component = await waitForComponent(driver, ON.id('textArea'));
      await textArea.inputText('mst');
      await driver.delayMs(1000);
      const saveBtn: Component = await waitForComponent(driver, ON.id('saveBtn'));
      await saveBtn.click();
      await driver.delayMs(2000);
      const after = await getAlbums();
      expect(after[0].count).assertEqual(before[0].count + 1);
      Logger.info(TAG, BUNDLE + 'TxtEdit end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0400
     * @tc.name      testMultiMediaRecord0004
     * @tc.desc      Recording for three seconds creates an audio file and grows Audios by one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaRecord0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'Record begin');
      const driver = Driver.create();
      await ensureHome(driver);
      const before = await getAlbums();
      await openAddMenu(driver);
      const record: Component = await waitForComponent(driver, ON.id('record'));
      await record.click();
      await driver.delayMs(1000);
      const startBtn: Component = await waitForComponent(driver, ON.id('startBtn'));
      await startBtn.click();
      await driver.delayMs(3000);
      const pauseBtn: Component = await waitForComponent(driver, ON.id('pauseBtn'));
      await pauseBtn.click();
      await driver.delayMs(1000);
      const backIndex: Component = await waitForComponent(driver, ON.id('back'));
      await backIndex.click();
      await driver.delayMs(2000);
      const after = await getAlbums();
      expect(after[3].count).assertEqual(before[3].count + 1);
      Logger.info(TAG, BUNDLE + 'Record end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0500
     * @tc.name      testMultiMediaRename0005
     * @tc.desc      Renaming a document keeps the document count unchanged.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaRename0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'Rename begin');
      const driver = Driver.create();
      await ensureHome(driver);
      const before = await getAlbums();
      expect(before[0].count > 0).assertTrue();
      const mediaType: Component = await waitForComponent(driver, ON.id('mediaType0'), 6, '0005-mediaType');
      await mediaType.click();
      await driver.delayMs(1500);
      const rename: Component = await waitForComponent(driver, ON.id('rename0'), 6, '0005-rename');
      await rename.click();
      await driver.delayMs(1000);
      const inputRename: Component = await waitForComponent(driver, ON.id('inputRename'), 6, '0005-input');
      await inputRename.clearText();
      const newName = `mst_${Date.now()}`;
      await inputRename.inputText(newName);
      await driver.delayMs(800);
      await driver.pressBack();
      await driver.delayMs(1000);
      const yesText = getString($r('app.string.yes'));
      const confirm: Component = await waitForComponent(driver, ON.text(yesText), 6, '0005-confirm');
      await confirm.click();
      await driver.delayMs(2500);
      const after = await getAlbums();
      expect(after[0].count).assertEqual(before[0].count);
      const backIndex: Component = await waitForComponent(driver, ON.id('back'), 6, '0005-back');
      await backIndex.click();
      await driver.delayMs(1000);
      Logger.info(TAG, BUNDLE + 'Rename end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0600
     * @tc.name      testMultiMediaDeleteOne0006
     * @tc.desc      Deleting one document shrinks the Documents album by one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaDeleteOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'DeleteOne begin');
      const driver = Driver.create();
      await ensureHome(driver);
      const before = await getAlbums();
      expect(before[0].count > 0).assertTrue();
      const mediaType: Component = await waitForComponent(driver, ON.id('mediaType0'), 6, '0006-mediaType');
      await mediaType.click();
      await driver.delayMs(1500);
      const deleteData: Component = await waitForComponent(driver, ON.id('delete0'), 6, '0006-delete');
      await deleteData.click();
      await driver.delayMs(1000);
      const yesText = getString($r('app.string.yes'));
      const confirmBtn: Component = await waitForComponent(driver, ON.text(yesText), 6, '0006-confirm');
      await confirmBtn.click();
      await driver.delayMs(2500);
      const after = await getAlbums();
      expect(after[0].count).assertEqual(before[0].count - 1);
      const backIndex: Component = await waitForComponent(driver, ON.id('back'), 6, '0006-back');
      await backIndex.click();
      await driver.delayMs(1000);
      Logger.info(TAG, BUNDLE + 'DeleteOne end');
    })

    /**
     * @tc.number    SUB_SYS_MULTIMEDIA_UI_0700
     * @tc.name      testMultiMediaDeleteAll0007
     * @tc.desc      Deleting every document one by one empties the Documents album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testMultiMediaDeleteAll0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'DeleteAll begin');
      const driver = Driver.create();
      await ensureHome(driver);
      const mediaType: Component = await waitForComponent(driver, ON.id('mediaType0'), 6, '0007-mediaType');
      await mediaType.click();
      await driver.delayMs(1500);
      const yesText = getString($r('app.string.yes'));
      const total = (await getAlbums())[0].count;
      for (let i = 0; i < total; i++) {
        const deleteData: Component = await waitForComponent(driver, ON.id('delete0'), 6, '0007-delete');
        await deleteData.click();
        await driver.delayMs(1000);
        const confirmBtn: Component = await waitForComponent(driver, ON.text(yesText), 6, '0007-confirm');
        await confirmBtn.click();
        await driver.delayMs(2500);
      }
      const finalCount = (await getAlbums())[0].count;
      expect(finalCount).assertEqual(0);
      Logger.info(TAG, BUNDLE + 'DeleteAll end');
    })
  })
}
