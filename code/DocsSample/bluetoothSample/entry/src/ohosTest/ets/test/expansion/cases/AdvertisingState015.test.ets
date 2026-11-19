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

import { rethrowCaught } from '../fixtures/SdkInterop';
import { runCleanup } from '../fixtures/Cleanup';
import { expect } from '@ohos/hypium';
import { BluetoothSdk } from '../fixtures/BluetoothSdk';
import { BleAdvertisingManager } from '../../../../../main/ets/bluetoothService/BluetoothAdvertising';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';


/**
 * @tc.number BT_ADV_STATE_015
 * @tc.name EXP_BT_ADV_STATE_015
 * @tc.desc Real advertising lifecycle awaits SDK promises, retains exact handles and uses actual event registrations. Scenario BT_ADV_STATE_015: {"onAdvertisingStateChange":true,"emit":{"advertisingId":17,"state":0}}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed2: boolean = false;
    try {
      const manager = new BleAdvertisingManager();
      const hadState = AppStorage.has('advertiserState');
      const previousState = AppStorage.get<number>('advertiserState');
      let primaryFailed1: boolean = false;
      try {
        manager.onAdvertisingStateChange();
        sdk.emitAdvertising({ advertisingId: 17, state: 0 as ble.AdvertisingState });
        expect(AppStorage.get<number>('advertiserState')).assertEqual(0);
      } catch (primaryError) {
        primaryFailed1 = true;
        rethrowCaught(primaryError);
      } finally {
        runCleanup((): void => {
          if (hadState) {
            if (previousState === undefined) {
              throw new Error('Preexisting advertiser state was not a number');
            }
            AppStorage.setOrCreate('advertiserState', previousState);
          } else {
            AppStorage.delete('advertiserState');
          }
        }, primaryFailed1);
      }
    } catch (primaryError) {
      primaryFailed2 = true;
      rethrowCaught(primaryError);
    } finally {
      runCleanup((): void => {
        sdk.dispose();
      }, primaryFailed2);
    }
  };

export default runExpansionCase;
