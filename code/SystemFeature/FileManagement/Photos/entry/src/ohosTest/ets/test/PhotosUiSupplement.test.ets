/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON, Component, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';
import util from '@ohos.util';

const TAG = '[Sample_PhotosUiSupplementTest]';
const DOMAIN = 0xF811;
const BUNDLE = 'photos_';
const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

const JPEG_BASE64 = '/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHB' +
'wgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/wAARCAABAAEDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAA' +
'AAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2Jygg' +
'kKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKj' +
'pKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/9oACAEBAAA/APn+v//Z';

async function appText(name: string): Promise<string> {
  const appContext: Context = abilityDelegator.getAppContext();
  const moduleContext: Context = appContext.createModuleContext('entry');
  return await moduleContext.resourceManager.getStringByName(name);
}

async function waitForComponent(driver: Driver, match: On, tries: number = 6): Promise<Component> {
  let lastErr: Error = new Error('component not found');
  for (let i = 0; i < tries; i++) {
    try {
      const found: Component | null = await driver.findComponent(match);
      if (found !== null && found !== undefined) {
        return found;
      }
      lastErr = new Error('component is null');
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
  let lastErr: Error = new Error('component not found');
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

async function dismissPermissionDialogs(driver: Driver): Promise<void> {
  for (let i = 0; i < 8; i++) {
    const clickedZh: boolean = await clickIfExist(driver, ON.text('允许'));
    const clickedEn: boolean = clickedZh ? true : await clickIfExist(driver, ON.text('Allow'));
    if (!clickedZh && !clickedEn) {
      return;
    }
  }
}

async function clickIfExist(driver: Driver, match: On): Promise<boolean> {
  try {
    const component: Component | null = await driver.findComponent(match);
    if (component === null || component === undefined) {
      return false;
    }
    await component.click();
    await driver.delayMs(800);
    return true;
  } catch (err) {
    return false;
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
    await driver.delayMs(1500);
    if (await componentExists(driver, ON.id('28'), 1)) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(1000);
  }
  await driver.assertComponentExist(ON.id('28'));
}

async function prepareHome(driver: Driver): Promise<void> {
  await bringAppToFront();
  await driver.delayMs(1000);
  await dismissPermissionDialogs(driver);
  await goHome(driver);
}

async function existsWithScroll(driver: Driver, name: string): Promise<boolean> {
  const text: string = await appText(name);
  if (await componentExists(driver, ON.text(text), 1)) {
    return true;
  }
  await driver.swipe(100, 1000, 100, 200);
  await driver.delayMs(1000);
  return await componentExists(driver, ON.text(text), 2);
}

async function enterAllPhotos(driver: Driver): Promise<void> {
  const allText: string = await appText('album_all');
  await clickWithRetry(driver, ON.text(allText), 5);
  await driver.delayMs(1500);
  await waitForComponent(driver, ON.type('GridItem'));
}

async function openFirstGridItem(driver: Driver): Promise<void> {
  const items: Array<Component> = await driver.findComponents(ON.type('GridItem'));
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
  }
}

async function createTestImage(): Promise<void> {
  const appContext: Context = abilityDelegator.getAppContext();
  const helper = photoAccessHelper.getPhotoAccessHelper(appContext);
  const uri = await helper.createAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg');
  const file = fileIo.openSync(uri, fileIo.OpenMode.READ_WRITE);
  const decoder = new util.Base64Helper();
  const bytes: Uint8Array = decoder.decodeSync(JPEG_BASE64);
  fileIo.writeSync(file.fd, bytes.buffer);
  fileIo.closeSync(file.fd);
}

async function prepareBrowser(driver: Driver): Promise<void> {
  await prepareHome(driver);
  await enterAllPhotos(driver);
  await openFirstGridItem(driver);
  await ensureBrowserBar(driver, await appText('action_info'), '5');
}


async function enterGridSelection(driver: Driver): Promise<void> {
  await prepareHome(driver);
  await enterAllPhotos(driver);
  const items: Array<Component> = await driver.findComponents(ON.type('GridItem'));
  if (items.length === 0) {
    throw new Error('no GridItem for selection');
  }
  await items[0].longClick();
  await driver.delayMs(1200);
}

async function openDetails(driver: Driver): Promise<void> {
  await prepareBrowser(driver);
  await clickWithRetry(driver, ON.id('5'));
  await driver.delayMs(1500);
}

async function openAlbumByName(driver: Driver, name: string): Promise<void> {
  await prepareHome(driver);
  await clickWithRetry(driver, ON.text(await appText(name)), 6);
  await driver.delayMs(1800);
}

async function openRecycle(driver: Driver): Promise<void> {
  await goHome(driver);
  await driver.swipe(100, 1000, 100, 200);
  await driver.delayMs(1200);
  await clickWithRetry(driver, ON.text(await appText('album_recycle')), 5);
  await driver.delayMs(1800);
}

async function deleteFirstImage(driver: Driver): Promise<void> {
  await createTestImage();
  await prepareHome(driver);
  await enterAllPhotos(driver);
  await openFirstGridItem(driver);
  await ensureBrowserBar(driver, await appText('action_delete'), '7');
  await clickWithRetry(driver, ON.text(await appText('action_delete')));
  await driver.delayMs(1200);
  await clickWithRetry(driver, ON.id('deleteConfirm'));
  await driver.delayMs(2000);
}

export default function PhotosUiSupplementTest(): void {
  describe('PhotosUiSupplementTest', () => {
    beforeAll(async () => {
      await createTestImage();
      await createTestImage();
    });

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0001
     * @tc.name      testPhotosUiSupp0001
     * @tc.desc      Checks all photos album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0001 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_all');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_all')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0002
     * @tc.name      testPhotosUiSupp0002
     * @tc.desc      Checks camera album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0002 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_camera');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_camera')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0003
     * @tc.name      testPhotosUiSupp0003
     * @tc.desc      Checks video album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0003 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_video');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_video')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0004
     * @tc.name      testPhotosUiSupp0004
     * @tc.desc      Checks favorite album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0004 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_favor');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_favor')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0005
     * @tc.name      testPhotosUiSupp0005
     * @tc.desc      Checks screenshot album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0005 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_screen_shot');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_screen_shot')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0006
     * @tc.name      testPhotosUiSupp0006
     * @tc.desc      Checks moving photo album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0006 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_moving_photo');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_moving_photo')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0007
     * @tc.name      testPhotosUiSupp0007
     * @tc.desc      Checks recycle album is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0007 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'album_recycle');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_recycle')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0008
     * @tc.name      testPhotosUiSupp0008
     * @tc.desc      Checks photos tab is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0008 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'tab_timeline');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_timeline')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0009
     * @tc.name      testPhotosUiSupp0009
     * @tc.desc      Checks albums tab is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0009 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'tab_albums');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_albums')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0010
     * @tc.name      testPhotosUiSupp0010
     * @tc.desc      Checks the location album tab is visible on the Photos home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0010 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      const exists: boolean = await existsWithScroll(driver, 'tab_location_albums');
      expect(exists).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_location_albums')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0011
     * @tc.name      testPhotosUiSupp0011
     * @tc.desc      Checks the new album entry is present on the home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0011 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      expect(await componentExists(driver, ON.id('28'), 2)).assertTrue();
      const button: Component = await waitForComponent(driver, ON.id('28'));
      expect(await button.getId()).assertEqual('28');
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0012
     * @tc.name      testPhotosUiSupp0012
     * @tc.desc      Checks the home screen remains usable after a repeated app activation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0012 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await bringAppToFront();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_albums')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0013
     * @tc.name      testPhotosUiSupp0013
     * @tc.desc      Opens and leaves the album_all album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0013 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_all')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0014
     * @tc.name      testPhotosUiSupp0014
     * @tc.desc      Opens and leaves the album_camera album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0014 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_camera')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0015
     * @tc.name      testPhotosUiSupp0015
     * @tc.desc      Opens and leaves the album_video album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0015 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_video')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0016
     * @tc.name      testPhotosUiSupp0016
     * @tc.desc      Opens and leaves the album_favor album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0016 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_favor')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0017
     * @tc.name      testPhotosUiSupp0017
     * @tc.desc      Opens and leaves the album_screen_shot album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0017 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_screen_shot')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0018
     * @tc.name      testPhotosUiSupp0018
     * @tc.desc      Opens and leaves the album_moving_photo album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0018 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_moving_photo')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0019
     * @tc.name      testPhotosUiSupp0019
     * @tc.desc      Opens and leaves the album_recycle album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0019 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('album_recycle')));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0020
     * @tc.name      testPhotosUiSupp0020
     * @tc.desc      Checks seeded media appears in the all photos grid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0020 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await enterAllPhotos(driver);
      const items: Array<Component> = await driver.findComponents(ON.type('GridItem'));
      expect(items.length > 0).assertTrue();
      expect(await componentExists(driver, ON.type('GridItem'), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0021
     * @tc.name      testPhotosUiSupp0021
     * @tc.desc      Checks opening a grid item exposes the browser delete action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0021 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      const deleteText: string = await appText('action_delete');
      expect(await componentExists(driver, ON.text(deleteText), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_info')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0022
     * @tc.name      testPhotosUiSupp0022
     * @tc.desc      Checks the browser details entry has its stable id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0022 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      const info: Component = await waitForComponent(driver, ON.id('5'));
      expect(await info.getId()).assertEqual('5');
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0023
     * @tc.name      testPhotosUiSupp0023
     * @tc.desc      Checks the browser delete entry has its stable id.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0023 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      expect(await componentExists(driver, ON.id('7'), 3)).assertTrue();
      const deleteButton: Component = await waitForComponent(driver, ON.id('7'));
      expect(await deleteButton.getId()).assertEqual('7');
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0024
     * @tc.name      testPhotosUiSupp0024
     * @tc.desc      Checks the browser rename action is exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0024 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      const renameText: string = await appText('action_rename');
      expect(await componentExists(driver, ON.text(renameText), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0025
     * @tc.name      testPhotosUiSupp0025
     * @tc.desc      Checks the browser favorite action is exposed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0025 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      const favoriteText: string = await appText('action_not_favorite');
      expect(await componentExists(driver, ON.text(favoriteText), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('14'), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0026
     * @tc.name      testPhotosUiSupp0026
     * @tc.desc      Checks going back from the browser returns to the grid.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0026 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await driver.pressBack();
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.type('GridItem'), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('5'), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0027
     * @tc.name      testPhotosUiSupp0027
     * @tc.desc      Checks the details dialog opens and closes without leaving the browser.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0027 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await clickWithRetry(driver, ON.id('5'));
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.text(await appText('action_info')), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0028
     * @tc.name      testPhotosUiSupp0028
     * @tc.desc      Checks the rename dialog can be opened and dismissed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0028 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await clickWithRetry(driver, ON.text(await appText('action_rename')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.type('TextInput'), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0029
     * @tc.name      testPhotosUiSupp0029
     * @tc.desc      Checks the delete confirmation can be opened and cancelled.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0029 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await clickWithRetry(driver, ON.text(await appText('action_delete')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('deleteConfirm'), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('deleteConfirm'), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0030
     * @tc.name      testPhotosUiSupp0030
     * @tc.desc      Checks the new album dialog opens and can be dismissed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0030 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.id('28'));
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.type('TextInput'), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0031
     * @tc.name      testPhotosUiSupp0031
     * @tc.desc      Checks the album home remains stable after entering all photos and returning.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0031 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await enterAllPhotos(driver);
      await driver.pressBack();
      await driver.delayMs(1500);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_all')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0032
     * @tc.name      testPhotosUiSupp0032
     * @tc.desc      Checks the albums tab restores the album home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0032 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('tab_albums')));
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_albums')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0033
     * @tc.name      testPhotosUiSupp0033
     * @tc.desc      Checks the photos tab can be selected from the album home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0033 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('tab_timeline')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.text(await appText('tab_timeline')), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0034
     * @tc.name      testPhotosUiSupp0034
     * @tc.desc      Checks the location album tab can be selected and left.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0034 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await clickWithRetry(driver, ON.text(await appText('tab_location_albums')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.text(await appText('tab_location_albums')), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0035
     * @tc.name      testPhotosUiSupp0035
     * @tc.desc      Checks repeated back navigation from all photos reaches the album home.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0035 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await enterAllPhotos(driver);
      await driver.pressBack();
      await driver.delayMs(1200);
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 4)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0036
     * @tc.name      testPhotosUiSupp0036
     * @tc.desc      Checks the home screen survives a vertical swipe.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0036 begin');
      const driver: Driver = Driver.create();
      await prepareHome(driver);
      await driver.swipe(100, 1000, 100, 200);
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('tab_albums')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0037
     * @tc.name      testPhotosUiSupp0037
     * @tc.desc      Enters grid selection mode by long pressing a photo.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0037 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_select_all')), 3)).assertTrue();
      expect(await componentExists(driver, ON.type('GridItem'), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0038
     * @tc.name      testPhotosUiSupp0038
     * @tc.desc      Selects all photos from selection mode.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0038 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      await clickWithRetry(driver, ON.text(await appText('action_select_all')));
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.text(await appText('action_deselect_all')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0039
     * @tc.name      testPhotosUiSupp0039
     * @tc.desc      Deselects all photos from select-all state.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0039 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      await clickWithRetry(driver, ON.text(await appText('action_select_all')));
      await driver.delayMs(1000);
      await clickWithRetry(driver, ON.text(await appText('action_deselect_all')));
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.text(await appText('action_select_all')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_deselect_all')), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0040
     * @tc.name      testPhotosUiSupp0040
     * @tc.desc      Selects two photos and keeps multi-select actions available.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0040 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      const items: Array<Component> = await driver.findComponents(ON.type('GridItem'));
      expect(items.length > 1).assertTrue();
      if (items.length > 1) {
        await items[1].click();
        await driver.delayMs(1000);
      }
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_share')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0041
     * @tc.name      testPhotosUiSupp0041
     * @tc.desc      Leaves selection mode with the back key.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0041 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.text(await appText('action_select_all')), 1)).assertFalse();
      expect(await componentExists(driver, ON.type('GridItem'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0042
     * @tc.name      testPhotosUiSupp0042
     * @tc.desc      Keeps the share action after selecting all photos.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0042 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      await clickWithRetry(driver, ON.text(await appText('action_select_all')));
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.text(await appText('action_share')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0043
     * @tc.name      testPhotosUiSupp0043
     * @tc.desc      Checks the details dialog title field.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0043 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('title')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('details')), 2)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0044
     * @tc.name      testPhotosUiSupp0044
     * @tc.desc      Checks the details dialog time field.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0044 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('time')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('details')), 2)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0045
     * @tc.name      testPhotosUiSupp0045
     * @tc.desc      Checks the details dialog size field.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0045 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('size')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('details')), 2)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0046
     * @tc.name      testPhotosUiSupp0046
     * @tc.desc      Checks the details dialog resolution field.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0046 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('resolution')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('details')), 2)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0047
     * @tc.name      testPhotosUiSupp0047
     * @tc.desc      Checks the details dialog location and shooting fields.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0047 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('location')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('shooting_params')), 2)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('details')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0048
     * @tc.name      testPhotosUiSupp0048
     * @tc.desc      Checks the details dialog title is present.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0048 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      expect(await componentExists(driver, ON.text(await appText('details')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('title')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0049
     * @tc.name      testPhotosUiSupp0049
     * @tc.desc      Checks the screenshots album renders its empty state when it has no items.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0049 begin');
      const driver: Driver = Driver.create();
      await openAlbumByName(driver, 'album_screen_shot');
      expect(await componentExists(driver, ON.text(await appText('no_distributed_photo_head_title_album')), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0050
     * @tc.name      testPhotosUiSupp0050
     * @tc.desc      Checks the moving photo album renders its empty state when it has no items.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0050 begin');
      const driver: Driver = Driver.create();
      await openAlbumByName(driver, 'album_moving_photo');
      expect(await componentExists(driver, ON.text(await appText('no_distributed_photo_head_title_album')), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0051
     * @tc.name      testPhotosUiSupp0051
     * @tc.desc      Checks the delete dialog shows the photo recycle prompt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0051 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await clickWithRetry(driver, ON.text(await appText('action_delete')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.text(await appText('recycle_picture_tips')), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('deleteConfirm'), 2)).assertTrue();
      await driver.pressBack();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0052
     * @tc.name      testPhotosUiSupp0052
     * @tc.desc      Checks cancelling the delete dialog keeps the browser open.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0052 begin');
      const driver: Driver = Driver.create();
      await prepareBrowser(driver);
      await clickWithRetry(driver, ON.text(await appText('action_delete')));
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.id('deleteConfirm'), 3)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1000);
      expect(await componentExists(driver, ON.id('deleteConfirm'), 1)).assertFalse();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0053
     * @tc.name      testPhotosUiSupp0053
     * @tc.desc      Deletes a seeded photo into the recycle album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0053 begin');
      const driver: Driver = Driver.create();
      await deleteFirstImage(driver);
      await openRecycle(driver);
      expect(await componentExists(driver, ON.type('GridItem'), 5)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('album_recycle')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0054
     * @tc.name      testPhotosUiSupp0054
     * @tc.desc      Checks the recycle browser exposes the recover action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0054 begin');
      const driver: Driver = Driver.create();
      await deleteFirstImage(driver);
      await openRecycle(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_recover'));
      expect(await componentExists(driver, ON.text(await appText('action_recover')), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0055
     * @tc.name      testPhotosUiSupp0055
     * @tc.desc      Recovers a trashed photo and shrinks the recycle album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0055 begin');
      const driver: Driver = Driver.create();
      await deleteFirstImage(driver);
      await openRecycle(driver);
      const before: number = (await driver.findComponents(ON.type('GridItem'))).length;
      expect(before > 0).assertTrue();
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_recover'));
      await clickWithRetry(driver, ON.text(await appText('action_recover')));
      await driver.delayMs(2200);
      await openRecycle(driver);
      const after: number = (await driver.findComponents(ON.type('GridItem'))).length;
      expect(after < before).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0056
     * @tc.name      testPhotosUiSupp0056
     * @tc.desc      Checks the recycle album exposes its clear action.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0056 begin');
      const driver: Driver = Driver.create();
      await deleteFirstImage(driver);
      await openRecycle(driver);
      expect(await componentExists(driver, ON.text(await appText('action_clear_recycle')), 4)).assertTrue();
      expect(await componentExists(driver, ON.type('GridItem'), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0057
     * @tc.name      testPhotosUiSupp0057
     * @tc.desc      Checks the recycle album can be opened from the home screen.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0057 begin');
      const driver: Driver = Driver.create();
      await openRecycle(driver);
      expect(await componentExists(driver, ON.text(await appText('album_recycle')), 3)).assertTrue();
      expect(await componentExists(driver, ON.id('28'), 1)).assertFalse();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0058
     * @tc.name      testPhotosUiSupp0058
     * @tc.desc      Checks the details dialog close returns to the browser.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0058 begin');
      const driver: Driver = Driver.create();
      await openDetails(driver);
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await componentExists(driver, ON.text(await appText('details')), 1)).assertFalse();
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_SUPP_0059
     * @tc.name      testPhotosUiSupp0059
     * @tc.desc      Checks the browser remains navigable after a selection cycle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUiSupp0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0059 begin');
      const driver: Driver = Driver.create();
      await enterGridSelection(driver);
      await driver.pressBack();
      await driver.delayMs(1000);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_info'), '5');
      expect(await componentExists(driver, ON.id('5'), 3)).assertTrue();
      expect(await componentExists(driver, ON.text(await appText('action_delete')), 2)).assertTrue();
      HiLog.info(DOMAIN, TAG, 'testPhotosUiSupp0059 end');
    })

  })
}
