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
import { BleScanManager } from '../../../../../main/ets/bluetoothService/BluetoothScan';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';


/**
 * @tc.number BT_SCAN_EVENTS_007
 * @tc.name EXP_BT_SCAN_EVENTS_007
 * @tc.desc Deliver actual registered BLEDeviceFind callback; assert retained scan records, duplicate-name handling and lifecycle. Scenario BT_SCAN_EVENTS_007: {"events":[[{"id":"A","name":"one","data":[2,1,6,0]}]],"then":"startScan"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleScanManager();
      manager.onScanResult();
      sdk.emitScan([{
        deviceId: 'A',
        deviceName: 'one',
        rssi: -50,
        connectable: true,
        data: new Uint8Array([2,1,6,0]).buffer
      }]);
      manager.startScan();
      expect(manager.getScanData().length).assertEqual(0);
      expect(sdk.toasts.length).assertEqual(2);
      expect(sdk.toasts[0].message).assertEqual('A');
      expect(sdk.toasts[1].message).assertEqual('startBleScan success');
      expect(JSON.stringify(sdk.calls)).assertEqual(
        '["ble.on","prompt.showToast","ble.on","ble.startBLEScan","prompt.showToast"]'
      );
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
