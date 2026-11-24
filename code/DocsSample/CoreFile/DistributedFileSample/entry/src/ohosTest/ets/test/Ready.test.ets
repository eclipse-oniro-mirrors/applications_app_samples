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

import { describe, it, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import type { Assert } from '@ohos/hypium';
import { Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import type { UIAbility, Want } from '@kit.AbilityKit';
import { bundleManager } from '@kit.AbilityKit';
import type { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { isDistributedOperationReady } from './DistributedTestSupport';

const DELAY_TIME: number = 1500;
const DOMAIN: number = 0xF811;
const PERMISSION_NAME: string = 'ohos.permission.DISTRIBUTED_DATASYNC';
const TOP_ABILITY_STEP_MS: number = 200;
const TOP_ABILITY_LIMIT: number = 30;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

async function isPermissionGranted(): Promise<boolean> {
  const info: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
    bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION);
  const index: number = info.reqPermissionDetails.findIndex((detail: bundleManager.ReqPermissionDetail): boolean =>
    detail.name === PERMISSION_NAME);
  return index >= 0 && info.permissionGrantStates[index] === bundleManager.PermissionGrantState.PERMISSION_GRANTED;
}

// startAbility 返回时页面切换尚未落定，直接取栈顶会偶发拿到 TestAbility，需等到 EntryAbility 上位。
async function waitTopAbilityName(): Promise<string> {
  const driver: Driver = Driver.create();
  let name: string = '';
  for (let step: number = 0; step < TOP_ABILITY_LIMIT; step++) {
    const ability: UIAbility = await delegator.getCurrentTopAbility();
    name = ability.context.abilityInfo.name;
    if (name === 'EntryAbility') {
      break;
    }
    await driver.delayMs(TOP_ABILITY_STEP_MS);
  }
  return name;
}

function expect(tag: string, actual: Object | undefined): Assert {
  const actualText: string = JSON.stringify(actual) ?? 'undefined';
  hilog.info(DOMAIN, tag, 'assert actual=%{public}s', actualText);
  return hypiumExpect(actual);
}

async function getResourceString(resource: Resource): Promise<string> {
  const manager: resourceManager.ResourceManager = delegator.getAppContext().resourceManager;
  const text: string = await manager.getStringValue(resource);
  return text;
}

export default function readyTest(): void {
  describe('readyTest', (): void => {
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_READY_0100
     * @tc.name testDistributedFileReady0001
     * @tc.desc Start the entry ability and verify the top ability name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileReady0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileReady0001';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
          await delegator.startAbility(want);
          expect(TAG, await waitTopAbilityName()).assertEqual('EntryAbility');
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_READY_0200
     * @tc.name testDistributedFileReady0002
     * @tc.desc Verify the permission request button text and enabled state before clicking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileReady0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileReady0002';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const text: string = await getResourceString($r('app.string.ApplyPermission'));
          const driver: Driver = Driver.create();
          const button: Component = await driver.findComponent(ON.text(text));
          expect(TAG, await button.getText()).assertEqual(text);
          expect(TAG, await button.isEnabled()).assertEqual(true);
          await button.click();
          await driver.delayMs(DELAY_TIME);
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_READY_0300
     * @tc.name testDistributedFileReady0003
     * @tc.desc Verify the permission confirmation button text and enabled state before clicking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileReady0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileReady0003';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const text: string = await getResourceString($r('app.string.permit'));
          const driver: Driver = Driver.create();
          const button: Component | null = await driver.findComponent(ON.text(text));
          if (button === null) {
            expect(TAG, await isPermissionGranted()).assertTrue();
          } else {
            expect(TAG, await button.getText()).assertEqual(text);
            expect(TAG, await button.isEnabled()).assertEqual(true);
            await button.click();
            await driver.delayMs(DELAY_TIME);
            expect(TAG, await isPermissionGranted()).assertTrue();
          }
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_READY_0400
     * @tc.name testDistributedFileReady0004
     * @tc.desc Verify the create file button text and enabled state before clicking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileReady0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileReady0004';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const text: string = await getResourceString($r('app.string.CreateFile'));
          const driver: Driver = Driver.create();
          const button: Component = await driver.findComponent(ON.text(text));
          expect(TAG, await button.getText()).assertEqual(text);
          expect(TAG, await button.isEnabled()).assertEqual(true);
          // createFile 同步写 distributedFilesDir，目录未挂载时会长时间占住主线程，只在环境就绪时点击。
          if (isDistributedOperationReady(bundleName, delegator.getAppContext().distributedFilesDir)) {
            await button.click();
            await driver.delayMs(DELAY_TIME);
          }
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
    /**
     * @tc.number SUB_DISTRIBUTED_FILE_READY_0500
     * @tc.name testDistributedFileReady0005
     * @tc.desc Verify the sandbox copy button text and enabled state before clicking.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDistributedFileReady0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const TAG: string = 'testDistributedFileReady0005';
        hilog.info(DOMAIN, TAG, `${TAG} start`);
        try {
          const text: string = await getResourceString($r('app.string.CopySandToDistributed'));
          const driver: Driver = Driver.create();
          const button: Component = await driver.findComponent(ON.text(text));
          expect(TAG, await button.getText()).assertEqual(text);
          expect(TAG, await button.isEnabled()).assertEqual(true);
          if (isDistributedOperationReady(bundleName, delegator.getAppContext().distributedFilesDir)) {
            await button.click();
            await driver.delayMs(DELAY_TIME);
          }
        } finally {
          hilog.info(DOMAIN, TAG, `${TAG} end`);
        }
      });
  });
}
