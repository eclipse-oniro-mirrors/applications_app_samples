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

import { describe, expect, it, Level, Size, TestType, beforeAll, beforeEach } from '@ohos/hypium';
import { Component, Driver, ON } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';

const BUNDLE_NAME: string = 'com.samples.hspsample';
const ABILITY_NAME: string = 'EntryAbility';
const INDEX_PAGE_TEXT: string = 'HSP index page';
const MENU_PAGE_TEXT: string = 'HSP menu page';
const BACK_PAGE_TEXT: string = 'HSP back page';
const ADD_RESULT: string = 'result: 3';
const NATIVE_RESULT: string = 'result: 12';
const STEP_DELAY: number = 300;

let driver: Driver = Driver.create();
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let libraryResourceManager: resourceManager.ResourceManager;

async function findId(id: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.id(id));
  } catch (err) {
    return null;
  }
}

async function findText(text: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.text(text));
  } catch (err) {
    return null;
  }
}

async function waitForId(id: string, timeout: number): Promise<Component | null> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    let component: Component | null = await findId(id);
    if (component !== null) {
      return component;
    }
    await driver.delayMs(100);
  }
  return null;
}

async function waitForText(text: string, timeout: number): Promise<Component | null> {
  let deadline: number = Date.now() + timeout;
  while (Date.now() < deadline) {
    let component: Component | null = await findText(text);
    if (component !== null) {
      return component;
    }
    await driver.delayMs(100);
  }
  return null;
}

async function goHome(): Promise<void> {
  for (let attempt = 0; attempt < 8; attempt++) {
    if (await findId('add') !== null) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(STEP_DELAY);
  }
}

export default function hspUiPageTest(): void {
  describe('HspUiPageTest', () => {
    beforeAll(async () => {
      const appContext: common.Context = delegator.getAppContext();
      libraryResourceManager = appContext.createModuleContext('library').resourceManager;
      await driver.delayMs(500);
      try {
        await delegator.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME
        });
      } catch (err) {
        expect(false).assertFail();
      }
      await driver.delayMs(800);
      await goHome();
    });

    beforeEach(async () => {
      await goHome();
    });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_UI_PAGE_0100
     * @tc.name      testHspUiPage0001
     * @tc.desc      Verify the entry page exposes the shared title, picture and every action entry.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspUiPage0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const title: Component | null = await waitForId('library', 5000);
          expect(title !== null).assertTrue();
          const expectedTitle: string = libraryResourceManager.getStringByNameSync('library_title');
          expect(await title?.getText()).assertEqual(expectedTitle);
          expect(await waitForId('image', 3000) !== null).assertTrue();
          expect(await waitForId('add', 3000) !== null).assertTrue();
          expect(await waitForId('nativeMulti', 3000) !== null).assertTrue();
          expect(await waitForId('getStringValue', 3000) !== null).assertTrue();
          expect(await waitForId('clickToIndex', 3000) !== null).assertTrue();
          expect(await waitForId('clickToMenu', 3000) !== null).assertTrue();
          expect(await waitForId('clickToBack', 3000) !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_UI_PAGE_0200
     * @tc.name      testHspUiPage0002
     * @tc.desc      Verify the HSP index page shows its own text and image and returns to the entry page.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspUiPage0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const entry: Component | null = await waitForId('clickToIndex', 3000);
          expect(entry !== null).assertTrue();
          if (entry !== null) {
            await entry.click();
          }
          const pageText: Component | null = await waitForText(INDEX_PAGE_TEXT, 3000);
          expect(pageText !== null).assertTrue();
          expect(await pageText?.getText()).assertEqual(INDEX_PAGE_TEXT);
          expect(await waitForId('example', 3000) !== null).assertTrue();
          await driver.pressBack();
          await driver.delayMs(STEP_DELAY);
          expect(await waitForId('add', 3000) !== null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_UI_PAGE_0300
     * @tc.name      testHspUiPage0003
     * @tc.desc      Verify the HSP menu and back pages show their text and keep both return entries.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspUiPage0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const entry: Component | null = await waitForId('clickToMenu', 3000);
          expect(entry !== null).assertTrue();
          if (entry !== null) {
            await entry.click();
          }
          const menuText: Component | null = await waitForText(MENU_PAGE_TEXT, 3000);
          expect(menuText !== null).assertTrue();
          expect(await menuText?.getText()).assertEqual(MENU_PAGE_TEXT);
          const router: Component | null = await waitForId('menuToBack', 3000);
          expect(router !== null).assertTrue();
          if (router !== null) {
            await router.click();
          }
          const backText: Component | null = await waitForText(BACK_PAGE_TEXT, 3000);
          expect(backText !== null).assertTrue();
          expect(await backText?.getText()).assertEqual(BACK_PAGE_TEXT);
          expect(await waitForId('backToHAP', 3000) !== null).assertTrue();
          expect(await waitForId('backToHSP', 3000) !== null).assertTrue();
          const backToHsp: Component | null = await findId('backToHSP');
          if (backToHsp !== null) {
            await backToHsp.click();
          }
          expect(await waitForText(MENU_PAGE_TEXT, 3000) !== null).assertTrue();
          await driver.pressBack();
          await driver.delayMs(STEP_DELAY);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_UI_PAGE_0400
     * @tc.name      testHspUiPage0004
     * @tc.desc      Verify the result line switches between the HSP arithmetic and native actions.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testHspUiPage0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const addButton: Component | null = await waitForId('add', 3000);
          expect(addButton !== null).assertTrue();
          if (addButton !== null) {
            await addButton.click();
          }
          const addResult: Component | null = await waitForText(ADD_RESULT, 3000);
          expect(addResult !== null).assertTrue();
          expect(await addResult?.getText()).assertEqual(ADD_RESULT);
          const nativeButton: Component | null = await waitForId('nativeMulti', 3000);
          if (nativeButton !== null) {
            await nativeButton.click();
          }
          const nativeResult: Component | null = await waitForText(NATIVE_RESULT, 3000);
          expect(nativeResult !== null).assertTrue();
          expect(await nativeResult?.getText()).assertEqual(NATIVE_RESULT);
          expect(await findText(ADD_RESULT) === null).assertTrue();
          if (addButton !== null) {
            await addButton.click();
          }
          expect(await waitForText(ADD_RESULT, 3000) !== null).assertTrue();
          expect(await findText(NATIVE_RESULT) === null).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
