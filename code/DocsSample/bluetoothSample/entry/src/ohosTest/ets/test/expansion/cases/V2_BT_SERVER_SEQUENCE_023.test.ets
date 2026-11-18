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
import { GattServerManager } from '../fixtures/ServerSubject';
import { ServerSdk } from '../fixtures/ServerSdk';
import { ble } from '@kit.ConnectivityKit';
/**
 * @tc.number V2_BT_SERVER_SEQUENCE_023
 * @tc.name EXP_V2_BT_SERVER_SEQUENCE_023
 * @tc.desc Real registered server callbacks in mixed read/write order, needRsp gating, exact transaction routing, isolated response buffers and send recovery. Scenario: {"offset":255,"writeResponseMode":2,"reverseEventOrder":false,"transactionBase":230}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new ServerSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattServerManager();
      expect(manager.gattServer === sdk.server).assertTrue();
      expect(JSON.stringify(sdk.calls)).assertEqual('["ble.createGattServer"]');
      manager.registerServer();
      expect(sdk.services.length).assertEqual(1);
      expect(sdk.services[0].serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(sdk.services[0].isPrimary).assertEqual(true);
      expect(sdk.services[0].characteristics.length).assertEqual(1);
      const registered = sdk.services[0].characteristics[0];
      expect(registered.characteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(registered.characteristicValue).join(',')).assertEqual('21,22');
      expect(registered.descriptors.length).assertEqual(2);
      expect(registered.descriptors[0].descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(registered.descriptors[1].descriptorUuid).assertEqual('00002903-0000-1000-8000-00805F9B34FB');
      expect(new Uint8Array(registered.descriptors[0].descriptorValue).join(',')).assertEqual('0,0');
      expect(new Uint8Array(registered.descriptors[1].descriptorValue).join(',')).assertEqual('31,32');
      manager.onCharacteristicRead();
      manager.onDescriptorRead();
      manager.onCharacteristicWrite();
      manager.onDescriptorWrite();
      const charRead: ble.CharacteristicReadRequest = {
        deviceId: 'AA:10:00:00:00:17',
        transId: 230,
        offset: 255,
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB'
      };
      const descRead: ble.DescriptorReadRequest = {
        deviceId: 'AA:10:00:00:00:17',
        transId: 231,
        offset: 255,
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB'
      };
      const charWrite: ble.CharacteristicWriteRequest = {
        deviceId: 'AA:10:00:00:00:17',
        transId: 232,
        offset: 255,
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        isPrepared: false,
        needRsp: true,
        value: new Uint8Array([65, 0, 255]).buffer
      };
      const descWrite: ble.DescriptorWriteRequest = {
        deviceId: 'AA:10:00:00:00:17',
        transId: 233,
        offset: 255,
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
        isPrepared: false,
        needRsp: true,
        value: new Uint8Array([66, 128]).buffer
      };
      const requestSnapshot = JSON.stringify(charRead);
      const registrationSnapshot = JSON.stringify(sdk.services);
      sdk.emitCharacteristicRead(charRead);
      expect(sdk.responses.length).assertEqual(1);
      expect(sdk.responses[0].deviceId).assertEqual('AA:10:00:00:00:17');
      expect(sdk.responses[0].transId).assertEqual(230);
      expect(sdk.responses[0].offset).assertEqual(255);
      expect(sdk.responses[0].status).assertEqual(0);
      expect(new Uint8Array(sdk.responses[0].value).join(',')).assertEqual('21,22');
      sdk.emitDescriptorRead(descRead);
      expect(sdk.responses.length).assertEqual(2);
      expect(sdk.responses[1].deviceId).assertEqual('AA:10:00:00:00:17');
      expect(sdk.responses[1].transId).assertEqual(231);
      expect(sdk.responses[1].offset).assertEqual(255);
      expect(sdk.responses[1].status).assertEqual(0);
      expect(new Uint8Array(sdk.responses[1].value).join(',')).assertEqual('31,32');
      sdk.emitCharacteristicWrite(charWrite);
      expect(sdk.responses.length).assertEqual(3);
      expect(sdk.responses[2].deviceId).assertEqual('AA:10:00:00:00:17');
      expect(sdk.responses[2].transId).assertEqual(232);
      expect(sdk.responses[2].offset).assertEqual(255);
      expect(sdk.responses[2].status).assertEqual(0);
      expect(new Uint8Array(sdk.responses[2].value).join(',')).assertEqual('');
      sdk.emitDescriptorWrite(descWrite);
      expect(sdk.responses.length).assertEqual(4);
      expect(sdk.responses[3].deviceId).assertEqual('AA:10:00:00:00:17');
      expect(sdk.responses[3].transId).assertEqual(233);
      expect(sdk.responses[3].offset).assertEqual(255);
      expect(sdk.responses[3].status).assertEqual(0);
      expect(new Uint8Array(sdk.responses[3].value).join(',')).assertEqual('');
      const firstResponseBuffer = sdk.responses[0].value;
      sdk.emitCharacteristicRead(charRead);
      expect(sdk.responses.length).assertEqual(5);
      expect(sdk.responses[4].value !== firstResponseBuffer).assertTrue();
      expect(new Uint8Array(sdk.responses[4].value).join(',')).assertEqual('21,22');
      sdk.throwAt = 'server.sendResponse';
      sdk.emitDescriptorRead(descRead);
      expect(sdk.responses.length).assertEqual(6);
      expect(new Uint8Array(sdk.responses[5].value).join(',')).assertEqual('31,32');
      sdk.throwAt = '';
      sdk.emitDescriptorRead(descRead);
      expect(sdk.responses.length).assertEqual(7);
      expect(sdk.responses[6].value !== sdk.responses[5].value).assertTrue();
      expect(new Uint8Array(sdk.responses[6].value).join(',')).assertEqual('31,32');
      expect(JSON.stringify(charRead)).assertEqual(requestSnapshot);
      expect(JSON.stringify(sdk.services)).assertEqual(registrationSnapshot);
      expect(new Uint8Array(charWrite.value).join(',')).assertEqual('65,0,255');
      expect(new Uint8Array(descWrite.value).join(',')).assertEqual('66,128');
      expect(charWrite.needRsp).assertEqual(true);
      expect(descWrite.needRsp).assertEqual(true);
      expect(sdk.toasts.length).assertEqual(1);
      expect(sdk.toasts[0].message).assertEqual('registerServer success');
      expect(sdk.removed.length).assertEqual(0);
      expect(sdk.offMatchesRegistration.length).assertEqual(0);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'server.sendResponse').length).assertEqual(7);
      expect(manager.gattServer === sdk.server).assertTrue();
      expect(manager.myServiceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(manager.myCharacteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(manager.myFirstDescriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(manager.mySecondDescriptorUuid).assertEqual('00002903-0000-1000-8000-00805F9B34FB');
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
