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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import type { resourceManager } from '@kit.LocalizationKit';

const WAIT_TIMEOUT_MS: number = 5000;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver: Driver = Driver.create();

// 点击场景按钮，确认准备完成后出现相应的拖起提示；不模拟跨应用文件复制。
async function checkScenario(buttonName: string, sourceName: string): Promise<void> {
  const resources: resourceManager.ResourceManager = delegator.getAppContext().resourceManager;
  const buttonText: string = resources.getStringByNameSync(buttonName);
  const sourceText: string = resources.getStringByNameSync(sourceName);
  const button: Component = await driver.waitForComponent(ON.text(buttonText), WAIT_TIMEOUT_MS);
  await button.click();
  const source: Component = await driver.waitForComponent(ON.text(sourceText), WAIT_TIMEOUT_MS);
  const actual: string = await source.getText();
  console.info(`Scenario ${buttonName}: actual=${actual}, expected=${sourceText}`);
  expect(actual).assertEqual(sourceText);
}

// 注册三个导出场景的界面验证用例。
export default function abilityTest(): void {
  describe('VirtualFileDragSample', () => {
    beforeAll(async (): Promise<void> => {
      await delegator.startAbility({
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'EntryAbility',
        moduleName: 'entry'
      });
      const label: string = delegator.getAppContext().resourceManager.getStringByNameSync('source_document');
      await driver.waitForComponent(ON.text(label), WAIT_TIMEOUT_MS);
    });

    // 选择单文档后显示可拖起提示。
    it('VirtualFileDragC_Document_001', 0, async (): Promise<void> => {
      console.info('VirtualFileDragC_Document_001 begin');
      try {
        await checkScenario('document', 'source_document');
      } finally {
        console.info('VirtualFileDragC_Document_001 end');
      }
    });

    // 选择嵌套目录后显示可拖起提示。
    it('VirtualFileDragC_Directory_002', 0, async (): Promise<void> => {
      console.info('VirtualFileDragC_Directory_002 begin');
      try {
        await checkScenario('directory', 'source_directory');
      } finally {
        console.info('VirtualFileDragC_Directory_002 end');
      }
    });

    // 选择按需解压后完成元数据准备。
    it('VirtualFileDragC_Archive_003', 0, async (): Promise<void> => {
      console.info('VirtualFileDragC_Archive_003 begin');
      try {
        await checkScenario('archive', 'source_archive');
      } finally {
        console.info('VirtualFileDragC_Archive_003 end');
      }
    });
  });
}
