/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';

const TAG = '[SampleTest]';
const DOMAIN = 0xF811;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver = Driver.create();
let manager: resourceManager.ResourceManager | undefined = undefined;

function resText(name: string): string {
  if (manager === undefined) {
    manager = abilityDelegator.getAppContext().resourceManager;
  }
  return manager.getStringByNameSync(name);
}

async function waitForComponent(text: string, timeoutMs: number): Promise<boolean> {
  const deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    try {
      let component = await driver.findComponent(ON.text(text));
      if (component !== null && component !== undefined) {
        return true;
      }
    } catch (e) {
      hilog.info(DOMAIN, TAG, ' findComponent exception');
    }
    await driver.delayMs(500);
  }
  return false;
}

async function findAndClick(text: string, timeoutMs: number): Promise<boolean> {
  const found = await waitForComponent(text, timeoutMs);
  if (!found) {
    hilog.info(DOMAIN, TAG, ' component not found: ' + text);
    return false;
  }
  try {
    let component = await driver.findComponent(ON.text(text));
    if (component !== null && component !== undefined) {
      await component.click();
    }
  } catch (e) {
    hilog.info(DOMAIN, TAG, ' click exception: ' + text);
  }
  return true;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      await abilityDelegator.startAbility({
        bundleName: 'com.sample.USBManagerCApiSample',
        abilityName: 'EntryAbility'
      });
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' StartAbility_001, begin');
      let found = await waitForComponent(resText('page_title'), 10000);
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, ' StartAbility_001, end');
    })
    it('GetDeviceList_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' GetDeviceList_001, begin');
      let found = await findAndClick(resText('btn_get_device_list'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, ' GetDeviceList_001, end');
    })
    it('HasPermission_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' HasPermission_001, begin');
      let found = await findAndClick(resText('btn_has_permission'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, ' HasPermission_001, end');
    })
    it('RequestPermission_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' RequestPermission_001, begin');
      let found = await findAndClick(resText('btn_request_permission'), 5000);
      expect(found).assertTrue();
      let dialogHandled = false;
      const deadline = Date.now() + 8000;
      while (Date.now() < deadline && !dialogHandled) {
        try {
          let btnAllow = await driver.findComponent(ON.text(resText('allow_dialog_button')))
          if (btnAllow !== null && btnAllow !== undefined) {
            await btnAllow.click();
            await driver.delayMs(3000);
            dialogHandled = true;
          }
        } catch (e) {
          hilog.info(DOMAIN, TAG, ' find allow button exception');
        }
        if (!dialogHandled) {
          await driver.delayMs(500);
        }
      }
      hilog.info(DOMAIN, TAG, ' RequestPermission_001, dialogHandled=' + dialogHandled);
      hilog.info(DOMAIN, TAG, ' RequestPermission_001, end');
    })
    it('ConnectDevice_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' ConnectDevice_001, begin');
      let found = await findAndClick(resText('btn_connect_device'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, ' ConnectDevice_001, end');
    })
    it('GetFileDescriptor_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' GetFileDescriptor_001, begin');
      let found = await findAndClick(resText('btn_get_fd'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, ' GetFileDescriptor_001, end');
    })
    it('ClosePipe_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' ClosePipe_001, begin');
      let found = await findAndClick(resText('btn_close_pipe'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, ' ClosePipe_001, end');
    })
    it('FreeDeviceList_001', 0, async () => {
      hilog.info(DOMAIN, TAG, ' FreeDeviceList_001, begin');
      let found = await findAndClick(resText('btn_free_device_list'), 5000);
      expect(found).assertTrue();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, ' FreeDeviceList_001, end');
    })
  })
}
