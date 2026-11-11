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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, MatchPattern, ON } from '@kit.TestKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import cloudDisk, {
  ChangesResult,
  CustomInfoResult,
  FileSyncState,
  IsPlaceholderResult,
  PlaceholderStateResult,
  ResultList,
  SyncFolder
} from 'libentry.so';

const BUNDLE_NAME: string = 'com.samples.clouddisk';
const ABILITY_NAME: string = 'EntryAbility';
const TAG: string = 'CloudDiskTest';
const DOMAIN: number = 0xF812;

// The board image is built without SUPPORT_CLOUD_DISK_MANAGER, so CloudDisk APIs return 801.
const NOT_SUPPORTED: number = 801;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const appContext = delegator.getAppContext();
const API_BASE: string = appContext.filesDir + '/clouddisk_api_base';

const MODULE_TITLES: string[] = [
  '创建占位符文件',
  '判断是否为占位符文件',
  '更新占位符元数据',
  '占位符转0字节普通文件',
  '标记文件为占位符 (MarkFileAsPlaceholder)',
  '取消占位符标记 (UnmarkPlaceholderFile)',
  '获取自定义信息 (GetPlaceholderCustomInfo)',
  '普通文件脱水',
  '水合占位符',
  '注册回调表',
  '解注册回调表',
  '响应回调请求 (OH_CloudDisk_Execute)'
];

const MODULE_BUTTONS: string[] = [
  'createPlaceholderBtn',
  'judgePlaceholderBtn',
  'updatePlaceholderBtn',
  'convertBtn',
  'markBtn',
  'unmarkBtn',
  'getCustomInfoBtn',
  'dehydrateBtn',
  'hydrateBtn',
  'registerCallbackBtn',
  'unregisterCallbackBtn',
  'executeBtn'
];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function clickText(driver: Driver, text: string): Promise<boolean> {
  const component: Component = await driver.findComponent(ON.text(text));
  if (!component) {
    return false;
  }
  await component.click();
  return true;
}

async function dismissDialogs(driver: Driver): Promise<void> {
  for (let i = 0; i < 3; i++) {
    if (await clickText(driver, '确定')) {
      await sleep(500);
      continue;
    }
    if (await clickText(driver, 'OK')) {
      await sleep(500);
      continue;
    }
    break;
  }
}

async function ensureTabs(driver: Driver): Promise<boolean> {
  await dismissDialogs(driver);
  for (let i = 0; i < 4; i++) {
    const tab: Component = await driver.findComponent(ON.id('tabSyncRoot'));
    if (tab) {
      return true;
    }
    await driver.pressBack();
    await sleep(600);
  }
  return false;
}

async function ensureMain(driver: Driver): Promise<boolean> {
  if (!await ensureTabs(driver)) {
    return false;
  }
  if (await driver.findComponent(ON.id('registerSyncRootBtn'))) {
    return true;
  }
  const tab: Component = await driver.waitForComponent(ON.id('tabSyncRoot'), 3000);
  if (!tab) {
    return false;
  }
  await tab.click();
  await sleep(300);
  return true;
}

async function ensureApp(driver: Driver): Promise<boolean> {
  if (await ensureTabs(driver)) {
    return true;
  }
  await delegator.startAbility({
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_NAME
  });
  await sleep(1500);
  await dismissDialogs(driver);
  return await ensureTabs(driver);
}

async function switchToPlaceholderTab(driver: Driver): Promise<boolean> {
  if (!await ensureTabs(driver)) {
    return false;
  }
  if (await driver.findComponent(ON.id('placeholderMenu0'))) {
    return true;
  }
  const tab: Component = await driver.waitForComponent(ON.id('tabPlaceholder'), 3000);
  if (!tab) {
    return false;
  }
  await tab.click();
  await sleep(200);
  return true;
}

async function openModule(driver: Driver, index: number): Promise<boolean> {
  if (!await switchToPlaceholderTab(driver)) {
    return false;
  }
  if (!await driver.findComponent(ON.id('placeholderMenu0'))) {
    await driver.swipe(108, 400, 108, 1000, 300);
    await sleep(200);
  }
  const menuId: string = 'placeholderMenu' + index;
  let menu: Component = await driver.findComponent(ON.id(menuId));
  for (let i = 0; i < 2 && !menu; i++) {
    await driver.swipe(108, 1000, 108, 300, 300);
    await sleep(300);
    menu = await driver.findComponent(ON.id(menuId));
  }
  if (!menu) {
    log('menu not found: ' + menuId);
    return false;
  }
  await menu.click();
  await sleep(300);
  return true;
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function findWithScroll(driver: Driver, id: string): Promise<Component> {
  let component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    await driver.swipe(540, 1000, 540, 400, 300);
    await sleep(300);
    component = await driver.findComponent(ON.id(id));
  }
  return component;
}

async function assertComponentId(component: Component, id: string): Promise<void> {
  if (!component) {
    log('component not found: ' + id);
    expect().assertFail();
    return;
  }
  log('verify component: ' + id);
  expect(await component.getId()).assertEqual(id);
}

async function openSubpage(driver: Driver, buttonId: string, pageId: string): Promise<boolean> {
  if (!await ensureMain(driver)) {
    return false;
  }
  const button: Component = await driver.waitForComponent(ON.id(buttonId), 3000);
  if (!button) {
    return false;
  }
  await button.click();
  await sleep(800);
  const page: Component = await driver.waitForComponent(ON.id(pageId), 5000);
  if (!page) {
    return false;
  }
  return true;
}

export default function cloudDiskTest() {
  describe('CloudDiskTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      if (!fs.accessSync(API_BASE)) {
        fs.mkdirSync(API_BASE);
      }
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await sleep(1500);
      const driver: Driver = Driver.create();
      await dismissDialogs(driver);
      const ready: boolean = await ensureMain(driver);
      expect(ready).assertTrue();
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await dismissDialogs(driver);
      const ready: boolean = await ensureApp(driver);
      expect(ready).assertTrue();
    });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0100
     * @tc.name      testLaunchAndMainPage0001
     * @tc.desc      Start the app and verify both tabs and all sync-root management controls exist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testLaunchAndMainPage0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureMain(driver)).assertTrue();
          const ids: string[] = [
            'tabSyncRoot', 'tabPlaceholder', 'syncRootPathInput', 'aliasInput',
            'selectFolderBtn', 'clearAllSyncRootsBtn', 'registerSyncRootBtn', 'unregisterSyncRootBtn',
            'activateSyncRootBtn', 'deactivateSyncRootBtn', 'modifyAliasBtn',
            'listenerPathInput', 'registerListenerBtn', 'unregisterListenerBtn',
            'readOperationLogBtn', 'setSyncStatesBtn', 'getSyncStatesBtn', 'syncRootTable'
          ];
          for (let i = 0; i < ids.length; i++) {
            const component: Component = await driver.findComponent(ON.id(ids[i]));
            if (!component) {
              log('component not found: ' + ids[i]);
              expect().assertFail();
              return;
            }
            log('verify component: ' + ids[i]);
            await assertComponentId(component, ids[i]);
          }
          expect(await getTextById(driver, 'noSyncRootText')).assertEqual('未注册同步根');
        } catch (err) {
          log(`testLaunchAndMainPage0001 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0200
     * @tc.name      testTabSwitch0002
     * @tc.desc      Switch between the two tabs and verify each side's content is rendered.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testTabSwitch0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          expect(await getTextById(driver, 'placeholderTitle')).assertEqual(MODULE_TITLES[0]);
          const backTab: Component = await driver.waitForComponent(ON.id('tabSyncRoot'), 3000);
          if (!backTab) {
            log('back tab not found');
            expect().assertFail();
            return;
          }
          log('verify back tab');
          await assertComponentId(backTab, 'tabSyncRoot');
          await backTab.click();
          await sleep(800);
          const register: Component = await driver.findComponent(ON.id('registerSyncRootBtn'));
          if (!register) {
            log('register button not found');
            expect().assertFail();
            return;
          }
          log('verify register button');
          await assertComponentId(register, 'registerSyncRootBtn');
        } catch (err) {
          log(`testTabSwitch0002 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0300
     * @tc.name      testPlaceholderModules0003
     * @tc.desc      Click placeholder/hydration modules 0-5 and verify each title.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPlaceholderModules0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          if (!await driver.findComponent(ON.id('placeholderMenu0'))) {
            await driver.swipe(108, 400, 108, 1000, 300);
            await sleep(200);
          }
          if (!await driver.findComponent(ON.id('placeholderTitle'))) {
            await driver.swipe(540, 400, 540, 1100, 300);
            await sleep(200);
          }
          for (let i = 0; i < 6; i++) {
            log('checking module ' + i.toString());
            const menuId: string = 'placeholderMenu' + i;
            let menu: Component = await driver.findComponent(ON.id(menuId));
            for (let k = 0; k < 2 && !menu; k++) {
              await driver.swipe(108, 1000, 108, 300, 300);
              await sleep(300);
              menu = await driver.findComponent(ON.id(menuId));
            }
            if (!menu) {
              log('menu not found: ' + menuId);
              expect().assertFail();
              break;
            }
            log('verify menu: ' + menuId);
            await assertComponentId(menu, menuId);
            await menu.click();
            await sleep(150);
            const title: Component = await driver.findComponent(ON.id('placeholderTitle'));
            if (!title) {
              log('placeholder title not found');
              expect().assertFail();
              break;
            }
            log('verify placeholder title');
            await assertComponentId(title, 'placeholderTitle');
            const titleText: string = await title.getText();
            expect(titleText).assertEqual(MODULE_TITLES[i]);
          }
        } catch (err) {
          log(`testPlaceholderModules0003 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0400
     * @tc.name      testModulePrimaryButtons0004
     * @tc.desc      Verify the primary action button exists for modules 0-5.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testModulePrimaryButtons0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          if (!await driver.findComponent(ON.id('placeholderMenu0'))) {
            await driver.swipe(108, 400, 108, 1000, 300);
            await sleep(200);
          }
          for (let i = 0; i < 6; i++) {
            const menu: Component = await driver.findComponent(ON.id('placeholderMenu' + i));
            if (!menu) {
              log('menu not found: placeholderMenu' + i);
              expect().assertFail();
              break;
            }
            log('verify menu: placeholderMenu' + i);
            await assertComponentId(menu, 'placeholderMenu' + i);
            await menu.click();
            await sleep(150);
            const button: Component = await findWithScroll(driver, MODULE_BUTTONS[i]);
            if (!button) {
              log('button not found: ' + MODULE_BUTTONS[i]);
              expect().assertFail();
              break;
            }
            log('verify button: ' + MODULE_BUTTONS[i]);
            await assertComponentId(button, MODULE_BUTTONS[i]);
          }
        } catch (err) {
          log(`testModulePrimaryButtons0004 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0500
     * @tc.name      testPlaceholderModules0005
     * @tc.desc      Click placeholder/hydration modules 6-8 and verify each title.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPlaceholderModules0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          if (!await driver.findComponent(ON.id('placeholderMenu6'))) {
            await driver.swipe(108, 400, 108, 1000, 300);
            await sleep(200);
          }
          if (!await driver.findComponent(ON.id('placeholderTitle'))) {
            await driver.swipe(540, 400, 540, 1100, 300);
            await sleep(200);
          }
          for (let i = 6; i < 9; i++) {
            log('checking module ' + i.toString());
            const menuId: string = 'placeholderMenu' + i;
            let menu: Component = await driver.findComponent(ON.id(menuId));
            for (let k = 0; k < 2 && !menu; k++) {
              await driver.swipe(108, 1000, 108, 300, 300);
              await sleep(300);
              menu = await driver.findComponent(ON.id(menuId));
            }
            if (!menu) {
              log('menu not found: ' + menuId);
              expect().assertFail();
              break;
            }
            log('verify menu: ' + menuId);
            await assertComponentId(menu, menuId);
            await menu.click();
            await sleep(150);
            const title: Component = await driver.findComponent(ON.id('placeholderTitle'));
            if (!title) {
              log('placeholder title not found');
              expect().assertFail();
              break;
            }
            log('verify placeholder title');
            await assertComponentId(title, 'placeholderTitle');
            const titleText: string = await title.getText();
            expect(titleText).assertEqual(MODULE_TITLES[i]);
          }
        } catch (err) {
          log(`testPlaceholderModules0005 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0600
     * @tc.name      testModulePrimaryButtons0006
     * @tc.desc      Verify the primary action button exists for modules 6-8.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testModulePrimaryButtons0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          for (let i = 6; i < 9; i++) {
            const menu: Component = await driver.findComponent(ON.id('placeholderMenu' + i));
            if (!menu) {
              log('menu not found: placeholderMenu' + i);
              expect().assertFail();
              break;
            }
            log('verify menu: placeholderMenu' + i);
            await assertComponentId(menu, 'placeholderMenu' + i);
            await menu.click();
            await sleep(150);
            const button: Component = await findWithScroll(driver, MODULE_BUTTONS[i]);
            if (!button) {
              log('button not found: ' + MODULE_BUTTONS[i]);
              expect().assertFail();
              break;
            }
            log('verify button: ' + MODULE_BUTTONS[i]);
            await assertComponentId(button, MODULE_BUTTONS[i]);
          }
        } catch (err) {
          log(`testModulePrimaryButtons0006 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0700
     * @tc.name      testPlaceholderModules0007
     * @tc.desc      Click placeholder/hydration modules 9-11 (scrolling the menu) and verify each title.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPlaceholderModules0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await switchToPlaceholderTab(driver)).assertTrue();
          if (!await driver.findComponent(ON.id('placeholderMenu9'))) {
            await driver.swipe(108, 1000, 108, 300, 300);
            await sleep(300);
          }
          if (!await driver.findComponent(ON.id('placeholderTitle'))) {
            await driver.swipe(540, 400, 540, 1100, 300);
            await sleep(200);
          }
          for (let i = 9; i < MODULE_TITLES.length; i++) {
            log('checking module ' + i.toString());
            const menu: Component = await driver.findComponent(ON.id('placeholderMenu' + i));
            await assertComponentId(menu, 'placeholderMenu' + i);
            if (!menu) {
              break;
            }
            await menu.click();
            await sleep(150);
            const title: Component = await driver.findComponent(ON.id('placeholderTitle'));
            await assertComponentId(title, 'placeholderTitle');
            const titleText: string = title ? await title.getText() : '';
            expect(titleText).assertEqual(MODULE_TITLES[i]);
          }
        } catch (err) {
          log(`testPlaceholderModules0007 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0800
     * @tc.name      testSyncRootEmptyPath0008
     * @tc.desc      Register with an empty path, verify the 801 failure dialog and that the page survives.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSyncRootEmptyPath0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureMain(driver)).assertTrue();
          const register: Component = await driver.waitForComponent(ON.id('registerSyncRootBtn'), 3000);
          await assertComponentId(register, 'registerSyncRootBtn');
          await register.click();
          await sleep(1000);
          const title: Component = await driver.waitForComponent(ON.text('执行失败'), 3000);
          expect(await title.getText()).assertContain('执行失败');
          const code: Component = await driver.findComponent(
            ON.text(String(NOT_SUPPORTED), MatchPattern.CONTAINS));
          expect(await code.getText()).assertContain(String(NOT_SUPPORTED));
          await dismissDialogs(driver);
          expect(await ensureMain(driver)).assertTrue();
        } catch (err) {
          log(`testSyncRootEmptyPath0008 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_0900
     * @tc.name      testPlaceholderEmptyPath0009
     * @tc.desc      Create a placeholder with empty inputs, verify the 801 failure dialog.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPlaceholderEmptyPath0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openModule(driver, 0)).assertTrue();
          const create: Component = await driver.waitForComponent(ON.id('createPlaceholderBtn'), 3000);
          await assertComponentId(create, 'createPlaceholderBtn');
          await create.click();
          await sleep(1000);
          const title: Component = await driver.waitForComponent(ON.text('创建失败'), 3000);
          expect(await title.getText()).assertContain('创建失败');
          const code: Component = await driver.findComponent(
            ON.text(String(NOT_SUPPORTED), MatchPattern.CONTAINS));
          expect(await code.getText()).assertContain(String(NOT_SUPPORTED));
          await dismissDialogs(driver);
        } catch (err) {
          log(`testPlaceholderEmptyPath0009 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1000
     * @tc.name      testOperationLogPage0010
     * @tc.desc      Open the operation-log page, verify its controls, then return to the main page.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testOperationLogPage0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openSubpage(driver, 'readOperationLogBtn', 'operationLogPage')).assertTrue();
          expect(await getTextById(driver, 'queryOperationLogBtn')).assertEqual('查询操作记录');
          expect(await getTextById(driver, 'batchQueryOperationLogBtn')).assertEqual('批量查询操作记录');
        } catch (err) {
          log(`testOperationLogPage0010 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1100
     * @tc.name      testSetSyncStatesPage0011
     * @tc.desc      Open the set-sync-state page, add a row, submit, and verify the page stays alive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSetSyncStatesPage0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openSubpage(driver, 'setSyncStatesBtn', 'setSyncStatesPage')).assertTrue();
          const add: Component = await driver.waitForComponent(ON.id('setAddRowBtn'), 3000);
          await assertComponentId(add, 'setAddRowBtn');
          await add.click();
          await sleep(500);
          const submit: Component = await driver.findComponent(ON.id('setSubmitBtn'));
          await assertComponentId(submit, 'setSubmitBtn');
          await submit.click();
          await sleep(800);
          const page: Component = await driver.findComponent(ON.id('setSyncStatesPage'));
          await assertComponentId(page, 'setSyncStatesPage');
        } catch (err) {
          log(`testSetSyncStatesPage0011 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1200
     * @tc.name      testGetSyncStatesPage0012
     * @tc.desc      Open the get-sync-state page, add a row, submit, and verify the page stays alive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGetSyncStatesPage0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openSubpage(driver, 'getSyncStatesBtn', 'getSyncStatesPage')).assertTrue();
          const add: Component = await driver.waitForComponent(ON.id('getAddRowBtn'), 3000);
          await assertComponentId(add, 'getAddRowBtn');
          await add.click();
          await sleep(500);
          const submit: Component = await driver.findComponent(ON.id('getSubmitBtn'));
          await assertComponentId(submit, 'getSubmitBtn');
          await submit.click();
          await sleep(800);
          const page: Component = await driver.findComponent(ON.id('getSyncStatesPage'));
          await assertComponentId(page, 'getSyncStatesPage');
        } catch (err) {
          log(`testGetSyncStatesPage0012 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1300
     * @tc.name      testUnsupportedSyncRootApis0013
     * @tc.desc      On this image all sync-root APIs must return 801 without crashing.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUnsupportedSyncRootApis0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(cloudDisk.registerSyncFolder(API_BASE, 'api_alias')).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.updateDisplayName(API_BASE, 'api_alias2')).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.activeSyncFolder(API_BASE)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.deactiveSyncFolder(API_BASE)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.registerSyncFolderChange(API_BASE)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.unRegisterSyncFolderChange(API_BASE)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.unRegisterSyncFolder(API_BASE)).assertEqual(NOT_SUPPORTED);
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          expect(folders.length).assertEqual(0);
        } catch (err) {
          log(`testUnsupportedSyncRootApis0013 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1400
     * @tc.name      testUnsupportedPlaceholderApis0014
     * @tc.desc      On this image all placeholder APIs must return 801 with neutral result payloads.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUnsupportedPlaceholderApis0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(cloudDisk.createPlaceholderFile(API_BASE, 'a.txt', 1, 2, 3, 'meta'))
            .assertEqual(NOT_SUPPORTED);
          const isPlaceholder: IsPlaceholderResult = cloudDisk.isPlaceholderFile(API_BASE, 'a.txt');
          expect(isPlaceholder.code).assertEqual(NOT_SUPPORTED);
          expect(isPlaceholder.isPlaceholder).assertFalse();
          const state: PlaceholderStateResult = cloudDisk.getPlaceholderState(API_BASE, 'a.txt');
          expect(state.code).assertEqual(NOT_SUPPORTED);
          expect(state.state).assertEqual(0);
          expect(cloudDisk.updatePlaceholder(API_BASE, 'a.txt', 1, 2, 3, 'meta2'))
            .assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.convertPlaceholderToFile(API_BASE, 'a.txt')).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.markFileAsPlaceholder(API_BASE, 'a.txt')).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.unmarkPlaceholderFile(API_BASE, 'a.txt')).assertEqual(NOT_SUPPORTED);
          const info: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(API_BASE, 'a.txt');
          expect(info.code).assertEqual(NOT_SUPPORTED);
          expect(info.dataLength).assertEqual(0);
          expect(cloudDisk.dehydrateFile(API_BASE, 'a.txt')).assertEqual(NOT_SUPPORTED);
        } catch (err) {
          log(`testUnsupportedPlaceholderApis0014 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1500
     * @tc.name      testUnsupportedCallbackApis0015
     * @tc.desc      Hydration/callback APIs must fail cleanly (801) and callback state stays neutral.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUnsupportedCallbackApis0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(cloudDisk.registerCallbackTable(API_BASE, '')).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.unregisterCallbackTable(API_BASE)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.hydratePlaceholder(API_BASE, 'a.txt', 0)).assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.execute(0, 0, API_BASE, 'a.txt', 'hello', 0, 5, true, 5))
            .assertEqual(NOT_SUPPORTED);
          expect(cloudDisk.getCallbackReqKey()).assertEqual(0);
          expect(cloudDisk.getCallbackReqKeyVersion() >= 0).assertTrue();
        } catch (err) {
          log(`testUnsupportedCallbackApis0015 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1600
     * @tc.name      testEmptyPathReturnsError0016
     * @tc.desc      Empty paths are rejected by the wrapper or the service with a non-zero code, no crash.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testEmptyPathReturnsError0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(cloudDisk.registerSyncFolder('', 'alias') !== 0).assertTrue();
          expect(cloudDisk.updateDisplayName('', 'alias') !== 0).assertTrue();
          expect(cloudDisk.activeSyncFolder('') !== 0).assertTrue();
          expect(cloudDisk.deactiveSyncFolder('') !== 0).assertTrue();
          expect(cloudDisk.registerSyncFolderChange('') !== 0).assertTrue();
          expect(cloudDisk.unRegisterSyncFolderChange('') !== 0).assertTrue();
          expect(cloudDisk.createPlaceholderFile('', 'a.txt', 1, 2, 3, '') !== 0).assertTrue();
          expect(cloudDisk.isPlaceholderFile('', 'a.txt').code !== 0).assertTrue();
          expect(cloudDisk.getPlaceholderState('', 'a.txt').code !== 0).assertTrue();
          expect(cloudDisk.getPlaceholderCustomInfo('', 'a.txt').code !== 0).assertTrue();
          expect(cloudDisk.dehydrateFile('', 'a.txt') !== 0).assertTrue();
          const states: FileSyncState[] = [];
          expect(cloudDisk.setFileSyncStates('', 0, states) !== 0).assertTrue();
        } catch (err) {
          log(`testEmptyPathReturnsError0016 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1700
     * @tc.name      testBatchStateQueries0017
     * @tc.desc      Batch change/state queries return no change data and leave no sync root behind.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBatchStateQueries0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const changes: ChangesResult = cloudDisk.getSyncFolderChanges(API_BASE, 0, 10);
          const states: ResultList[] = cloudDisk.getFileSyncStates(API_BASE, 1, ['a.txt']);
          const folders: SyncFolder[] = cloudDisk.getAllSyncFolder();
          log('changes=' + String(changes) + '; states=' + String(states) + '; folders=' + String(folders));
          const noChanges: boolean =
            changes === null || changes === undefined || changes.changesData.length === 0;
          expect(noChanges).assertTrue();
          const noStates: boolean = states === null || states === undefined || states.length === 0;
          expect(noStates).assertTrue();
          expect(folders.length).assertEqual(0);
        } catch (err) {
          log(`testBatchStateQueries0017 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1800
     * @tc.name      testClearAllSyncRoots0018
     * @tc.desc      Click "clear all sync roots" and verify the empty table is shown afterwards.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClearAllSyncRoots0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureMain(driver)).assertTrue();
          const clear: Component = await driver.waitForComponent(ON.id('clearAllSyncRootsBtn'), 3000);
          await assertComponentId(clear, 'clearAllSyncRootsBtn');
          await clear.click();
          await sleep(800);
          expect(await getTextById(driver, 'noSyncRootText')).assertEqual('未注册同步根');
          expect(await ensureMain(driver)).assertTrue();
        } catch (err) {
          log(`testClearAllSyncRoots0018 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_1900
     * @tc.name      testAliasInput0019
     * @tc.desc      Type an alias into the input and verify the text is kept.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testAliasInput0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureMain(driver)).assertTrue();
          const input: Component = await driver.waitForComponent(ON.id('aliasInput'), 3000);
          await assertComponentId(input, 'aliasInput');
          await input.click();
          await sleep(500);
          await input.clearText();
          await input.inputText('alias_test');
          await sleep(500);
          expect(await getTextById(driver, 'aliasInput')).assertEqual('alias_test');
        } catch (err) {
          log(`testAliasInput0019 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_CLOUD_DISK_UI_2000
     * @tc.name      testRepeatedTabSwitch0020
     * @tc.desc      Switch tabs repeatedly and verify the page remains responsive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testRepeatedTabSwitch0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await ensureMain(driver)).assertTrue();
          for (let i = 0; i < 3; i++) {
            expect(await switchToPlaceholderTab(driver)).assertTrue();
            const backTab: Component = await driver.waitForComponent(ON.id('tabSyncRoot'), 3000);
            await assertComponentId(backTab, 'tabSyncRoot');
            await backTab.click();
            await sleep(600);
          }
          const register: Component = await driver.findComponent(ON.id('registerSyncRootBtn'));
          await assertComponentId(register, 'registerSyncRootBtn');
        } catch (err) {
          log(`testRepeatedTabSwitch0020 failed: ${String(err)}`);
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
