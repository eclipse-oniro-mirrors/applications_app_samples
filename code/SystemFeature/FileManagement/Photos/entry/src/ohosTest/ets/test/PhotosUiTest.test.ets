/*
 * Copyright (c) 2023-2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON, Component, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';
import util from '@ohos.util';

const TAG = '[Sample_PhotosTest]';
const BUNDLE = 'photos_';
const DOMAIN = 0xF811;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

const JPEG_BASE64 = '/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHB' +
'wgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/wAARCAABAAEDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAA' +
'AAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2Jygg' +
'kKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKj' +
'pKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/9oACAEBAAA/APn+v//Z';

async function getAppContext(): Promise<Context> {
  return abilityDelegator.getAppContext();
}

async function appText(name: string): Promise<string> {
  const appContext = await getAppContext();
  const moduleContext = appContext.createModuleContext('entry');
  return await moduleContext.resourceManager.getStringByName(name);
}

async function waitForComponent(driver: Driver, match: On, tries: number = 6, label: string = ''): Promise<Component> {
  let lastErr: Error = new Error('not found');
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        return found;
      }
      lastErr = new Error(`component is null [${label}] for ${JSON.stringify(match)}`);
    } catch (err) {
      lastErr = new Error(String(err));
    }
    await driver.delayMs(1000);
  }
  throw lastErr;
}

async function componentExists(driver: Driver, match: On, tries: number = 3): Promise<boolean> {
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        return true;
      }
    } catch (err) {
    }
    await driver.delayMs(1000);
  }
  return false;
}

async function clickWithRetry(driver: Driver, match: On, tries: number = 5): Promise<void> {
  let lastErr: Error = new Error('not found');
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        await found.click();
        await driver.delayMs(500);
        return;
      }
      lastErr = new Error('component is null');
    } catch (err) {
      lastErr = new Error(String(err));
    }
    await driver.delayMs(1200);
  }
  throw lastErr;
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
  for (let i = 0; i < 8; i++) {
    const clickedZh = await clickIfExist(driver, ON.text('允许'));
    const clickedEn = clickedZh ? true : await clickIfExist(driver, ON.text('Allow'));
    if (!clickedZh && !clickedEn) {
      break;
    }
  }
}

async function bringAppToFront(): Promise<void> {
  try {
    await abilityDelegator.startAbility({
      bundleName: 'com.samples.photos',
      abilityName: 'EntryAbility'
    });
  } catch (err) {
  }
}

async function goHome(driver: Driver): Promise<void> {
  for (let i = 0; i < 6; i++) {
    if (await componentExists(driver, ON.id('28'), 1)) {
      return;
    }
    await bringAppToFront();
    await driver.delayMs(2000);
    if (await componentExists(driver, ON.id('28'), 1)) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(1200);
  }
  await driver.assertComponentExist(ON.id('28'));
}

async function enterAllPhotos(driver: Driver): Promise<void> {
  const allText = await appText('album_all');
  await clickWithRetry(driver, ON.text(allText), 5);
  await driver.delayMs(1500);
  await waitForComponent(driver, ON.type('GridItem'));
}

async function openFirstGridItem(driver: Driver): Promise<void> {
  const items = await driver.findComponents(ON.type('GridItem'));
  if (items.length === 0) {
    throw new Error('no GridItem on album grid');
  }
  await items[0].click();
  await driver.delayMs(2000);
}

async function ensureBrowserBar(driver: Driver, barText: string, altId: string = ''): Promise<void> {
  for (let i = 0; i < 8; i++) {
    if (await componentExists(driver, ON.text(barText), 1)) {
      return;
    }
    if (altId !== '' && await componentExists(driver, ON.id(altId), 1)) {
      return;
    }
    await driver.click(360, 500);
    await driver.delayMs(900);
    if (await componentExists(driver, ON.text(barText), 1)) {
      return;
    }
    if (altId !== '' && await componentExists(driver, ON.id(altId), 1)) {
      return;
    }
  }
}

async function createTestImage(displayIndex: number): Promise<string> {
  const appContext = await getAppContext();
  const helper = photoAccessHelper.getPhotoAccessHelper(appContext);
  const uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg');
  const file = fileIo.openSync(uri, fileIo.OpenMode.READ_WRITE);
  const decoder = new util.Base64Helper();
  const bytes: Uint8Array = decoder.decodeSync(JPEG_BASE64);
  fileIo.writeSync(file.fd, bytes.buffer);
  fileIo.closeSync(file.fd);
  HiLog.info(DOMAIN, TAG, `seed image ${displayIndex} created: ${uri}`);
  return uri;
}

async function seedTestImages(count: number): Promise<void> {
  for (let i = 0; i < count; i++) {
    await createTestImage(i);
  }
}

export default function PhotosUiTest(): void {
  describe('PhotosUiTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0100
     * @tc.name      testPhotosStartAbility0001
     * @tc.desc      Launching EntryAbility brings up the album home grid with the new album entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosStartAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, BUNDLE + 'StartAbility begin');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.samples.photos',
          abilityName: 'EntryAbility'
        });
      } catch (exception) {
        HiLog.info(DOMAIN, TAG, `StartAbility exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      const driver = Driver.create();
      await driver.delayMs(3000);
      await dismissPermissionDialogs(driver);
      await goHome(driver);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, BUNDLE + 'StartAbility end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0200
     * @tc.name      testPhotosSeedAndList0002
     * @tc.desc      Seeded library images are listed in the All photos album grid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosSeedAndList0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, BUNDLE + 'SeedAndList begin');
      await seedTestImages(5);
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      let count = 0;
      for (let i = 0; i < 30; i++) {
        const items = await driver.findComponents(ON.type('GridItem'));
        count = items.length;
        if (count >= 5) {
          break;
        }
        await driver.delayMs(1000);
      }
      HiLog.info(DOMAIN, TAG, BUNDLE + 'GridItem count:' + count);
      expect(count).assertLarger(4);
      await driver.pressBack();
      await driver.delayMs(1500);
      HiLog.info(DOMAIN, TAG, BUNDLE + 'SeedAndList end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0300
     * @tc.name      testPhotosBrowserActions0003
     * @tc.desc      Opening a photo shows info and delete actions in the browser.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosBrowserActions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, BUNDLE + 'BrowserActions begin');
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_delete'), '7');
      await driver.assertComponentExist(ON.id('5'));
      const deleteText = await appText('action_delete');
      await driver.assertComponentExist(ON.text(deleteText));
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      HiLog.info(DOMAIN, TAG, BUNDLE + 'BrowserActions end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0400
     * @tc.name      testPhotosRename0004
     * @tc.desc      Renaming a photo updates its title shown in the details dialog.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosRename0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, BUNDLE + 'Rename begin');
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_rename'), '29');
      const renameText = await appText('action_rename');
      const renamed = await clickIfExist(driver, ON.text(renameText));
      expect(renamed).assertTrue();
      await driver.delayMs(1000);
      const text = await waitForComponent(driver, ON.type('TextInput'));
      await text.clearText();
      const newName = `phtest_${Date.now()}`;
      await text.inputText(newName);
      await driver.delayMs(800);
