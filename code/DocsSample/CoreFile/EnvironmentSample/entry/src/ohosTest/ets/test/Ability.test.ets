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

import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { logCase, logAssertion } from './EnvironmentTestSupport';

const DELAY_TIME: number = 1500;

async function getResourceString(resource: Resource): Promise<string> {
  const text: string = await abilityDelegatorRegistry.getAbilityDelegator()
    .getAppContext().resourceManager.getStringValue(resource.id);
  return text;
}

export default function abilityTest(): void {
  describe('ActsAbilityTest', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_UI_001
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_UI_001
     * @tc.desc Start EntryAbility and handle the optional permission dialog.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_UI_001', 0, async (): Promise<void> => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_UI_001';
      logCase(name, 'begin');
      try {
        const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
        const want: Want = {
          bundleName: bundleName,
          abilityName: 'EntryAbility'
        };
        await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
        const driver: Driver = Driver.create();
        await driver.delayMs(DELAY_TIME);
        // SDK 26.0.0 documents undefined for an unmatched findComponent, not null.
        const allowButton: Component | undefined = await driver.findComponent(ON.text('允许'));
        const actualAllowPresent: boolean = allowButton !== undefined;
        logCase(name, actualAllowPresent ? 'permission dialog present' : 'permission dialog absent');
        if (allowButton !== undefined) {
          await allowButton.click();
          await driver.delayMs(DELAY_TIME);
        }
        const ability: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const actualAbilityName: string = ability.context.abilityInfo.name;
        logAssertion(name, 'top ability name', actualAbilityName, 'EntryAbility');
        expect(actualAbilityName).assertEqual('EntryAbility');
        const buttonText: string = await getResourceString($r('app.string.getUserDirExample'));
        logAssertion(name, 'initial button selector (EQUALS)', buttonText, buttonText);
        await driver.assertComponentExist(ON.text(buttonText));
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_UI_002
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_UI_002
     * @tc.desc Click the user directory button and verify a newly appended success status.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_UI_002', 0, async (): Promise<void> => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_UI_002';
      logCase(name, 'begin');
      try {
        const buttonText: string = await getResourceString($r('app.string.getUserDirExample'));
        const driver: Driver = Driver.create();
        logAssertion(name, 'directory button selector (EQUALS)', buttonText, buttonText);
        await driver.assertComponentExist(ON.text(buttonText));
        const button: Component = await driver.findComponent(ON.text(buttonText));
        const result: Component = await driver.findComponent(ON.id('operationResult'));
        const previousText: string = await result.getText();
        await button.click();
        await driver.delayMs(DELAY_TIME);
        const resultText: string = await getResourceString($r('app.string.public_dirs_success'));
        const visibleText: string = await result.getText();
        const actualResultVisible: boolean = visibleText === `${previousText}${resultText}\n`;
        logAssertion(name, 'fresh directory success status', actualResultVisible, true);
        expect(actualResultVisible).assertEqual(true);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_UI_003
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_UI_003
     * @tc.desc Click the download import button and verify a newly appended success status.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_UI_003', 0, async (): Promise<void> => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_UI_003';
      logCase(name, 'begin');
      try {
        const buttonText: string = await getResourceString($r('app.string.readUserDownloadDirExample'));
        const driver: Driver = Driver.create();
        logAssertion(name, 'import button selector (EQUALS)', buttonText, buttonText);
        await driver.assertComponentExist(ON.text(buttonText));
        const button: Component = await driver.findComponent(ON.text(buttonText));
        const result: Component = await driver.findComponent(ON.id('operationResult'));
        const previousText: string = await result.getText();
        await button.click();
        await driver.delayMs(DELAY_TIME);
        const resultText: string = await getResourceString($r('app.string.download_import_success'));
        const visibleText: string = await result.getText();
        const actualResultVisible: boolean = visibleText === `${previousText}${resultText}\n`;
        logAssertion(name, 'fresh import success status', actualResultVisible, true);
        expect(actualResultVisible).assertEqual(true);
      } finally {
        logCase(name, 'end');
      }
    });

    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_UI_004
     * @tc.name SUB_CORE_FILE_ENVIRONMENT_UI_004
     * @tc.desc Click the download write button and verify a newly appended success status.
     */
    it('SUB_CORE_FILE_ENVIRONMENT_UI_004', 0, async (): Promise<void> => {
      const name: string = 'SUB_CORE_FILE_ENVIRONMENT_UI_004';
      logCase(name, 'begin');
      try {
        const buttonText: string = await getResourceString($r('app.string.writeUserDownloadDirExample'));
        const driver: Driver = Driver.create();
        logAssertion(name, 'write button selector (EQUALS)', buttonText, buttonText);
        await driver.assertComponentExist(ON.text(buttonText));
        const button: Component = await driver.findComponent(ON.text(buttonText));
        const result: Component = await driver.findComponent(ON.id('operationResult'));
        const previousText: string = await result.getText();
        await button.click();
        await driver.delayMs(DELAY_TIME);
        const resultText: string = await getResourceString($r('app.string.download_write_success'));
        const visibleText: string = await result.getText();
        const actualResultVisible: boolean = visibleText === `${previousText}${resultText}\n`;
        logAssertion(name, 'fresh write success status', actualResultVisible, true);
        expect(actualResultVisible).assertEqual(true);
      } finally {
        logCase(name, 'end');
      }
    });
  });
}
