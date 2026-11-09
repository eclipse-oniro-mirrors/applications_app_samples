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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const TAG = '[Sample_ManagingExternalStorageDevices]';
const DOMAIN = 0xF811;
const DELAY_TIME_1S = 1000;

const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
const BUNDLENAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver = Driver.create();

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
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
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
        const subscribeButton = await driver.findComponent(ON.text('SubscribeBroadcastEvents'));
        const receiveButton = await driver.findComponent(ON.text('ReceiveBroadcastNotifications'));
        expect(await subscribeButton.getText()).assertEqual('SubscribeBroadcastEvents');
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
        const subscribeButton = await driver.findComponent(ON.text('SubscribeBroadcastEvents'));
        expect(subscribeButton !== null).assertTrue();
        await subscribeButton?.click();
        await driver.delayMs(DELAY_TIME_1S);
        const statusText = await driver.findComponent(ON.text('Subscription succeeded'));
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
        const receiveButton = await driver.findComponent(ON.text('ReceiveBroadcastNotifications'));
        expect(await receiveButton.getText()).assertEqual('ReceiveBroadcastNotifications');
        await receiveButton?.click();
        await driver.delayMs(DELAY_TIME_1S);
        const listeningText = await driver.findComponent(ON.text('Listening for volume events'));
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testManagingExternalStorageReceive0001 end');
      });
  })
}
