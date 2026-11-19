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
 * @tc.number BT_ADV_STATE_012
 * @tc.name EXP_BT_ADV_STATE_012
 * @tc.desc Real advertising lifecycle awaits SDK promises, retains exact handles and uses actual event registrations. Scenario BT_ADV_STATE_012: {"method":"stopAdvertising","args":[],"failure":"ble.stopAdvertising reject"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleAdvertisingManager();
      sdk.rejectAt = 'ble.stopAdvertising';
      await manager.stopAdvertising();
      expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('bluetooth advertising stop fail');
      expect(sdk.calls.indexOf('ble.off')).assertEqual(-1);
    } catch (primaryError) {
      primaryFailed1 = true;
      rethrowCaught(primaryError);
    } finally {
      runCleanup((): void => {
        sdk.dispose();
      }, primaryFailed1);
    }
  };

export default runExpansionCase;
