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
import { BluetoothSdk, descriptor } from '../fixtures/BluetoothSdk';
import { GattClientManager, GattData } from '../../../../../main/ets/bluetoothService/GattClientManager';
import { ble } from '@kit.ConnectivityKit';
import { settleServicePromises } from '../fixtures/ServiceInputs';
/**
 * @tc.number V2_BT_GATT_FIELDS_005
 * @tc.name EXP_V2_BT_GATT_FIELDS_005
 * @tc.desc Snapshot real GattData fields, mutate source without manager aliasing, inspect ASCII SDK requests and independent replay buffers. Scenario: {"asciiLength":1,"ascii":"A","uuidMode":0}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      const data = new GattData();
      expect(data.serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(data.characteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(data.descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(data.characteristicValue).assertEqual('');
      expect(data.descriptorValue).assertEqual('');
      manager.device = 'field-peer';
      manager.gattClient = sdk.client;
      manager.connectState = 2 as ble.ProfileConnectionState;
      manager.found = true;
      manager.serviceResult = 'preserved-result';
      data.serviceUuid = '0000180A-0000-1000-8000-00805F9B34FB';
      data.characteristicUuid = '00002A14-0000-1000-8000-00805F9B34FB';
      data.descriptorUuid = '00002902-0000-1000-8000-00805F9B34FB';
      data.characteristicValue = 'A';
      data.descriptorValue = 'A';
      manager.setGattData(data);
      expect(manager.myServiceUuid).assertEqual('0000180A-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicUuid).assertEqual('00002A14-0000-1000-8000-00805F9B34FB');
      expect(manager.myDescriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicValue).assertEqual('A');
      expect(manager.myDescriptorValue).assertEqual('A');
      data.serviceUuid = 'changed-source-S';
      data.characteristicUuid = 'changed-source-C';
      data.descriptorUuid = 'changed-source-D';
      data.characteristicValue = 'changed-source-char';
      data.descriptorValue = 'changed-source-desc';
      expect(manager.myServiceUuid).assertEqual('0000180A-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicUuid).assertEqual('00002A14-0000-1000-8000-00805F9B34FB');
      expect(manager.myDescriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicValue).assertEqual('A');
      expect(manager.myDescriptorValue).assertEqual('A');
      manager.writeCharacteristicValue();
      const sentChar = sdk.sentCharacteristic;
      expect(sentChar !== undefined).assertTrue();
      if (sentChar === undefined) {
        throw new Error('Expected sentChar from real production call');
      }
      expect(sentChar.serviceUuid).assertEqual('0000180A-0000-1000-8000-00805F9B34FB');
      expect(sentChar.characteristicUuid).assertEqual('00002A14-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(sentChar.characteristicValue).join(',')).assertEqual('65');
      expect(sentChar.descriptors.length).assertEqual(1);
      expect(sentChar.descriptors[0].descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(sentChar.descriptors[0].descriptorValue).join(',')).assertEqual('65');
      expect(sdk.writeType).assertEqual(ble.GattWriteType.WRITE);
      manager.writeDescriptorValue();
      const sentDesc = sdk.sentDescriptor;
      expect(sentDesc !== undefined).assertTrue();
      if (sentDesc === undefined) {
        throw new Error('Expected sentDesc from real production call');
      }
      expect(sentDesc.serviceUuid).assertEqual('0000180A-0000-1000-8000-00805F9B34FB');
      expect(sentDesc.characteristicUuid).assertEqual('00002A14-0000-1000-8000-00805F9B34FB');
      expect(sentDesc.descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(sentDesc.descriptorValue).join(',')).assertEqual('65');
      expect(sentChar.descriptors[0].descriptorValue !== sentDesc.descriptorValue).assertTrue();
      sdk.readDescriptor = descriptor([0, 127, 255]);
      manager.readDescriptorValue();
      await settleServicePromises();
      const readRequest = sdk.sentDescriptor;
      expect(readRequest !== undefined).assertTrue();
      if (readRequest === undefined) {
        throw new Error('Expected readRequest from real production call');
      }
      expect(new Uint8Array(readRequest.descriptorValue).join(',')).assertEqual('');
      expect(readRequest.descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(sentDesc.descriptorValue).join(',')).assertEqual('65');
      expect(manager.device).assertEqual('field-peer');
      expect(manager.connectState).assertEqual(2);
      expect(manager.found).assertEqual(true);
      expect(manager.getResult()).assertEqual('preserved-result');
      const next = new GattData();
      next.serviceUuid = '0000180A-0000-1000-8000-00805F9B34FB';
      next.characteristicUuid = '00002A14-0000-1000-8000-00805F9B34FB';
      next.descriptorUuid = '00002902-0000-1000-8000-00805F9B34FB';
      next.characteristicValue = 'A';
      next.descriptorValue = 'A';
      manager.setGattData(next);
      manager.writeDescriptorValue();
      const replayed = sdk.sentDescriptor;
      expect(replayed !== undefined).assertTrue();
      if (replayed === undefined) {
        throw new Error('Expected replayed from real production call');
      }
      expect(new Uint8Array(replayed.descriptorValue).join(',')).assertEqual('65');
      expect(replayed.descriptorValue !== sentDesc.descriptorValue).assertTrue();
      expect(new Uint8Array(sentDesc.descriptorValue).join(',')).assertEqual('65');
      expect(sdk.toasts.length).assertEqual(5);
      expect(sdk.toasts[0].message).assertEqual('writeCharacteristicValue success');
      expect(sdk.toasts[1].message).assertEqual('writeDescriptorValue success');
      expect(sdk.toasts[2].message).assertEqual('readDescriptorValue success');
      expect(sdk.toasts[3].message).assertEqual('logDescriptor uuid:D\nlogDescriptor value: 0 127 255 ');
      expect(sdk.toasts[4].message).assertEqual('writeDescriptorValue success');
      expect(data.characteristicValue).assertEqual('changed-source-char');
      expect(next.characteristicValue).assertEqual('A');
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
