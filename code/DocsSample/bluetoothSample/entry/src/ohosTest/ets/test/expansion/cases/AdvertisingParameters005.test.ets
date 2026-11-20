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
import { BleAdvertisingManager } from '../../../../../main/ets/bluetoothService/BluetoothAdvertising';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';


/**
 * @tc.number BT_ADV_PARAM_005
 * @tc.name EXP_BT_ADV_PARAM_005
 * @tc.desc Real advertising parameter builder passes exact bytes, UUIDs, settings and shared response payload to ble.startAdvertising. Scenario BT_ADV_PARAM_005: {"setAdvertisingParameter":[-1,[255],"invalid-uuid",[],true]}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleAdvertisingManager();
      const manufacturerBytes = new Uint8Array([255]);
      const serviceBytes = new Uint8Array([]);
      manager.setAdvertisingParameter(-1, manufacturerBytes, 'invalid-uuid', serviceBytes, true);
      sdk.resolveHandle = 7;
      await manager.startAdvertising();
      const params = sdk.advertising;
      expect(params !== undefined).assertTrue();
      if (params === undefined) {
        throw new Error('startAdvertising parameters missing');
      }
      const data = params.advertisingData;
      const response = params.advertisingResponse;
      expect(response !== undefined).assertTrue();
      if (response === undefined) {
        throw new Error('advertising response missing');
      }
      const manufacturers = data.manufactureData;
      const services = data.serviceData;
      if (manufacturers === undefined || services === undefined) {
        throw new Error('advertising payload missing');
      }
      expect(manufacturers.length).assertEqual(1);
      expect(services.length).assertEqual(1);
      expect(manufacturers[0].manufactureId).assertEqual(-1);
      expect(Array.from(new Uint8Array(manufacturers[0].manufactureValue)).join(',')).assertEqual('255');
      expect(services[0].serviceUuid).assertEqual('invalid-uuid');
      expect(Array.from(new Uint8Array(services[0].serviceValue)).join(',')).assertEqual('');
      expect(data.includeDeviceName).assertEqual(true);
      expect(JSON.stringify(data.serviceUuids)).assertEqual('["invalid-uuid"]');
      expect(response.manufactureData === data.manufactureData).assertEqual(false);
      const responseManufacturers = response.manufactureData;
      const responseServices = response.serviceData;
      if (responseManufacturers === undefined || responseServices === undefined) {
        throw new Error('response payload missing');
      }
      expect(responseManufacturers[0] === manufacturers[0]).assertEqual(true);
      expect(responseServices[0] === services[0]).assertEqual(true);
      expect(params.advertisingSettings.interval).assertEqual(160);
      expect(params.advertisingSettings.txPower).assertEqual(0);
      expect(params.advertisingSettings.connectable).assertEqual(true);
      expect(params.duration).assertEqual(0);
      expect(sdk.toasts[0].message).assertEqual('bluetooth startAdvertising start success');
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
