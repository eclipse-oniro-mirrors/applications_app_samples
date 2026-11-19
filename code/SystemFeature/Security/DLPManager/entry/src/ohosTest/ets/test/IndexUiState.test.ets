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
      const assertOk1: boolean = await ensureIndexPage(driver);
      log('afterEach check1: await ensureIndexPage(driver) = ' + String(assertOk1));
      expect(assertOk1).assertTrue();
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
      const assertOk2: boolean = await prepare(driver);
      log('testIndexUiState0501 check2: await prepare(driver) = ' + String(assertOk2));
      expect(assertOk2).assertTrue();
      const assertOk3: boolean = await exists(driver, 'noteBook');
      log('testIndexUiState0501 check3: await exists(driver, \'noteBook\') = ' + String(assertOk3));
      expect(assertOk3).assertTrue();
      const assertOk4: boolean = await exists(driver, 'latestFile');
      log('testIndexUiState0501 check4: await exists(driver, \'latestFile\') = ' + String(assertOk4));
      expect(assertOk4).assertTrue();
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
      const assertOk5: boolean = await prepare(driver);
      log('testIndexUiState0502 check5: await prepare(driver) = ' + String(assertOk5));
      expect(assertOk5).assertTrue();
      const assertOk6: boolean = await exists(driver, 'moreIcon');
      log('testIndexUiState0502 check6: await exists(driver, \'moreIcon\') = ' + String(assertOk6));
      expect(assertOk6).assertTrue();
      const assertOk7: boolean = await exists(driver, 'add');
      log('testIndexUiState0502 check7: await exists(driver, \'add\') = ' + String(assertOk7));
      expect(assertOk7).assertTrue();
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
      const assertOk8: boolean = await prepare(driver);
      log('testIndexUiState0503 check8: await prepare(driver) = ' + String(assertOk8));
      expect(assertOk8).assertTrue();
      const assertOk9: boolean = await exists(driver, 'indexList');
      log('testIndexUiState0503 check9: await exists(driver, \'indexList\') = ' + String(assertOk9));
      expect(assertOk9).assertTrue();
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
      const assertOk10: boolean = await prepare(driver);
      log('testIndexUiState0504 check10: await prepare(driver) = ' + String(assertOk10));
      expect(assertOk10).assertTrue();
      const assertOk11: boolean = await clickId(driver, 'moreIcon');
      log('testIndexUiState0504 check11: await clickId(driver, \'moreIcon\') = ' + String(assertOk11));
      expect(assertOk11).assertTrue();
      await sleep(350);
      const assertOk12: boolean = await exists(driver, 'obtain_visit_record');
      log('testIndexUiState0504 check12: await exists(driver, \'obtain_visit_record\') = ' + String(assertOk12));
      expect(assertOk12).assertTrue();
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
      const assertOk13: boolean = await prepare(driver);
      log('testIndexUiState0505 check13: await prepare(driver) = ' + String(assertOk13));
      expect(assertOk13).assertTrue();
      const assertOk14: boolean = await clickId(driver, 'moreIcon');
      log('testIndexUiState0505 check14: await clickId(driver, \'moreIcon\') = ' + String(assertOk14));
      expect(assertOk14).assertTrue();
      await sleep(350);
      const assertOk15: boolean = await exists(driver, 'obtain_sandbox_retention_information');
      log('testIndexUiState0505 check15: await exists(driver, \'obtain_sandbox_retention_information\') = ' +
        String(assertOk15));
      expect(assertOk15).assertTrue();
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
      const assertOk16: boolean = await prepare(driver);
      log('testIndexUiState0506 check16: await prepare(driver) = ' + String(assertOk16));
      expect(assertOk16).assertTrue();
      const assertOk17: boolean = await clickId(driver, 'moreIcon');
      log('testIndexUiState0506 check17: await clickId(driver, \'moreIcon\') = ' + String(assertOk17));
      expect(assertOk17).assertTrue();
      await sleep(350);
      const assertOk18: boolean = await clickId(driver, 'obtain_visit_record');
      log('testIndexUiState0506 check18: await clickId(driver, \'obtain_visit_record\') = ' + String(assertOk18));
      expect(assertOk18).assertTrue();
      await sleep(350);
      const assertOk19: boolean = await exists(driver, 'obtain_visit_record');
      log('testIndexUiState0506 check19: await exists(driver, \'obtain_visit_record\') = ' + String(assertOk19));
      expect(assertOk19).assertFalse();
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
      const assertOk20: boolean = await prepare(driver);
      log('testIndexUiState0507 check20: await prepare(driver) = ' + String(assertOk20));
      expect(assertOk20).assertTrue();
      const assertOk21: boolean = await clickId(driver, 'moreIcon');
      log('testIndexUiState0507 check21: await clickId(driver, \'moreIcon\') = ' + String(assertOk21));
      expect(assertOk21).assertTrue();
      await sleep(350);
      const assertOk22: boolean = await clickId(driver, 'obtain_sandbox_retention_information');
      log('testIndexUiState0507 check22: await clickId(driver, \'obtain_sandbox_retention_information\') = ' +
        String(assertOk22));
      expect(assertOk22).assertTrue();
      await sleep(350);
      const assertOk23: boolean = await exists(driver, 'obtain_sandbox_retention_information');
      log('testIndexUiState0507 check23: await exists(driver, \'obtain_sandbox_retention_information\') = ' +
        String(assertOk23));
      expect(assertOk23).assertFalse();
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
      const assertOk24: boolean = await prepare(driver);
      log('testIndexUiState0511 check24: await prepare(driver) = ' + String(assertOk24));
      expect(assertOk24).assertTrue();
      await startApp();
      await sleep(350);
      const assertOk25: boolean = await exists(driver, 'noteBook');
      log('testIndexUiState0511 check25: await exists(driver, \'noteBook\') = ' + String(assertOk25));
      expect(assertOk25).assertTrue();
      const assertOk26: boolean = await exists(driver, 'moreIcon');
      log('testIndexUiState0511 check26: await exists(driver, \'moreIcon\') = ' + String(assertOk26));
      expect(assertOk26).assertTrue();
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
      const assertOk27: boolean = await prepare(driver);
      log('testIndexUiState0513 check27: await prepare(driver) = ' + String(assertOk27));
      expect(assertOk27).assertTrue();
      const assertOk28: boolean = await clickId(driver, 'add');
      log('testIndexUiState0513 check28: await clickId(driver, \'add\') = ' + String(assertOk28));
      expect(assertOk28).assertTrue();
      await sleep(800);
      await driver.pressBack();
      await sleep(350);
      const assertOk29: boolean = await ensureIndexPage(driver);
      log('testIndexUiState0513 check29: await ensureIndexPage(driver) = ' + String(assertOk29));
      expect(assertOk29).assertTrue();
    })
  })
}
