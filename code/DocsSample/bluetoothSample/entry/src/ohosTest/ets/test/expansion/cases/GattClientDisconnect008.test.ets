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
 * @tc.number BT_CLIENT_STOP_008
 * @tc.name EXP_BT_CLIENT_STOP_008
 * @tc.desc Real GATT stop guard/order/failure path; subscribed callback identity and retained state are checked. Scenario BT_CLIENT_STOP_008: {"stopConnect":true,"throwAt":"close"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.connectState = 2 as ble.ProfileConnectionState;
      manager.gattClient = sdk.client;
      manager.device = 'A';
      manager.onGattClientStateChange();
      sdk.calls = [];
      sdk.throwAt = 'client.close';
      manager.stopConnect();
      expect(manager.connectState).assertEqual(2);
      expect(JSON.stringify(sdk.calls)).assertEqual(
        '["client.disconnect","client.off","client.close","prompt.showToast"]'
      );
      expect(sdk.toasts[0].message).assertEqual('stopConnect fail');
      expect(manager.gattClient === sdk.client).assertEqual(true);
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
