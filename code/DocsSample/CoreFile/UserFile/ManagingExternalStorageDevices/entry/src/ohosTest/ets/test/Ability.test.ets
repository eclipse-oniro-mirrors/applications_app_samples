/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const TAG = '[Sample_ManagingExternalStorageDevices]';
const DOMAIN = 0xF811;
const DELAY_TIME_1S = 1000;

const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
const BUNDLENAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver: Driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = {
    bundleName: BUNDLENAME,
    abilityName: 'EntryAbility'
  };
  await DELEGATOR.startAbility(want);
}

export default function ManagingExternalStorageDevicesTest(): void {
  describe('ManagingExternalStorageDevicesTest', () => {
    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_0100
     * @tc.name      testManagingExternalStorageStartAbility0001
     * @tc.desc      Start EntryAbility and verify it becomes the top ability.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageStartAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageStartAbility0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_TIME_1S);
        const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
        const abilityName: string = ability.context.abilityInfo.name;
        hilog.info(DOMAIN, TAG, 'top ability name: %{public}s', abilityName);
        expect(abilityName).assertEqual('EntryAbility');
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageStartAbility0001 end');
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_0200
     * @tc.name      testManagingExternalStorageButtons0001
     * @tc.desc      Verify the subscribe and receive buttons are displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageButtons0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageButtons0001 begin');
        await driver.delayMs(DELAY_TIME_1S);
        const subscribeButton: Component = await driver.findComponent(ON.text('SubscribeBroadcastEvents'));
        const receiveButton: Component = await driver.findComponent(ON.text('ReceiveBroadcastNotifications'));
        const subscribeText: string = await subscribeButton.getText();
        const receiveText: string = await receiveButton.getText();
        hilog.info(DOMAIN, TAG, 'subscribe button text: %{public}s', subscribeText);
        hilog.info(DOMAIN, TAG, 'receive button text: %{public}s', receiveText);
        expect(subscribeText).assertEqual('SubscribeBroadcastEvents');
        expect(receiveText).assertEqual('ReceiveBroadcastNotifications');
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageButtons0001 end');
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_0300
     * @tc.name      testManagingExternalStorageSubscribe0001
     * @tc.desc      Verify clicking the subscribe button creates a volume event subscriber.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageSubscribe0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSubscribe0001 begin');
        await driver.delayMs(DELAY_TIME_1S);
        const subscribeButton: Component = await driver.findComponent(ON.text('SubscribeBroadcastEvents'));
        hilog.info(DOMAIN, TAG, 'subscribe button resolved: %{public}s', subscribeButton !== null ? 'true' : 'false');
        expect(subscribeButton !== null).assertTrue();
        await subscribeButton?.click();
        await driver.delayMs(DELAY_TIME_1S);
        const statusText: Component = await driver.findComponent(ON.text('Subscription succeeded'));
        const statusValue: string = statusText !== null ? await statusText.getText() : '';
        hilog.info(DOMAIN, TAG, 'subscribe status text: %{public}s', statusValue);
        expect(statusText !== null).assertTrue();
        expect(statusValue).assertEqual('Subscription succeeded');
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageSubscribe0001 end');
      });

    /**
     * @tc.number    SUB_COREFILEKIT_MANAGING_EXTERNAL_STORAGE_0400
     * @tc.name      testManagingExternalStorageReceive0001
     * @tc.desc      Verify clicking the receive button starts listening for volume events.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testManagingExternalStorageReceive0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageReceive0001 begin');
        await driver.delayMs(DELAY_TIME_1S);
        const receiveButton: Component = await driver.findComponent(ON.text('ReceiveBroadcastNotifications'));
        const receiveText: string = await receiveButton.getText();
        hilog.info(DOMAIN, TAG, 'receive button text: %{public}s', receiveText);
        expect(receiveText).assertEqual('ReceiveBroadcastNotifications');
        await receiveButton?.click();
        await driver.delayMs(DELAY_TIME_1S);
        const listeningText: Component = await driver.findComponent(ON.text('Listening for volume events'));
        const listeningValue: string = listeningText !== null ? await listeningText.getText() : '';
        hilog.info(DOMAIN, TAG, 'receive status text: %{public}s', listeningValue);
        expect(listeningText !== null).assertTrue();
        expect(listeningValue).assertEqual('Listening for volume events');
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageReceive0001 end');
      });
  })
}
