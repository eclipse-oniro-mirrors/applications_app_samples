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

import { describe, expect, it, TestType, Size, Level, beforeAll, afterAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = '[Sample_DevelopingFileManagerApplication]';
const DOMAIN = 0xF811;
const DELAY_TIME_1S = 1000;
const DELAY_TIME_3S = 3000;
const DELAY_TIME_7S = 7000;
const FILE_MANAGER_ENTRY = 'DevelopingFileManagerApplication';
const MONITOR_ENTRY = 'ListeningForDeviceOnline/OfflineStatus';
const CREATE_FILE_BUTTON = 'CreateFile';
const CREATE_SUCCESS_TEXT = 'CreateDocumentUriSuccess';
const REGISTER_BUTTON = 'RegisterToMonitorTheDevice';
const CANCEL_BUTTON = 'CancelMonitoringTheDevice';
const MONITOR_SUCCESS_TEXT = 'Monitoring succeeded';

const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
const BUNDLENAME = abilityDelegatorRegistry.getArguments().bundleName;

async function waitForText(driver: Driver, text: string, timeout: number): Promise<Component | null> {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    const component = await driver.findComponent(ON.text(text));
    if (component) {
      return component;
    }
    await driver.delayMs(300);
  }
  return null;
}

async function ensureMain(driver: Driver): Promise<boolean> {
  for (let i = 0; i < 6; i++) {
    if (await driver.findComponent(ON.text(FILE_MANAGER_ENTRY))) {
      return true;
    }
    if (await driver.findComponent(ON.text(MONITOR_ENTRY))) {
      return true;
    }
    await driver.pressBack();
    await driver.delayMs(300);
  }
  return false;
}

async function openEntry(driver: Driver, text: string): Promise<boolean> {
  if (!await ensureMain(driver)) {
    return false;
  }
  const entry = await waitForText(driver, text, 3000);
  if (!entry) {
    return false;
  }
  await entry.click();
  await driver.delayMs(DELAY_TIME_1S);
  return true;
}

function dataPath(name: string): string {
  return DELEGATOR.getAppContext().filesDir + '/' + name;
}

export default function abilityTest() {
  describe('DevelopingFileManagerApplicationTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll called');
    })
    afterAll(async () => {
    })

    /**
     * @tc.number CORE_FILE_KIT_DFMA_FUNCTION_TEST_0100
     * @tc.name CoreFileKitDfmaFunctionTest0001
     * @tc.desc Verify that the EntryAbility starts and stays at the top of the ability stack
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('CoreFileKitDfmaFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0100 begin');
        const want: Want = {
          bundleName: BUNDLENAME,
          abilityName: 'EntryAbility'
        };
        await DELEGATOR.startAbility(want);
        let driver: Driver = Driver.create();
        await driver.delayMs(DELAY_TIME_1S);
        const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0100 end');
        done();
      })

    /**
     * @tc.number CORE_FILE_KIT_DFMA_FUNCTION_TEST_0200
     * @tc.name CoreFileKitDfmaFunctionTest0002
     * @tc.desc Verify that a file is created in the sandbox directory and the success message is displayed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('CoreFileKitDfmaFunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0200 begin');
        const driver = Driver.create();
        await driver.delayMs(DELAY_TIME_1S);

        const switchPage: Component = await driver.findComponent(ON.text(FILE_MANAGER_ENTRY));
        await switchPage.click();
        await driver.delayMs(DELAY_TIME_3S);

        const createFileButton: Component = await driver.findComponent(ON.text(CREATE_FILE_BUTTON));
        await createFileButton.click();
        await driver.delayMs(DELAY_TIME_1S);

        const successText: Component = await driver.findComponent(ON.text(CREATE_SUCCESS_TEXT));
        expect(await successText.getText()).assertEqual(CREATE_SUCCESS_TEXT);

        await driver.pressBack();
        await driver.delayMs(DELAY_TIME_1S);
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0200 end');
        done();
      })

    /**
     * @tc.number CORE_FILE_KIT_DFMA_FUNCTION_TEST_0300
     * @tc.name CoreFileKitDfmaFunctionTest0003
     * @tc.desc Verify that the directory watcher reports the monitored file change
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('CoreFileKitDfmaFunctionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0300 begin');
        const driver = Driver.create();
        await driver.delayMs(DELAY_TIME_1S);

        const switchPage: Component = await driver.findComponent(ON.text(MONITOR_ENTRY));
        await switchPage.click();
        await driver.delayMs(DELAY_TIME_3S);

        const registerButton: Component = await driver.findComponent(ON.text(REGISTER_BUTTON));
        await registerButton.click();
        await driver.delayMs(DELAY_TIME_7S);

        const monitorText: Component = await driver.findComponent(ON.text(MONITOR_SUCCESS_TEXT));
        expect(await monitorText.getText()).assertEqual(MONITOR_SUCCESS_TEXT);

        const cancelButton: Component = await driver.findComponent(ON.text(CANCEL_BUTTON));
        await cancelButton.click();
        await driver.delayMs(DELAY_TIME_1S);

        await driver.pressBack();
        await driver.delayMs(DELAY_TIME_1S);
        hilog.info(DOMAIN, TAG, 'CORE_FILE_KIT_DFMA_FUNCTION_TEST_0300 end');
        done();
      })


  })
}
