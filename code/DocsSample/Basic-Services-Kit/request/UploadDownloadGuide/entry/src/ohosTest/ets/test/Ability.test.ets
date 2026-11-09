/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { Want } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, MatchPattern } from '@kit.TestKit';
import { logger } from '../util/Logger';

const TAG = '[UploadAndDownloadGuide]';
const BUNDLE_NAME = 'com.samples.uploaddownloadguide';
const ABILITY_NAME = 'EntryAbility';

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

function getResourceString(resource: Resource) {
  let res: resourceManager.Resource = {
    bundleName: resource.bundleName,
    moduleName: resource.moduleName,
    id: resource.id
  };
  let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  return delegator.getAppContext().resourceManager.getStringSync(res);
}

async function findId(driver: Driver, id: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.id(id));
  } catch (err) {
    return null;
  }
}

async function findText(driver: Driver, text: string): Promise<Component | null> {
  try {
    return await driver.findComponent(ON.text(text));
  } catch (err) {
    return null;
  }
}

async function waitForId(driver: Driver, id: string, timeout: number): Promise<Component | null> {
  let deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    let component = await findId(driver, id);
    if (component !== null) {
      return component;
    }
    await sleep(200);
  }
  return null;
}

async function clickAllow(driver: Driver): Promise<void> {
  let allow = await findText(driver, getResourceString($r('app.string.allow')));
  if (allow === null) {
    allow = await findText(driver, getResourceString($r('app.string.allow_up')));
  }
  if (allow !== null) {
    await allow.click();
    await sleep(500);
  }
}

export default function abilityTest() {
  let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let driver: Driver = Driver.create();
  let want: Want = {
    bundleName: BUNDLE_NAME,
    abilityName: ABILITY_NAME
  };

  describe('AbilityTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0100
     * @tc.name      testUploadDownloadAbility0001
     * @tc.desc      Start the application and verify the home page.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        delegator.startAbility(want, (err: Error) => {
          logger.info(TAG, `startAbility callback: ${JSON.stringify(err)}`);
        });
        await sleep(1500);
        await clickAllow(driver);
        expect(await waitForId(driver, 'btn_upload', 5000) !== null).assertTrue();
        expect(await findId(driver, 'btn_download') !== null).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0200
     * @tc.name      testUploadDownloadAbility0002
     * @tc.desc      Verify the notification permission flow and top ability.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await clickAllow(driver);
        await delegator.getCurrentTopAbility().then((ability: UIAbility) => {
          expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
        });
        expect(await waitForId(driver, 'btn_upload', 3000) !== null).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0300
     * @tc.name      testUploadDownloadAbility0003
     * @tc.desc      Verify the upload page entry and publish button.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let btnUpload = await waitForId(driver, 'btn_upload', 3000);
        expect(btnUpload !== null).assertTrue();
        if (btnUpload !== null) {
          await btnUpload.click();
          await sleep(500);
        }
        expect(await waitForId(driver, 'publish1', 3000) !== null).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0400
     * @tc.name      testUploadDownloadAbility0004
     * @tc.desc      Verify the download page and download file list.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await driver.pressBack();
        await sleep(500);
        let btnDownload = await waitForId(driver, 'btn_download', 3000);
        expect(btnDownload !== null).assertTrue();
        if (btnDownload !== null) {
          await btnDownload.click();
          await sleep(500);
        }
        let viewDownload = await waitForId(driver, 'view_download_files', 3000);
        expect(viewDownload !== null).assertTrue();
        if (viewDownload !== null) {
          await viewDownload.click();
          await sleep(500);
        }
        let listItems = await driver.findComponents(ON.type('List'));
        expect(listItems !== null && listItems.length > 0).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0500
     * @tc.name      testUploadDownloadAbility0005
     * @tc.desc      Verify opening a folder in the download file page.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let listItems = await driver.findComponents(ON.type('List'));
        expect(listItems !== null && listItems.length > 0).assertTrue();
        if (listItems !== null && listItems.length > 0) {
          await listItems[0].click();
          await sleep(500);
        }
        let clearFolder = await driver.waitForComponent(
          ON.text(getResourceString($r('app.string.clear_folder')), MatchPattern.CONTAINS), 3000);
        expect(clearFolder !== null).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_ABILITY_0600
     * @tc.name      testUploadDownloadAbility0006
     * @tc.desc      Verify the download page button state after returning.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadAbility0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await driver.pressBack();
        await sleep(500);
        expect(await waitForId(driver, 'download_to', 3000) !== null).assertTrue();
        expect(await findId(driver, 'view_download_files') !== null).assertTrue();
      } catch (err) {
        expect().assertFail();
      } finally {
        done();
      }
    });
  });
}
