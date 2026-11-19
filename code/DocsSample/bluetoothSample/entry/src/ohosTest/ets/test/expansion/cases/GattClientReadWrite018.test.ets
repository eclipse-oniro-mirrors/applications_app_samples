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
import { promptAction } from '@kit.ArkUI';
import { settleServicePromises } from '../fixtures/ServiceInputs';

/**
 * @tc.number BT_CLIENT_IO_018
 * @tc.name EXP_BT_CLIENT_IO_018
 * @tc.desc Defect-exposing real descriptor write must retain complete non-ASCII UTF-8, not bless catalog truncation. Scenario BT_CLIENT_IO_018: {"setGattDataDescriptorValue":"\u4e2d","method":"writeDescriptorValue","callback":"success"}
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
      data.descriptorValue = '\u4e2d';
      manager.setGattData(data);
      manager.writeDescriptorValue();
      await settleServicePromises();
      const sent = sdk.sentDescriptor;
      expect(sent !== undefined).assertTrue();
      if (sent === undefined) {
        throw new Error('descriptor SDK request missing');
      }
      expect(Array.from(new Uint8Array(sent.descriptorValue)).join(",")).assertEqual("228,184,173");
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
