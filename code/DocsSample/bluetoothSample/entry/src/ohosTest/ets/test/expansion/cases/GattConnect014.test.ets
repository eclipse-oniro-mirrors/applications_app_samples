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
import { GattClientManager } from '../../../../../main/ets/bluetoothService/GattClientManager';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';
import { settleServicePromises } from '../fixtures/ServiceInputs';

/**
 * @tc.number BT_CLIENT_CONNECT_014
 * @tc.name EXP_BT_CLIENT_CONNECT_014
 * @tc.desc Real client connection guard/factory/state callback with external SDK call and state assertions. Scenario BT_CLIENT_CONNECT_014: {"subscribeThenEmit":{"deviceId":"A","state":99}}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.device = 'A';
      manager.gattClient = sdk.client;
      manager.onGattClientStateChange();
      sdk.emitConnection({ deviceId: 'A', state: 99 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(99);
      expect(JSON.stringify(sdk.calls)).assertEqual('["client.on"]');
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
