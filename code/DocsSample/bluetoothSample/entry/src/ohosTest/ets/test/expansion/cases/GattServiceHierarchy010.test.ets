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
import { ble } from '@kit.ConnectivityKit';
/**
 * @tc.number V2_BT_HIERARCHY_010
 * @tc.name EXP_V2_BT_HIERARCHY_010
 * @tc.desc Match only within the correct service/characteristic hierarchy; preserve source tree, rejection snapshot and UUID reconfiguration recovery. Scenario: {"servicePosition":0,"characteristicPosition":1,"descriptorPosition":1,"matchingDescriptor":true,"wrongParentDecoys":true}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.startConnect('hierarchy-peer');
      sdk.emitConnection({ deviceId: 'hierarchy-peer', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(2);
      expect(manager.gattClient === sdk.client).assertTrue();
      manager.myCharacteristicValue = 'AZ';
      manager.myDescriptorValue = 'AZ';
      const services: ble.GattService[] = [
        {
          serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          isPrimary: true,
          characteristics: [
            {
              serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
              characteristicUuid: 'other-C-0',
              characteristicValue: new Uint8Array([2]).buffer,
              descriptors: [
                {
                  serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                  characteristicUuid: 'other-C-0',
                  descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                  descriptorValue: new Uint8Array([1]).buffer
                }
              ]
            },
            {
              serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
              characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
              characteristicValue: new Uint8Array([21,22]).buffer,
              descriptors: [
                {
                  serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                  characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                  descriptorUuid: 'other-D-0',
                  descriptorValue: new Uint8Array([0]).buffer
                },
                {
                  serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                  characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                  descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                  descriptorValue: new Uint8Array([0,255]).buffer
                },
                {
                  serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                  characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                  descriptorUuid: 'tail-D',
                  descriptorValue: new Uint8Array([31,32]).buffer
                }
              ]
            },
            {
              serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
              characteristicUuid: 'tail-C',
              characteristicValue: new Uint8Array([4]).buffer,
              descriptors: [
                {
                  serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                  characteristicUuid: 'tail-C',
                  descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                  descriptorValue: new Uint8Array([3]).buffer
                }
              ]
            }
          ]
        },
        {
          serviceUuid: 'tail-S',
          isPrimary: true,
          characteristics: []
        }
      ];
      sdk.services = services;
      const before = JSON.stringify(services);
      await manager.discoverServices();
      expect(manager.found).assertEqual(true);
      expect(manager.getResult()).assertEqual(before);
      expect(manager.serviceResult).assertEqual(before);
      expect(JSON.stringify(services)).assertEqual(before);
      expect(services.length).assertEqual(2);
      expect(services[0].serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(services[0].characteristics.length).assertEqual(3);
      expect(services[0].characteristics[1].characteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(services[0].characteristics[1].descriptors.length).assertEqual(3);
      expect(services[0].characteristics[1].descriptors[1].descriptorUuid).assertEqual(
        '00002902-0000-1000-8000-00805F9B34FB'
      );
      expect(new Uint8Array(services[0].characteristics[1].characteristicValue).join(',')).assertEqual('21,22');
      expect(sdk.toasts[1].message === 'getServices success: ' + before).assertEqual(true);
      manager.writeDescriptorValue();
      const sent = sdk.sentDescriptor;
      expect(sent !== undefined).assertTrue();
      if (sent === undefined) {
        throw new Error('Expected sent from real production call');
      }
      expect(sent.serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(sent.characteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(sent.descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(sent.descriptorValue).join(',')).assertEqual('65,90');
      expect(sdk.toasts[2].message).assertEqual('writeDescriptorValue success');
      sdk.rejectAt = 'client.getServices';
      await manager.discoverServices();
      expect(manager.found).assertEqual(true);
      expect(manager.serviceResult).assertEqual(before);
      expect(sdk.toasts[3].message).assertEqual('getServices fail');
      sdk.rejectAt = '';
      manager.myDescriptorUuid = 'not-present';
      await manager.discoverServices();
      expect(manager.found).assertEqual(false);
      expect(manager.getResult()).assertEqual(before);
      manager.myDescriptorUuid = '00002902-0000-1000-8000-00805F9B34FB';
      await manager.discoverServices();
      expect(manager.found).assertEqual(true);
      expect(manager.getResult()).assertEqual(before);
      expect(JSON.stringify(services)).assertEqual(before);
      expect(manager.device).assertEqual('hierarchy-peer');
      expect(manager.connectState).assertEqual(2);
      expect(manager.myServiceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(manager.myDescriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicValue).assertEqual('AZ');
      expect(manager.myDescriptorValue).assertEqual('AZ');
      expect(sdk.toasts.length).assertEqual(6);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'client.getServices').length).assertEqual(4);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'client.writeDescriptorValue').length).assertEqual(
        1
      );
      expect(sdk.peers.length).assertEqual(1);
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
