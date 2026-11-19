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
 * @tc.number V2_BT_CLIENT_OWNERSHIP_023
 * @tc.name EXP_V2_BT_CLIENT_OWNERSHIP_023
 * @tc.desc Three-peer ownership transfer, nonmatching isolation, guard reentry, old registered callbacks tracking current ownership and connect recovery. Scenario: {"peerOrder":["AA:00:00:00:00:03","AA:00:00:00:00:02","AA:00:00:00:00:01"],"firstReportedState":2,"thirdFactoryOutcome":"on"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattClientManager();
      manager.startConnect('AA:00:00:00:00:03');
      expect(manager.device).assertEqual('AA:00:00:00:00:03');
      expect(manager.gattClient === sdk.client).assertTrue();
      expect(manager.connectState).assertEqual(0);
      expect(JSON.stringify(sdk.peers)).assertEqual('["AA:00:00:00:00:03"]');
      expect(sdk.toasts[0].message).assertEqual('startConnect success');
      const firstListener = sdk.connectionListener;
      if (firstListener === undefined) {
        throw new Error('Actual first connection listener missing');
      }
      sdk.emitConnection({ deviceId: 'AA:00:00:00:00:02', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(0);
      sdk.emitConnection({ deviceId: 'AA:00:00:00:00:03', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(2);
      manager.startConnect('AA:00:00:00:00:02');
      expect(JSON.stringify(sdk.peers)).assertEqual('["AA:00:00:00:00:03"]');
      expect(manager.device).assertEqual('AA:00:00:00:00:03');
      expect(manager.connectState).assertEqual(2);
      sdk.emitConnection({ deviceId: 'AA:00:00:00:00:03', state: 2 as ble.ProfileConnectionState });
      manager.readCharacteristicValue();
      expect(sdk.toasts[1].message).assertEqual('no characteristic from server');
      expect(manager.found).assertEqual(false);
      expect(manager.getResult()).assertEqual('');
      sdk.emitConnection({ deviceId: 'AA:00:00:00:00:03', state: 0 as ble.ProfileConnectionState });
      manager.startConnect('AA:00:00:00:00:02');
      expect(JSON.stringify(sdk.peers)).assertEqual('["AA:00:00:00:00:03","AA:00:00:00:00:02"]');
      expect(manager.device).assertEqual('AA:00:00:00:00:02');
      expect(sdk.connectionListener !== firstListener).assertTrue();
      const secondListener = sdk.connectionListener;
      if (secondListener === undefined) {
        throw new Error('Actual second connection listener missing');
      }
      firstListener({ deviceId: 'AA:00:00:00:00:03', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(0);
      firstListener({ deviceId: 'AA:00:00:00:00:02', state: 1 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(1);
      sdk.emitConnection({ deviceId: 'AA:00:00:00:00:02', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(2);
      sdk.services = [];
      await manager.discoverServices();
      expect(manager.found).assertEqual(false);
      expect(manager.serviceResult).assertEqual('[]');
      expect(manager.getResult()).assertEqual('[]');
      secondListener({ deviceId: 'AA:00:00:00:00:02', state: 0 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(0);
      sdk.throwAt = 'client.on';
      manager.startConnect('AA:00:00:00:00:01');
      expect(manager.device).assertEqual('AA:00:00:00:00:01');
      expect(JSON.stringify(sdk.peers)).assertEqual('["AA:00:00:00:00:03","AA:00:00:00:00:02","AA:00:00:00:00:01"]');
      expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('startConnect success');
      sdk.throwAt = '';
      secondListener({ deviceId: 'AA:00:00:00:00:02', state: 3 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(0);
      secondListener({ deviceId: 'AA:00:00:00:00:01', state: 2 as ble.ProfileConnectionState });
      expect(manager.connectState).assertEqual(2);
      expect(manager.found).assertEqual(false);
      expect(manager.serviceResult).assertEqual('[]');
      manager.writeDescriptorValue();
      expect(sdk.toasts[sdk.toasts.length - 1].message).assertEqual('no descriptor from server');
      expect(sdk.sentDescriptor).assertUndefined();
      expect(sdk.calls.filter((stage: string): boolean => stage === 'client.connect').length).assertEqual(3);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'client.on').length).assertEqual(3);
      expect(sdk.toasts.length).assertEqual(6);
      expect(sdk.offMatchesRegistration.length).assertEqual(0);
      expect(manager.gattClient === sdk.client).assertTrue();
      expect(manager.myCharacteristicValue).assertEqual('');
      expect(manager.myDescriptorValue).assertEqual('');
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
