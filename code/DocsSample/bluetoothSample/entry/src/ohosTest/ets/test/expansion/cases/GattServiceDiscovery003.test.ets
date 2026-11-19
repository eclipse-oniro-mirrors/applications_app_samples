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
 * @tc.number BT_CLIENT_DISCOVERY_003
 * @tc.name EXP_BT_CLIENT_DISCOVERY_003
 * @tc.desc Real discoverServices and private matching traverse typed SDK service fixtures; serialized result and found state are asserted. Scenario BT_CLIENT_DISCOVERY_003: {"services":[{"serviceUuid":"00001810-0000-1000-8000-00805F9B34FB","isPrimary":true,"characteristics":[]}]}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.gattClient = sdk.client;
      const services: ble.GattService[] = [
        {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          isPrimary: true,
          characteristics: []
        }
      ];
      sdk.services = services;
      await manager.discoverServices();
      expect(manager.found).assertEqual(false);
      expect(manager.serviceResult).assertEqual(JSON.stringify(services));
      expect(manager.getResult()).assertEqual(JSON.stringify(services));
      expect(sdk.toasts[0].message === 'getServices success: ' + JSON.stringify(services)).assertEqual(true);
      expect(JSON.stringify(sdk.calls)).assertEqual('["client.getServices","prompt.showToast"]');
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
