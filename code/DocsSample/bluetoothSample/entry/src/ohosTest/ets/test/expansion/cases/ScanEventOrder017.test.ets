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
import { ble } from '@kit.ConnectivityKit';
/**
 * @tc.number V2_BT_SCAN_ORDER_017
 * @tc.name EXP_V2_BT_SCAN_ORDER_017
 * @tc.desc Explicit device list positions, first-result-only batch, duplicate-name retention, restart list replacement and old real callback reentry. Scenario: {"listSize":3,"duplicatePosition":2,"packet":[],"reverseDeviceOrder":false,"interval":170}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleScanManager();
      manager.setScanParameter('170', '4567', 'sensor', '');
      manager.startScan();
      const firstListener = sdk.scanListener;
      if (firstListener === undefined) {
        throw new Error('Actual scan listener missing');
      }
      const originalList = manager.getScanData();
      expect(originalList.length).assertEqual(0);
      const input0: ble.ScanResult = {
        deviceId: 'AA:00:00:00:11:00',
        deviceName: 'scan-0',
        rssi: -128,
        connectable: true,
        data: new Uint8Array([]).buffer
      };
      sdk.emitScan([input0]);
      expect(manager.getScanData().length).assertEqual(1);
      const input1: ble.ScanResult = {
        deviceId: 'AA:00:00:00:11:01',
        deviceName: 'scan-1',
        rssi: -67,
        connectable: false,
        data: new Uint8Array([]).buffer
      };
      sdk.emitScan([input1]);
      expect(manager.getScanData().length).assertEqual(2);
      const input2: ble.ScanResult = {
        deviceId: 'AA:00:00:00:11:02',
        deviceName: 'scan-2',
        rssi: -1,
        connectable: true,
        data: new Uint8Array([]).buffer
      };
      sdk.emitScan([input2]);
      expect(manager.getScanData().length).assertEqual(3);
      expect(manager.getScanData() === originalList).assertTrue();
      expect(originalList[0].getDeviceId()).assertEqual('AA:00:00:00:11:00');
      expect(originalList[0].getDeviceName()).assertEqual('scan-0');
      expect(originalList[0].getRssi()).assertEqual(-128);
      expect(originalList[0].getConnectable()).assertEqual(true);
      expect(originalList[0].getData().length).assertEqual(0);
      expect(originalList[0].getData().join(',')).assertEqual('');
      expect(originalList[0].getData().buffer === input0.data).assertTrue();
      expect(originalList[1].getDeviceId()).assertEqual('AA:00:00:00:11:01');
      expect(originalList[1].getDeviceName()).assertEqual('scan-1');
      expect(originalList[1].getRssi()).assertEqual(-67);
      expect(originalList[1].getConnectable()).assertEqual(false);
      expect(originalList[1].getData().length).assertEqual(0);
      expect(originalList[1].getData().join(',')).assertEqual('');
      expect(originalList[1].getData().buffer === input1.data).assertTrue();
      expect(originalList[2].getDeviceId()).assertEqual('AA:00:00:00:11:02');
      expect(originalList[2].getDeviceName()).assertEqual('scan-2');
      expect(originalList[2].getRssi()).assertEqual(-1);
      expect(originalList[2].getConnectable()).assertEqual(true);
      expect(originalList[2].getData().length).assertEqual(0);
      expect(originalList[2].getData().join(',')).assertEqual('');
      expect(originalList[2].getData().buffer === input2.data).assertTrue();
      const duplicate: ble.ScanResult = {
        deviceId: 'BB:00:00:00:11:FF',
        deviceName: 'scan-2',
        rssi: -10,
        connectable: false,
        data: new ArrayBuffer(0)
      };
      sdk.emitScan([duplicate]);
      expect(originalList.length).assertEqual(3);
      expect(originalList[2].getDeviceId()).assertEqual('AA:00:00:00:11:02');
      expect(originalList[2].getRssi()).assertEqual(-1);
      expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('BB:00:00:00:11:FF');
      const ignored: ble.ScanResult = {
        deviceId: 'ignored-second',
        deviceName: 'not-inserted',
        rssi: -2,
        connectable: true,
        data: new ArrayBuffer(0)
      };
      sdk.emitScan([duplicate, ignored]);
      expect(manager.getScanData().length).assertEqual(3);
      expect(sdk.toasts.length).assertEqual(6);
      manager.startScan();
      const restartedList = manager.getScanData();
      expect(restartedList !== originalList).assertTrue();
      expect(restartedList.length).assertEqual(0);
      expect(originalList.length).assertEqual(3);
      expect(sdk.scanListener !== firstListener).assertTrue();
      sdk.emitScan([input0]);
      firstListener([input2]);
      expect(restartedList.length).assertEqual(2);
      expect(manager.getScanData() === restartedList).assertTrue();
      expect(restartedList[0].getDeviceId()).assertEqual('AA:00:00:00:11:00');
      expect(restartedList[0].getDeviceName()).assertEqual('scan-0');
      expect(restartedList[0].getRssi()).assertEqual(-128);
      expect(restartedList[0].getConnectable()).assertEqual(true);
      expect(restartedList[0].getData().length).assertEqual(0);
      expect(restartedList[0].getData().join(',')).assertEqual('');
      expect(restartedList[1].getDeviceId()).assertEqual('AA:00:00:00:11:02');
      expect(restartedList[1].getDeviceName()).assertEqual('scan-2');
      expect(restartedList[1].getRssi()).assertEqual(-1);
      expect(restartedList[1].getConnectable()).assertEqual(true);
      expect(restartedList[1].getData().length).assertEqual(0);
      expect(restartedList[1].getData().join(',')).assertEqual('');
      expect(originalList.length).assertEqual(3);
      expect(sdk.toasts.length).assertEqual(9);
      const options = sdk.options;
      expect(options !== undefined).assertTrue();
      if (options === undefined) {
        throw new Error('Expected options from real production call');
      }
      expect(options.interval).assertEqual(170);
      expect(sdk.filters[0].manufactureId).assertEqual(4567);
      expect(sdk.filters[0].name).assertEqual('sensor');
      expect(ignored.deviceName).assertEqual('not-inserted');
      expect(duplicate.deviceName).assertEqual('scan-2');
      expect(sdk.calls.filter((stage: string): boolean => stage === 'ble.on').length).assertEqual(2);
      expect(sdk.offMatchesRegistration.length).assertEqual(0);
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
