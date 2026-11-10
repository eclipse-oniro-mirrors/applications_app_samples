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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component, On } from '@kit.TestKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';

const TAG = '[Sample_PhotosTest]';
const BUNDLE = 'photos_';
const DOMAIN = 0xF811;
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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
  for (let i: number = 0; i < tries; i++) {
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
  for (let i: number = 0; i < tries; i++) {
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
  for (let i: number = 0; i < tries; i++) {
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
  for (let i: number = 0; i < 8; i++) {
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
  for (let i: number = 0; i < 6; i++) {
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
  for (let i: number = 0; i < 8; i++) {
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
  hilog.info(DOMAIN, TAG, `seed image ${displayIndex} created: ${uri}`);
  return uri;
}

async function seedTestImages(count: number): Promise<void> {
  for (let i: number = 0; i < count; i++) {
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
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility begin');
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.samples.photos',
          abilityName: 'EntryAbility'
        });
      } catch (exception) {
        hilog.info(DOMAIN, TAG, `StartAbility exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      const driver = Driver.create();
      await driver.delayMs(3000);
      await dismissPermissionDialogs(driver);
      await goHome(driver);
      expect(await componentExists(driver, ON.id('28'), 3)).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility end');
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
      hilog.info(DOMAIN, TAG, BUNDLE + 'SeedAndList begin');
      await seedTestImages(5);
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      let count = 0;
      for (let i: number = 0; i < 30; i++) {
        const items = await driver.findComponents(ON.type('GridItem'));
        count = items.length;
        if (count >= 5) {
          break;
        }
        await driver.delayMs(1000);
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'GridItem count:' + count);
      expect(count).assertLarger(4);
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'SeedAndList end');
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
      hilog.info(DOMAIN, TAG, BUNDLE + 'BrowserActions begin');
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
      hilog.info(DOMAIN, TAG, BUNDLE + 'BrowserActions end');
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
      hilog.info(DOMAIN, TAG, BUNDLE + 'Rename begin');
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
      const yesText = await appText('yes');
      const btnOK: Component = await waitForComponent(driver, ON.text(yesText));
      await btnOK.click();
      await driver.delayMs(2500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_info'), '5');
      const btnInfo: Component = await waitForComponent(driver, ON.id('5'), 6, '0004-info');
      await btnInfo.click();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'check text:' + newName);
      await driver.assertComponentExist(ON.text(newName));
      await driver.pressBack();
      await driver.delayMs(1000);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'Rename end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0500
     * @tc.name      testPhotosFavorite0005
     * @tc.desc      Favoriting a photo makes it appear in the favorites album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosFavorite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Favorite begin');
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      const favorText = await appText('action_not_favorite');
      const btnFavor: Component = await waitForComponent(driver, ON.text(favorText), 10);
      await btnFavor.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.swipe(100, 1000, 100, 200);
      await driver.delayMs(2000);
      const favorAlbumText = await appText('album_favor');
      const favorAlbum: Component = await waitForComponent(driver, ON.text(favorAlbumText));
      await favorAlbum.click();
      await driver.delayMs(2000);
      const items = await driver.findComponents(ON.type('GridItem'));
      expect(items.length).assertLarger(0);
      await driver.pressBack();
      await driver.delayMs(1500);
      hilog.info(DOMAIN, TAG, BUNDLE + 'Favorite end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0600
     * @tc.name      testPhotosUnfavorite0006
     * @tc.desc      Unfavoriting a photo removes it from the favorites album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosUnfavorite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Unfavorite begin');
      await seedTestImages(1);
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_not_favorite'), '14');
      const btnFavor: Component = await waitForComponent(driver, ON.id('14'), 6, '0006-favor-btn');
      await btnFavor.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      const favorAlbumText = await appText('album_favor');
      const favorAlbum: Component = await waitForComponent(driver, ON.text(favorAlbumText), 8, '0006-favor-album-card');
      await favorAlbum.click();
      await driver.delayMs(2000);
      const items = await driver.findComponents(ON.type('GridItem'));
      expect(items.length).assertLarger(0);
      const favCount = items.length;
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_favorite'), '13');
      const btnUnfavor: Component = await waitForComponent(driver, ON.id('13'), 6, '0006-unfavor-btn');
      await btnUnfavor.click();
      await driver.delayMs(2500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await goHome(driver);
      const favorAlbumAfter: Component = await waitForComponent(driver, ON.text(favorAlbumText), 8,
        '0006-favor-album-again');
      await favorAlbumAfter.click();
      await driver.delayMs(2000);
      let afterCount = favCount;
      for (let i: number = 0; i < 10; i++) {
        const now = await driver.findComponents(ON.type('GridItem'));
        afterCount = now.length;
        if (afterCount < favCount) {
          break;
        }
        await driver.delayMs(1000);
      }
      expect(afterCount).assertLess(favCount);
      hilog.info(DOMAIN, TAG, BUNDLE + 'Unfavorite end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0700
     * @tc.name      testPhotosCreateAlbum0007
     * @tc.desc      Creating a user album and adding a photo puts the album into the media library.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosCreateAlbum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateAlbum begin');
      const driver = Driver.create();
      await goHome(driver);
      await driver.assertComponentExist(ON.id('28'));
      const btnNew: Component = await driver.findComponent(ON.id('28'));
      await btnNew.click();
      await driver.delayMs(1000);
      const albumName = `ualbum_${Date.now()}`;
      const text = await waitForComponent(driver, ON.type('TextInput'), 8, '0007-name-input');
      await text.clearText();
      await text.inputText(albumName);
      await driver.delayMs(800);
      const yesText = await appText('yes');
      const btnConfirm: Component = await waitForComponent(driver, ON.text(yesText), 8, '0007-confirm');
      await btnConfirm.click();
      await driver.delayMs(2500);
      const selectText = await appText('album_all');
      if (!(await componentExists(driver, ON.text(selectText), 2))) {
        let joined = '';
        const texts: Array<Component> = await driver.findComponents(ON.type('Text'));
        for (let i: number = 0; i < texts.length; i++) {
          joined += `[${await texts[i].getText()}]`;
        }
        throw new Error(`NO_SELECT_PAGE=${joined}`);
      }
      const gridItems = await driver.findComponents(ON.type('GridItem'));
      if (gridItems.length > 1) {
        await gridItems[1].click();
      } else if (gridItems.length === 1) {
        await gridItems[0].click();
      }
      await driver.delayMs(1500);
      const btnOK: Component = await waitForComponent(driver, ON.id('1'), 8, '0007-ok');
      await btnOK.click();
      await driver.delayMs(3000);
      const appContext2 = await getAppContext();
      const helper2 = photoAccessHelper.getPhotoAccessHelper(appContext2);
      let found = false;
      let names = '';
      for (let attempt: number = 0; attempt < 3 && !found; attempt++) {
        await driver.delayMs(2000);
        const userAlbums = await helper2.getAlbums(photoAccessHelper.AlbumType.USER,
          photoAccessHelper.AlbumSubtype.USER_GENERIC);
        const albumObjects = await userAlbums.getAllObjects();
        for (let i: number = 0; i < albumObjects.length; i++) {
          names += `[${albumObjects[i].albumName}]`;
          if (albumObjects[i].albumName === albumName) {
            found = true;
          }
        }
      }
      if (!found) {
        throw new Error(`ALBUM_NAMES=${names}`);
      }
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'CreateAlbum end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0800
     * @tc.name      testPhotosDeleteAlbum0008
     * @tc.desc      Long pressing the user album and confirming delete removes it from the library.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDeleteAlbum0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DeleteAlbum begin');
      const driver = Driver.create();
      await goHome(driver);
      const textNodes = await driver.findComponents(ON.type('Text'));
      let albumCard: Component | null = null;
      let albumCardText = '';
      for (let i: number = 0; i < textNodes.length; i++) {
        const t: string = await textNodes[i].getText();
        if (t.startsWith('ualbum_')) {
          albumCard = textNodes[i];
          albumCardText = t;
          break;
        }
      }
      expect(albumCard !== null).assertTrue();
      if (albumCard === null) {
        return;
      }
      await albumCard.longClick();
      await driver.delayMs(1500);
      const deleteText = await appText('action_delete');
      const btnDelete: Component = await waitForComponent(driver, ON.text(deleteText));
      await btnDelete.click();
      await driver.delayMs(1500);
      await driver.assertComponentExist(ON.id('deleteConfirm'));
      const btnDeleteConfirm: Component = await driver.findComponent(ON.id('deleteConfirm'));
      await btnDeleteConfirm.click();
      await driver.delayMs(2500);
      const appContext2 = await getAppContext();
      const helper2 = photoAccessHelper.getPhotoAccessHelper(appContext2);
      const userAlbums = await helper2.getAlbums(photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
      const albumObjects = await userAlbums.getAllObjects();
      let stillThere = false;
      for (let i: number = 0; i < albumObjects.length; i++) {
        if (albumObjects[i].albumName === albumCardText) {
          stillThere = true;
        }
      }
      expect(stillThere).assertFalse();
      hilog.info(DOMAIN, TAG, BUNDLE + 'DeleteAlbum end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_0900
     * @tc.name      testPhotosDeleteToTrash0009
     * @tc.desc      Deleting a photo moves it into the recently deleted album.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDeleteToTrash0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DeleteToTrash begin');
      await seedTestImages(1);
      const driver = Driver.create();
      await goHome(driver);
      await enterAllPhotos(driver);
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_delete'), '7');
      const deleteText = await appText('action_delete');
      const btnDelete: Component = await waitForComponent(driver, ON.text(deleteText));
      await btnDelete.click();
      await driver.delayMs(1500);
      await driver.assertComponentExist(ON.id('deleteConfirm'));
      const btnDeleteConfirm: Component = await driver.findComponent(ON.id('deleteConfirm'));
      await btnDeleteConfirm.click();
      await driver.delayMs(2500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.pressBack();
      await driver.delayMs(1500);
      await driver.swipe(100, 1000, 100, 200);
      await driver.delayMs(2000);
      const recycleText = await appText('album_recycle');
      const recycleAlbum: Component = await waitForComponent(driver, ON.text(recycleText));
      await recycleAlbum.click();
      await driver.delayMs(2000);
      const items = await driver.findComponents(ON.type('GridItem'));
      expect(items.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'DeleteToTrash end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_UI_1000
     * @tc.name      testPhotosRecover0010
     * @tc.desc      Recovering a trashed photo shrinks the recently deleted album by one.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosRecover0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'Recover begin');
      const driver = Driver.create();
      await goHome(driver);
      const recycleText = await appText('album_recycle');
      const recycleAlbum: Component = await waitForComponent(driver, ON.text(recycleText));
      await recycleAlbum.click();
      await driver.delayMs(2000);
      const recycleItems = await driver.findComponents(ON.type('GridItem'));
      const beforeRecover = recycleItems.length;
      expect(beforeRecover > 0).assertTrue();
      await openFirstGridItem(driver);
      await ensureBrowserBar(driver, await appText('action_recover'));
      const recoverText = await appText('action_recover');
      const btnRecover: Component = await waitForComponent(driver, ON.text(recoverText));
      await btnRecover.click();
      await driver.delayMs(2500);
      await goHome(driver);
      const recycleAlbumAfter: Component = await waitForComponent(driver, ON.text(recycleText), 8,
        '0010-recycle-again');
      await recycleAlbumAfter.click();
      await driver.delayMs(2000);
      let afterRecover = beforeRecover;
      for (let i: number = 0; i < 25; i++) {
        const now = await driver.findComponents(ON.type('GridItem'));
        afterRecover = now.length;
        if (afterRecover < beforeRecover) {
          break;
        }
        await driver.delayMs(1000);
      }
      expect(afterRecover).assertEqual(beforeRecover - 1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'Recover end');
    })
  })
}
