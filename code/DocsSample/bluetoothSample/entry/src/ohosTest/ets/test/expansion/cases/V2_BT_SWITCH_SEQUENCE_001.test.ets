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
import { BluetoothSwitch } from '../../../../../main/ets/bluetoothService/BluetoothSwitch';
import { access } from '@kit.ConnectivityKit';
/**
 * @tc.number V2_BT_SWITCH_SEQUENCE_001
 * @tc.name EXP_V2_BT_SWITCH_SEQUENCE_001
 * @tc.desc Bidirectional switch calls, nonterminal ordering, actual stale/current callbacks, identity-propagating external exception and clean recovery. Scenario: {"openFirst":false,"intermediateState":1,"firstTerminal":0,"secondTerminal":2}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BluetoothSwitch();
      manager.closeBluetooth();
      expect(JSON.stringify(sdk.calls)).assertEqual(
        '["access.off stateChange","access.disableBluetooth","access.on stateChange"]'
      );
      const firstListener = sdk.stateListener;
      if (firstListener === undefined) {
        throw new Error('Actual first switch listener missing');
      }
      sdk.emitState(1 as access.BluetoothState);
      expect(JSON.stringify(sdk.calls)).assertEqual(
        '["access.off stateChange","access.disableBluetooth","access.on stateChange"]'
      );
      manager.openBluetooth();
      expect(JSON.stringify(sdk.calls)).assertEqual('["access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange","access.enableBluetooth","access.on stateChange"]');
      const secondListener = sdk.stateListener;
      if (secondListener === undefined) {
        throw new Error('Actual second switch listener missing');
      }
      expect(secondListener !== firstListener).assertTrue();
      firstListener(0 as access.BluetoothState);
      expect(JSON.stringify(sdk.calls)).assertEqual('["access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange","access.enableBluetooth","access.on stateChange","access.off stateChange"]');
      sdk.emitState(1 as access.BluetoothState);
      expect(sdk.calls.length).assertEqual(7);
      sdk.emitState(2 as access.BluetoothState);
      expect(JSON.stringify(sdk.calls)).assertEqual('["access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange","access.enableBluetooth","access.on stateChange","access.off stateChange","access.off stateChange"]');
      sdk.throwAt = 'access.disableBluetooth';
      let caught: boolean = false;
      try {
        manager.closeBluetooth();
      } catch (error) {
        caught = error === sdk.error;
      }
      expect(caught).assertEqual(true);
      expect(sdk.stateListener === secondListener).assertTrue();
      expect(JSON.stringify(sdk.calls)).assertEqual('["access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange","access.enableBluetooth","access.on stateChange","access.off stateChange","access.off stateChange","access.off stateChange","access.disableBluetooth"]');
      sdk.throwAt = '';
      manager.closeBluetooth();
      expect(sdk.stateListener !== secondListener).assertTrue();
      sdk.emitState(0 as access.BluetoothState);
      expect(JSON.stringify(sdk.calls)).assertEqual('["access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange","access.enableBluetooth","access.on stateChange","access.off stateChange","access.off stateChange","access.off stateChange","access.disableBluetooth","access.off stateChange","access.disableBluetooth","access.on stateChange","access.off stateChange"]');
      expect(sdk.calls.length).assertEqual(14);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'access.off stateChange').length).assertEqual(7);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'access.on stateChange').length).assertEqual(3);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'access.disableBluetooth').length).assertEqual(3);
      expect(sdk.calls.filter((stage: string): boolean => stage === 'access.enableBluetooth').length).assertEqual(1);
      expect(sdk.toasts.length).assertEqual(0);
      expect(sdk.peers.length).assertEqual(0);
      expect(sdk.filters.length).assertEqual(0);
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
