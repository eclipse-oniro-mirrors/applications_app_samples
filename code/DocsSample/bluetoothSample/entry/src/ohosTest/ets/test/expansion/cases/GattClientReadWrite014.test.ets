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
import { BluetoothSdk, characteristic, descriptor } from '../fixtures/BluetoothSdk';
import { GattClientManager, GattData } from '../../../../../main/ets/bluetoothService/GattClientManager';
import { ble } from '@kit.ConnectivityKit';

import { settleServicePromises } from '../fixtures/ServiceInputs';

/**
 * @tc.number BT_CLIENT_IO_014
 * @tc.name EXP_BT_CLIENT_IO_014
 * @tc.desc Defect-exposing real GATT write: characteristic and nested descriptor must encode their own configured UTF-8 values (catalog bug oracle corrected). Scenario BT_CLIENT_IO_014: {"setGattData":{"serviceUuid":"S","characteristicUuid":"C","descriptorUuid":"D","characteristicValue":"","descriptorValue":"xyz"},"method":"writeCharacteristicValue","callback":"success"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.gattClient = sdk.client;
      manager.connectState = 2 as ble.ProfileConnectionState;
      manager.found = true;
      const data = new GattData();
      data.serviceUuid = 'S';
      data.characteristicUuid = 'C';
      data.descriptorUuid = 'D';
      data.characteristicValue = '';
      data.descriptorValue = 'xyz';
      manager.setGattData(data);
      manager.writeCharacteristicValue();
      const sent = sdk.sentCharacteristic;
      expect(sent !== undefined).assertTrue();
      if (sent === undefined) {
        throw new Error('write characteristic missing');
      }
      expect(sent.serviceUuid).assertEqual("S");
      expect(sent.characteristicUuid).assertEqual("C");
      expect(sent.descriptors.length).assertEqual(1);
      expect(sent.descriptors[0].descriptorUuid).assertEqual("D");
      expect(sent.descriptors[0].serviceUuid).assertEqual("S");
      expect(sent.descriptors[0].characteristicUuid).assertEqual("C");
      expect(sdk.writeType).assertEqual(ble.GattWriteType.WRITE);
      expect(Array.from(new Uint8Array(sent.characteristicValue)).join(",")).assertEqual("");
      expect(Array.from(new Uint8Array(sent.descriptors[0].descriptorValue)).join(",")).assertEqual("120,121,122");
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
