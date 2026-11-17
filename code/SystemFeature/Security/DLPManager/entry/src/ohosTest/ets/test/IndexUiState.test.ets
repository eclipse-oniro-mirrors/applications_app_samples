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
import { beforeAll, afterEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';
import fs from '@ohos.file.fs';
import { allowPermissionDialogs } from './UiCommon';

const BUNDLE: string = 'com.sample.dlpmanager';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'IndexUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

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

async function findUi(driver: Driver, matcher: On, timeout: number): Promise<Component | null> {
  try {
    const component: Component = await driver.waitForComponent(matcher, timeout);
    return component !== undefined && component !== null ? component : null;
  } catch (error) {
    return null;
  }
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  return component !== null;
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findUi(driver, ON.id(id), 500);
  if (component === null) {
    return false;
  }
  try {
    await component.click();
    await sleep(250);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function startApp(): Promise<void> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(900);
}

async function createIndexFile(name: string, content: string): Promise<boolean> {
  const pathDir: string | undefined = AppStorage.get<string>('pathDir');
  let ok: boolean = false;
  if (pathDir !== undefined && pathDir !== '') {
    try {
      const file = fs.openSync(pathDir + '/' + name,
        fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, content);
      fs.closeSync(file);
      ok = true;
    } catch (error) {
      log('createIndexFile failed: ' + name + ' -> ' + String(error));
    }
  } else {
    log('createIndexFile skipped: pathDir is empty');
  }
  return ok;
}

async function closeMenuIfOpen(driver: Driver): Promise<void> {
  if (await exists(driver, 'index_menu_12')) {
    await driver.pressBack();
    await sleep(200);
  }
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  await allowPermissionDialogs(driver);
  for (let i = 0; i < 3; i++) {
    if (await exists(driver, 'noteBook')) {
      await closeMenuIfOpen(driver);
      return true;
    }
    if (await exists(driver, 'filePageBack')) {
      await clickId(driver, 'filePageBack');
      await sleep(250);
      continue;
    }
    await driver.pressBack();
    await sleep(250);
  }
  if (await exists(driver, 'noteBook')) {
    await closeMenuIfOpen(driver);
    return true;
  }
  await startApp();
  await closeMenuIfOpen(driver);
  return await exists(driver, 'noteBook');
}

async function triggerRelist(driver: Driver): Promise<boolean> {
  if (await exists(driver, 'file0')) {
    await clickId(driver, 'file0');
    await sleep(350);
    await clickId(driver, 'filePageBack');
    await sleep(350);
    return await exists(driver, 'noteBook');
  }
  if (!await clickId(driver, 'add')) {
    return false;
  }
  await sleep(900);
  await allowPermissionDialogs(driver);
  await driver.pressBack();
  await sleep(400);
  return await exists(driver, 'noteBook');
}

async function prepare(driver: Driver): Promise<boolean> {
  await startApp();
  return await ensureIndexPage(driver);
}

export default function indexUiStateTest(): void {
  describe('IndexUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await startApp();
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = await Driver.create();
      expect(await ensureIndexPage(driver)).assertTrue();
    });

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0501
     * @tc.name      testIndexUiState0501
     * @tc.desc      Verify the index page renders its title and subtitle.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0501 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'noteBook')).assertTrue();
      expect(await exists(driver, 'latestFile')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0502
     * @tc.name      testIndexUiState0502
     * @tc.desc      Verify the index page exposes the more icon and add button.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0502 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'moreIcon')).assertTrue();
      expect(await exists(driver, 'add')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0503
     * @tc.name      testIndexUiState0503
     * @tc.desc      Verify the index page renders the file list container.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0503 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await exists(driver, 'indexList')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0504
     * @tc.name      testIndexUiState0504
     * @tc.desc      Verify opening the home menu shows the visit record entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0504 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'moreIcon')).assertTrue();
      await sleep(350);
      expect(await exists(driver, 'obtain_visit_record')).assertTrue();
      await driver.pressBack();
      await sleep(250);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0505
     * @tc.name      testIndexUiState0505
     * @tc.desc      Verify opening the home menu shows the sandbox entry.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0505 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'moreIcon')).assertTrue();
      await sleep(350);
      expect(await exists(driver, 'obtain_sandbox_retention_information')).assertTrue();
      await driver.pressBack();
      await sleep(250);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0506
     * @tc.name      testIndexUiState0506
     * @tc.desc      Verify selecting the visit record entry closes the menu.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0506 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'moreIcon')).assertTrue();
      await sleep(350);
      expect(await clickId(driver, 'obtain_visit_record')).assertTrue();
      await sleep(350);
      expect(await exists(driver, 'obtain_visit_record')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0507
     * @tc.name      testIndexUiState0507
     * @tc.desc      Verify selecting the sandbox entry closes the menu.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0507 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'moreIcon')).assertTrue();
      await sleep(350);
      expect(await clickId(driver, 'obtain_sandbox_retention_information')).assertTrue();
      await sleep(350);
      expect(await exists(driver, 'obtain_sandbox_retention_information')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0511
     * @tc.name      testIndexUiState0511
     * @tc.desc      Verify a repeated start of the entry ability keeps the page stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0511 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      await startApp();
      await sleep(350);
      expect(await exists(driver, 'noteBook')).assertTrue();
      expect(await exists(driver, 'moreIcon')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_INDEXUI_0513
     * @tc.name      testIndexUiState0513
     * @tc.desc      Verify the add button is clickable and the page stays reachable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testIndexUiState0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testIndexUiState0513 begin');
      const driver: Driver = await Driver.create();
      expect(await prepare(driver)).assertTrue();
      expect(await clickId(driver, 'add')).assertTrue();
      await sleep(800);
      await driver.pressBack();
      await sleep(350);
      expect(await ensureIndexPage(driver)).assertTrue();
    })
  })
}
